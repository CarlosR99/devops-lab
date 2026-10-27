variable "nombre_archivo" {
  description = "Nombre del archivo que creará Terraform"
  type        = string
  default     = "mensaje.txt"
}

variable "mensaje" {
  description = "Contenido del archivo"
  type        = string
  default     = "Mi laboratorio DevOps con Terraform"
}
