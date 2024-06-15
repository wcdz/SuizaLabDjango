from django import forms
from ..models import Citas


class CitasForm(forms.ModelForm):
    class Meta:
        model = Citas
        fields = (
            "nombre_completo",
            "id_tipo_documento",
            "numero_documento",
            "id_tipo_especialidad",
        )

    def validar_numero_documento(self):
        numero_documento = self.cleaned_data["numero_documento"]
        if len(numero_documento) == 8 or len(numero_documento) == 12:
            raise forms.ValidationError(
                "El número de documento debe tener exactamente 8 caracteres."
            )
        return numero_documento
