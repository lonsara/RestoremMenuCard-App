import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Myhome.dart';

class Screenfilter extends StatefulWidget {
  Map<String, bool> isfilter;
  Screenfilter({super.key,required this.isfilter});

  @override
  State<Screenfilter> createState() => _ScreenfilterState();
}

class _ScreenfilterState extends State<Screenfilter> {
  static bool isGlutenFree = false;
  static bool isLactoseFree = false;
  static bool isVegetarian = false;
  static bool isVegan = false;

  void initState() {
    super.initState();
    // Initialize filter values from the passed map or SharedPreferences
    // isGlutenFree = widget.isfilter['glutenfree']!;
    // isLactoseFree = widget.isfilter['lactosfree']!;
    // isVegetarian = widget.isfilter['vegetarian']!;
    // isVegan = widget.isfilter['vegan']!;
  }

  Future<void> saveFilterState() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
     sp.setBool('glutenfree', isGlutenFree);
     sp.setBool('lactosefree', isLactoseFree);
     sp.setBool('vegetarian', isVegetarian);
     sp.setBool('vegan', isVegan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 28, 20, 1),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Save the filter preferences before navigating back
            saveFilterState();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Myhome(
                        filtermap: {
                          'glutenfree': isGlutenFree,
                          'lactosfree': isLactoseFree,
                          'vegetarian': isVegetarian,
                          'vegan': isVegan,
                        },
                      )),
            );
          },
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Your Filters',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Gluten-Free filter toggle
          ListTile(
            title: const Text(
              'Gluten-free',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Only include gluten-free meals',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: SizedBox(
              width: 60,
              child: FlutterSwitch(
                  inactiveColor: const Color.fromRGBO(82, 68, 61, 1),
                  activeColor: Colors.orangeAccent,
                  value: isGlutenFree,
                  onToggle: (bool value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                    saveFilterState(); // Save state on toggle
                  }),
            ),
          ),
          const Divider(
            color: Colors.white38,
            thickness: 0.3,
          ),

          // Lactose-Free filter toggle
          ListTile(
            title: const Text(
              'Lactose-free',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Only include lactose-free meals',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: SizedBox(
              width: 60,
              child: FlutterSwitch(
                  inactiveColor: const Color.fromRGBO(82, 68, 61, 1),
                  activeColor: Colors.orangeAccent,
                  value: isLactoseFree,
                  onToggle: (bool value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                    saveFilterState(); // Save state on toggle
                  }),
            ),
          ),
          const Divider(
            color: Colors.white38,
            thickness: 0.3,
          ),

          // Vegetarian filter toggle
          ListTile(
            title: const Text(
              'Vegetarian',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Only include vegetarian meals',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: SizedBox(
              width: 60,
              child: FlutterSwitch(
                  inactiveColor: const Color.fromRGBO(82, 68, 61, 1),
                  activeColor: Colors.orangeAccent,
                  value: isVegetarian,
                  onToggle: (bool value) {
                    setState(() {
                      isVegetarian = value;
                    });
                    saveFilterState(); // Save state on toggle
                  }),
            ),
          ),
          const Divider(
            color: Colors.white38,
            thickness: 0.3,
          ),

          // Vegan filter toggle
          ListTile(
            title: const Text(
              'Vegan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Only include vegan meals',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: SizedBox(
              width: 60,
              child: FlutterSwitch(
                  inactiveColor: const Color.fromRGBO(82, 68, 61, 1),
                  activeColor: Colors.orangeAccent,
                  value: isVegan,
                  onToggle: (bool value) {
                    setState(() {
                      isVegan = value;
                    });
                    saveFilterState(); // Save state on toggle
                  }),
            ),
          ),
          const Divider(
            color: Colors.white38,
            thickness: 0.3,
          ),
        ],
      ),
    );
  }
}
