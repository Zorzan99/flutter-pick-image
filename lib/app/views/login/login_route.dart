import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testando/app/global/routes/routes.dart';
import 'package:testando/app/views/login/login_binding.dart';
import 'package:testando/app/views/login/login_page.dart';

class LoginRoute implements Routes {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
