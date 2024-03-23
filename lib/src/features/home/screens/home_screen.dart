import 'package:flutter/material.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gastronomic Recommendations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepository.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Promotion Cards Section
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of promotions
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Container(
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            width: 195,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Center column
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Get 50% OFF on your first order',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('See restaurant',
                                        style: TextStyle(fontSize: 10)),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      textStyle: TextStyle(
                                        fontSize: 10,
                                      ),
                                      minimumSize: Size(0, 30), // button size
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Image section - 35% of the width
                          Container(
                            width: 105,
                            child: Image.network(
                              'https://brandemia.org/sites/default/files/sites/default/files/logo_el_corral_despues.jpg',
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Search Bar
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search for restaurants or food',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Featured restaurants',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  RestaurantCardBuilder()
                      .setName("Juan Valdez")
                      .setStatus("Open")
                      .setImageUrl(
                          "https://upload.wikimedia.org/wikipedia/en/b/b8/Juan_Valdez_Caf%C3%A9_Logo.jpg")
                      .build(),
                  RestaurantCardBuilder()
                      .setName("Senecafé")
                      .setStatus("Open")
                      .setImageUrl(
                          "https://img.freepik.com/vector-premium/coffee-vintage-logo-design-isnpiration-cafeteria_427676-94.jpg")
                      .build(),
                  // RestaurantCardBuilder
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
              child: Text('Most popular food',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            FoodCard(foodName: 'Burgers', foodType: 'Fastfood'),
            FoodCard(foodName: 'Burgers', foodType: 'Fastfood'),
            FoodCard(foodName: 'Burgers', foodType: 'Fastfood'),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String status;
  final String imageUrl;

  const RestaurantCard({
    Key? key,
    required this.name,
    required this.status,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(name),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(status),
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String foodName;
  final String foodType;

  const FoodCard({Key? key, required this.foodName, required this.foodType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.fastfood),
      title: Text(foodName),
      subtitle: Text('Type of food: $foodType'),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

//builder design pattern
class RestaurantCardBuilder {
  String _name = "Default Name";
  String _status = "Closed";
  String _imageUrl = "https://defaultimage.jpg";

  RestaurantCardBuilder setName(String name) {
    _name = name;
    return this;
  }

  RestaurantCardBuilder setStatus(String status) {
    _status = status;
    return this;
  }

  RestaurantCardBuilder setImageUrl(String imageUrl) {
    _imageUrl = imageUrl;
    return this;
  }

  RestaurantCard build() {
    return RestaurantCard(
      name: _name,
      status: _status,
      imageUrl: _imageUrl,
    );
  }
}
