import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player {
  Player(this.name, this.group, this.bestScore, this.firstScore);

  String name;
  String group;
  int bestScore;
  int firstScore;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  @override
  String toString() {
    return 'Player{name: $name, group: $group, bestScore: $bestScore, firstScore: $firstScore}';
  }
}