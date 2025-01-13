import 'package:flutter/material.dart';
import 'package:updatedrestorentapp/screens/Screenfilter.dart';
import 'Myhome.dart';

class Drawers extends StatefulWidget {
  Map<String, bool> filtermap;
  // final Function setFilter;
  Drawers({super.key, required this.filtermap});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      widget.filtermap = filterData;
    });
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
        elevation: 3,
        backgroundColor: const Color.fromRGBO(43, 34, 28, 1),
        child: ListView(
          children: [
            Container(
              height: 220,
              color: const Color.fromRGBO(109, 50, 0, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'images/imgs.png',
                      scale: 3,
                    ),
                    SizedBox(
                      width: width / 30,
                    ),
                    const Text(
                      'Cooking Up!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.nightlife,
                color: Colors.white,
                size: 22,
              ),
              title: const Text(
                'Meals',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Myhome(
                              filtermap: widget.filtermap,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 22,
              ),
              title: const Text(
                'Filter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Screenfilter(isfilter: widget.filtermap)));

                // if (result != null) {
                //   _setFilters(result);
                // }
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
