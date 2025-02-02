import 'package:flutter/material.dart';
import 'package:flutter_football/adapters/entityToHiveObj/club.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/season.hive_obj.dart';
import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/entities/season/season.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/club/hive_club.datasousrce.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/game_slot/hive_game_slot.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/season/hive_season.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/hive/hive_registrar.g.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/club.repository.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/game_slot.repository.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/season.repository.dart';
import 'package:flutter_football/usecases/create_game_slot.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  await Future.wait([
    Hive.openBox<GameSlotHiveObj>(HiveGameSlotDataSource.boxName),
    Hive.openBox<SeasonHiveObj>(HiveSeasonDataSource.boxName),
    Hive.openBox<ClubHiveObj>(HiveClubDataSource.boxName),
  ]);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _createNewGame() async {
    Box<ClubHiveObj> clubBox = Hive.box(HiveClubDataSource.boxName);

    final clubRepository = ClubRepository(HiveClubDataSource(clubBox));
    final seasonRepository = SeasonRepository(HiveSeasonDataSource(Hive.box(HiveSeasonDataSource.boxName)), clubRepository);
    final gameSlotRepository = GameSlotRepository(HiveGameSlotDataSource(Hive.box(HiveGameSlotDataSource.boxName)), seasonRepository, clubRepository);

    final createGameSlotUsecase = CreateGameSlotUsecase(gameSlotRepository);

    final testClub = Club(
      name: 'test-club',
      id: 1,
      tier: 1,
      nation: Nation.brazil,
      stadiumName: 'stadiumName',
      shortName: 'shortName',
      leagueId: 1,
    );

    final testSeason = Season(id: 1, name: 'test', clubs: [testClub], leagueId: 1);

    await createGameSlotUsecase.execute(
      GameSlot(
        id: 1,
        saveName: 'test',
        createdAt: DateTime.now(),
        lastPlayedAt: DateTime.now(),
        currentSeason: testSeason,
        seasons: [testSeason],
        userClub: testClub
      ),
    );
  }

  void _loadGame() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Football Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _createNewGame,
              child: const Text('Create New Game'),
            ),
            ElevatedButton(
              onPressed: _loadGame,
              child: const Text('Load Game'),
            ),
          ],
        ),
      ),
    );
  }
}
