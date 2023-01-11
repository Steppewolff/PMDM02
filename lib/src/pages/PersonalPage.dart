import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';

// Este widget almacena el estado de la página PersonalPage.
class PersonalPage extends StatefulWidget {
  Persona persona;
  PersonalPage({super.key, required this.persona});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

// Persona persona = Persona.sinNombre(
//     'Gómez', '12/05/1982', 'fernando@fernando.es', '123456789');

Persona persona = Persona(
    'Prueba', 'Gómez', '12/05/1982', 'fernando@fernando.es', '123456789');

// class Formulario extends StatefulWidget {
//   @override
//   State<Formulario> createState() => _Formulario();
// }

// class _Formulario extends State<Formulario> {
//   final valorTexto = TextEditingController();

//   @override
//   Widget build(BuildContext context) {}
// }

// Este widget mostrará la página HomePage de la app.
class _PersonalPageState extends State<PersonalPage> {
  final personalFormKey = GlobalKey<FormState>();
  final valorTexto = TextEditingController();

  @override
  void reinicio() {
    valorTexto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gómez Romano'),
      ),
      body: Column(
        children: [
          const Text(
            'Formulario de información personal',
            style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
                decoration: TextDecoration.underline),
          ),
          Form(
            key: personalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: persona.nombre,
                  controller: valorTexto,
                  decoration:
                      InputDecoration(labelText: 'Introduce tu nombre:'),
                  onFieldSubmitted: (String value) {
                    persona.nombre = valorTexto.text;
                    setState(() {
                      persona.nombre = 'Fernando';
                      persona.setNombre = 'Fernando';
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu nombre';
                    }
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Introduce tu apellido:'),
                  initialValue: persona.apellido,
                  onFieldSubmitted: (value) {
                    setState(() {
                      persona.apellido = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu apellido';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Introduce tu fecha de nacimiento:'),
                  initialValue: persona.fechaNacimiento,
                  onFieldSubmitted: (value) {
                    setState(() {
                      persona.fechaNacimiento = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu fecha de nacimiento';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Introduce tu email:'),
                  initialValue: persona.email,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    setState(() {
                      persona.email = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu correo electrónico';
                    }
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Introduce tu contraseña:'),
                  initialValue: persona.pwd,
                  onFieldSubmitted: (value) {
                    setState(() {
                      persona.pwd = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu contraseña';
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (personalFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Datos recibidos ' + valorTexto.text)));
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(persona: persona),
                      ),
                    );
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
