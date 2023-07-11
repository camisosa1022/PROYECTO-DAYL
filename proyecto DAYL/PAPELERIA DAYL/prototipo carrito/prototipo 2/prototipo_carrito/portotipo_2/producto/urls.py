from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
from producto.views import *

urlpatterns = [
    path('',views.index,name="producto_index"),
    path('<str:categoria>',views.categorias,name="categorias"),
    path('<str:categoria>/<str:subcategoria>',views.categorias,name="categorias"),
    path('<str:nombre_producto>/<int:id>/', views.producto, name='producto'),
    path('agregar/<int:producto_id>/', agregar_producto, name="Add"),
    path('eliminar/<int:producto_id>/', eliminar_producto, name="Del"),
    path('restar/<int:producto_id>/', restar_producto, name="Sub"),
    path('limpiras/', limpiar_carrito, name="cls"),
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)