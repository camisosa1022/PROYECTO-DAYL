from http.client import HTTPResponse
from django.http import HttpResponse
from django.shortcuts import redirect, render
from buycar.carrito import Carrito
from producto.models import *
# Create your views here.

def carindex(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()
    context = {'categorias': categorias,
               'subcategorias': subcategorias,
               'productos': productos,}
    return render(request,'carritogeneral.html',context)

def agregar_producto(request,producto_id,color_id,cantidad):
    carrito = Carrito(request)
    producto_carrito = Producto.objects.get(id=producto_id)
    color_carrito = Color.objects.get(id=color_id)
    carrito.agregar(producto_carrito,color_carrito,cantidad)
    redirect_url = request.META.get('HTTP_REFERER', 'index')
    return redirect(redirect_url)

def eliminar_producto(request,producto_id,color_id):
    carrito = Carrito(request)
    producto_carrito = Producto.objects.get(id=producto_id)
    color_carrito = Color.objects.get(id=color_id)
    carrito.eliminar(producto_carrito,color_carrito)
    redirect_url = request.META.get('HTTP_REFERER', 'index')
    return redirect(redirect_url)

def restar_cantidad_producto(request,producto_id,color_id,cantidad):
    carrito = Carrito(request)
    producto_carrito = Producto.objects.get(id=producto_id)
    color_carrito = Color.objects.get(id=color_id)
    carrito.restar_cantidad(producto_carrito,color_carrito,cantidad)
    redirect_url = request.META.get('HTTP_REFERER', 'index')
    return redirect(redirect_url)

def limpiar_carrito(request):
    carrito = Carrito(request)
    carrito.limpiar_carrito()
    redirect_url = request.META.get('HTTP_REFERER', 'index')
    return redirect(redirect_url)