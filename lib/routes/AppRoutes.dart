import 'package:get/get.dart';
import 'package:supabase_aula/listUserPage.dart';

import '../homePage.dart';

class AppRoutes{
  static const HOME = '/home';
  static const LIST_USERS = '/list-users';
}

class AppPages{
  static final routes = [
    GetPage(name: AppRoutes.HOME, page: ()=> HomePage()),
    GetPage(name: AppRoutes.LIST_USERS, page: ()=> ListCadastro()),
  ];
}