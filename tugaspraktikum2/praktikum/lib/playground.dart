import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:praktikum/change_name.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  double size = 12;
  TextEditingController controller = TextEditingController(text: 'Hello, World!');
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    bool isMaxSize() {
      if (size > 128) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reached maximum size')),
        );

        return false;
      }

      return true;
    }

    bool isMinSize() {
      if (size < 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reached minimum size')),
        );

        return false;
      }

      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              controller.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size,
                color: color,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'font size : $size',
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChangeName(),
                    ),
                  ),
                  child: const Text('Goes to task 2 page'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'color',
            onPressed: () {
              showDialog(
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    // Use Material color picker:
                    //
                    child: MaterialPicker(
                      pickerColor: color,
                      onColorChanged: (value) {
                        setState(() {
                          color = value;
                        });
                      },
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                context: context,
              );
            },
            child: const Icon(Icons.color_lens),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'text',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Edit text content'),
                    content: TextField(
                      controller: controller,
                      maxLength: 20,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: const Text('ok'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.text_fields),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'increase',
            onPressed: () {
              if (isMaxSize()) {
                setState(() {
                  size++;
                });
              }
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'decrease',
            onPressed: () {
              if (isMinSize()) {
                setState(() {
                  size--;
                });
              }
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'random',
            onPressed: () {
              setState(() {
                size = Random().nextDouble() * 128;
              });
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
