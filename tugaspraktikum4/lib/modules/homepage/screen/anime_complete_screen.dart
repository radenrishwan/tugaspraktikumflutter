import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_complete/anime_complete_bloc.dart';
import 'package:otakudesu/modules/homepage/widget/anime_card.dart';

class AnimeCompleteScreen extends StatefulWidget {
  const AnimeCompleteScreen({super.key});

  @override
  State<AnimeCompleteScreen> createState() => AnimeCompleteScreenState();
}

class AnimeCompleteScreenState extends State<AnimeCompleteScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        log(controller.position.pixels.toString());
        context.read<AnimeCompleteBloc>().add(AnimeCompleteFetched());
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
        title: const Text('Complete Anime'),
      ),
      body: Padding(
        padding: kDefaultLargePaddingSize,
        child: BlocBuilder<AnimeCompleteBloc, AnimeCompleteState>(
          builder: (context, state) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: kDefaultSmallPaddingSize.vertical,
              mainAxisSpacing: kDefaultSmallPaddingSize.vertical,
              controller: controller,
              children: List.generate(
                state.animes.length,
                (index) => AnimeCard(
                  anime: state.animes[index],
                  onTap: () {
                    GoRouter.of(context).push('/anime/${state.animes[index].id}');
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
