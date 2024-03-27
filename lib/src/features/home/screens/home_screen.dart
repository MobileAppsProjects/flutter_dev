import 'package:flutter/material.dart';
import 'package:flutter_dev/src/common/widgets/offer_card.dart';
import 'package:flutter_dev/src/common/widgets/food_categories_card.dart';
import 'package:flutter_dev/src/common/widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Promotion Cards Section
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of promotions
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 16, bottom: 16, right: 10),
                      child: OfferCard(),
                    );
                  },
                ),
              ),
              // Search Bar
              Padding(
                padding: EdgeInsets.only(right: 16.0, bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for restaurants or food",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Text('Featured restaurants',
                  style: Theme.of(context).textTheme.headlineLarge),
              Container(
                height: 270,
                padding: EdgeInsets.only(bottom: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Number of restaurants
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: RestaurantCard(
                          width: 170,
                          height: 150,
                          onTap: () {
                            print('object');
                          }),
                    );
                  },
                ),
              ),
              Text('Most popular food',
                  style: Theme.of(context).textTheme.headlineLarge),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5, // Number of restaurants
                  itemBuilder: (context, index) {
                    return FoodCategoriesCard(
                      foodName: 'Pizza',
                      foodType: 'Italian',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
