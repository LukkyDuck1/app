import 'package:app/screens/tab_carrito.dart';
import 'package:app/screens/tab_categorias.dart';
import 'package:app/screens/tab_inicio.dart';
import 'package:app/screens/tab_mas.dart';
import 'package:app/screens/lider_view.dart';
import 'package:app/screens/santaisabel_view.dart';
import 'package:app/screens/unimarc_view.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  String? _supermercadoActual;

  @override
  void initState() {
    super.initState();
  }

  void _abrirSupermercado(String supermercado) {
    setState(() {
      _supermercadoActual = supermercado; // Cambiar automáticamente a la pestaña de Categorías
    });
  }

  void _cerrarSupermercado() {
    setState(() {
      _supermercadoActual = null;
      _currentIndex = 0; // Regresar a la pestaña de inicio
    });
  }

  Widget _getSupermercadoView(List<Map<String, dynamic>> tabs) {
    // Solo mostrar vistas de supermercado si estás en la pestaña de Inicio (index 0)
    // y hay un supermercado seleccionado
    if (_currentIndex == 0 && _supermercadoActual != null) {
      switch (_supermercadoActual) {
        case 'Lider':
          return const LiderView();
        case 'Santa Isabel':
          return const SantaIsabelView();
        case 'Unimarc':
          return const UnimarcView();
      }
    }
    
    // En cualquier otro caso, mostrar la pestaña normal
    return tabs[_currentIndex]['pagina'];
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {
        'pagina': Tabinicio(abrirSupermercado: _abrirSupermercado),
        'title': 'Inicio',
        'icon': 'assets/icons/Icon_casa.png',
      },
      {
        'pagina': TabCategorias(supermercadoActual: _supermercadoActual),
        'title': 'Categorias',
        'icon': 'assets/icons/icon_2.png',
      },
      // Eliminadas las pestañas de Carrito y Mas
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_supermercadoActual ?? tabs[_currentIndex]['title']),
        leading: _supermercadoActual != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _cerrarSupermercado,
              )
            : null,
      ),
      body: _getSupermercadoView(tabs),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Ya no necesitas verificar índices 2 y 3 (Carrito y Mas)
            // Solo mantener el supermercado para Inicio (0) y Categorías (1)
          });
        },
        items: tabs.map((tab) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              tab['icon'],
              width: 24,
              height: 24,
            ),
            label: tab['title'],
          );
        }).toList(),
      ),
    );
  }
}