from django.http import JsonResponse
from django.shortcuts import render
from . models import *
# Create your views here.
def index(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()

    
    return render(request, "indexproducto.html", {"categorias":categorias,"subcategorias":subcategorias,"productos":productos})
def categorias(request,categoria,subcategoria=None):
    if subcategoria is not None:
        productos=Producto.objects.filter(subcategoria__nombre=subcategoria)
        categoria = categoria
        subcategoria = subcategoria
        categorias = Categoria.objects.all()
        subcategorias = Subcategoria.objects.all()
        context={"productos": productos,
                 "categoria": categoria,
                 "subcategoria": subcategoria,
                 "categorias": categorias,
                 "subcategorias": subcategorias}
    elif categoria is not None:
        productos = Producto.objects.filter(subcategoria__categoria__nombre=categoria)
        categorias = Categoria.objects.all()
        subcategorias = Subcategoria.objects.all()
        context={"productos": productos,
                 "categoria": categoria,
                 "categorias": categorias,
                 "subcategorias": subcategorias}
    return render(request, "productos.html",context)
def producto(request,nombre_producto,id):
    producto=Producto.objects.get(nombre=nombre_producto,id=id)
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    context={"producto": producto,
            "subcategorias": subcategorias,
            "categorias": categorias}
    return render(request, "producto.html",context)