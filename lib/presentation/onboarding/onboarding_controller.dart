import 'package:get/get.dart';
import 'package:widgets/domain/usecases/local_usecase.dart';
import 'package:widgets/routes/routes.dart';

class A {
  int a;
  String b;
  A({
    required this.a,
    required this.b,
  });
}

class OnboardingController extends GetxController {
  late List<String> items;
  final local = Get.find<LocalUsecase>();
  @override
  void onInit() {
    items = ['1', '2', '3'];
    super.onInit();
  }

  //TODO
  Future<void> nextPage() async {
    // Trang hiện tại A
    // Trang cần đến là G

    ///* Routing
    // Get.toNamed(Routes.home); // A->G
    // Get.offNamed(Routes.home); // A remove -> G
    // Get.offNamedUntil(Routes.home,
    //     ModalRoute.withName(Routes.login)); // A -> B -> C -> D => A -> G
    // Get.offAllNamed(Routes.home); // A -> B -> C -> D => G

    // Get.to(() => const HomePage());
    // Get.off(() => const HomePage());
    // Get.until((route) => false);
    // Get.offAll(() => const HomePage());

    // final result =
    //     await Get.toNamed(Routes.home, arguments: A(a: 100, b: 'test'));
    // print(result);
  }

  // void callbackFunction(String s) {
  //   print('ABC');
  // }

  void onSkip() {
    local.didShowOnboard(true);
    // Get.toNamed(Routes.login);
    Get.toNamed(Routes.openId);
  }
}
