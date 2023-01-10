import 'package:flutter/material.dart';

// Este widget almacena el estado de la página PersonalPage.
class PersonalPage extends StatefulWidget {
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

// Este widget mostrará la página HomePage de la app.
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
          const Text('Página personal'),
          Form(
            key: personalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Introduce tu nombre:'),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu nombre';
                    }
                  },
                ),
                Text('Introduce tu apellido:'),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor rellena tu apellido';
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (personalFormKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Datos recibidos')));
                    }
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

//                    if (personalFormKey.currentState!.validate()){
//                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Datos recibidos')));
//                    }
//                  },
//                  child: Text('Enviar'),),