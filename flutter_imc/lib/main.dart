import 'package:flutter/material.dart';

void main() => runApp(Home());


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _descr = 'Informe seus dados!';
void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text.replaceAll(',', '.'));
      double altura = double.parse(
              alturaController.text.replaceAll('.', '').replaceAll(',', '')) /
          100;
      double imc = peso / (altura * altura);

      if (imc < 16.0) {
        _descr = "Magreza Grave IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 16.0 && imc < 17.0) {
        _descr = "Magreza Moderada IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 17.0 && imc < 18.5) {
        _descr = "Magreza Leve IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc < 25.0) {
        _descr = "Saudável IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc < 30.0) {
        _descr = "Sobrepeso IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc < 35.0) {
        _descr = "Obesidade IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 35.0 && imc < 40.0) {
        _descr = "Obesidade Severa IMC: (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40.0) {
        _descr = "Obesidade Mórbida IMC: (${imc.toStringAsPrecision(3)})";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Imc',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora Imc'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField( 
                controller: pesoController,
                keyboardType: TextInputType.number, 
                  decoration: const InputDecoration(
                    hintText: 'kg',
                    labelText: 'Digite seu peso',
                    
                ),
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.numberWithOptions(decimal: false), 
                decoration: const InputDecoration(
                  hintText: 'ex : m',
                  labelText: 'Digite sua altura',
                ),
              ),
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                
                children: <Widget>[
                  RaisedButton(
                   onPressed: (){
                     _calcular();
                   },
                   color: Colors.lightBlue,
                   textColor: Colors.white,
                   child: Text("Calcular Imc"), 
                  ),
                  Text( 
                    _descr,
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
