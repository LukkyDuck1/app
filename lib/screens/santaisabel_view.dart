import 'package:flutter/material.dart';
import 'tab_home.dart';

class SantaIsabelView extends StatelessWidget {
  const SantaIsabelView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabHome(
      nombre: 'Santa Isabel',
      colorPrincipal: Colors.red,
      categorias: ['Todos', 'Lácteos', 'Snacks', 'Bebidas'],
      productos: {
        'Lácteos': [
          {'nombre': 'Leche Entera', 'precio': 1200, 'imagen': 'assets/images/lecheentera.png'},
        ],
        'Snacks': [
          {'nombre': 'Papas Fritas', 'precio': 800, 'imagen': 'assets/images/papasfritas.png'},
          {'nombre': 'Nutella', 'precio': 2500, 'imagen': 'assets/images/nutella.png'},
        ],
        'Bebidas': [
          {'nombre': 'Coca Cola 591ml', 'precio': 1500, 'imagen': 'assets/images/cocacola.png'},
        ],
      },
    );
  }
}
