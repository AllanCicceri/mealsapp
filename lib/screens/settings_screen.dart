import 'package:flutter/material.dart';
import 'package:meal/components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Hello! You' 're at settings screen :)'),
      ),
    );
  }
}
