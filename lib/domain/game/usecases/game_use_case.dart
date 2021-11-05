
import 'package:flip_flop_game/domain/core/usecases/usecase.dart';
import 'package:flip_flop_game/domain/game/constants.dart';
import 'package:flip_flop_game/domain/game/entity/game.dart';
import 'package:flip_flop_game/domain/game/entity/game_properties.dart';
import 'package:injectable/injectable.dart';

@injectable
class GameUseCase extends UseCase<Game, GameProperties> {
  late int _seed;

  @override
  Future<Game> useCase() async {
    print("use Case called : seed number $_seed");
    List<String> _assetPaths = List.empty(growable: true);
    for(int count = 1; count <= GameConfig.quantity / 2; count++) {
      _assetPaths.add('resources/pack$_seed/image$count-image.png');
      _assetPaths.add('resources/pack$_seed/image$count-text.png');
    }

    _assetPaths.shuffle();
    return Game(_assetPaths);
  }


  @override
  Future<Game> executeUseCase(GameProperties params) {
    _seed = params.seed;
    print("seed : $_seed");
    return super.executeUseCase(params);
  }
}
