import 'package:flutter/material.dart';
import 'package:flutter_restaurante_1/carrito/carrito.dart';
import 'package:flutter_restaurante_1/pantalla_inicio.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Carrito(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PantallaInicio(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
