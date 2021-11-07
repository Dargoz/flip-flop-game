import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  String name;
  String? firstScore;
  String? bestScore;
  String lastScore;

  Player(
      {required this.name,
      this.firstScore,
      this.bestScore,
      required this.lastScore});

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  @override
  String toString() {
    return 'Player{name: $name, firstScore: $firstScore, bestScore: $bestScore, lastScore: $lastScore}';
  }

}
