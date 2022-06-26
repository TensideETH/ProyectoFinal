from django.db import models
from django.conf import settings
class Marca(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(max_length=200)
    def __str__(self):
        return self.nombre
    class Meta:
        db_table="sistemapedidos_marca"
class Producto(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(max_length=200)
    precio = models.FloatField(default=0)
    stock = models.IntegerField(default=0)
    marca = models.ForeignKey(Marca, on_delete=models.CASCADE)
    imagen = models.ImageField(upload_to='img')
    def __str__(self):
        return self.nombre
    class Meta:
        db_table = "sistemapedidos_producto"
class Pedido(models.Model):
    fecha = models.DateField(default=None)
    productosPedidos = models.ManyToManyField(Producto, through='ProductoPedido')
    estado = models.CharField(choices=[('A', 'ABIERTO'),('E','ENTREGADO'),('P','PENDIENTE'),('V','EN VIAJE')],\
        max_length=1, default='A')
    cliente = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    def __str__(self):
        return str(self.id)
    class Meta:
        db_table = "sistemapedidos_pedido"    
class ProductoPedido(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    cantidad = models.IntegerField(default=1)
    def __str__(self):
        return str(self.id)
    class Meta:
        db_table = "sistemapedidos_productopedido"
# Create your models here.
