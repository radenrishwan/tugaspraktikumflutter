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
              leading: const Icon(Icons.dark_mode),
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
            title: const Text('About Us'),
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('About Us'),
                    content: const Text(
                      '''
Hi, Buddy 👋👋👋.

Thanks for using our app. please send us star at github if this app really usefull. And we also open to all contribute, please check our github if you interested:

https://github.com/radenrishwan/tugaspraktikumflutter/tree/master/tugaspraktikum6

this apps created due to my assignment in college, so please dont expect too much from this app.

created by : Raden Mohamad Rishwan, Reza Zulfikri
''',
                      textAlign: TextAlign.justify,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
