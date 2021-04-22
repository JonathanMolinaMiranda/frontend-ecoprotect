import 'package:flutter/material.dart';
import 'package:flutter_application_1/loginForm.dart';
import 'package:flutter_application_1/ajustes.dart';
import 'package:flutter_application_1/registerForm.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/principal.dart';

class solicitarVerificado extends StatefulWidget {
  solicitarVerificado();
  @override
  _solicitarVerificadoState createState() => _solicitarVerificadoState();
}

class _solicitarVerificadoState extends State<solicitarVerificado> {
  int selectedIndex = 4;

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
                      "Verificar cuenta",
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
              Container(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Una insignia verificada es un icono que aparece junto al nombre de usuario en tus publicaciones que representa la presencia de una organización. Tener la verificación te permitirá subir publicaciones de el antes y después de una ubicación concreta. Además, el gradiente de tus publicaciones se convierte en un gradiente de satisfacción',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 13),
              ),
              Container(
                height: 50,
                width: 1000,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => ajustes(),
                    ));
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Envía tu solicitud de verificación a través de ecoprotect@eco.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
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