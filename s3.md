# Amazon S3

## Create the bucket

```bash
$ aws s3api create-bucket \
  --bucket demo-aroussel-s3-bucket-2022 \
  --acl private \
  --region eu-west-3 --create-bucket-configuration LocationConstraint=eu-west-3
```

Output the public URL of the S3 bucket:

```json
{
  "Location": "http://demo-aroussel-s3-bucket-2022.s3.amazonaws.com/"
}
```

```bash
$ aws s3api put-public-access-block --bucket demo-aroussel-s3-bucket-2022 \
  --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Upload

```bash
$ aws s3 cp picture.jpg s3://demo-aroussel-s3-bucket-2022
```

```bash
$ aws s3 ls s3://demo-aroussel-s3-bucket-2022
2022-05-22 18:50:08      33369 picture.jpg
```

## Enable bucket versioning

```bash
$ aws s3api put-bucket-versioning --bucket demo-aroussel-s3-bucket-2022 --versioning-configuration Status=Enabled
```
