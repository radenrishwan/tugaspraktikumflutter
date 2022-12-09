import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/color.dart';
import 'package:tugaspraktikum6/constant/status.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:tugaspraktikum6/provider/note.dart';
import 'package:tugaspraktikum6/screen/edit_note.dart';
import 'package:tugaspraktikum6/utils/time.dart';
import 'package:tugaspraktikum6/widget/info.dart';
import 'package:tugaspraktikum6/widget/more.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: () {
        showMoreBottomSheet(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditNoteScreen(
                        note: note,
                        noteStatus: NoteStatus.edit,
                      ),
                    ),
                  );
                },
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (context) {
                  showMoreBottomSheet(context);
                },
                backgroundColor: kSecondaryColor,
                foregroundColor: Colors.white,
                icon: Icons.more_horiz,
                label: 'More',
              ),
            ],
          ),
          child: ListTile(
            leading: const Icon(Icons.note),
            title: Text(note.title),
            subtitle: Text('Last update : ${TimeUtils.fromNanoToDefaultString(note.updatedAt)}'),
          ),
        ),
      ),
    );
  }

  void showMoreBottomSheet(context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return MoreWidget(
          onTapPreview: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => EditNoteScreen(
                      note: note,
                      noteStatus: NoteStatus.preview,
                    ),
                  ),
                )
                .then(
                  (value) => Navigator.pop(context),
                );
          },
          onTapEdit: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => EditNoteScreen(
                      note: note,
                      noteStatus: NoteStatus.edit,
                    ),
                  ),
                )
                .then(
                  (value) => Navigator.pop(context),
                );
          },
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
