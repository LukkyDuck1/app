import 'package:flutter/material.dart';

class TabCarrito extends StatelessWidget {
  const TabCarrito({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Carritos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}