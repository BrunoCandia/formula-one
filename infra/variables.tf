variable "environment" {
    type = string
    description = "the environment app"
    default = "dev"
}

variable "subscription_id" {
  type = string
  description = "the azure subscription id"
  default = "ed0eed35-e487-434c-8eed-1f15d8b0909f"
}

variable "project_name" {
  description = "project name"
  type = string
  default = "formula-one-system"
}

variable "location" {
  description = "the azure region where the resources will be created"
  type = string
  default = "centralus"
}

variable "src_key" {
  type = string
  description = "the environment id"
  default = "dev"
}

variable "sql_server_pass" {
  type = string
  description = "the sql server password"  
}