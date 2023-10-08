import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets/data/repo_impl/local_repo_impl.dart';
import 'package:widgets/domain/usecases/local_usecase.dart';

class DependecyInjection {
  static Future<void> injection() async {
    final pref = await SharedPreferences.getInstance();
    Get.put(LocalUsecase(LocalRepoImpl(pref)));
  }
}
