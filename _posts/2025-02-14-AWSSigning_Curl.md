---
layout: post
title: Signing AWS Requests with Curl
# date element overrides date in title format.
tag:
  - AWS
  - curl
---

All requests to AWS APIs must be signed using [AWS Signature Version 4
(SigV4)][1]. While the [AWS SDK libraries][2] and the [AWS CLI][3] will handle
this for you, external HTTP client libraries are on their own to support the
[SigV4 signing process][5].  

This matters if you have built an application using API Gateway and IAM
authorization. Client requests, whether it be from a mobile application or
testing script, need to be signed. Fortunately, the open-source community has
contributed support for SigV4 in many popular HTTP libraries (e.g., [Python's
Requests][3], [Dart's Dio][4]). Notably, the command line tool, [`curl`][6],
has native support for AWS signing.  

The curl incantation is tricky enough that I have to google and fuss about it a
bit to get it right. Here are some common ways of signing your requests with
curl.

If you are still using long-term access keys this will do:
```bash
curl \
  --request POST \
  --user "$AWS_ACCESS_KEY:$AWS_SECRET_ACCESS_KEY" \
  --aws-sigv4 "aws:amz:us-east-1:execute-api" \
  --header "Content-Type: application/json" \
  "$URL"
```

Of course, that approach is [no longer recommended][8], and you should use
short-lived credentials. With short-lived credentials you'll have to include
session information with your temporary access and secret key.
```bash
curl \
  --request POST \
  --user "$AWS_ACCESS_KEY:$AWS_SECRET_ACCESS_KEY" \
  --aws-sigv4 "aws:amz:us-east-1:execute-api" \
  --header "x-amz-security-token: $AWS_SESSION_TOKEN" \
  --header "Content-Type: application/json" \
  "$URL"
```

Note, `AWS_ACCESS_KEY`, `AWS_SECRET_ACCESS_KEY`, and `AWS_SESSION_TOKEN` are
probably not in your environment. You will need to set them.  

If you have programatic access (via the CLI) to the AWS account the API is in,
and your permissions are sufficient, you can use the values in cached by the
AWS CLI cache after a login. 

```bash
ls -lt ~/.aws/cli/cache
```

You will likely want the most recent file there.  

Better still is to use the CLI itself to get at those values.  

```bash
aws configure export-credentials --format process
```

You can parse the json output of that command and automate the steps needed to
run your curl. Note, the aws CLI won't respect the `--query` option for the
`export-credentials` command - I presume to avoid piping sensitive data to
external processes - so you will have to parse the output with a tool you
trust. I use `jq` in the command below.


```bash
curl 
 --request POST \
 --aws-sigv4 "aws:amz:us-east-1:execute-api" \
 --user "$(aws configure export-credentials --format process | jq -r .AccessKeyId):$(aws configure export-credentials --format process | jq -r .SecretAccessKey)" \
 --header "x-amz-security-token: $(aws configure export-credentials --format process | jq -r .SessionToken)" \
 --header "Content-Type: application/json" \
 "$URL"
```

And there you have it. Not the fastest but I think [it looks pretty good][9].


[1]: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html
[2]: https://aws.amazon.com/developer/
[3]: https://github.com/DavidMuller/aws-requests-auth
[4]: https://github.com/nicholasphair/aws_signature_v4_interceptor
[5]: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv-create-signed-request.html
[6]: https://github.com/curl/curl
[7]: https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html
[8]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
[9]: https://youtu.be/mGP-CvjqmXA?si=O21Tp14A-5iduuZm
