import 'package:busrefactori/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class QuienesSomosWidget extends StatelessWidget {
  const QuienesSomosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        //1 Form como raiz de nuestro formulario
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 20,
              ),
              child: const Center(
                child: Text("QUIENES SOMOS",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
              ),
            ),
            const LogoWidget(),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: const Center(
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
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Center(
                child: Container(
                  height: 150.0,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/mision.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Center(
                child: Container(
                  height: 150.0,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/vision.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
