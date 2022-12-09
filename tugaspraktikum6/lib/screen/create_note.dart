import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/color.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:tugaspraktikum6/provider/note.dart';
import 'package:uuid/uuid.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final FocusNode _titleNode = FocusNode();
  final FocusNode _contentNode = FocusNode();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Widget titleTextField() {
    return TextField(
      focusNode: _titleNode,
      maxLines: 1,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
      ),
      style: Theme.of(context).textTheme.titleLarge,
      autocorrect: true,
      autofocus: true,
      inputFormatters: [
        LengthLimitingTextInputFormatter(25),
      ],
      controller: _titleController,
    );
  }

  Widget contentTextField() {
    return Expanded(
      child: TextField(
        focusNode: _contentNode,
        maxLines: 9999,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Content',
        ),
        autocorrect: true,
        inputFormatters: [
          LengthLimitingTextInputFormatter(99999),
        ],
        controller: _contentController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        leading: IconButton(
          onPressed: () async {
            if (_titleController.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: const Text('Title cannot be empty'),
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

              return;
            }

            await context
                .read<NoteProvider>()
                .add(
                  Note(
                    id: const Uuid().v4(),
                    title: _titleController.text,
                    content: _contentController.text,
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                    updatedAt: DateTime.now().millisecondsSinceEpoch,
                  ),
                )
                .then(
                  (_) => Navigator.pop(context),
                );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [],
      ),
      body: Padding(
        padding: kTabLabelPadding,
        child: Column(
          children: [
            titleTextField(),
            contentTextField(),
          ],
        ),
      ),
    );
  }
}
