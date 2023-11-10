import 'package:busrefactori/Views/buscar_reporte_screen.dart';
import 'package:busrefactori/Views/principal.dart';
import 'package:busrefactori/main.dart';
import 'package:busrefactori/widgets/quien_somos_widget.dart';
import 'package:flutter/material.dart';

class PrincipalAdminScreen extends StatelessWidget {
  const PrincipalAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAdminView(),
      appBar: AppBar(),
      body: const QuienesSomosWidget(),
    );
  }
}

class DrawerAdminView extends StatelessWidget {
  const DrawerAdminView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(" "),
            accountEmail: Text(" "),
            decoration: BoxDecoration(
              image: DecorationImage(
                  // image: NetworkImage(
                  //   "https://www.limabus.com.pe/wp-content/uploads/2021/09/LIMA-BUS-INTERNACIONAL-1.jpg",
                  // ),
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: const Text(
              "RECOMENDACIONES DE SEGURIDAD ",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Empresa()));
            },
          ),
          ListTile(
            title: const Text("BUSCAR REPORTES"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const BuscarReporteScreen()));
            },
          ),
          // ListTile(
          //   title: const Text("3"),
          //   onTap: () {
          //     Navigator.of(context).pop();
          //     // Navigator.of(context).push(MaterialPageRoute(
          //     //     builder: (BuildContext context) => lista()));
          //   },
          // ),
          Divider(),
          ListTile(
            title: const Text("logout"),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) => const LoginView()));
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => lista()));
            },
          ),
        ],
      ),
    );
  }
}
