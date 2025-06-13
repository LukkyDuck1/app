import 'package:flutter/material.dart';

class TabCategorias extends StatelessWidget {
  final String? supermercadoActual;
  final Function(String) onCategoriaSeleccionada;

  const TabCategorias({
    required this.supermercadoActual,
    required this.onCategoriaSeleccionada,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define las categorías según el supermercado
    final Map<String, List<String>> categoriasPorSupermercado = {
      'Lider': ['Lácteos', 'Snacks', 'Bebidas', 'Abarrotes'],
      'Santa Isabel': ['Lácteos', 'Panadería', 'Bebestibles', 'Carnes', 'Abarrotes', 'Dulces'],
      'Unimarc': ['Lácteos', 'Snacks', 'Bebidas', 'Carnes', 'Abarrotes'],
    };

    // Define los iconos para cada categoría
    final Map<String, IconData> iconosPorCategoria = {
      'Lácteos': Icons.local_drink,
      'Snacks': Icons.fastfood,
      'Bebidas': Icons.local_bar,
      'Abarrotes': Icons.shopping_basket,
      'Panadería': Icons.bakery_dining,
      'Bebestibles': Icons.wine_bar,
      'Carnes': Icons.restaurant,
      'Dulces': Icons.cake,
    };

    // Obtén las categorías del supermercado actual
    final categorias = categoriasPorSupermercado[supermercadoActual] ?? ['No hay supermercado seleccionado'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categorías - ${supermercadoActual ?? "General"}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                final icono = iconosPorCategoria[categoria] ?? Icons.category;
                
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(
                      categoria,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.withOpacity(0.1),
                      child: Icon(
                        icono,
                        color: Colors.blue,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      if (categoria != 'No hay supermercado seleccionado') {
                        onCategoriaSeleccionada(categoria); // Llamar al callback
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}