import 'package:flutter/material.dart';
import 'santaisabel_view.dart';
import 'unimarc_view.dart';
import 'lider_view.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _tabs = [
    {
      'pagina': const LiderView(),
      'title': 'Lider',
      'icon': Icons.store_mall_directory,
    },
    {
      'pagina': const UnimarcView(),
      'title': 'Unimarc',
      'icon': Icons.storefront,
    },
    {
      'pagina': const SantaIsabelView(),
      'title': 'Santa Isabel',
      'icon': Icons.shopping_bag,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentIndex]['title']),
        backgroundColor: Colors.blue,
      ),
      body: _tabs[_currentIndex]['pagina'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _tabs.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab['icon']),
            label: tab['title'],
          );
        }).toList(),
      ),
    );
  }
}
