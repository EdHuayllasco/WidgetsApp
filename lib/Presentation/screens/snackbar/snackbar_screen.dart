import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSanckbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackScreen y dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSanckbar(context);
        },
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
