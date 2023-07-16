def total_carrito(request):
    total = 0
    carrito = request.session.get("carrito", {})
    for key, value in carrito.items():
        total += int(value.get("acumulado", 0))
                
    return {"total_carrito": total}
