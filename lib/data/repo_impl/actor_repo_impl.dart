import 'package:widgets/core/usecase/data_state.dart';
import 'package:widgets/data/datasource/actor_service.dart';
import 'package:widgets/domain/models/actor.dart';
import 'package:widgets/domain/repo_abs/actor_repo_abs.dart';

class ActorRepoImpl extends ActorRepo {
  final ActorService _;
  ActorRepoImpl(this._);

  @override
  Future<DataState<Actor>> getActor() async {
    final response = await _.getActor();
    if (response.statusCode == 200) {
      final data = Actor.fromJson(response.body);
      return DataSuccess(data);
    } else {
      return DataFailure(
          response.statusCode!, response.bodyString ?? 'UNKNOWN ERROR');
    }
  }
}
