import 'package:flutter/material.dart';
import 'package:updatedrestorentapp/Model/Items.dart';
import 'package:updatedrestorentapp/screens/Meals.dart';
import 'package:updatedrestorentapp/screens/dummyItems.dart';

class Categoriespage extends StatefulWidget {
  final Function togglemeals;
  final List<Items> favoritemeals;
  final Map<String, bool> myfilter;

  const Categoriespage(
      {super.key,
      required this.togglemeals,
      required this.favoritemeals,
      required this.myfilter,});

  @override
  State<Categoriespage> createState() => _CategoriespageState();
}

class _CategoriespageState extends State<Categoriespage> {

  // To store updated filters
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      body: GridView.extent(
        mainAxisSpacing: 11,
        crossAxisSpacing: 11,
        childAspectRatio: 2.5 / 2,
        maxCrossAxisExtent: 200,
        children: [
          for (final availablemeal in availablemeals)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => Meals(
                        categoryId: availablemeal.id,
                        togglemeals: widget.togglemeals,
                        favoritemeals: widget.favoritemeals,
                        myfilter: widget.myfilter,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: availablemeal.color,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      availablemeal.tittle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
