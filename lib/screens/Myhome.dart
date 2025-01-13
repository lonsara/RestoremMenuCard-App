import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:updatedrestorentapp/Model/Items.dart';
import 'package:updatedrestorentapp/screens/Drawer.dart';
import 'package:updatedrestorentapp/screens/favoriteMeal.dart';

import 'Cateroriespage.dart';

class Myhome extends StatefulWidget {
  final Map<String,bool> filtermap;
   Myhome({super.key,required this.filtermap});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int index = 0;
  Map<String, bool> filters = {};
  List<Items> favoriteList = [];



  void initState() {
    super.initState();
    filters = widget.filtermap;
  }
  // void _setFilters(Map<String, bool> filterData) { setState(() { filters = filterData; }); }
  void togglefunc(Items item) {
    setState(() {
      if (favoriteList.contains(item)) {
        favoriteList.remove(item);
        Get.snackbar(
            'Remove from Favorite',
            colorText: Colors.white,
            '',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        favoriteList.add(item);
        Get.snackbar(
            'Added to Favorite',
            colorText: Colors.white,
            '',
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      Categoriespage(
        favoritemeals: favoriteList,
        togglemeals: togglefunc,
        myfilter: filters,
      ),
      Favoritemeal(
        favoriteMeals: favoriteList,
        togglemeals: togglefunc,
      ),
    ];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
          unselectedItemColor: Colors.white,
          selectedItemColor: CupertinoColors.systemOrange,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
          ]),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ));
        }),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawers(filtermap: filters,),
      body: pages[index],
    );
  }
}
