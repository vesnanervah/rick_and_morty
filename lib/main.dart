import 'dart:io';
import 'package:hive_ce/hive.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/characters/repository/character_repo.dart';
import 'package:rick_and_morty/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Environment.dev);
  final path = await getTemporaryDirectory();
  Hive.init(path.path);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<CharacterRepo>().fetchCharacters().then((val) {
      print(val);
    });
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
