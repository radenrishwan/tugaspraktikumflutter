import 'package:flutter/material.dart';
import 'package:tugaspraktikum4/widget/discover_card.dart';
import 'package:tugaspraktikum4/widget/perfect_card.dart';

final List<Widget> perfect = [
  PerfectCard(
    title: 'Fresh Finds',
    image: Image.asset(
      'assets/illustrations/fresh finds.jpg',
    ),
  ),
  PerfectCard(
    title: 'Chilled Hits',
    image: Image.asset(
      'assets/illustrations/chilled hits.jpg',
    ),
  ),
  PerfectCard(
    title: 'Best of the year',
    image: Image.asset(
      'assets/illustrations/bia.jpg',
    ),
  ),
];

final List<Widget> discover = [
  DiscoverCard(
    color: Colors.white,
    title: 'fly the falcon',
    subtitle: 'Discover 87 Songs!',
    image: Image.asset(
      'assets/illustrations/discover/discover-1.png',
      fit: BoxFit.cover,
    ),
    onTap: () {},
  ),
  DiscoverCard(
    color: Colors.white,
    title: 'fly the falcon',
    subtitle: 'Discover 87 Songs!',
    image: Image.asset(
      'assets/illustrations/discover/discover-1.png',
      fit: BoxFit.cover,
    ),
    onTap: () {},
  ),
  DiscoverCard(
    color: Colors.white,
    title: 'fly the falcon',
    subtitle: 'Discover 87 Songs!',
    image: Image.asset(
      'assets/illustrations/discover/discover-1.png',
      fit: BoxFit.cover,
    ),
    onTap: () {},
  ),
  DiscoverCard(
    color: Colors.white,
    title: 'fly the falcon',
    subtitle: 'Discover 87 Songs!',
    image: Image.asset(
      'assets/illustrations/discover/discover-1.png',
      fit: BoxFit.cover,
    ),
    onTap: () {},
  ),
];
