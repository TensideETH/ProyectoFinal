from django.contrib import admin

from sistemapedidos.models import Producto, Marca, Pedido, ProductoPedido

# Register your models here.
admin.site.register(Producto)
admin.site.register(Marca)
admin.site.register(Pedido)
admin.site.register(ProductoPedido)