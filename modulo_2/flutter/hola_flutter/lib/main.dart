import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hola Flutter desde 4to semestre')),
        body: const Center(
          child: Text(
            '¡Hola Mundo! 😊',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    ),
  );
}