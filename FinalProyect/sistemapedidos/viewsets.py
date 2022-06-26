import rest_framework
from rest_framework import viewsets
from sistemapedidos import models
from sistemapedidos.models import Marca, Pedido, Producto, ProductoPedido
from . import serializers
import datetime
import json
from django.conf import settings
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import action
from rest_framework.response import Response
class ProductoViewset(viewsets.ModelViewSet):
    #permission_classes = [IsAuthenticated]
    #authentication_classes = (TokenAuthentication,)
    serializer_class = serializers.ProductoSerializer
    queryset = Producto.objects.all()
class MarcaViewset(viewsets.ModelViewSet):
    serializer_class = serializers.MarcaSerializer
    queryset = Marca.objects.all()
class PedidoViewset(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    authentication_classes = (TokenAuthentication,)
    serializer_class = serializers.PedidoSerializer
    queryset = Pedido.objects.all()
    @action(detail=False, methods=['GET'], name='Crear pedido')
    def crear(self, request):
        client = request.user #Esto identifica automáticamente al usuario que esté identificado
        p = Pedido(fecha=datetime.date.today(), estado= 'A',cliente=client)
        p.save()
        queryset = models.Pedido.objects.filter(id=p.id)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data) 
    @action(detail=False, methods=['GET'], name='Lista por cliente')
    def c(self, request):
        queryset = models.Pedido.objects.filter(cliente=request.user.id)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    @action(detail=False, methods=['GET'], name='Lista por cliente')
    def cerrar(self, request):
        queryset = models.Pedido.objects.filter(cliente=request.user.id)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
class ProductoPedidoViewset(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    authentication_classes = (TokenAuthentication,)
    serializer_class = serializers.ProductoPedidoSerializer
    queryset = ProductoPedido.objects.all()
    @action(detail=True, methods=['GET'], name='Detalle validado')
    def det(self, request, pk=None):
        queryset = models.ProductoPedido.objects.filter(pedido=pk)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    @action(detail=False, methods=['POST'], name='Agregar a pedido')
    def agregar(self, request):
        #datos = request.data
        #request.POST.get('idProd')
        jData=json.loads(request.body)
        prod = Producto.objects.filter(id=jData["idProd"]).first() 
        ped = Pedido.objects.filter(id=jData["idPed"]).first()
        p = ProductoPedido(pedido=ped, producto=prod, cantidad = 1)
        p.save()
        queryset = models.ProductoPedido.objects.filter(pedido=ped, producto=prod)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)