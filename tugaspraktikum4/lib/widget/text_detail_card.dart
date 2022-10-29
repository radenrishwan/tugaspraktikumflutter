import 'package:flutter/material.dart';

class TextDetailCard extends StatelessWidget {
  final String title;
  final String value;
  const TextDetailCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
        ),
        Text(
          checkValue(value),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  String checkValue(String value) {
    if (value.length > 40) {
      return '${value.substring(0, 38)}...';
    }

    return value;
  }
}
