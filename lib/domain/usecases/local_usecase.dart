import 'package:widgets/domain/repo_abs/local_repo_abs.dart';

class LocalUsecase {
  final LocalRepo _;

  LocalUsecase(this._);
  bool isShowOnboard() {
    return _.isShowOnboading();
  }

  void didShowOnboard(bool value) {
    _.didShowOnboard(value);
  }
}
