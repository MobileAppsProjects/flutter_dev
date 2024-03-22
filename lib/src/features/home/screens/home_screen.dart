import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/src/common/widgets/bottom_nav_bar.dart';
import 'package:flutter_dev/src/repository/authentication_repository/authentication_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            // Lista horizontal de descuentos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Agrega tus widgets de descuentos aquí
                ],
              ),
            ),
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Busqueda',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Featured restaurants
            SizedBox(height: 16),
            Text(
              'FEATURED RESTAURANTS',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Agrega tus widgets de restaurantes destacados aquí
                  RestaurantCard(
                    category: 'Cafés',
                    isOpen: true,
                    name: 'Juan Valdéz',
                    imageUrl: 'assets/images/juanvaldez.png',
                  ),
                  // Agrega más restaurantes destacados aquí
                  RestaurantCard(
                    category: 'Cafés',
                    isOpen: false,
                    name: 'Starbucks',
                    imageUrl: 'assets/images/starbucks.jpg',
                  ),
                ],
              ),
            ),
            // Most popular food
            SizedBox(height: 16),
            Text(
              'MOST POPULAR FAST FOOD',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Agrega tus widgets de comidas populares aquí
                  FoodCard(
                    name: 'Burgers',
                    type: 'Fastfood',
                    imageUrl: 'assets/images/burguer1.jpg',
                    onImageTap: () {},
                  ),
                  SizedBox(height: 10),
                  // Agrega más comidas populares aquí
                  FoodCard(
                    name: 'Burgers',
                    type: 'Fast food',
                    imageUrl: 'assets/images/burguer1.jpg',
                    onImageTap: () {},
                  ),
                  SizedBox(height: 10),
                  FoodCard(
                    name: 'Burgers',
                    type: 'Fast food',
                    imageUrl: 'assets/images/burguer1.jpg',
                    onImageTap: () {},
                  ),
                  SizedBox(height: 10),
                  FoodCard(
                    name: 'Burgers',
                    type: 'Fast food',
                    imageUrl: 'assets/images/burguer1.jpg',
                    onImageTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String category;
  final bool isOpen;
  final String name;
  final String imageUrl;

  RestaurantCard({
    required this.category,
    required this.isOpen,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 160,
            width: 160,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Row(
                  children: [
                    Icon(
                      isOpen ? Icons.circle : Icons.circle_outlined,
                      color: isOpen ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(isOpen ? 'Open' : 'Closed'),
                  ],
                ),
                Text(
                  category,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String type;
  final String imageUrl;
  final VoidCallback onImageTap;

  FoodCard({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: onImageTap,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 247, 247, 247)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Container(
              width: 60,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(imageUrl),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                ' $type',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
