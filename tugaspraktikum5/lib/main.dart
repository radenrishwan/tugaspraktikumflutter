import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_complete/anime_complete_bloc.dart';
import 'package:otakudesu/modules/homepage/bloc/anime_ongoing/anime_on_going_bloc.dart';
import 'package:otakudesu/modules/homepage/screen/anime_complete_screen.dart';
import 'package:otakudesu/modules/anime_detail/screen/anime_detail_screen.dart';
import 'package:otakudesu/modules/anime_list/screen/anime_list_screen.dart';
import 'package:otakudesu/modules/episode_detail/screen/episode_detail_sceen.dart';
import 'package:otakudesu/modules/homepage/screen/home_screen.dart';
import 'package:otakudesu/modules/homepage/screen/on_going_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnimeOnGoingBloc()),
        BlocProvider(create: (context) => AnimeCompleteBloc()),
      ],
      child: InitialApp(),
    ),
  );
}

class InitialApp extends StatelessWidget {
  InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Otakudesu',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue.shade200,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.blue.shade200,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/anime-list',
        builder: (BuildContext context, GoRouterState state) {
          return const AnimeListScreen();
        },
      ),
      GoRoute(
        path: '/anime/ongoing',
        builder: (BuildContext context, GoRouterState state) {
          return const OnGoingScreen();
        },
      ),
      GoRoute(
        path: '/anime/complete',
        builder: (BuildContext context, GoRouterState state) {
          return const AnimeCompleteScreen();
        },
      ),
      GoRoute(
        path: '/anime/:id',
        builder: (BuildContext context, GoRouterState state) {
          String id = state.params['id']!;

          return AnimeDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/episode/:id/:title',
        builder: (BuildContext context, GoRouterState state) {
          String id = state.params['id']!;
          String title = state.params['title']!;

          return EpisodeDetailScreen(id: id, title: title);
        },
      )
    ],
  );
}
