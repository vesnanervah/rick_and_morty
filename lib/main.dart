import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty/characters/block/favorite_characters_bloc.dart';
import 'package:rick_and_morty/characters/block/remote_characters_bloc.dart';
import 'package:rick_and_morty/core/di/injection.dart';
import 'package:rick_and_morty/core/view/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(Environment.dev);
  final path = await getApplicationCacheDirectory();
  Hive.init(path.path);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RemoteCharactersBloc>()),
        BlocProvider(create: (_) => getIt<FavoriteCharactersBloc>()),
      ],
      child: MaterialApp(
        home: HomeLayout(theme: themeMode, onChangeThemeTap: changeTheme),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
      ),
    );
  }

  void changeTheme() {
    final theme = themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    setState(() {
      themeMode = theme;
    });
  }
}
