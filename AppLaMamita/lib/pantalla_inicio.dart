import 'package:flutter/material.dart';
import 'package:flutter_restaurante_1/segunda_pantalla.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/img/logo.png",
                  width: 900,
                  height: 400,
                ),
                const SizedBox(height: 20),
                const Text(
                  "LA MAMITA",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(102, 84, 94, 5),
                  ),
                ),
              ],
            ),
          ),
          // Botón para continuar
          Positioned(
            bottom: 180,
            right: MediaQuery.of(context).size.width / 2 -
                25, // Centra el botón horizontalmente
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor:
                    const Color.fromRGBO(163, 145, 147, 5), // Color del botón
                padding: const EdgeInsets.all(20.0),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MenuScreen())); // Acción a realizar cuando se presione el botón
              },
            ),
          ),
          // Texto "Cada plato es una experiencia" en la esquina inferior derecha
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  right: 15, left: 3, top: 40, bottom: 40),
              decoration: BoxDecoration(
                color: Colors.black
                    .withOpacity(0.3), // Color de fondo semi-transparente
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(200), // Ajusta los bordes superiores
                ),
              ),
              child: const RotatedBox(
                quarterTurns: 3,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Cada plato es una experiencia",
                    style: TextStyle(
                      color: Color.fromRGBO(220, 201, 194, 0.98),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
