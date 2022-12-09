import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum6/constant/status.dart';
import 'package:tugaspraktikum6/provider/note.dart';
import 'package:tugaspraktikum6/screen/create_note.dart';
import 'package:tugaspraktikum6/screen/edit_note.dart';
import 'package:tugaspraktikum6/screen/settting.dart';
import 'package:tugaspraktikum6/widget/note_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Note Application'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: const Text('Create Note'),
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreateNoteScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        onTap: () {
                          Navigator.pop(context);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: kMaterialListPadding,
        child: FutureBuilder(
          future: context.read<NoteProvider>().findAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Consumer<NoteProvider>(
              builder: (context, provider, child) {
                if (provider.notes.isEmpty) {
                  return const Center(
                    child: Text('No notes yet'),
                  );
                }

                return ListView.builder(
                  itemCount: provider.notes.length,
                  itemBuilder: (context, index) {
                    return NoteCard(
                      note: provider.notes[index],
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(
                              note: provider.notes[index],
                              noteStatus: NoteStatus.preview,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
