import 'package:flutter_football/adapters/entityToHiveObj/club.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/game_slot.hive_obj.dart';
import 'package:flutter_football/adapters/entityToHiveObj/season.hive_obj.dart';
import 'package:flutter_football/entities/enum/nation.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<GameSlotHiveObj>(),
  AdapterSpec<ClubHiveObj>(),
  AdapterSpec<SeasonHiveObj>(),
  AdapterSpec<Nation>(),
])
class HiveAdapters {}
