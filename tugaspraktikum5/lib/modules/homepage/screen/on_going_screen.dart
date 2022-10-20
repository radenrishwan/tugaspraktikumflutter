import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/helper/constant.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_ongoing/anime_on_going_bloc.dart';
import 'package:otakudesu/modules/homepage/widget/anime_card.dart';

class OnGoingScreen extends StatefulWidget {
  const OnGoingScreen({super.key});

  @override
  State<OnGoingScreen> createState() => _OnGoingScreenState();
}

class _OnGoingScreenState extends State<OnGoingScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        context.read<AnimeOnGoingBloc>().add(AnimeOnGoingFetched());
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
        title: const Text('On-Going Anime'),
      ),
      body: Padding(
        padding: kDefaultLargePaddingSize,
        child: BlocBuilder<AnimeOnGoingBloc, AnimeOnGoingState>(
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
