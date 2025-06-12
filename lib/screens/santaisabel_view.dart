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

  Future<Map<String, List<Map<String, dynamic>>>> fetchProductos() async {
    try {
      final response = await http.get(
        Uri.parse('https://lukkyduck1.github.io/santaisable/ofertas_santaisabel.json'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        // Reorganizar los datos en categorías
        final Map<String, List<Map<String, dynamic>>> productos = {
          'Todos': [],
        };

        for (var item in data) {
          productos['Todos']!.add({
            'nombre': item['nombre'],
            'precio': item['precio_actual'],
            'imagen': item['imagen'], // URL de la imagen
          });
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
          final categorias = ['Todos'];

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
