import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  // Este widget mostrará la página HomePage de la app.

  @override
  State<PersonalPage> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Gómez Romano'),
    ),
    body: Center(
      child: const Text('Página personal'),
    ),
  );
}
