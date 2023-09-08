from django.http import JsonResponse
from django.shortcuts import render
from producto.models import *

def index(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()
    k = 0

    return render(request, 'index.html',{"categorias": categorias,
                                         "subcategorias": subcategorias,
                                         "productos": productos,
                                         "k": k,})
def obtener_imagen_color(request):
    color_id = request.GET.get('colorId')
    try:
        color = Color.objects.get(id=color_id)
        imagen_url = color.imagen.url
        return JsonResponse({'imagen_url': imagen_url})
    except Color.DoesNotExist:
        return JsonResponse({'error': 'Color no encontrado',
                             "color": color_id})
def registro(request):
    return render(request, 'layouts/parcials/register.html')