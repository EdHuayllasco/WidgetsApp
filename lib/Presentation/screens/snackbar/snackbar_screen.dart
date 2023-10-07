import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSanckbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackback = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // obligar a la persona a no poder salirse sino es con alguno de los botones
        builder: (context) => AlertDialog(
              title: const Text('Estas seguro?'),
              content: const Text(
                  'Lorem do ex aliqua voluptate cupidatat qui Lorem cupidatat reprehenderit do. Nulla culpa do anim incididunt quis enim aliqua mollit pariatur. Cupidatat aliqua est minim voluptate. Nostrud laboris id sint qui culpa excepteur cillum anim et qui. Est irure do deserunt elit aute. Adipisicing adipisicing aliqua eu adipisicing minim est occaecat ex officia anim deserunt est.'
                  ),
              actions: [
                TextButton(onPressed: () => context.pop(), child: const Text('Cancelar'),),
                FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackScreen y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Anim dolor do ut adipisicing in veniam aliquip nulla enim. Pariatur cillum commodo id ad dolor velit qui commodo aliquip nisi eu. Tempor voluptate eu ut consequat aliqua ullamco ad excepteur aliquip aliquip qui. Elit amet dolor irure dolore magna Lorem irure nulla enim deserunt irure do. Laboris ea velit quis esse ex veniam voluptate eiusmod culpa laborum officia Lorem.')
                  ]);
                },
                child: const Text('Licencias Usadas')),
            FilledButton(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar Dialogo'))
          ],
        ),
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
