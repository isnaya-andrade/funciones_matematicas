import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Funciones()));
}

class Funciones extends StatefulWidget {
  const Funciones({super.key});

  @override
  CalculadoraState createState() => CalculadoraState();
}

class CalculadoraState extends State<Funciones> {
  final TextEditingController num1_controller = TextEditingController();
  final TextEditingController num2_controller = TextEditingController();

  void onSumar() {
    
    if(num1_controller.text.isEmpty || num2_controller.text.isEmpty) {
      return;
    }

    num resultado = double.parse(num1_controller.text) + double.parse(num2_controller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaResultados(operacion: 'Suma', resultado: resultado),
        ),
      );
  }

  void onRestar() {
    if(num1_controller.text.isEmpty || num2_controller.text.isEmpty) {
      return;
    }

    num resultado = double.parse(num1_controller.text) - double.parse(num2_controller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaResultados(operacion: 'Resta', resultado: resultado),
        ),
      );
  }

  void onDividir() {
    if(num1_controller.text.isEmpty || num2_controller.text.isEmpty) {
      return;
    }

    num resultado = double.parse(num1_controller.text) / double.parse(num2_controller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaResultados(operacion: 'División', resultado: resultado),
        ),
      );
  }

  void onMultiplicar() {
    if(num1_controller.text.isEmpty || num2_controller.text.isEmpty) {
      return;
    }

    num resultado = double.parse(num1_controller.text) * double.parse(num2_controller.text);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaResultados(operacion: 'Multiplicación', resultado: resultado),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('Número 1'),
              TextField(
                controller: num1_controller,
                decoration: const InputDecoration(
                  labelText: 'Ingresa el primer núnmero', // Etiqueta
                  border: OutlineInputBorder(), // Bordes
                )
              ),
              const Text('Número 2'),
              TextField(
                controller: num2_controller,
                decoration: const InputDecoration(
                  labelText: 'Ingresa el segundo número', // Etiqueta
                  border: OutlineInputBorder(), // Bordes
                )
              ),
              ElevatedButton(
                onPressed: onSumar,
                child: const Text('Suma')
              ),
              ElevatedButton(
                onPressed: onRestar,
                child: const Text('Resta')
              ),ElevatedButton(
                onPressed: onDividir,
                child: const Text('División')
              ),ElevatedButton(
                onPressed: onMultiplicar,
                child: const Text('Multiplicación')
              )
            ],
          ),
        ),
      ),
    );
  }

   @override
  void dispose() {
    num1_controller.dispose(); // Limpia el controlador
    num2_controller.dispose();
    super.dispose();
  }
}

class PantallaResultados extends StatelessWidget {
  final String operacion;
  final num resultado;

  const PantallaResultados({super.key, required this.operacion, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Resultados')),
      body: Center(
        child: Text(
          'La $operacion es: $resultado',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}