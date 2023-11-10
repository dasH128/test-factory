import 'dart:convert';

import 'package:busrefactori/Views/principal.dart';
import 'package:busrefactori/Views/principal_admin_screen.dart';
import 'package:busrefactori/services/ApiService.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login Lima_Bus';

  @override
  Widget build(BuildContext context) {
    //return MyAppi(); //PrincipalAdminScreen MyAppi
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: _title,
    //   theme: ThemeData(primarySwatch: Colors.amber),
    //   home: PrincipalAdminScreen(),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.black26, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'images/logo.png',
                width: 15,
                height: 250,
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'INGRESAR DATOS',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.account_box_outlined),
                  labelText: 'USUARIO',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.lock_outline),
                  labelText: 'CONTRASEÑA',
                ),
              ),
            ),
            Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5.0),
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text('Acceder'),
                )),
          ],
        ));
  }

  Future<void> login() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Validando...',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.orange,
    ));
    ApiService apiService = ApiService();
    dynamic res = await apiService.iniciarSesion(username.text, password.text);
    dynamic values = json.decode(res.toString());
    print('datos: ${username.text} - ${password.text}');
    print('server response: ${values['data'][0]["login"]}');
    if (values['data'][0]["login"] == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyAppi()));
    } else if (values['data'][0]["login"] == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx) => const PrincipalAdminScreen()));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Usuario o contraseña incorrectos'),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }
}
