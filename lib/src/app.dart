import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

class AppPMDM02 extends StatelessWidget {
  // Este widget servirá para organizar el resto de la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //Se instancia la HomePage con un constructor sin parámetros
        child: HomePage.sinParametro(),
      ),
    );
  }
}
