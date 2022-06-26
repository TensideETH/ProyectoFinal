from rest_framework import routers
from sistemapedidos import viewsets
router = routers.DefaultRouter()
router.register(r'producto', viewsets.ProductoViewset, basename="producto"),
router.register(r'marca', viewsets.MarcaViewset, basename="marca"),
router.register(r'pedido', viewsets.PedidoViewset, basename="pedido"),
router.register(r'productopedido', viewsets.ProductoPedidoViewset, basename="productopedido"),