import 'package:flutter/material.dart';
import 'package:busrefactori/Views/lista.dart';
import 'package:busrefactori/Views/reporte.dart';

class MyAppi extends StatelessWidget {
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
        body: Container(
          child: SingleChildScrollView(
              child: Form(
            //1 Form como raiz de nuestro formulario
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text("QUIENES SOMOS",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  padding: EdgeInsets.only(
                    top: 20.0,
                    right: 20,
                  ),
                ),
                _Logo(context),
                Container(
                  child: Center(
                    child: Text(
                      "Nuestras operaciones comenzaron el año 2010 como una de las cuatro empresas operadoras del Sistema Metropolitano. Desde Entonces, nuestro crecimiento no se ha detenido, gracias al compromiso de nuestros 600 colaboradores y a la consolidacion de alianzas estrategicas. Como organizacionm tenemos el firme proposito de contribuir a mejorar la calidad de vida de los ciudadanos. Destacamos que nuestra filosofia se basa en promover el bienestar de nuestros colaboradores, aspecto que ha sido reconocido con la certificacion de la asociacion de buenos empleadores (ABE).",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: 150.0,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/mision.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: 150.0,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/vision.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10),
                )
              ],
            )),
          )),
        ),
      ),
    );
  }

  Widget _Logo(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 200.0,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
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
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(
              'images/piloto.jpg',
              width: 450,
              height: 450,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "ESTIMADO PILOTO REPORTA TODA NOVEDAD O FALLA QUE PRESENTA EL BUS, CON TU APOYO "
                "AYUDARAS EVITAR UNA VARADA, ESTO CON EL FIN DE DAR UN BUEN SERVICIO A NUESTROS USUARIOS.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
          ]),
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
