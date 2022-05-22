# Amazon RDS

## Create the security group in the default VPC

```bash
$ aws ec2 create-security-group --group-name demo-database-postgres --description demo-database-postgres
```

```json
{
  "GroupId": "sg-0eafae375a74ae471"
}
```

## Allow network access from my Home IP to the Postgres instance

```bash
$ aws ec2 authorize-security-group-ingress \
    --group-id sg-0eafae375a74ae471 \
    --protocol tcp \
    --port 5432 \
    --cidr 86.246.109.124/32
```

## List database engine versions

```bash
$ aws rds describe-db-engine-versions --engine postgres --default-only
```

returns the latest default version used by RDS for the Postgres engine:

```json
{
  "DBEngineVersions": [
    {
      "Engine": "postgres",
      "EngineVersion": "13.4",
      "DBParameterGroupFamily": "postgres13",
      "DBEngineDescription": "PostgreSQL",
      "DBEngineVersionDescription": "PostgreSQL 13.4-R1"
    }
  ]
}
```

## Create the database instance

```bash
$ aws rds create-db-instance \
    --db-instance-identifier database-1 \
    --db-instance-class db.t3.micro \
    --engine postgres \
    --master-username postgres \
    --master-user-password secret99 \
    --allocated-storage 20 \
    --engine-version 13.4 \
    --storage-type gp2 \
    --publicly-accessible \
    --vpc-security-group-ids sg-0eafae375a74ae471 \
    --db-name mydb
```

```bash
$ psql -h database-1.cdmrt6zjlfqb.eu-west-3.rds.amazonaws.com -U postgres
```

## Clean

```bash
$ aws rds delete-db-instance --db-instance database-1 --skip-final-snapshot
```

```bash
$ aws ec2 delete-security-group --group-id sg-0eafae375a74ae471
```
