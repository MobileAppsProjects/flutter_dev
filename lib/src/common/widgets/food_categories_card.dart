import 'package:flutter/material.dart';
import 'package:flutter_dev/src/constants/colors.dart';

class FoodCategoriesCard extends StatelessWidget {
  final String foodName;
  final String foodType;

  const FoodCategoriesCard(
      {Key? key, required this.foodName, required this.foodType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Handle tap here
        },
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: 70,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    color: TaccentColor,
                    width: 55,
                    height: 55,
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/6978/6978255.png',
                        width: 25,
                        height: 25),
                  )),
              SizedBox(width: 16), // Add some space between the image and text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(foodName, style: Theme.of(context).textTheme.bodyMedium),
                  Text('Type of food: $foodType'),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
