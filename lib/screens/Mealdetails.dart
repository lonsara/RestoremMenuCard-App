import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:updatedrestorentapp/screens/dummyItems.dart';

import '../Model/Items.dart';
import 'Meals.dart';
import 'favoriteMeal.dart';

class Mealdetails extends StatefulWidget {
  final String mealId;
  final Function togglemeals;
  final List<Items> favoritemeals;
  const Mealdetails({super.key, required this.mealId,required this.favoritemeals,required this.togglemeals});

  @override
  State<Mealdetails> createState() => _MealdetailsState();
}

class _MealdetailsState extends State<Mealdetails> {
  TextStyle sectionHeaderStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  TextStyle sectionContentStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w300,
    fontSize: 20,
  );
  // Use Item instead of Meals here
  late bool isFavorite;

  void initState(){
    super.initState();
    var meals=dummyitems.firstWhere((meal)=>meal.id==widget.mealId);
    isFavorite=widget.favoritemeals.contains(meals);
  }
  @override
  Widget build(BuildContext context) {
    var selectedMeal = dummyitems.firstWhere((meal) => meal.id == widget.mealId);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            selectedMeal.tittle, // Make sure you access 'title' from Item, not Meals
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border, // Star changes based on isFavorite
              color: isFavorite ? Colors.yellow : Colors.white, // Change color if favorited
            ),
            onPressed: () {
              setState(() {
                isFavorite=!isFavorite;
                widget.togglemeals(selectedMeal);
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(3.0),
        children: [
          Card(
            elevation: 5,
            child: Image.network(
              selectedMeal.url, // Access URL from Item
              scale: 1.0,
            ),
          ),
          const SizedBox(height: 10),
          Text('Ingredients', textAlign: TextAlign.center, style: sectionHeaderStyle),
          const SizedBox(height: 10),
          for (var ingredient in selectedMeal.ingredients)
            Text('$ingredient \n', textAlign: TextAlign.center, style: sectionContentStyle),
          const SizedBox(height: 10),
          Text('Steps', textAlign: TextAlign.center, style: sectionHeaderStyle),
          const SizedBox(height: 10),
          for (var step in selectedMeal.steps)
            Text('${step}\n', textAlign: TextAlign.center, style: sectionContentStyle),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
