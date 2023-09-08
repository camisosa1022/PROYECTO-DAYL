from django.db import models

def default_product_image():
    return 'imagen/productos/404.png'
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
    imagen = models.ImageField(upload_to='imagen/productos',null=True,blank=True,help_text="Imagen del producto", default=default_product_image)
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
    
    def __str__(self) -> str:
        return f'{self.nombre}'

