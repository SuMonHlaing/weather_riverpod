import 'package:flutter/material.dart';

class SetttingScreen extends StatefulWidget {
  const SetttingScreen({super.key});

  @override
  State<SetttingScreen> createState() => _SetttingScreenState();
}

class _SetttingScreenState extends State<SetttingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setting'),
      ),
    );
  }
}
