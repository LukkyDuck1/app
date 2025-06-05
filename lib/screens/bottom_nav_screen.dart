import 'package:app/screens/tab_carrito.dart';
import 'package:app/screens/tab_categorias.dart';
import 'package:app/screens/tab_home.dart';
import 'package:app/screens/tab_mas.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> _tabs = [
    {'pagina': const TabHome(), 'title': 'Inicio', 'icon': 'assets/icons/Icon_casa.png'},
    {'pagina': const TabCategorias(), 'title': 'Categorias', 'icon': 'assets/icons/icon_2.png'},
    {'pagina': const TabCarrito(), 'title': 'carrito', 'icon': 'assets/icons/Icon_carrito.png'},
    {'pagina': const TabMas(), 'title': 'Mas', 'icon': 'assets/icons/icon_mas.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentIndex]['title']),
      ),
      body: _tabs[_currentIndex]['pagina'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
  BottomNavigationBarItem(
    icon: Image.asset(
      _tabs[0]['icon'],
      width: 24,
      height: 24,
    ),
    label: _tabs[0]['title']
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      _tabs[1]['icon'],
      width: 24,
      height: 24,
    ),
    label: _tabs[1]['title']
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      _tabs[2]['icon'],
      width: 24,
      height: 24,
    ),
    label: _tabs[2]['title']
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      _tabs[3]['icon'],
      width: 33,
      height: 33,
    ),
    label: _tabs[3]['title']
  )   
],
      ),

    );
  }
}