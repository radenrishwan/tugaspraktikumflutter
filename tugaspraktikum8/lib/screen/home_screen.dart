import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum8/provider/home_card_provider.dart';
import 'package:tugaspraktikum8/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Getting more card...')));
        context.read<HomeCardProvider>().fetchCards();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: FutureBuilder<void>(
        future: context.read<HomeCardProvider>().fetchCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<HomeCardProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                controller: controller,
                itemCount: value.cards.length,
                itemBuilder: (context, index) {
                  final data = value.cards[index];

                  if (data.type == "Spell Card" || data.type == "Trap Card") {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              card: value.cards[index],
                            ),
                          ),
                        );
                      },
                      leading: Image.network(data.cardImages[0].smallUrl),
                      title: Text(value.cards[index].name),
                      subtitle: Text(value.cards[index].race),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${value.cards[index].type}"),
                        ],
                      ),
                    );
                  }

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            card: value.cards[index],
                          ),
                        ),
                      );
                    },
                    leading: Image.network(data.cardImages[0].smallUrl),
                    title: Text(value.cards[index].name),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("ATK : ${value.cards[index].atk}"),
                        const SizedBox(width: 10),
                        Text("DEF : ${value.cards[index].def}"),
                        const SizedBox(width: 10),
                        Text("LVL : ${value.cards[index].level}"),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${value.cards[index].type}"),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
