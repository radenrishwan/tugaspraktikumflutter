import 'package:flutter/material.dart';
import 'package:tugaspraktikum8/models/card.dart' as model;
import 'package:tugaspraktikum8/widget/price_card.dart';

class DetailScreen extends StatelessWidget {
  final model.Card card;

  const DetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          card.name,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    card.cardImages[0].url,
                    height: 370,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...(card.type == "Spell Card" || card.type == "Trap Card")
                          ? [
                              Text(
                                'Card Info',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 10),
                              Text("ID : ${card.id}"),
                              const SizedBox(height: 10),
                              Text('Card Type : ${card.type}'),
                              const SizedBox(height: 10),
                              Text('Archetype: ${card.archetype ?? 'No Archetype'}'),
                              const SizedBox(height: 10),
                              Text('Race: ${card.race}'),
                            ]
                          : [
                              Text(
                                'Card Info',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 10),
                              Text("ID : ${card.id}"),
                              const SizedBox(height: 10),
                              Text("ATK : ${card.atk}"),
                              const SizedBox(height: 10),
                              Text("DEF : ${card.def}"),
                              const SizedBox(height: 10),
                              Text("LVL : ${card.level}"),
                              const SizedBox(height: 10),
                              Text('Card Type : ${card.type}'),
                              const SizedBox(height: 10),
                              Text('Attribute: ${card.attribute}'),
                              const SizedBox(height: 10),
                              Text('Archetype: ${card.archetype ?? 'No Archetype'}'),
                              const SizedBox(height: 10),
                              Text('Race: ${card.race}'),
                            ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Description',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(card.description),
              const SizedBox(height: 10),
              Text(
                'Market Price',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(color: Colors.black),
              ),
              const SizedBox(height: 4),
              ...List.generate(
                card.cardPrices.length,
                (index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PriceCard(
                          leading: Icon(
                            Icons.shopping_cart,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: card.cardPrices[index].marketPrice.toString(),
                        ),
                        PriceCard(
                          leading: Text(
                            'TCG',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          label: card.cardPrices[index].tcgplayerPrice.toString(),
                        ),
                        PriceCard(
                          leading: Text(
                            'Coolstuffinc',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          label: card.cardPrices[index].coolstuffincPrice.toString(),
                        ),
                        PriceCard(
                          leading: Text(
                            'EBAY',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          label: card.cardPrices[index].ebayPrice.toString(),
                        ),
                        PriceCard(
                          leading: Text(
                            'AMAZON',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          label: card.cardPrices[index].amazonPrice.toString(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Text(
                'Card Set',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(color: Colors.black),
              ),
              const SizedBox(height: 4),
              ...(card.cardSets != null)
                  ? List.generate(
                      card.cardSets!.length,
                      (index) {
                        final set = card.cardSets![index];

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(child: Text(set.rarityCode)),
                            title: Text(set.name),
                            subtitle: Text(set.code),
                            trailing: Text('\$${set.price}'),
                          ),
                        );
                      },
                    )
                  : [const Text('Set not available')],
            ],
          ),
        ),
      ),
    );
  }
}
