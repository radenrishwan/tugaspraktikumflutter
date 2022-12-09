import 'package:flutter/material.dart';
import 'package:tugaspraktikum6/constant/color.dart';

class MoreWidget extends StatelessWidget {
  final VoidCallback onTapPreview;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  final VoidCallback onTapInfo;

  const MoreWidget({
    super.key,
    required this.onTapPreview,
    required this.onTapEdit,
    required this.onTapDelete,
    required this.onTapInfo,
  });

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(
            Icons.preview,
            color: kPrimaryColor,
          ),
          title: const Text('Preview'),
          onTap: onTapPreview,
        ),
        ListTile(
          leading: Icon(
            Icons.edit,
            color: kSecondaryColor,
          ),
          title: const Text('Edit'),
          onTap: onTapEdit,
        ),
        ListTile(
          leading: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          title: const Text('Delete'),
          onTap: onTapDelete,
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
            color: Colors.green,
          ),
          title: const Text('Info'),
          onTap: onTapInfo,
        ),
      ],
    );
  }
}
