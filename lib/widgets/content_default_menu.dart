import 'package:flutter/material.dart';

class ContentDefaultMenuWidget extends StatelessWidget {
  const ContentDefaultMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
      ]),
    );
  }
}
