import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets/data/datasource/activity_service.dart';
import 'package:widgets/data/datasource/actor_service.dart';
import 'package:widgets/data/repo_impl/activity_repo_impl.dart';
import 'package:widgets/data/repo_impl/actor_repo_impl.dart';
import 'package:widgets/data/repo_impl/local_repo_impl.dart';
import 'package:widgets/domain/usecases/activity_usecase.dart';
import 'package:widgets/domain/usecases/actor_usecase.dart';
import 'package:widgets/domain/usecases/fcm_usecase.dart';
import 'package:widgets/domain/usecases/local_usecase.dart';

class DependecyInjection {
  static Future<void> injection() async {
    final pref = await SharedPreferences.getInstance();

    Get.put(LocalUsecase(LocalRepoImpl(pref)));
    Get.put(ActorUsecases(ActorRepoImpl(ActorService())));
    Get.put(ActivityUsecases(ActivityRepoImpl(ActivityService())));
    final fcm = FcmUsecase();
    Get.put(fcm);
    fcm.init();
  }
}
