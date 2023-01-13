import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';

// Este widget almacena el estado de la página PersonalPage.
class PersonalPage extends StatefulWidget {
  Persona persona;
  PersonalPage({super.key, required this.persona});

  //Se guarda el estado del wiget PersonalPage
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

//Se instancia el objeto persona, inicializando todos sus atributos
Persona persona = Persona(
    'Fernando', 'Gómez', '12/05/1982', 'fernando@fernando.es', '123456789');

// Este widget mostrará la página PersonalPage de la app.
class _PersonalPageState extends State<PersonalPage> {
  final personalFormKey = GlobalKey<FormState>();

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
          //Widget para formulario de datos personales
          Form(
            key: personalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: persona.nombre,
                  decoration:
                      InputDecoration(labelText: 'Introduce tu nombre:'),
                  onChanged: (String value) {
                    setState(() {
                      //Se emplea el método setter para pasar el valor introducido en el formualrio
                      persona.setNombre = value;
                    });
                  },
                  //Se valida el campo, que no esté vacío
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
                  onChanged: (String value) {
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
                  onChanged: (String value) {
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
                  onChanged: (String value) {
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
                  onChanged: (String value) {
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
                //Botón para enviar datos de formulario
                ElevatedButton(
                  onPressed: () {
                    if (personalFormKey.currentState!.validate()) {
                      //Se activa una barra en el pie que informa al usuario de que se ha guardado la información
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Datos recibidos ' + persona.nombre)));
                    }
                    //Se vuelve a la HomePage y se pasa como argumento el objeto persona modificado con datos de formulario
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
