import 'package:get/get.dart';
import 'package:movies_app/service/deep_links.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DeepLinksService());
  }
}
