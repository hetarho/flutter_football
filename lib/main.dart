import 'package:flutter/material.dart';
import 'package:flutter_football/adapters/entityToHiveObj/club.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/league.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/season.hive_obj.dart';
import 'package:flutter_football/entities/club/club.dart';
import 'package:flutter_football/entities/enum/nation.dart';
import 'package:flutter_football/entities/game_slot/game_slot.dart';
import 'package:flutter_football/entities/league/league.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/club/hive_club.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/game_slot/hive_game_slot.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/league/hive_league.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/datasources/season/hive_season.datasource.dart';
import 'package:flutter_football/frameworks-and-drivers/hive/hive_registrar.g.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/club.repository.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/game_slot.repository.dart';
import 'package:flutter_football/frameworks-and-drivers/repositories/league.repository.dart';
import 'package:flutter_football/usecases/clear_db.usecase.dart';
import 'package:flutter_football/usecases/create_game_slot.usecase.dart';
import 'package:flutter_football/usecases/delete_game_slot.usecase.dart';
import 'package:flutter_football/usecases/find_all_game_slot.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters();

  final List<String> boxNames = [
    HiveGameSlotDataSource.boxName,
    HiveSeasonDataSource.boxName,
    HiveClubDataSource.boxName,
    HiveLeagueDataSource.boxName,
  ];

  await Future.wait([
    Hive.openBox<GameSlotHiveObj>(HiveGameSlotDataSource.boxName),
    Hive.openBox<SeasonHiveObj>(HiveSeasonDataSource.boxName),
    Hive.openBox<ClubHiveObj>(HiveClubDataSource.boxName),
    Hive.openBox<LeagueHiveObj>(HiveLeagueDataSource.boxName),
  ]);

  await Future.wait([
    ...boxNames.map((boxName) => Hive.openBox<int>('${boxName}_lastId')),
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
  late final GameSlotRepository _gameSlotRepository;
  late final ClubRepository _clubRepository;
  late final LeagueRepository _leagueRepository;

  @override
  void initState() {
    super.initState();

    final gameSlotDataSource = HiveGameSlotDataSource();
    final clubDataSource = HiveClubDataSource();
    final leagueDataSource = HiveLeagueDataSource();

    _clubRepository = ClubRepository(clubDataSource);
    _leagueRepository = LeagueRepository(leagueDataSource, _clubRepository);
    _gameSlotRepository = GameSlotRepository(gameSlotDataSource, _clubRepository, _leagueRepository);
  }

  List<GameSlot> _gameSlots = [];

  void _createNewGame() async {
    final createGameSlotUsecase = CreateGameSlotUsecase(_gameSlotRepository);

    List<Club> testClubs = [];
    List<League> testLeagues = [];

    for (var i = 0; i < 10; i++) {
      final createdClubs = List.generate(
          10,
          (index) => Club(
                name: 'test-club-$index',
                id: index + 1,
                tier: 1,
                nation: Nation.brazil,
                stadiumName: 'stadiumName',
                shortName: 'shortName',
                leagueId: 1,
              ));
      final testLeague = League(
        name: 'test-league-$i',
        id: i + 1,
        tier: 1,
        nation: Nation.brazil,
        clubs: createdClubs,
      );

      testClubs.addAll(createdClubs);
      testLeagues.add(testLeague);
    }

    await createGameSlotUsecase.execute(
      GameSlot(
        id: 1,
        saveName: 'test',
        createdAt: DateTime.now(),
        lastPlayedAt: DateTime.now(),
        userClub: testClubs.first,
        clubs: testClubs,
        leagues: testLeagues,
      ),
    );

    setState(() {
      _loadGame();
    });
  }

  void _loadGame() async {
    final findAllGameSlotUsecase = FindAllGameSlotUsecase(_gameSlotRepository);

    final gameSlots = await findAllGameSlotUsecase.execute();

    setState(() {
      _gameSlots = gameSlots;
    });
  }

  void _deleteGame(int id) async {
    final deleteGameSlotUsecase = DeleteGameSlotUsecase(_gameSlotRepository);
    await deleteGameSlotUsecase.execute(id);
    setState(() {
      _loadGame();
    });
  }

  void _clearDb() async {
    final clearDbUsecase = ClearDbUsecase([_gameSlotRepository, _leagueRepository, _clubRepository]);
    await clearDbUsecase.execute(null);
    setState(() {
      _loadGame();
    });
  }

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
            Row(
              children: [
                ElevatedButton(onPressed: _createNewGame, child: const Text('Create')),
                ElevatedButton(onPressed: _loadGame, child: const Text('Load Game')),
                ElevatedButton(onPressed: _clearDb, child: const Text('Clear DB')),
              ],
            ),
            ..._gameSlots.map((gameSlot) => Row(
                  children: [
                    Text(gameSlot.id.toString()),
                    Text(gameSlot.saveName),
                    ElevatedButton(onPressed: () => _deleteGame(gameSlot.id), child: const Text('Delete')),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
