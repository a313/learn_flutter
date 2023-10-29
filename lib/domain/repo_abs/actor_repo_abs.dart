import 'package:widgets/core/usecase/data_state.dart';

import '../models/actor.dart';

abstract class ActorRepo {
  Future<DataState<Actor>> getActor();
}
