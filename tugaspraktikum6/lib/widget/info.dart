import 'package:flutter/material.dart';
import 'package:tugaspraktikum6/data/models/note.dart';
import 'package:tugaspraktikum6/utils/time.dart';

class InfoWidget extends StatelessWidget {
  final Note note;
  const InfoWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.title),
          title: const Text(
            'Title',
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(note.title),
        ),
        ListTile(
          leading: const Icon(Icons.date_range),
          title: const Text('Content Length'),
          subtitle: Text('${note.content.length} characters'),
        ),
        ListTile(
          leading: const Icon(Icons.date_range),
          title: const Text('Created At'),
          subtitle: Text(TimeUtils.fromNanoToDefaultString(note.createdAt)),
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Updated At'),
          subtitle: Text(TimeUtils.fromNanoToDefaultString(note.updatedAt)),
        ),
      ],
    );
  }
}
