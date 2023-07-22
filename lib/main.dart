import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_app/providers.dart';
import 'package:timer_app/timer_page.dart';

final timerProvider =
    StateNotifierProvider<TimerNotifier, int>((ref) => TimerNotifier());

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      debugShowCheckedModeBanner: false,
      home: TimerPage(),
    );
  }
}
