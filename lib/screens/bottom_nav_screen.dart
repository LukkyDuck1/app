import 'package:app/screens/tab_categorias.dart';
import 'package:app/screens/tab_inicio.dart';
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
  String? _filtroCategoria; // Nueva variable para el filtro

  @override
  void initState() {
    super.initState();
  }

  void _abrirSupermercado(String supermercado) {
    setState(() {
      _supermercadoActual = supermercado;
      _filtroCategoria = null; // Resetear filtro al cambiar supermercado
    });
  }

  void _cerrarSupermercado() {
    setState(() {
      _supermercadoActual = null;
      _filtroCategoria = null; // Resetear filtro
      _currentIndex = 0;
    });
  }

  // Nueva función para aplicar filtro de categoría
  void _aplicarFiltroCategoria(String categoria) {
    setState(() {
      _filtroCategoria = categoria;
      _currentIndex = 0; // Cambiar a la pestaña de inicio
    });
  }

  Widget _getSupermercadoView(List<Map<String, dynamic>> tabs) {
    if (_currentIndex == 0 && _supermercadoActual != null) {
      switch (_supermercadoActual) {
        case 'Lider':
          return LiderView(filtroInicial: _filtroCategoria);
        case 'Santa Isabel':
          return SantaIsabelView(filtroInicial: _filtroCategoria);
        case 'Unimarc':
          return UnimarcView(filtroInicial: _filtroCategoria);
      }
    }
    
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
        'pagina': TabCategorias(
          supermercadoActual: _supermercadoActual,
          onCategoriaSeleccionada: _aplicarFiltroCategoria,
        ),
        'title': 'Categorias',
        'icon': 'assets/icons/icon_2.png',
      },
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