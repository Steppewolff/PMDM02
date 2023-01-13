import 'package:flutter/material.dart';
import 'package:gomez_romano_fernando_pmdm02_tarea/src/pages/WidgetPage.dart';
import 'PersonalPage.dart';

class Persona {
  late String nombre;
  late String apellido;
  late String fechaNacimiento;
  late String email;
  late String pwd;

  //Constructores de la clase Persona, solamente se utilizará el nombrado como .sinNombre
  Persona.soloNombre(this.nombre);

  Persona.sinNombre(this.apellido, this.fechaNacimiento, this.email, this.pwd);

  Persona(
      this.nombre, this.apellido, this.fechaNacimiento, this.email, this.pwd);

  //Setter y getter del atributo nombre. No se crean los del resto de atributos porque se pasan sus valores del formulario de PersonalPage usando otro método
  get getNombre => nombre;

  set setNombre(nombre) => this.nombre = nombre;
}

//Se crea el widget para la págin inicial Homepage. Como se utilizan botones y cmabia su estado se extiende Statefulwidget
class HomePage extends StatefulWidget {
  late Persona persona;
  //Constructor nombrado sin parámetros
  HomePage.sinParametro();
  //Constructor utilizado para pruebas que requiere como parámetrocun objeto Persona
  HomePage({super.key, required this.persona});

  @override
  //Se almacena el estado del widget HomePage
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPPMMD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Datos personales',
              style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.underline,
                color: Colors.amber,
              ),
            ),
            Container(
              child: Column(
                children: [
                  //Se muestran los atributos de la clase Persona para comprobar que se pasan de PersonalPage a HomePage
                  Text(persona.nombre),
                  Text(persona.apellido),
                  Text(persona.fechaNacimiento),
                  Text(persona.email),
                  Text(persona.pwd),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                FloatingActionButton.extended(
                  heroTag: 'btn1',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalPage(persona: persona),
                      ),
                    );
                  },
                  label: Text('Ir a página Personal'),
                ),
                FloatingActionButton.extended(
                  heroTag: 'btn2',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WidgetPage(),
                      ),
                    );
                  },
                  label: Text('Ir a página de Widget AnimatedContainer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
