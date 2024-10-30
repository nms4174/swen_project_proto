provider "aws" {
  region = "us-east-1"
}

resource "aws_amplify_app" "swen_project_proto" {
  name       = "swen_project_proto"
  repository = "https://github.com/nms4174/swen_project_proto"

  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT


}