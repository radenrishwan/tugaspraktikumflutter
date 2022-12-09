import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/color.dart';
import 'package:tugaspraktikum6/constant/status.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:tugaspraktikum6/provider/note.dart';
import 'package:tugaspraktikum6/widget/info.dart';
import 'package:tugaspraktikum6/widget/more.dart';

class EditNoteScreen extends StatefulWidget {
  final Note note;
  final NoteStatus noteStatus;
  const EditNoteScreen({super.key, required this.note, required this.noteStatus});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final FocusNode _titleNode = FocusNode();
  final FocusNode _contentNode = FocusNode();
  bool isEditable = false;

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    _titleController.text = widget.note.title;
    _contentController.text = widget.note.content;

    if (widget.noteStatus == NoteStatus.edit) {
      isEditable = true;
    }
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
      readOnly: !isEditable,
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
        readOnly: !isEditable,
        maxLines: null,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.multiline,
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
        title: Text(widget.note.title),
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
                .update(
                  Note(
                    id: widget.note.id,
                    title: _titleController.text,
                    content: _contentController.text,
                    createdAt: widget.note.createdAt,
                    updatedAt: DateTime.now().millisecondsSinceEpoch,
                  ),
                )
                .then(
                  (_) => Navigator.pop(context),
                );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showMoreBottomSheet(
                context,
                widget.note,
                onTapPreview: () {
                  isEditable = false;
                  setState(() {});
                  Navigator.pop(context);
                },
                onTapEdit: () {
                  isEditable = true;
                  setState(() {});
                  Navigator.pop(context);
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: kTabLabelPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleTextField(),
            contentTextField(),
          ],
        ),
      ),
    );
  }

  void showMoreBottomSheet(context, Note note, {required VoidCallback onTapPreview, required VoidCallback onTapEdit}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return MoreWidget(
          onTapPreview: onTapPreview,
          onTapEdit: onTapEdit,
          onTapDelete: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Delete ${note.title}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  content: const Text('Are you sure want to delete this note?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await context.read<NoteProvider>().remove(note.id).then(
                          (value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          onTapInfo: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return InfoWidget(note: note);
              },
            );
          },
        );
      },
    );
  }
}
