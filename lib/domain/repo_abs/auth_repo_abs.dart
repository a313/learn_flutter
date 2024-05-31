import 'package:widgets/core/usecase/data_state.dart';

abstract class AuthRepo {
  Future<DataState<dynamic>> login();
}
