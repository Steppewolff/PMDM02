import 'dart:math';

import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  // Este widget mostrará la página WidgetPage de la app.
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  //Este widget almacena el estado del widget por defecto, sus propiedades

  String _url = 'https://picsum.photos/250';
  var _reload = Random().nextInt(500);
  Color _color = Colors.blueGrey;
  BorderRadiusGeometry _borde = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        //Widget AnimatedContainer, usado para animar un elemento de la pantalla
        child: AnimatedContainer(
          width: 350,
          height: 350,
          color: _color,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Image.network(_url),
        ),
      ),
      //Se crea una barra inferior con botones para interactuar con el widget AnimatedContainer
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            setState(() {
              _reload = Random().nextInt(500);
              _url = 'https://picsum.photos/id/$_reload/250';
            });
          }
          if (value == 1) {
            setState(() {
              final numero = Random();
              _color = Color.fromRGBO(
                numero.nextInt(256),
                numero.nextInt(256),
                numero.nextInt(256),
                1,
              );
            });
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Siguiente Fotografía',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Cambiar color de fondo',
          )
        ],
      ),
    );
  }
}
