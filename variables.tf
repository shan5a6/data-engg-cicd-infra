#--- Global variables ---
variable "app_name" {
  type        = string
  default     = ""
  description = "resource group name"
}

variable "rg_region" {
  type        = string
  default     = "east us"
  description = "resource group region"  
}

variable "environment_suffix" {
  type        = string
  default     = "dev"
  description = "environment which you want to build"   
}

#--- ADF Variables
variable "github_configuration" {
    type    = any 
    default = {}
}

variable "sa_cont_list" {
  type  = list 
  default =[]
}
