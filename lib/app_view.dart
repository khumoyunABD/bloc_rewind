import 'package:bloc_rewind/components/custom_list_item.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/bloc-icon.png',
              cacheHeight: 45,
              cacheWidth: 40,
              //scale: 15,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text('Bloc Rewind')
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const [
            CustomListItem(
              appTitle: 'Counter App',
              appRoute: '/counter_app',
            ),
            Divider(),
            CustomListItem(
              appTitle: 'Timer App',
              appRoute: '/timer_app',
            ),
            Divider(),
            CustomListItem(
              appTitle: 'API App',
              appRoute: '/api_app',
            ),
            Divider(),
            CustomListItem(
              appTitle: 'Internet Connection App',
              appRoute: '/internet_app',
            ),
            Divider(),
            CustomListItem(
              appTitle: 'Persistent Theme App',
              appRoute: '/persistent_theme_app',
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
