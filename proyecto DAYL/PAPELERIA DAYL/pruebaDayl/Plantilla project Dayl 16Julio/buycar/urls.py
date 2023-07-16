from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
from buycar.views import *

app_name = 'buycar'
urlpatterns = [
    path('',views.carindex,name="carindex"),
    path('agregarc/<int:producto_id>/<int:color_id>/<int:cantidad>', agregar_producto, name="agregar"),
    path('eliminarc/<int:producto_id>/<int:color_id>', eliminar_producto, name="eliminar_producto"),
    path('disminuirc/<int:producto_id>/<int:color_id>/<int:cantidad>', restar_cantidad_producto, name="disminuir"),
    path('limpiarc/', limpiar_carrito, name="vaciar_carrito"),
    ]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)