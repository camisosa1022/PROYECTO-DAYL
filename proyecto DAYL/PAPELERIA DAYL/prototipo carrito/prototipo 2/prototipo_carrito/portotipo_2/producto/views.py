from django.http import JsonResponse
from django.shortcuts import redirect, render
from producto.carrito import Carrito
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

def agregar_producto(request,producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.agregar(producto)
    return redirect("index" )

def eliminar_producto(request,producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.eliminar(producto)
    return redirect("index" )

def restar_producto(request,producto_id):
    carrito = Carrito(request)
    producto = Producto.objects.get(id=producto_id)
    carrito.restar(producto)
    return redirect("index" )

def limpiar_carrito(request):
    carrito = Carrito(request)
    carrito.limpiar()
    return redirect("index" )