output "ruta_archivo" {
  description = "Ruta del archivo creado"
  value       = local_file.mensaje.filename
}

output "contenido_archivo" {
  description = "Contenido configurado en el archivo"
  value       = local_file.mensaje.content
}
