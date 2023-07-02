from django.shortcuts import render
from . models import *
# Create your views here.
def index(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()

    
    return render(request, "producto.html", {"categorias":categorias,"subcategorias":subcategorias,"productos":productos})