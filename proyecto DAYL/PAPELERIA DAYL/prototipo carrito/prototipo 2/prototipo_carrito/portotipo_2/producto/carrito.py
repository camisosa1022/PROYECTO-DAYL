from producto.templatetags.custom_filters import calcular_precio_oferta_iva, imagen_carrito,calcular_precio_carrito
from . models import *
class Carrito:
    def __init__(self, request):
        self.request = request
        self.sesion = request.session
        carrito = self.sesion.get("carrito")
        if not carrito:
            self.sesion["carrito"] ={}
            self.carrito = self.sesion["carrito"]
        else:
            self.carrito = carrito
    def oferta(self, producto):
        ofert = (producto.precio * (1 - (producto.oferta/100)))*(producto.porcentaje_iva/100 +1)
        return ofert
    
    def agregar(self,producto):
        id= str(producto.id)       
        if id not in self.carrito.keys():
            self.carrito[id] ={
                "producto_id": producto.id,
                "imagen": str(imagen_carrito(producto)),
                "nombre": producto.nombre,
                "acumulado": int(calcular_precio_carrito(producto)),
                "description": producto.descripcion,
                "cantidad": 1
            }
        else:
            self.carrito[id]["cantidad"]+=1
            self.carrito[id]["acumulado"]= self.carrito[id]["acumulado"] + int(calcular_precio_carrito(producto))
        
        self.guardar_carrito()

    
    
    def guardar_carrito(self) -> None:
        self.sesion["carrito"] = self.carrito
        self.sesion.modified = True
    
    def eliminar(self,producto):
        id = str(producto.id)
        if id in self.carrito:
            del self.carrito[id]
            self.guardar_carrito()
        

    def restar(self, producto):
        id = str(producto.id)
        if id in self.carrito.keys():
            self.carrito[id]["cantidad"]-=1
            self.carrito[id]["acumulado"]-= int(calcular_precio_oferta_iva(producto.precio, producto.porcentaje_iva,producto.oferta)),
            if self.carrito[id]["cantidad"]<=0:
                self.eliminar(producto)
            self.guardar_carrito()
        
        
    def limpiar(self):
        self.sesion["carrito"] = {}
        self.sesion.modified = True
        
        
