import 'package:flutter/material.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  TextEditingController aliasesController = TextEditingController(text: 'Something');
  TextEditingController realController = TextEditingController(text: 'Raden Mohamad Rishwan');
  bool isReavealed = false;
  String name = '';

  @override
  Widget build(BuildContext context) {
    name = isReavealed ? realController.text : aliasesController.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  isReavealed = !isReavealed;
                });
              },
              child: Text(
                'Reveal your real name',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'editname',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Edit name'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: realController,
                      maxLength: 25,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: aliasesController,
                      maxLength: 25,
                    ),
                  ],
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
    );
  }
}
