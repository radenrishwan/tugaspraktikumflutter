import 'package:tugaspraktikum8/models/card.dart' as model;
import 'package:flutter/material.dart';
import 'package:tugaspraktikum8/screen/detail_screen.dart';
import 'package:tugaspraktikum8/services/card_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: FutureBuilder<List<model.Card>>(
        future: CardService().findAll(2),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return const Center(
              child: Text('No data'),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data = snapshot.data![index];

              if (data.type == "Spell Card" || data.type == "Trap Card") {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          card: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  leading: Image.network(data.cardImages[0].smallUrl),
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].race),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${snapshot.data![index].type}"),
                    ],
                  ),
                );
              }

              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        card: snapshot.data![index],
                      ),
                    ),
                  );
                },
                leading: Image.network(data.cardImages[0].smallUrl),
                title: Text(snapshot.data![index].name),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("ATK : ${snapshot.data![index].atk}"),
                    const SizedBox(width: 10),
                    Text("DEF : ${snapshot.data![index].def}"),
                    const SizedBox(width: 10),
                    Text("LVL : ${snapshot.data![index].level}"),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${snapshot.data![index].type}"),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        tooltip: 'find data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
