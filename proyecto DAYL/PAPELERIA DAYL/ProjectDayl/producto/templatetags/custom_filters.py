from django import template

register = template.Library()

@register.simple_tag
def increment(value):
    return value+1

@register.simple_tag
def calcular_precio_oferta_iva(valor,iva,oferta):

    if oferta is None:
        return valor*((iva/100)+1)
    else:
        return round((valor*(1-(oferta/100)))*((iva/100)+1),0)
@register.simple_tag
def calcular_precio_iva(producto):
    return round(producto.precio*((producto.porcentaje_iva/100)+1),0)

@register.simple_tag(takes_context=True)
def primera_imagen(context,producto):
    primera_imagen = producto.color_set.first()
    if primera_imagen:
        return primera_imagen.imagen.url
    else:
        return "unknown"
@register.simple_tag(takes_context=True)
def imagenes_color(context,producto):
    imagenes = producto.color_set.all()
    return imagenes
