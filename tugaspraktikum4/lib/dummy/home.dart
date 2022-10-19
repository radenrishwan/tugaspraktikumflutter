import 'package:flutter/material.dart';
import 'package:tugaspraktikum4/widget/followed_avatar.dart';
import 'package:tugaspraktikum4/widget/playlist_card.dart';
import 'package:tugaspraktikum4/widget/recently_played_card.dart';

const List<Widget> followed = [
  FollowedAvatar(),
  FollowedAvatar(),
  FollowedAvatar(),
  FollowedAvatar(),
  FollowedAvatar(),
];

List<Widget> recent = [
  RecentlyPlayedCard(
    title: 'What do you do with a drunken sailor?',
    subtitle: 'Justin Bieber',
    image: Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZWoEzmLG292RDy3zh7pKMB36WbRgRDGdVsimZy6hV2hgFXp2o4WvCp8BOGW3LSH29sE&usqp=CAU',
      fit: BoxFit.cover,
    ),
  ),
  RecentlyPlayedCard(
    title: 'What do you do with a drunken sailor?',
    subtitle: 'Justin Bieber',
    image: Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZWoEzmLG292RDy3zh7pKMB36WbRgRDGdVsimZy6hV2hgFXp2o4WvCp8BOGW3LSH29sE&usqp=CAU',
      fit: BoxFit.cover,
    ),
  ),
  RecentlyPlayedCard(
    title: 'What do you do with a drunken sailor?',
    subtitle: 'Justin Bieber',
    image: Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZWoEzmLG292RDy3zh7pKMB36WbRgRDGdVsimZy6hV2hgFXp2o4WvCp8BOGW3LSH29sE&usqp=CAU',
      fit: BoxFit.cover,
    ),
  ),
  RecentlyPlayedCard(
    title: 'What do you do with a drunken sailor?',
    subtitle: 'Justin Bieber',
    image: Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZWoEzmLG292RDy3zh7pKMB36WbRgRDGdVsimZy6hV2hgFXp2o4WvCp8BOGW3LSH29sE&usqp=CAU',
      fit: BoxFit.cover,
    ),
  ),
];

const List<Widget> playlists = [
  PlaylistCard(),
  PlaylistCard(),
  PlaylistCard(),
  PlaylistCard(),
  PlaylistCard(),
];
