from django.shortcuts import render
from producto.models import *

def index(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()
    k = 0

    return render(request, 'index.html',{"categorias": categorias, "subcategorias": subcategorias, "productos": productos,"k": k})

def contador(request, cont):
    cont += 1
    return cont
    
