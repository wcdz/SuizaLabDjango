from django.http import HttpRequest
from django.utils.decorators import method_decorator
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.http.response import HttpResponse as HttpResponse, JsonResponse
from ..models import (
    Citas,
    TiposDocumentos,
    TiposEspecialidades,
    NumerosDocumentos,
    ViewCitas,
)
from datetime import datetime
import json


# Create your views here.
class CitasView(View):

    # Cada que se ejecuta una funcion
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args, **kwargs) -> HttpResponse:
        return super().dispatch(request, *args, **kwargs)

    def get(self, request, id=0):
        if id > 0:
            citas = list(ViewCitas.objects.filter(id_cita=id).values())
            if citas:
                cita = citas[0]
                response = {"message": "Cita encontrada", "Cita": cita}
            else:
                response = {"message": "No hay cita registrada"}
        else:
            citas = list(ViewCitas.objects.filter(estado='1').values())
            if citas:
                response = {"message": "Todas las Citas", "Citas": citas}
            else:
                response = {"message": "No hay citas registradas"}

        return JsonResponse(response)

    def post(self, request):
        rq = json.loads(request.body)

        nombre_completo = rq.get("nombre_completo")
        id_tipo_documento = rq.get("id_tipo_documento")
        numero_documento = rq.get("numero_documento")
        id_tipo_especialidad = rq.get("id_tipo_especialidad")

        # Validar que existe id_tipo_documento en la tabla TiposDocumentos
        try:
            tipo_documento = TiposDocumentos.objects.get(
                id_tipo_documento=id_tipo_documento
            )
        except TiposDocumentos.DoesNotExist:
            return JsonResponse(
                {
                    "message": f"El tipo de documento con id {id_tipo_documento} no existe"
                },
                status=400,
            )

        # Verificar longitud de número de documento
        if len(numero_documento) != int(tipo_documento.num_digitos):
            return JsonResponse(
                {
                    "message": f"El número de documento debe tener exactamente {tipo_documento.num_digitos} caracteres."
                },
                status=400,
            )

        # Validar que existe id_tipo_especialidad en la tabla TiposEspecialidades
        try:
            tipo_especialidad = TiposEspecialidades.objects.get(
                id_tipo_especialidad=id_tipo_especialidad
            )
        except TiposEspecialidades.DoesNotExist:
            return JsonResponse(
                {
                    "message": f"El tipo de especialidad con id {id_tipo_especialidad} no existe"
                },
                status=400,
            )

        # Validacion de registro previo o creacion de nuevo registro
        try:
            numero_documento_existente = NumerosDocumentos.objects.get(
                numero_documento=numero_documento, id_tipo_documento=id_tipo_documento
            )
        except NumerosDocumentos.DoesNotExist:
            # Si no existe, lo creamos
            numero_documento_existente = NumerosDocumentos.objects.create(
                numero_documento=numero_documento,
                id_tipo_documento_id=id_tipo_documento,
            )

        # Se inserta
        nueva_cita = Citas.objects.create(
            nombre_completo=nombre_completo,
            id_numero_documento=numero_documento_existente,
            id_tipo_especialidad_id=id_tipo_especialidad,
        )

        response = {
            "message": "Se insertó la data correctamente",
            "data_insert": {
                "nombre_completo": nombre_completo,
                "nombre_documento": tipo_documento.nombre_documento,
                "numero_documento": numero_documento,
                "nombre_especialidad": tipo_especialidad.nombre_especialidad,
            },
        }
        return JsonResponse(response)

    def put(self, request, id=0):
        rq = json.loads(request.body)
        citas = list(ViewCitas.objects.filter(id_cita=id).values())
        if id > 0:
            if citas:
                nombre_completo = rq.get("nombre_completo")
                numero_documento = rq.get("numero_documento")
                id_tipo_documento = rq.get("id_tipo_documento")
                id_tipo_especialidad = rq.get("id_tipo_especialidad")
                fecha_actualizacion = datetime.now()

                cita = Citas.objects.get(id_cita=id)
                # print(cita)

                # Validar que existe id_tipo_especialidad en la tabla TiposEspecialidades
                try:
                    tipo_especialidad = TiposEspecialidades.objects.get(
                        id_tipo_especialidad=id_tipo_especialidad
                    )
                except TiposEspecialidades.DoesNotExist:
                    return JsonResponse(
                        {
                            "message": f"El tipo de especialidad con id {id_tipo_especialidad} no existe"
                        },
                        status=400,
                    )

                try:
                    numero_documento_existente = NumerosDocumentos.objects.get(
                        numero_documento=numero_documento,
                        id_tipo_documento=id_tipo_documento,
                    )
                    numero_documento_existente.numero_documento = numero_documento
                    numero_documento_existente.save()
                except NumerosDocumentos.DoesNotExist:
                    # Si no existe, lo creamos
                    numero_documento_existente = NumerosDocumentos.objects.create(
                        numero_documento=numero_documento,
                        id_tipo_documento_id=id_tipo_documento,
                    )
                    cita.id_numero_documento = numero_documento_existente

                cita.nombre_completo = nombre_completo
                cita.id_tipo_especialidad = tipo_especialidad
                cita.fecha_actualizacion = fecha_actualizacion

                cita.save()
                response = {"message": "Update listo"}

            else:
                response = {"message": "No hay citas registradas"}
        else:
            response = {"message": "No hay id"}

        return JsonResponse(response)

    def delete(self, request, id=0):
        if id > 0:
            cita = Citas.objects.get(id_cita=id)
            if cita:
                cita.estado = 0
                cita.save()
                response = {"message": "Se elimino la data"}
            else:
                response = {"message": "No se encuentra la cita a eliminar"}
        else:
            response = {"message": "No hay id"}

        return JsonResponse(response)
