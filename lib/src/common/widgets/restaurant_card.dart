import 'package:flutter/material.dart';
import 'package:flutter_dev/src/constants/colors.dart';
import 'package:flutter_dev/src/constants/images.dart';
import 'package:flutter_dev/src/utils/theme/theme_text.dart';

class RestaurantCard extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;

  const RestaurantCard({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: width,
          height: height,
        ),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                child: Image.asset(
                  'assets/images/juanvaldez.png',
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Cafes',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Spacer(),
                        RichText(
                          text: TextSpan(
                              text: 'Open',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    backgroundColor: TtagOpenColor,
                                  )),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Juan Valdez',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
