# Generated by Django 4.2.2 on 2023-06-21 20:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0002_alter_producto_porcentaje_iva'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='precio',
            field=models.DecimalField(decimal_places=2, help_text='Valor del producto antes de iva', max_digits=10),
        ),
    ]
