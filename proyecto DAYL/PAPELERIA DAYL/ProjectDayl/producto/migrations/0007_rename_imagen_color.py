# Generated by Django 4.2.2 on 2023-07-07 22:39

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('producto', '0006_imagen_stock'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Imagen',
            new_name='Color',
        ),
    ]
