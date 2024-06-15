# from django.urls import path

# urlpatterns = [path("citas/", CitasView.as_view(), name="lista_citas")]

from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views.citas import CitasView

urlpatterns = [
    path('citas/', CitasView.as_view(), name="lista_citas"),
    path('citas/<int:id>', CitasView.as_view(), name="lista_citas"),
]
