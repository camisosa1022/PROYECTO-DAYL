# Generated by Django 4.2.2 on 2023-07-07 22:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0005_remove_producto_imagen_imagen'),
    ]

    operations = [
        migrations.AddField(
            model_name='imagen',
            name='stock',
            field=models.IntegerField(blank=True, help_text='Cantidad del producto del color agg', null=True),
        ),
    ]