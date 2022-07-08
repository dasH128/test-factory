import 'package:flutter/material.dart';
import 'package:busrefactori/lista.dart';
import 'package:busrefactori/reporte.dart';

class MyAppi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "LIMA BUS S.A",
            ),
            actions: <Widget>[
              Icon(
                Icons.airport_shuttle_rounded,
                size: 50.0,
              ),
              Icon(
                Icons.airport_shuttle_rounded,
                size: 50.0,
              ),
              Icon(
                Icons.airport_shuttle_rounded,
                size: 50.0,
              ),
            ],
            centerTitle: true,
          ),
          drawer: MenuLateral(),
          body: Center(
            child: Text("HOME"),
          ),
        ));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(" "),
            accountEmail: Text(" "),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.limabus.com.pe/wp-content/uploads/2021/09/LIMA-BUS-INTERNACIONAL-1.jpg"),
                    fit: BoxFit.cover)),
          ),
          new ListTile(
            title: Text(
              "RECOMENDACIONES DE SEGURIDAD ",
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Empresa()));
            },
          ),
          new ListTile(
            title: Text("REPORTES DE FALLAS Y VARADAS"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => reporte()));
            },
          ),
          new ListTile(
            title: Text("LISTA DE CHEQUEO"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => lista()));
            },
          )
        ],
      ),
    );
  }
}

class Empresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("RECOMENDACIONES DEL PILOTO"),
      ),
      body: Center(
         child: Stack(
           alignment: Alignment.bottomCenter,
          children: [
            Image.asset('images/piloto.jpg', width:450,height: 450,),


            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("ESTIMADO PILOTO REPORTA TODA NOVEDAD O FALLA QUE PRESENTA EL BUS, CON TU APOYO "
                "AYUDARAS EVITAR UNA VARADA, ESTO CON EL FIN DE DAR UN BUEN SERVICIO A NUESTROS USUARIOS." , style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 15),),
            ),
        ]
      ),

    ));

  }
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("PRODUCTOS"),
      ),
      body: Center(
        child: Text("ESTAS EN PRODUCTOS"),
      ),
    );
  }
}

class Galeria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("GALERIA"),
      ),
      body: Center(
        child: Text("ESTAS EN GALERIA"),
      ),
    );
  }
}

class Contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("CONTACTO"),
      ),
      body: Center(
        child: Text("ESTAS EN CONTACTO"),
      ),
    );
  }
}
