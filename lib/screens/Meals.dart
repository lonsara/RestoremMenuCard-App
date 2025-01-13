import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:updatedrestorentapp/Model/Items.dart';
import 'package:updatedrestorentapp/screens/Mealdetails.dart';
import 'package:updatedrestorentapp/screens/dummyItems.dart';

class Meals extends StatefulWidget {
  final String categoryId;
  final Function togglemeals;
  final List<Items> favoritemeals;
  final Map<String ,bool> myfilter;
  const Meals(
      {super.key,
      required this.categoryId,
      required this.togglemeals,
      required this.favoritemeals,
      required this.myfilter});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  bool _applyFilters(Items meal) {
    if (widget.myfilter['glutenfree']! && !meal.isGlutenFree) {
      return false;
    }
    if (widget.myfilter['lactosfree']! && !meal.isLactoseFree) {
      return false;
    }
    if (widget.myfilter['vegetarian']! && !meal.isVegetarian) {
      return false;
    }
    if (widget.myfilter['vegan']! && !meal.isVegan) {
      return false;
    }
    return true;
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var seletedByFilter=dummyitems.where((meal){
      return meal.categories.contains(widget.categoryId) && _applyFilters(meal);
    }).toList();
    return seletedByFilter.isEmpty?const Scaffold(
      backgroundColor:Color.fromRGBO(34, 28, 20, 1) ,
        body: Align(
          alignment: Alignment.center,
          child: Text("Oo...ho No Meals Present",style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),),
        )
    )
    :
      Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      body: ListView.builder(
          itemCount: seletedByFilter.length,
          itemBuilder: (context, index) {
            var items = seletedByFilter[index];
            return Padding(
              padding: const EdgeInsets.only(
                  bottom: 16.0, left: 10, right: 10, top: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Mealdetails(
                                mealId: items.id,
                                favoritemeals: widget.favoritemeals,
                                togglemeals: widget.togglemeals,
                              )));
                },
                child: Card(
                  elevation: 5,
                  child: Stack(
                    children: [
                      Image.network(
                        items.url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Positioned(
                        bottom: 1,
                        width: width,
                        child: Container(
                            color: Colors.black26,
                            height: 100,
                            child: ListTile(
                              title: Text(
                                items.tittle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Colors.white,
                                          size: 19,
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          items.duration,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.shopping_bag_rounded,
                                          color: Colors.white,
                                          size: 19,
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          items.complexity,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.currency_exchange_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          items.affortability,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
