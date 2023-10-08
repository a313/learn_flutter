import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets/domain/repo_abs/local_repo_abs.dart';

class LocalRepoImpl extends LocalRepo {
  final SharedPreferences _;
  LocalRepoImpl(this._);
  @override
  bool isShowOnboading() {
    return _.getBool('isOnboading') ?? false;
  }

  @override
  void didShowOnboard(bool value) {
    _.setBool('isOnboading', value);
  }
}
