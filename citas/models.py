from django.db import models

class TiposDocumentos(models.Model):
    id_tipo_documento = models.AutoField(primary_key=True)
    nombre_documento = models.CharField(max_length=50, null=True)
    num_digitos = models.CharField(max_length=2, null=True)

    def __str__(self):
        return self.nombre_documento

class TiposEspecialidades(models.Model):
    id_tipo_especialidad = models.AutoField(primary_key=True)
    nombre_especialidad = models.CharField(max_length=50, null=True)

    def __str__(self):
        return self.nombre_especialidad

class NumerosDocumentos(models.Model):
    id_numero_documento = models.AutoField(primary_key=True)
    numero_documento = models.CharField(max_length=20, null=True)
    id_tipo_documento = models.ForeignKey(TiposDocumentos, on_delete=models.CASCADE, db_column='id_tipo_documento', null=True)

    def __str__(self):
        return self.id_numero_documento

class Citas(models.Model):
    id_cita = models.AutoField(primary_key=True)
    nombre_completo = models.CharField(max_length=100)
    id_numero_documento = models.ForeignKey(NumerosDocumentos, on_delete=models.SET_NULL, db_column='id_numero_documento', null=True)
    id_tipo_especialidad = models.ForeignKey(TiposEspecialidades, on_delete=models.SET_NULL, db_column='id_tipo_especialidad', null=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(auto_now=True, null=True)
    estado = models.IntegerField(default=1)

    # def __str__(self):
    #     return self
    
class ViewCitas(models.Model):
      id_cita = models.IntegerField(primary_key=True)
      nombre_completo = models.CharField(max_length=100)
      tipo_documento = models.CharField(max_length=100)
      numero_documento = models.CharField(max_length=100)
      nombre_especialidad = models.CharField(max_length=100)
      fecha_registro = models.CharField(max_length=100)
      fecha_actualizacion = models.CharField(max_length=100)
      estado = models.CharField(max_length=100)
      class Meta:
        managed = False  # Indica a Django que este modelo no es gestionado directamente por Django
        db_table = 'vista_citas'  # Nombre de la vista en la base de datos
    

# Nota: Las vistas en Django se manejan de manera diferente, normalmente a través de QuerySets.
# No es necesario replicar las vistas SQL directamente en modelos, pero puedes usar métodos o managers personalizados para lograr funcionalidades similares.
