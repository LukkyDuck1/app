import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 4,
         child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home), text: 'Home'),
                Tab(
                  icon: Icon(Icons.category), text: 'Categorias'),
                Tab(
                  icon: Icon(Icons.favorite), text: 'Favoritos'),
                Tab(
                  icon: Icon(Icons.more_horiz), text: 'Mas'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Home')),
              Center(child: Text('Categorias')),
              Center(child: Text('Favoritos')),
              Center(child: Text('Mas')),
            ],
          ),
         )),
    );
  }
}