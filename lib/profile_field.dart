import 'package:flutter/material.dart';

// The Profile Field widget returns the vertically stacked respective Label and Title that are inside the ListTiles on the HomeScreen

class ProfileField extends StatelessWidget {
  const ProfileField(
      {super.key, required this.fieldLabel, required this.fieldValue});

  final String fieldLabel;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel,
          style: Theme.of(
            context,
          ).textTheme.labelMedium,
        ),
        Text(fieldValue,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium),
      ],
    );
  }
}
