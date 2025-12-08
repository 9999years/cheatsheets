# terraform

## what is terraform

terraform has a database of the current state
- e.g. primary keys for identifying resources terraform has made
  - where "resources" are basically any cloud stuff:
    - ec2 instances
    - s3 buckets
    - github permissions
    - github repos
    - github teams
    - okta apps

### plan then apply

`terraform plan` calls every control plane GET endpoint in the aws :)
- then it will decide what stuff to do :)
- discrete stages: plan, then apply
- figures out how to order the graph of actions for you

`terraform apply` goes and does the application
- at $employer we click a button on https://terraform.io to do this

## workspaces

"workspaces" are isolated sections of the codebase with
  independent deploy pipelines
  - identified by a `main.tf` (i think?) and a `.terraform.lock.hcl`
  - workspaces are server-side objects
  - "projects" are maybe groups of workspaces...?

## config

configured with hcl: https://developer.hashicorp.com/terraform/language/syntax/configuration
- unfortunately very golangbrained

### kind of maps to json?

there's also json syntax, but it's defined in terms of the "native" syntax https://developer.hashicorp.com/terraform/language/syntax/json

apparently this:

```hcl
variable "example" {
  default = "hello"
}

resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-abc123"
}
```

corresponds to this:

```json
{
  "variable": {
    "example": {
      "default": "hello"
    }
  },
  "resource": {
    "aws_instance": {
      "example": {
        "instance_type": "t2.micro",
        "ami": "ami-abc123"
      }
    }
  }
}
```

i.e. in nix:

```nix
resource.aws_instance.example = {
  instance_type = "t2.micro";
  ami = "ami-abc123";
};
```

there's also templating within the json because of course there is:

```json
{
  "output": {
    "example": {
      "value": "${aws_instance.example}"
    }
  }
}
```

### blocks

```hcl
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}
```

`resource` is a block. each block takes a number of labels (`"aws_instance"`
and `"example"` here). each block is typed, at least like a little bit :)

buuuut blocks are typed like, a little vaguely? like `provider "aws"` takes a
bunch of aws-specific stuff, so `provider` must defer some typechecking to the
aws provider thingy...

some blocks we use:

- `terraform`: general configuration for a workspace
- contains 'inputs'/dependencies (but not module dependencies!)
- `provider`: a golang binary that gives you access to resources from a
  particular vendor, e.g. `provider "aws"`.
- `locals`: yeah we've got a block for your variables, you can't just have
  those spread around willy nilly near where you want to use them right? that
  would be messy
  - these are identified with `local.foo`, not `locals.foo` like you might expect
- `data`: finds data from "a given data source" and binds it to ... variables,
  kinda, but not `locals` directly
  - this is a function call; unlike `locals`, you can't determine the schema of
    its outputs by reading it
- `module`: a function call to another terraform hcl file, maybe with arguments
- `variable`: an argument to a module (function) call
  - these are identified with `var`, not `variable`

for schemas, see: https://registry.terraform.io/

## modules

a module is a ... function call, i guess?
