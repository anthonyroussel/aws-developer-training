import * as cdk from "aws-cdk-lib";
import * as dynamodb from "aws-cdk-lib/aws-dynamodb";
import * as iam from "aws-cdk-lib/aws-iam";
import * as lambda from "aws-cdk-lib/aws-lambda";
import * as lambdaEventSources from "aws-cdk-lib/aws-lambda-event-sources";
import * as s3 from "aws-cdk-lib/aws-s3";
import { Construct } from "constructs";

export class CdkAppStack extends cdk.Stack {
  public static readonly TABLE_NAME = "cdk-rekn-table";
  public static readonly FUNCTION_NAME = "cdk-rekn-function";
  public static readonly FUNCTION_ROLE_NAME = "cdk-rekn-lambdarole";
  public static readonly BUCKET_NAME = "cdk-rekn-imagebucket";

  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Database
    const table = new dynamodb.Table(this, CdkAppStack.TABLE_NAME, {
      partitionKey: {
        name: "PK",
        type: dynamodb.AttributeType.STRING,
      },
      removalPolicy: cdk.RemovalPolicy.DESTROY,
    });

    new cdk.CfnOutput(this, "DynamoTableName", {
      value: table.tableName,
    });

    // Bucket
    const bucket = new s3.Bucket(this, CdkAppStack.BUCKET_NAME, {
      removalPolicy: cdk.RemovalPolicy.DESTROY,
    });

    new cdk.CfnOutput(this, "Bucket", { value: bucket.bucketName });

    // Lambda
    const role = new iam.Role(this, CdkAppStack.FUNCTION_ROLE_NAME, {
      assumedBy: new iam.ServicePrincipal("lambda.amazonaws.com"),
    });

    role.addToPolicy(
      new iam.PolicyStatement({
        effect: iam.Effect.ALLOW,
        actions: [
          "rekognition:*",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        resources: ["*"],
      })
    );

    const lambdaFn = new lambda.Function(this, CdkAppStack.FUNCTION_NAME, {
      code: lambda.AssetCode.fromAsset("lambda"),
      environment: {
        BUCKET: bucket.bucketName,
        TABLE: table.tableName,
      },
      handler: "index.handler",
      role,
      runtime: lambda.Runtime.PYTHON_3_9,
    });

    lambdaFn.addEventSource(
      new lambdaEventSources.S3EventSource(bucket, {
        events: [s3.EventType.OBJECT_CREATED],
      })
    );

    bucket.grantReadWrite(lambdaFn);
    table.grantFullAccess(lambdaFn);
  }
}
