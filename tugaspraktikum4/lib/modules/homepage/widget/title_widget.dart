import 'package:flutter/material.dart';
import 'package:otakudesu/helper/constant.dart';

class TitleWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const TitleWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultLargePaddingSize.copyWith(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text('More'),
          ),
        ],
      ),
    );
  }
}
