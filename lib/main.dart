import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_aula/keySupabase.dart';
import 'package:supabase_aula/routes/AppRoutes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'homePage.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: KeysSupabase().utlsupabase,
    anonKey: KeysSupabase().keysupabase,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    initialRoute: AppRoutes.HOME,
    getPages: AppPages.routes,
  ));
}