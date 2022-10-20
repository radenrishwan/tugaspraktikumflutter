import 'package:flutter/material.dart';
import 'package:otakudesu/helper/constant.dart';

class ShowErrorWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ShowErrorWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Theme.of(context).primaryColor, size: 40),
          SizedBox(height: kDefaultLargePaddingSize.top),
          InkWell(
            onTap: onTap,
            child: Text(
              'Error ocurred, Please click here to load again',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
