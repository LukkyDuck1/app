import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  final String nombre;
  final Color colorPrincipal;
  final Map<String, List<Map<String, dynamic>>> productos;
  final List<String> categorias;

  const TabHome({
    required this.nombre,
    required this.colorPrincipal,
    required this.productos,
    required this.categorias,
    super.key,
  });

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  String filtroSeleccionado = 'Todos';
  String textoBusqueda = '';
  final TextEditingController _busquedaController = TextEditingController();

  List<Map<String, dynamic>> obtenerProductosFiltrados() {
    List<Map<String, dynamic>> productos;

    if (filtroSeleccionado == 'Todos') {
      productos = widget.productos.values.expand((list) => list).toList();
    } else {
      productos = widget.productos[filtroSeleccionado] ?? [];
    }

    if (textoBusqueda.isNotEmpty) {
      productos = productos.where((producto) {
        final nombre = producto['nombre'].toString().toLowerCase();
        return nombre.startsWith(textoBusqueda.toLowerCase());
      }).toList();
    }

    return productos;
  }

  @override
  Widget build(BuildContext context) {
    final productosFiltrados = obtenerProductosFiltrados();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorPrincipal,
        elevation: 0,
        title: Text(
          widget.nombre,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _busquedaController,
                onChanged: (value) {
                  setState(() {
                    textoBusqueda = value;
                  });
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: 'Buscar productos...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categorias.length,
                itemBuilder: (context, index) {
                  final filtro = widget.categorias[index];
                  final seleccionado = filtro == filtroSeleccionado;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ChoiceChip(
                      label: Text(filtro),
                      selected: seleccionado,
                      onSelected: (_) {
                        setState(() {
                          filtroSeleccionado = filtro;
                        });
                      },
                      selectedColor: widget.colorPrincipal,
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: seleccionado ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: productosFiltrados.isEmpty
                  ? const Center(child: Text('No se encontraron productos.'))
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                      children: productosFiltrados.map((producto) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    producto['imagen'].toString(),
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.broken_image, size: 50);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  producto['nombre'].toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '\$${producto['precio']}',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}