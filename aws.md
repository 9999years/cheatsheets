# aws

## "accounts"

- "federated user": your actual... account
- "account": acl 'group'
  - you can give someone root to an account and they won't be able to mess with
    things outside of it
- "role": a narrower set of acls within an account
  - roles have _policies_

## AWS IAM

- actions: what you can do
- principals: who can do them
- resources: what you can do them on

- iam users: never use these. bad. not secure
