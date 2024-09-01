import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PersistenThemeScreen extends StatefulWidget {
  const PersistenThemeScreen({super.key});

  @override
  State<PersistenThemeScreen> createState() => _PersistenThemeScreenState();
}

class _PersistenThemeScreenState extends State<PersistenThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Persistent Theme App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      // context.read<ThemeCubit>().toggleTheme(!isDarkMode);
                    },
                    icon: const Icon(
                      Ionicons.cloudy,
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
