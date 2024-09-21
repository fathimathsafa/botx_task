import 'package:flutter/material.dart';

class FilteringScreen extends StatelessWidget {
  const FilteringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .5),
            child: Center(
              child: Image.asset(
                'assets/png-clipart-oreo-logo-sandwich-cookie-birthday-cake-biscuits-others-miscellaneous-food_1-removebg-preview.png',
                width: size.width * .4,
                height: size.height * .2,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  height: size.height * .08,
                  width: size.width * .4,
                  child: MaterialButton(
                    color: Colors.blue[900],
                    onPressed: () {},
                    shape: StadiumBorder(),
                    child: Text(
                      "Product",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: size.width * .1),
                Container(
                  height: size.height * .08,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    child: Text(
                      "Raw Material",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // List of ListTiles with shadow
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Number of ListTiles
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 5, // Adjust the shadow strength
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh4k251xFF_9ijySYa4PoRBwdRDOixcZmkhw&s', // Image URL
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text('Oreo'),
                      subtitle: Text('Today'),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        child: Text('1 Bags'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
