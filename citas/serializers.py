from rest_framework import serializers
from .models import Citas

class CitasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Citas
        # fields = ('id_cita', 'nombre_completo', 'fecha_registro', 'fecha_actualizacion', 'estado', 'id_numero_documento', 'id_tipo_especialidad')
        fields = '__all__'
        read_only_field = ('id_cita', 'fecha_registro',)