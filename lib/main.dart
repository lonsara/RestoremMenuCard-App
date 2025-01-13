import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:updatedrestorentapp/Provider/Favorite_provider.dart';
import 'package:updatedrestorentapp/Provider/Filter_provider.dart';
import 'package:updatedrestorentapp/screens/Cateroriespage.dart';
import 'package:updatedrestorentapp/screens/Meals.dart';
import 'package:updatedrestorentapp/screens/Myhome.dart';
import 'package:get/get.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Myhome(filtermap: const {
          'glutenfree': false,
          'lactosfree': false,
          'vegetarian': false,
          'vegan': false,
        }),
      ),
    );
  }
}
