def calcular_precio_carrito(producto):
    if producto.oferta is None:
        return producto.precio*((producto.porcentaje_iva/100)+1)
    else:
        return int(round((producto.precio*(1-(producto.oferta/100)))*((producto.porcentaje_iva/100)+1),0))
    
class Carrito:
    def __init__(self,request):
        self.request = request
        self.session = request.session
        self.carrito = self.session.get("carrito", {})
        if not self.carrito:
            self.session["carrito"] = {}
            self.carrito = self.session["carrito"]

    
    def agregar(self,producto,cantidad):
        id = str(producto.id)
        if id not in self.carrito.keys():
            self.carrito[id] = {
                "producto_id": producto.id,
                "nombre": producto.nombre,
                "cantidad": cantidad,
                "valor" : calcular_precio_carrito(producto),
                "acumulado": calcular_precio_carrito(producto)*cantidad,
                "imagen": (producto.color_set.first()).imagen.url
            }
        else:
            self.carrito[id]["cantidad"] += cantidad
            print("Entramos en esta monda")
            self.carrito[id]["acumulado"] = self.carrito[id]["cantidad"] * calcular_precio_carrito(producto)
        self.guardar_carrito()
        
    def guardar_carrito(self):
        self.session["carrito"] = self.carrito
        self.session.modified = True
    
    def eliminar(self,producto):
        id = str(producto.id)
        if id in self.carrito:
            del self.carrito[id]
        self.guardar_carrito()
        
    def restar_cantidad(self,producto,cantidad):
        id = str(producto.id)
        if id in self.carrito.keys():
            self.carrito[id]["cantidad"] -= cantidad
            self.carrito[id]["acumulado"] = calcular_precio_carrito(producto)*self.carrito[id]["cantidad"]
            if self.carrito[id]["cantidad"] <= 0:
                self.eliminar(producto)
            self.guardar_carrito()
            
    def limpiar_carrito(self):
        self.session["carrito"] = {}
        self.session.modified = True
        
             