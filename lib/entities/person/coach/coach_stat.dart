import 'package:hive_ce_flutter/hive_flutter.dart';

class CoachStat extends HiveObject{
  /// 스카우팅
  ///
  /// 스카우팅 능력치가 높을 수록 선수의 overall 능력치를 정확하게 파악한다
  /// 0 ~ 100
  double scouting;

  /// 공격 훈련
  ///
  /// 공격 훈련의 효율
  /// 0 ~ 100
  double attackTraining;

  /// 수비 훈련
  ///
  /// 수비 훈련의 효율
  /// 0 ~ 100
  double defenseTraining;

  /// 패스 훈련
  ///
  /// 패스 훈련의 효율
  /// 0 ~ 100
  double passTraining;

  /// 동기부여
  ///
  /// 선수의 motivation능력치가 올라간다.
  /// 0 ~ 100
  double motivation;

  /// 유소년 발굴
  ///
  /// 유소년 트레이닝 시 training능력치가 올라간다.
  /// 0 ~ 100
  double youngDevelopment;

  CoachStat({
    required this.scouting,
    required this.attackTraining,
    required this.defenseTraining,
    required this.passTraining,
    required this.motivation,
    required this.youngDevelopment,
  });
}
