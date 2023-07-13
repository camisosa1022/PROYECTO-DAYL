from django.conf import settings
from django.db import models
from uuid import uuid4
import os
from django.db.models.signals import post_save, pre_save, pre_delete
from django.dispatch import receiver

def default_product_image():
    return 'imagen/productos/404.png'
def nombreImagen(instance, filename):
    extension = os.path.splitext(filename)[1]
    new_filename = f"{uuid4().hex}{extension}"
    return os.path.join('imagen/productos', new_filename)
    
# Create your models here.
class Proveedor(models.Model):
    ciudad = models.CharField(max_length=30,help_text="Ciudad del proveedor")
    nombre_completo = models.CharField(max_length=60,help_text="Nombre Proveedor")
    nit = models.CharField(max_length=15,help_text="Numero de identifiacion tributaria + digito de verificación adicional o numero de cedula")
    correo_electronico = models.EmailField(unique=True,help_text="Correo electronico del proveedor")
    telefono = models.CharField(max_length=13, help_text="Numero de telefono con identificador de pais")
    direccion = models.CharField(max_length=50,help_text="Dirección del proveedor Cll or Cr + ##-##")
    
    def __str__(self) -> str:
        return f'{self.nombre_completo} {self.nit}'
class Producto(models.Model):
    proveedor_id = models.ForeignKey('Proveedor',on_delete=models.SET_NULL,null=True)
    nombre = models.CharField(max_length=30,help_text="Nombre del producto")
    porcentaje_iva = models.DecimalField(max_digits=3,decimal_places=1,help_text="Porcentaje del iva ej = 16 - 19 ...")
    precio = models.DecimalField(max_digits=10,decimal_places=2,help_text="Valor del producto antes de iva")
    descripcion = models.TextField(help_text="Descripcion del producto")
    stock = models.IntegerField(help_text="Cantidad del producto en inventario")
    subcategoria = models.ForeignKey('Subcategoria',on_delete=models.SET_NULL,null=True)
    oferta = models.DecimalField(max_digits=4,decimal_places=2,null=True)
    def __str__(self) -> str:
        return f'{self.nombre} "{self.stock}" "{self.subcategoria.nombre}"'
class Subcategoria(models.Model):
    nombre = models.CharField(max_length=20,help_text="Nombre de la subcategoria Segundario")
    categoria = models.ForeignKey('Categoria',on_delete=models.SET_NULL,null=True)
    
    def __str__(self) -> str:
        return f'{self.nombre} {self.categoria}'
class Categoria(models.Model):
    nombre = models.CharField(max_length=30,help_text="Nombre de la categoria Principal")
    imagen = models.ImageField(upload_to=nombreImagen,null=True,blank=True,help_text="Imagen de la categoria",default=default_product_image)
    
    def __str__(self) -> str:
        return f'{self.nombre}'
class Color(models.Model):
     imagen = models.ImageField(upload_to=nombreImagen,null=True,blank=True,help_text="Imagen del producto", default=default_product_image)
     color = models.CharField(max_length=26)
     stock = models.IntegerField(null=True, blank=True, help_text="Cantidad del producto del color agg")
     producto_id = models.ForeignKey('Producto',on_delete=models.SET_NULL,null=True)
     
     def __str__(self) -> str:
         return f'{self.producto_id.nombre} - {self.color} {self.id}'
     
@receiver(pre_save, sender=Color)
def update_producto_stock(sender, instance, **kwargs):
    if instance.pk:
        # La imagen ya existe, calcular la diferencia de stock para actualizar el producto
        old_instance = sender.objects.get(pk=instance.pk)
        stock_diff = instance.stock - old_instance.stock
    else:
        # La imagen es nueva, agregar el stock al producto
        stock_diff = instance.stock
    
    producto = instance.producto_id
    producto.stock += stock_diff
    producto.save()

@receiver(pre_delete, sender=Categoria)
@receiver(pre_delete, sender=Color)
def delete_categoria_image(sender, instance, **kwargs):
    if instance.imagen:
        image_path = os.path.join(settings.MEDIA_ROOT, instance.imagen.name)
        if os.path.isfile(image_path):
            os.remove(image_path)