import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginForm.dart';
import 'package:flutter_application_1/ajustes.dart';
import 'package:flutter_application_1/registerForm.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/principal.dart';

class cambiarContrasena extends StatefulWidget {
  cambiarContrasena();
  @override
  _cambiarContrasenaState createState() => _cambiarContrasenaState();
}

class _cambiarContrasenaState extends State<cambiarContrasena> {
  int selectedIndex = 4;
  final password = TextEditingController();
  final passwordActual = TextEditingController();
  final password2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onItemTapped(int index) {
    /*setState(() {
      selectedIndex = index;
    });*/
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
              builder: (context) => PagePrincipal(),
            ))
            .then((var value) {});
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
              builder: (context) => LoginForm(),
            ))
            .then((var value) {});
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
              builder: (context) => RegisterForm(),
            ))
            .then((var value) {});
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
              builder: (context) => PagePrincipal(),
            ))
            .then((var value) {});
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
              builder: (context) => ajustes(),
            ))
            .then((var value) {});
        break;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    password.dispose();
    password2.dispose();
    super.dispose();
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Campo Requerido";
    } else if (value.length < 6) {
      return "Por seguridad la contraseña debe ser superior a 6 carácteres";
    } else
      return null;
  }

  String validatePassword2(String value) {
    if (value != password.text) {
      return "Las contraseñas deben coincidir";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ECOPROTECT',
          style: TextStyle(fontSize: 16.0, fontFamily: 'Glacial Indifference'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 13),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Cambio de contraseña",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 13),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: passwordActual,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña Actual',
                      hintText: 'Introduce contraseña - 6 caracteres mínimo'),
                  validator: validatePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 13),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      hintText: 'Introduce contraseña - 6 caracteres mínimo'),
                  validator: validatePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 13),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: password2,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Repita Contraseña',
                      hintText: 'Introduce de nuevo la contraseña'),
                  validator: validatePassword2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 13),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Scaffold.of(_formKey.currentContext).showSnackBar(
                          SnackBar(content: Text('Processando Datos')));
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (context) => PagePrincipal(),
                      ));
                    }
                  },
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromRGBO(100, 211, 83, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}