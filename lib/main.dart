import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/providers/main_screen_provider.dart';
import 'package:shoe_store/views/ui/main_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenProvider())
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoe Store',
        home: MainScreen());
  }
}
