import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tab_home.dart';

class SantaIsabelView extends StatefulWidget {
  const SantaIsabelView({super.key});

  @override
  State<SantaIsabelView> createState() => _SantaIsabelViewState();
}

class _SantaIsabelViewState extends State<SantaIsabelView> {
  late Future<Map<String, List<Map<String, dynamic>>>> _productos;

  @override
  void initState() {
    super.initState();
    _productos = fetchProductos();
  }

  // Mapa de palabras clave por categoría
  final Map<String, List<String>> palabrasPorCategoria = {
    'Lácteos': ['leche', 'queso', 'yogur', 'mantequilla', 'nido','cuisine'],
    'Panadería': ['pan', 'hallulla', 'marraqueta', 'croissant'],
    'Dulces': ['Santa Isabel', 'Sahne Nuss', 'Costa', 'Ferrero Rocher', 'Savory' ],
    'Bebestibles': ['coca', 'fanta', 'sprite', 'Diablo', 'Toro', 'Gato', 'Casillero', 'Misiones', 'cristal','jugo', 'bebida', 'cerveza', 'pepsi', 'agua', 'Stella Artois','Heineken'],
    'Carnes': ['pollo', 'carne', 'vacuno', 'cerdo', 'longaniza', 'pavo','San Jorge', 'Cuisine', 'vacuno', 'cerdo', 'longaniza', 'pavo'],
    'Abarrotes': ['arroz', 'fideo', 'azúcar', 'harina', 'lentejas', 'garbanzos'],
  };

  // Función que determina la categoría de un producto según su nombre
String obtenerCategoria(String nombreProducto) {
  final nombre = nombreProducto.toLowerCase();
  for (var categoria in palabrasPorCategoria.keys) {
    for (var palabra in palabrasPorCategoria[categoria]!) {
      if (nombre.contains(palabra.toLowerCase())) {
        return categoria;
      }
    }
  }
  return 'Otros';
}

  Future<Map<String, List<Map<String, dynamic>>>> fetchProductos() async {
    try {
      final response = await http.get(
        Uri.parse('https://lukkyduck1.github.io/santaisable/ofertas_santaisabel.json'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        final Map<String, List<Map<String, dynamic>>> productos = {
          'Todos': [],
          'Lácteos': [],
          'Panadería': [],
          'Bebestibles': [],
          'Carnes': [],
          'Abarrotes': [],
          'Dulces':[],
          'Otros': [],
        };

        for (var item in data) {
          final nombre = item['nombre'];
          final producto = {
            'nombre': nombre,
            'precio': item['precio_actual'],
            'imagen': item['imagen'],
          };

          // Agregar a "Todos"
          productos['Todos']!.add(producto);

          // Agregar a su categoría correspondiente
          final categoria = obtenerCategoria(nombre);
          productos[categoria]!.add(producto);
        }

        return productos;
      } else {
        throw Exception('Error al cargar los datos');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
      future: _productos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          final productos = snapshot.data!;
          final categorias = productos.keys.toList(); // Esto obtiene todas las categorías dinámicamente

          return TabHome(
            nombre: 'Santa Isabel',
            colorPrincipal: const Color.fromARGB(255, 225, 17, 17),
            productos: productos,
            categorias: categorias,
          );
        }
      },
    );
  }
}