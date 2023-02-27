variable "engine_type" {
    default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}
variable "instance_class" {
  default = "db.t2.micro"
}
variable "parameter_group_name" {
  default = "default.mysql5.7"
}
variable "replica_mode" {
default = "open-read-only"  
}