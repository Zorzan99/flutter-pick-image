import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testando/app/global/routes/routes.dart';
import 'package:testando/app/views/home_page/home_bindings.dart';
import 'package:testando/app/views/home_page/home_page.dart';

class HomeRoute implements Routes {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/home', page: () => const HomePage(), binding: HomeBindings())
  ];
}
