import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/domain/models/actor.dart';
import 'package:widgets/domain/repo_abs/actor_repo_abs.dart';

class ActorUsecases {
  final ActorRepo _;
  ActorUsecases(this._);
  Future<DataState<Actor>> getActor() {
    return _.getActor();
  }
}
