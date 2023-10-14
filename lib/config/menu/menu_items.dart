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
  MenuItem(title: 'SnackBars and Dialogs', subtitle: 'Indicadores en pantalla', link: '/snackbars', icon: Icons.info_outline),
  MenuItem(title: 'Animated Container', subtitle: 'StatefullWidget animated', link: '/animated', icon: Icons.check_box_outline_blank_rounded),
  MenuItem(title: 'Ui Controls + Tiles', subtitle: 'Flutter Controls', link: '/ui-controls', icon: Icons.car_rental_outlined),
  MenuItem(title: 'Introduccion a la Aplicacion', subtitle: 'Pequeno tutorial introductorio', link: '/tutorial', icon: Icons.accessibility_new_rounded),
  MenuItem(title: 'Infinite Scroll y Pull', subtitle: 'Vistas infinitas y Pull to Refresh', link: '/infinite', icon: Icons.list_alt_rounded),
  MenuItem(title: 'Riverpot Counter', subtitle: 'Riverpod Counter Screen vista', link: '/counter', icon: Icons.countertops_rounded),
];