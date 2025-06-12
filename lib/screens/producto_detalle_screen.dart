import 'package:flutter/material.dart';
import '/models/modelo_producto.dart';
//Declarar algo que se defina entre todas las screens como una variable definitiva? 

class ProductoDetallado extends StatelessWidget {

  final ModeloProducto producto;
  const ProductoDetallado({super.key, required this.producto});
  //Faltaria declarar algo? Hacerlo dinamico?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre), //Lo ideal es definir un modelo y asignarle el nombre!!
      ),
      //Asignar la imagen del producto de manera centralizada al Figma, Agregar también unos contenedores o cards con informacion nutricional abajo...
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //Definicion de imagen
          children: [
            Image.asset(
              producto.imagen,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              producto.nombre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${producto.precio.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 30),
            /*ElevatedButton(
              onPressed: () {
                // Lógica para añadir al carrito
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Añadir al carrito',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),*/
            const Text(
              'Descripción del producto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Descripción detallada del producto aquí. Puedes incluir ingredientes, información nutricional, peso, etc.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),   
    );
  }
}

