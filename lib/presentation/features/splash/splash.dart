import 'package:clean_arch_riverpod/presentation/features/home/pages/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        },
        child: Text("Click Me!"),
      ),
    );
  }
}
