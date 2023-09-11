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
  MenuItem(title: 'Botones', subtitle: 'Varios Botones en Flutter', link: '/', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Tarjeta', subtitle: 'Un contenedor estilizado', link: '/card', icon: Icons.credit_card),
];