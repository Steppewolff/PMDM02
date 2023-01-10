import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  // Este widget mostrará la página HomePage de la app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Principal'),
      ),
      body: Center(
        child: const Text('Página widget'),
      ),
    );
  }
}
