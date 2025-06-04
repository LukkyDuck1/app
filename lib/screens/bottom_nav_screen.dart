import 'package:app/screens/tab_home.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> _tabs = [
    {'pagina': const TabHome(), 'title': 'Categorias', 'icon': Icons.category},
    {'pagina': const TabHome(), 'title': 'Favoritos', 'icon': Icons.favorite},
    {'pagina': const TabHome(), 'title': 'Mas', 'icon': Icons.more_horiz},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentIndex]['title']),
      ),
      body: _tabs[_currentIndex]['pagina'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_tabs[0]['icon']),
            label: _tabs[0]['title']
            )
          ,
          BottomNavigationBarItem(
            icon: Icon(_tabs[1]['icon']),
            label: _tabs[1]['title']
            ),

            BottomNavigationBarItem(
            icon: Icon(_tabs[2]['icon']),
            label: _tabs[2]['title']
            )  
        ],
      ),

    );
  }
}