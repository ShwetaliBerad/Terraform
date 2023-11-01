variable "image_id" {
  type = string
  description = "Provide ami id for aws instance creation"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "vpcs" {
  type = map
  default = {
        default = "10.0.0.0/16"
        sql = "100.0.0.0/16"
    }
}

variable "users" {
    type = list
    default = ["Todd","James","Alice","Dottie"]
}