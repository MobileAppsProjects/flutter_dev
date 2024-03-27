import 'package:flutter/material.dart';

class FoodCategoriesCard extends StatelessWidget {
  final String foodName;
  final String foodType;

  const FoodCategoriesCard(
      {Key? key, required this.foodName, required this.foodType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Handle tap here
        },
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            width: 150,
            height: 60,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.fastfood),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(foodName),
                  Text('Type of food: $foodType'),
                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ));
  }
}
