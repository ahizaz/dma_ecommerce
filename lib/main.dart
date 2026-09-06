import 'package:dma_e_commerce/core/theme/app_theme.dart';
import 'package:dma_e_commerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MadeInBangladeshApp()));
}

class MadeInBangladeshApp extends StatelessWidget {
  const MadeInBangladeshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Made in Bangladesh',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
