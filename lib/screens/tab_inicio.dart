import 'package:flutter/material.dart';

class Tabinicio extends StatelessWidget {
  final Function(String) abrirSupermercado;

  const Tabinicio({required this.abrirSupermercado, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/imagen_comida.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Revisa el precio de tus\nproductos favoritos\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => abrirSupermercado('Lider'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Lider'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => abrirSupermercado('Unimarc'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Unimarc'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => abrirSupermercado('Santa Isabel'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 158, 33, 33),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Santa Isabel'),
            ),
          ],
        ),
      ),
    );
  }
}