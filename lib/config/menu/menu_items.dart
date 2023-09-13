import 'package:flutter/material.dart' show IconData, Icons; //cuando pone show utilizamos unicamente lo que especificamos


class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });


}
const List<MenuItem> appMenuItems =  [
  MenuItem(title: 'Botones', subtitle: 'Varios Botones en Flutter', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Tarjeta', subtitle: 'Un contenedor estilizado', link: '/cards', icon: Icons.credit_card),
  MenuItem(title: 'ProgressIndicator', subtitle: 'Generales y controlados', link: '/progress', icon: Icons.refresh_rounded),
  MenuItem(title: 'SnackBars and Dialogs', subtitle: 'Indicadores en pantalla', link: '/snackbars', icon: Icons.refresh_rounded),
];