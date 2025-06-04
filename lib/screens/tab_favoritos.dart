import 'package:flutter/material.dart';

class TabFavoritos extends StatelessWidget {
  const TabFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favoritos',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}