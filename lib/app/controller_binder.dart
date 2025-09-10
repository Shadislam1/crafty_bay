
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/ui/controller/sign_up_controller.dart';

import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(MainBottomNavController());
   Get.put(NetworkClient(onUnAuthorize: _onUnAuthorize,
       commonHeaders: _commonHeaders)
   );
   Get.put(SignUpController());
  }
    void _onUnAuthorize(){
      // TODO:Logout from from and relogin
  }
  Map<String,String> _commonHeaders= {
    'content-type':'application/json',
    'token':'',

  };
}