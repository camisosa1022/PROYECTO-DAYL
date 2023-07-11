# Generated by Django 4.2.2 on 2023-07-09 14:57

from django.db import migrations, models
import django.db.models.deletion
import producto.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(help_text='Nombre de la categoria Principal', max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Proveedor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ciudad', models.CharField(help_text='Ciudad del proveedor', max_length=30)),
                ('nombre_completo', models.CharField(help_text='Nombre Proveedor', max_length=60)),
                ('nit', models.CharField(help_text='Numero de identifiacion tributaria + digito de verificación adicional o numero de cedula', max_length=15)),
                ('correo_electronico', models.EmailField(help_text='Correo electronico del proveedor', max_length=254, unique=True)),
                ('telefono', models.CharField(help_text='Numero de telefono con identificador de pais', max_length=13)),
                ('direccion', models.CharField(help_text='Dirección del proveedor Cll or Cr + ##-##', max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Subcategoria',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(help_text='Nombre de la subcategoria Segundario', max_length=20)),
                ('categoria', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='producto.categoria')),
            ],
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(help_text='Nombre del producto', max_length=30)),
                ('imagen', models.ImageField(blank=True, default=producto.models.default_product_image, help_text='Imagen del producto', null=True, upload_to='imagen/productos')),
                ('porcentaje_iva', models.DecimalField(decimal_places=1, help_text='Porcentaje del iva ej = 16 - 19 ...', max_digits=3)),
                ('precio', models.DecimalField(decimal_places=2, help_text='Valor del producto antes de iva', max_digits=10)),
                ('descripcion', models.TextField(help_text='Descripcion del producto')),
                ('stock', models.IntegerField(help_text='Cantidad del producto en inventario')),
                ('oferta', models.DecimalField(decimal_places=2, max_digits=4, null=True)),
                ('proveedor_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='producto.proveedor')),
                ('subcategoria', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='producto.subcategoria')),
            ],
        ),
    ]
