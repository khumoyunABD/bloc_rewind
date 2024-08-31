import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.appTitle,
    required this.appRoute,
  });

  final String appTitle;
  final String appRoute;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appTitle),
      onTap: () {
        context.push(appRoute);
      },
      tileColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }
}
