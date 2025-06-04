import 'package:flutter/material.dart';

class TabCategorias extends StatelessWidget {
  const TabCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Categorias',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}