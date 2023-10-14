import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scafoldKey;
  const SideMenu({super.key, required this.scafoldKey});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // para saber donde estoy en cual de las opciones del navigation drawer
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    // notch barra superior que tienen algunos telefonos
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex:
          navDrawerIndex, // se va a marcar en la pestana del menu donde me encuentro actualmente
      // a donde quiero ir
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scafoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
            child: Text('Main')),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title)),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('More options')),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title)),
            ),
      ],
    );
  }
}
