import 'package:flutter/material.dart';

import 'my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0.0,
        centerTitle: true,

      ),
      drawer: MyDrawer(),
    );
  }
}
