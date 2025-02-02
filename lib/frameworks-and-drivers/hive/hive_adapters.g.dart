// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class GameSlotHiveObjAdapter extends TypeAdapter<GameSlotHiveObj> {
  @override
  final int typeId = 2;

  @override
  GameSlotHiveObj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameSlotHiveObj(
      id: (fields[0] as num).toInt(),
      saveName: fields[1] as String,
      createdAt: fields[2] as DateTime,
      lastPlayedAt: fields[3] as DateTime,
      currentSeasonId: (fields[4] as num).toInt(),
      seasonIds: (fields[5] as List).cast<int>(),
      userClubId: (fields[6] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GameSlotHiveObj obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.saveName)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.lastPlayedAt)
      ..writeByte(4)
      ..write(obj.currentSeasonId)
      ..writeByte(5)
      ..write(obj.seasonIds)
      ..writeByte(6)
      ..write(obj.userClubId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameSlotHiveObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NationAdapter extends TypeAdapter<Nation> {
  @override
  final int typeId = 3;

  @override
  Nation read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Nation.afghanistan;
      case 1:
        return Nation.albania;
      case 2:
        return Nation.algeria;
      case 3:
        return Nation.andorra;
      case 4:
        return Nation.angola;
      case 5:
        return Nation.antiguaAndBarbuda;
      case 6:
        return Nation.argentina;
      case 7:
        return Nation.armenia;
      case 8:
        return Nation.australia;
      case 9:
        return Nation.austria;
      case 10:
        return Nation.azerbaijan;
      case 11:
        return Nation.bahamas;
      case 12:
        return Nation.bahrain;
      case 13:
        return Nation.bangladesh;
      case 14:
        return Nation.barbados;
      case 15:
        return Nation.belarus;
      case 16:
        return Nation.belgium;
      case 17:
        return Nation.belize;
      case 18:
        return Nation.benin;
      case 19:
        return Nation.bhutan;
      case 20:
        return Nation.bolivia;
      case 21:
        return Nation.bosniaAndHerzegovina;
      case 22:
        return Nation.botswana;
      case 23:
        return Nation.brazil;
      case 24:
        return Nation.brunei;
      case 25:
        return Nation.bulgaria;
      case 26:
        return Nation.burkinaFaso;
      case 27:
        return Nation.burundi;
      case 28:
        return Nation.cambodia;
      case 29:
        return Nation.cameroon;
      case 30:
        return Nation.canada;
      case 31:
        return Nation.capeVerde;
      case 32:
        return Nation.centralAfricanRepublic;
      case 33:
        return Nation.chad;
      case 34:
        return Nation.chile;
      case 35:
        return Nation.china;
      case 36:
        return Nation.colombia;
      case 37:
        return Nation.comoros;
      case 38:
        return Nation.congo;
      case 39:
        return Nation.costaRica;
      case 40:
        return Nation.croatia;
      case 41:
        return Nation.cuba;
      case 42:
        return Nation.cyprus;
      case 43:
        return Nation.czechRepublic;
      case 44:
        return Nation.democraticRepublicOfCongo;
      case 45:
        return Nation.denmark;
      case 46:
        return Nation.djibouti;
      case 47:
        return Nation.dominica;
      case 48:
        return Nation.dominicanRepublic;
      case 49:
        return Nation.eastTimor;
      case 50:
        return Nation.ecuador;
      case 51:
        return Nation.egypt;
      case 52:
        return Nation.elSalvador;
      case 53:
        return Nation.equatorialGuinea;
      case 54:
        return Nation.eritrea;
      case 55:
        return Nation.estonia;
      case 56:
        return Nation.eswatini;
      case 57:
        return Nation.ethiopia;
      case 58:
        return Nation.fiji;
      case 59:
        return Nation.finland;
      case 60:
        return Nation.france;
      case 61:
        return Nation.gabon;
      case 62:
        return Nation.gambia;
      case 63:
        return Nation.georgia;
      case 64:
        return Nation.germany;
      case 65:
        return Nation.ghana;
      case 66:
        return Nation.greece;
      case 67:
        return Nation.grenada;
      case 68:
        return Nation.guatemala;
      case 69:
        return Nation.guinea;
      case 70:
        return Nation.guineaBissau;
      case 71:
        return Nation.guyana;
      case 72:
        return Nation.haiti;
      case 73:
        return Nation.honduras;
      case 74:
        return Nation.hungary;
      case 75:
        return Nation.iceland;
      case 76:
        return Nation.india;
      case 77:
        return Nation.indonesia;
      case 78:
        return Nation.iran;
      case 79:
        return Nation.iraq;
      case 80:
        return Nation.ireland;
      case 81:
        return Nation.israel;
      case 82:
        return Nation.italy;
      case 83:
        return Nation.ivoryCoast;
      case 84:
        return Nation.jamaica;
      case 85:
        return Nation.japan;
      case 86:
        return Nation.jordan;
      case 87:
        return Nation.kazakhstan;
      case 88:
        return Nation.kenya;
      case 89:
        return Nation.kiribati;
      case 90:
        return Nation.kuwait;
      case 91:
        return Nation.kyrgyzstan;
      case 92:
        return Nation.laos;
      case 93:
        return Nation.latvia;
      case 94:
        return Nation.lebanon;
      case 95:
        return Nation.lesotho;
      case 96:
        return Nation.liberia;
      case 97:
        return Nation.libya;
      case 98:
        return Nation.liechtenstein;
      case 99:
        return Nation.lithuania;
      case 100:
        return Nation.luxembourg;
      case 101:
        return Nation.madagascar;
      case 102:
        return Nation.malawi;
      case 103:
        return Nation.malaysia;
      case 104:
        return Nation.maldives;
      case 105:
        return Nation.mali;
      case 106:
        return Nation.malta;
      case 107:
        return Nation.marshallIslands;
      case 108:
        return Nation.mauritania;
      case 109:
        return Nation.mauritius;
      case 110:
        return Nation.mexico;
      case 111:
        return Nation.micronesia;
      case 112:
        return Nation.moldova;
      case 113:
        return Nation.monaco;
      case 114:
        return Nation.mongolia;
      case 115:
        return Nation.montenegro;
      case 116:
        return Nation.morocco;
      case 117:
        return Nation.mozambique;
      case 118:
        return Nation.myanmar;
      case 119:
        return Nation.namibia;
      case 120:
        return Nation.nauru;
      case 121:
        return Nation.nepal;
      case 122:
        return Nation.netherlands;
      case 123:
        return Nation.newZealand;
      case 124:
        return Nation.nicaragua;
      case 125:
        return Nation.niger;
      case 126:
        return Nation.nigeria;
      case 127:
        return Nation.northKorea;
      case 128:
        return Nation.northMacedonia;
      case 129:
        return Nation.norway;
      case 130:
        return Nation.oman;
      case 131:
        return Nation.pakistan;
      case 132:
        return Nation.palau;
      case 133:
        return Nation.palestine;
      case 134:
        return Nation.panama;
      case 135:
        return Nation.papuaNewGuinea;
      case 136:
        return Nation.paraguay;
      case 137:
        return Nation.peru;
      case 138:
        return Nation.philippines;
      case 139:
        return Nation.poland;
      case 140:
        return Nation.portugal;
      case 141:
        return Nation.qatar;
      case 142:
        return Nation.romania;
      case 143:
        return Nation.russia;
      case 144:
        return Nation.rwanda;
      case 145:
        return Nation.saintKittsAndNevis;
      case 146:
        return Nation.saintLucia;
      case 147:
        return Nation.saintVincentAndTheGrenadines;
      case 148:
        return Nation.samoa;
      case 149:
        return Nation.sanMarino;
      case 150:
        return Nation.saoTomeAndPrincipe;
      case 151:
        return Nation.saudiArabia;
      case 152:
        return Nation.senegal;
      case 153:
        return Nation.serbia;
      case 154:
        return Nation.seychelles;
      case 155:
        return Nation.sierraLeone;
      case 156:
        return Nation.singapore;
      case 157:
        return Nation.slovakia;
      case 158:
        return Nation.slovenia;
      case 159:
        return Nation.solomonIslands;
      case 160:
        return Nation.somalia;
      case 161:
        return Nation.southAfrica;
      case 162:
        return Nation.southKorea;
      case 163:
        return Nation.southSudan;
      case 164:
        return Nation.spain;
      case 165:
        return Nation.sriLanka;
      case 166:
        return Nation.sudan;
      case 167:
        return Nation.suriname;
      case 168:
        return Nation.sweden;
      case 169:
        return Nation.switzerland;
      case 170:
        return Nation.syria;
      case 171:
        return Nation.taiwan;
      case 172:
        return Nation.tajikistan;
      case 173:
        return Nation.tanzania;
      case 174:
        return Nation.thailand;
      case 175:
        return Nation.togo;
      case 176:
        return Nation.tonga;
      case 177:
        return Nation.trinidadAndTobago;
      case 178:
        return Nation.tunisia;
      case 179:
        return Nation.turkey;
      case 180:
        return Nation.turkmenistan;
      case 181:
        return Nation.tuvalu;
      case 182:
        return Nation.uganda;
      case 183:
        return Nation.ukraine;
      case 184:
        return Nation.unitedArabEmirates;
      case 185:
        return Nation.unitedKingdom;
      case 186:
        return Nation.unitedStates;
      case 187:
        return Nation.uruguay;
      case 188:
        return Nation.uzbekistan;
      case 189:
        return Nation.vanuatu;
      case 190:
        return Nation.vaticanCity;
      case 191:
        return Nation.venezuela;
      case 192:
        return Nation.vietnam;
      case 193:
        return Nation.yemen;
      case 194:
        return Nation.zambia;
      case 195:
        return Nation.zimbabwe;
      default:
        return Nation.afghanistan;
    }
  }

  @override
  void write(BinaryWriter writer, Nation obj) {
    switch (obj) {
      case Nation.afghanistan:
        writer.writeByte(0);
      case Nation.albania:
        writer.writeByte(1);
      case Nation.algeria:
        writer.writeByte(2);
      case Nation.andorra:
        writer.writeByte(3);
      case Nation.angola:
        writer.writeByte(4);
      case Nation.antiguaAndBarbuda:
        writer.writeByte(5);
      case Nation.argentina:
        writer.writeByte(6);
      case Nation.armenia:
        writer.writeByte(7);
      case Nation.australia:
        writer.writeByte(8);
      case Nation.austria:
        writer.writeByte(9);
      case Nation.azerbaijan:
        writer.writeByte(10);
      case Nation.bahamas:
        writer.writeByte(11);
      case Nation.bahrain:
        writer.writeByte(12);
      case Nation.bangladesh:
        writer.writeByte(13);
      case Nation.barbados:
        writer.writeByte(14);
      case Nation.belarus:
        writer.writeByte(15);
      case Nation.belgium:
        writer.writeByte(16);
      case Nation.belize:
        writer.writeByte(17);
      case Nation.benin:
        writer.writeByte(18);
      case Nation.bhutan:
        writer.writeByte(19);
      case Nation.bolivia:
        writer.writeByte(20);
      case Nation.bosniaAndHerzegovina:
        writer.writeByte(21);
      case Nation.botswana:
        writer.writeByte(22);
      case Nation.brazil:
        writer.writeByte(23);
      case Nation.brunei:
        writer.writeByte(24);
      case Nation.bulgaria:
        writer.writeByte(25);
      case Nation.burkinaFaso:
        writer.writeByte(26);
      case Nation.burundi:
        writer.writeByte(27);
      case Nation.cambodia:
        writer.writeByte(28);
      case Nation.cameroon:
        writer.writeByte(29);
      case Nation.canada:
        writer.writeByte(30);
      case Nation.capeVerde:
        writer.writeByte(31);
      case Nation.centralAfricanRepublic:
        writer.writeByte(32);
      case Nation.chad:
        writer.writeByte(33);
      case Nation.chile:
        writer.writeByte(34);
      case Nation.china:
        writer.writeByte(35);
      case Nation.colombia:
        writer.writeByte(36);
      case Nation.comoros:
        writer.writeByte(37);
      case Nation.congo:
        writer.writeByte(38);
      case Nation.costaRica:
        writer.writeByte(39);
      case Nation.croatia:
        writer.writeByte(40);
      case Nation.cuba:
        writer.writeByte(41);
      case Nation.cyprus:
        writer.writeByte(42);
      case Nation.czechRepublic:
        writer.writeByte(43);
      case Nation.democraticRepublicOfCongo:
        writer.writeByte(44);
      case Nation.denmark:
        writer.writeByte(45);
      case Nation.djibouti:
        writer.writeByte(46);
      case Nation.dominica:
        writer.writeByte(47);
      case Nation.dominicanRepublic:
        writer.writeByte(48);
      case Nation.eastTimor:
        writer.writeByte(49);
      case Nation.ecuador:
        writer.writeByte(50);
      case Nation.egypt:
        writer.writeByte(51);
      case Nation.elSalvador:
        writer.writeByte(52);
      case Nation.equatorialGuinea:
        writer.writeByte(53);
      case Nation.eritrea:
        writer.writeByte(54);
      case Nation.estonia:
        writer.writeByte(55);
      case Nation.eswatini:
        writer.writeByte(56);
      case Nation.ethiopia:
        writer.writeByte(57);
      case Nation.fiji:
        writer.writeByte(58);
      case Nation.finland:
        writer.writeByte(59);
      case Nation.france:
        writer.writeByte(60);
      case Nation.gabon:
        writer.writeByte(61);
      case Nation.gambia:
        writer.writeByte(62);
      case Nation.georgia:
        writer.writeByte(63);
      case Nation.germany:
        writer.writeByte(64);
      case Nation.ghana:
        writer.writeByte(65);
      case Nation.greece:
        writer.writeByte(66);
      case Nation.grenada:
        writer.writeByte(67);
      case Nation.guatemala:
        writer.writeByte(68);
      case Nation.guinea:
        writer.writeByte(69);
      case Nation.guineaBissau:
        writer.writeByte(70);
      case Nation.guyana:
        writer.writeByte(71);
      case Nation.haiti:
        writer.writeByte(72);
      case Nation.honduras:
        writer.writeByte(73);
      case Nation.hungary:
        writer.writeByte(74);
      case Nation.iceland:
        writer.writeByte(75);
      case Nation.india:
        writer.writeByte(76);
      case Nation.indonesia:
        writer.writeByte(77);
      case Nation.iran:
        writer.writeByte(78);
      case Nation.iraq:
        writer.writeByte(79);
      case Nation.ireland:
        writer.writeByte(80);
      case Nation.israel:
        writer.writeByte(81);
      case Nation.italy:
        writer.writeByte(82);
      case Nation.ivoryCoast:
        writer.writeByte(83);
      case Nation.jamaica:
        writer.writeByte(84);
      case Nation.japan:
        writer.writeByte(85);
      case Nation.jordan:
        writer.writeByte(86);
      case Nation.kazakhstan:
        writer.writeByte(87);
      case Nation.kenya:
        writer.writeByte(88);
      case Nation.kiribati:
        writer.writeByte(89);
      case Nation.kuwait:
        writer.writeByte(90);
      case Nation.kyrgyzstan:
        writer.writeByte(91);
      case Nation.laos:
        writer.writeByte(92);
      case Nation.latvia:
        writer.writeByte(93);
      case Nation.lebanon:
        writer.writeByte(94);
      case Nation.lesotho:
        writer.writeByte(95);
      case Nation.liberia:
        writer.writeByte(96);
      case Nation.libya:
        writer.writeByte(97);
      case Nation.liechtenstein:
        writer.writeByte(98);
      case Nation.lithuania:
        writer.writeByte(99);
      case Nation.luxembourg:
        writer.writeByte(100);
      case Nation.madagascar:
        writer.writeByte(101);
      case Nation.malawi:
        writer.writeByte(102);
      case Nation.malaysia:
        writer.writeByte(103);
      case Nation.maldives:
        writer.writeByte(104);
      case Nation.mali:
        writer.writeByte(105);
      case Nation.malta:
        writer.writeByte(106);
      case Nation.marshallIslands:
        writer.writeByte(107);
      case Nation.mauritania:
        writer.writeByte(108);
      case Nation.mauritius:
        writer.writeByte(109);
      case Nation.mexico:
        writer.writeByte(110);
      case Nation.micronesia:
        writer.writeByte(111);
      case Nation.moldova:
        writer.writeByte(112);
      case Nation.monaco:
        writer.writeByte(113);
      case Nation.mongolia:
        writer.writeByte(114);
      case Nation.montenegro:
        writer.writeByte(115);
      case Nation.morocco:
        writer.writeByte(116);
      case Nation.mozambique:
        writer.writeByte(117);
      case Nation.myanmar:
        writer.writeByte(118);
      case Nation.namibia:
        writer.writeByte(119);
      case Nation.nauru:
        writer.writeByte(120);
      case Nation.nepal:
        writer.writeByte(121);
      case Nation.netherlands:
        writer.writeByte(122);
      case Nation.newZealand:
        writer.writeByte(123);
      case Nation.nicaragua:
        writer.writeByte(124);
      case Nation.niger:
        writer.writeByte(125);
      case Nation.nigeria:
        writer.writeByte(126);
      case Nation.northKorea:
        writer.writeByte(127);
      case Nation.northMacedonia:
        writer.writeByte(128);
      case Nation.norway:
        writer.writeByte(129);
      case Nation.oman:
        writer.writeByte(130);
      case Nation.pakistan:
        writer.writeByte(131);
      case Nation.palau:
        writer.writeByte(132);
      case Nation.palestine:
        writer.writeByte(133);
      case Nation.panama:
        writer.writeByte(134);
      case Nation.papuaNewGuinea:
        writer.writeByte(135);
      case Nation.paraguay:
        writer.writeByte(136);
      case Nation.peru:
        writer.writeByte(137);
      case Nation.philippines:
        writer.writeByte(138);
      case Nation.poland:
        writer.writeByte(139);
      case Nation.portugal:
        writer.writeByte(140);
      case Nation.qatar:
        writer.writeByte(141);
      case Nation.romania:
        writer.writeByte(142);
      case Nation.russia:
        writer.writeByte(143);
      case Nation.rwanda:
        writer.writeByte(144);
      case Nation.saintKittsAndNevis:
        writer.writeByte(145);
      case Nation.saintLucia:
        writer.writeByte(146);
      case Nation.saintVincentAndTheGrenadines:
        writer.writeByte(147);
      case Nation.samoa:
        writer.writeByte(148);
      case Nation.sanMarino:
        writer.writeByte(149);
      case Nation.saoTomeAndPrincipe:
        writer.writeByte(150);
      case Nation.saudiArabia:
        writer.writeByte(151);
      case Nation.senegal:
        writer.writeByte(152);
      case Nation.serbia:
        writer.writeByte(153);
      case Nation.seychelles:
        writer.writeByte(154);
      case Nation.sierraLeone:
        writer.writeByte(155);
      case Nation.singapore:
        writer.writeByte(156);
      case Nation.slovakia:
        writer.writeByte(157);
      case Nation.slovenia:
        writer.writeByte(158);
      case Nation.solomonIslands:
        writer.writeByte(159);
      case Nation.somalia:
        writer.writeByte(160);
      case Nation.southAfrica:
        writer.writeByte(161);
      case Nation.southKorea:
        writer.writeByte(162);
      case Nation.southSudan:
        writer.writeByte(163);
      case Nation.spain:
        writer.writeByte(164);
      case Nation.sriLanka:
        writer.writeByte(165);
      case Nation.sudan:
        writer.writeByte(166);
      case Nation.suriname:
        writer.writeByte(167);
      case Nation.sweden:
        writer.writeByte(168);
      case Nation.switzerland:
        writer.writeByte(169);
      case Nation.syria:
        writer.writeByte(170);
      case Nation.taiwan:
        writer.writeByte(171);
      case Nation.tajikistan:
        writer.writeByte(172);
      case Nation.tanzania:
        writer.writeByte(173);
      case Nation.thailand:
        writer.writeByte(174);
      case Nation.togo:
        writer.writeByte(175);
      case Nation.tonga:
        writer.writeByte(176);
      case Nation.trinidadAndTobago:
        writer.writeByte(177);
      case Nation.tunisia:
        writer.writeByte(178);
      case Nation.turkey:
        writer.writeByte(179);
      case Nation.turkmenistan:
        writer.writeByte(180);
      case Nation.tuvalu:
        writer.writeByte(181);
      case Nation.uganda:
        writer.writeByte(182);
      case Nation.ukraine:
        writer.writeByte(183);
      case Nation.unitedArabEmirates:
        writer.writeByte(184);
      case Nation.unitedKingdom:
        writer.writeByte(185);
      case Nation.unitedStates:
        writer.writeByte(186);
      case Nation.uruguay:
        writer.writeByte(187);
      case Nation.uzbekistan:
        writer.writeByte(188);
      case Nation.vanuatu:
        writer.writeByte(189);
      case Nation.vaticanCity:
        writer.writeByte(190);
      case Nation.venezuela:
        writer.writeByte(191);
      case Nation.vietnam:
        writer.writeByte(192);
      case Nation.yemen:
        writer.writeByte(193);
      case Nation.zambia:
        writer.writeByte(194);
      case Nation.zimbabwe:
        writer.writeByte(195);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClubHiveObjAdapter extends TypeAdapter<ClubHiveObj> {
  @override
  final int typeId = 4;

  @override
  ClubHiveObj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClubHiveObj(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      leagueId: (fields[2] as num).toInt(),
      wins: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      draws: fields[4] == null ? 0 : (fields[4] as num).toInt(),
      losses: fields[5] == null ? 0 : (fields[5] as num).toInt(),
      nation: fields[6] as Nation,
      shortName: fields[7] as String,
      stadiumName: fields[8] as String,
      tier: (fields[9] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ClubHiveObj obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.leagueId)
      ..writeByte(3)
      ..write(obj.wins)
      ..writeByte(4)
      ..write(obj.draws)
      ..writeByte(5)
      ..write(obj.losses)
      ..writeByte(6)
      ..write(obj.nation)
      ..writeByte(7)
      ..write(obj.shortName)
      ..writeByte(8)
      ..write(obj.stadiumName)
      ..writeByte(9)
      ..write(obj.tier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClubHiveObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeasonHiveObjAdapter extends TypeAdapter<SeasonHiveObj> {
  @override
  final int typeId = 5;

  @override
  SeasonHiveObj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonHiveObj(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      clubIds: (fields[2] as List).cast<int>(),
      leagueId: (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, SeasonHiveObj obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.clubIds)
      ..writeByte(3)
      ..write(obj.leagueId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonHiveObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
