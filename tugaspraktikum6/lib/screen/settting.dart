import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/provider/theme_mode.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          StatefulBuilder(builder: (context, setState) {
            return ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: context.watch<ThemeModeProvider>().darkMode,
                onChanged: (value) {
                  context.read<ThemeModeProvider>().setDarkMode(value);

                  setState(() {});
                },
              ),
            );
          }),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
