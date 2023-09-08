from django.db import models
from producto.models import Producto
# Create your models here.
class Cliente(models.Model):
    TIPO_PERSONA_CHOICES = (
        ('Juridica', 'Juridica'),
        ('Natural', 'Natural'),
    )
    nombre = models.CharField(max_length=50,help_text="Nombre del cliente")
    correo_electronico = models.EmailField(unique=True, max_length=40, help_text="Correo del cliente")
    telefono = models.CharField(max_length=15,help_text="Telefono del cliente")
    ciudad = models.CharField(max_length=30,help_text="Ciudad del cliente")
    direccion = models.CharField(max_length=50,help_text="Direccion del cliente Formato Cll or Cr + ##-##")
    tipo_persona = models.CharField(max_length=50,choices=TIPO_PERSONA_CHOICES,help_text="Tipo juridica de Cliente")
    nit = models.CharField(max_length=15,help_text="Nit de Cliente",null=True)
    
    def __str__(self):
        return(f'{self.nombre} {self.nit}')
