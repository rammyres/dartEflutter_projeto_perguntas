import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() quandoReiniciar;

  Resultado(
    this.nota,
    this.quandoReiniciar,
  );

  String get texto {
    if (this.nota <= 8) {
      return "Parabéns! Nota $nota.";
    } else if (8 < this.nota && this.nota <= 12) {
      return "Quase lá! Nota $nota.";
    } else if (12 < this.nota && this.nota <= 24) {
      return "Muito bem! Nota $nota.";
    } else if (24 < this.nota) {
      return "Excelente! Nota $nota.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              this.texto,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          FlatButton(
            onPressed: quandoReiniciar,
            child: Text(
              "Reiniciar formuilário",
              style: TextStyle(fontSize: 28),
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
