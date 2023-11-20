import 'package:funmap/features/authentication/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

initAuth(){
  Get.lazyPut(()=>AuthController());
}
