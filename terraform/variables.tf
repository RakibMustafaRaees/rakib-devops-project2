variable "private_key" {
  description = "Base64 encoded private key"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
  default     = "/home/tk-lpt-261/.ssh/id_rsa"
}

