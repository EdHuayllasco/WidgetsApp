import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool mode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: Icon(
                  mode ? Icons.dark_mode_outlined : Icons.light_mode_outlined))
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colorTheme = ref.watch(colorListProvider);
    final int selecTheme = ref.watch(selectColorProvider);

    return ListView.builder(
      itemCount: colorTheme.length,
      itemBuilder: (context, index) {
        final Color color = colorTheme[index];
        return RadioListTile(
          title: Text(
            'Este Color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('$color.value'),
          activeColor: color,
          value: index,
          groupValue: selecTheme,
          onChanged: (value) {
            print(value);
            //todo: notificar el cambio
            ref.read(selectColorProvider.notifier).update((state) => index);
          },
        );
      },
    );
  }
}
