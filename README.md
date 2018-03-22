# Jekyll blog

## To run server:
```
auto/dev-server
```
then visit http://localhost:4000/

## To update gems:
```
auto/update-gems
```

## To build and deploy to production:
```
auto/deploy
```

## Update IAM User permissions for TravisUser
```
aws cloudformation update-stack --stack-name iam-user --capabilities CAPABILITY_IAM --template-body file://./cloudformation/iam.json
```