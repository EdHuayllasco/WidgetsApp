import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/Presentation/screens/cards/card_screen.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        //Navigator para rutas
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen())
        // );
        // Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link);
        // context.pushNamed(CardsScreen.name);
      },
      // splashColor: colors.primary, Color del splash
    );
  }
}
