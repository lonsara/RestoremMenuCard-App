import 'package:flutter/material.dart';
import 'package:updatedrestorentapp/screens/Mealdetails.dart';
import '../Model/Items.dart';

class Favoritemeal extends StatefulWidget {
  final List<Items> favoriteMeals;
  final Function togglemeals;
  Favoritemeal({required this.favoriteMeals, required this.togglemeals});

  @override
  State<Favoritemeal> createState() => _FavoritemealState();
}

class _FavoritemealState extends State<Favoritemeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      body: widget.favoriteMeals.isEmpty
          ? const Center(
              child: Text(
                "No Favorite Items Added yet.... ",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: widget.favoriteMeals.length,
              itemBuilder: (context, index) {
                var items = widget.favoriteMeals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => Mealdetails(
                                  mealId: items.id,
                                  favoritemeals: widget.favoriteMeals,
                                  togglemeals: widget.togglemeals,
                                )));
                  },
                  child: Card(
                    color: Colors.brown,
                    elevation: 5,
                    child: ListTile(
                      leading: Image.network(items.url),
                      title: Text(
                        items.tittle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${items.duration}   ||   ${items.complexity}   ||   ${items.affortability}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
