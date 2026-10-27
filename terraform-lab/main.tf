terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "mensaje" {
  filename = "${path.module}/${var.nombre_archivo}"
  content  = var.mensaje
}
