import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/model/fruit_model.dart';
import 'package:fruits_app/screens/fruit_detail.dart';
import 'package:fruits_app/utilities/constants.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({required this.fruit});
  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FruitDetailScreen(fruit: fruit)));
      },
      child: Container(
        height: kHeight,
        child: Row(
          children: [
            Container(
              height: kHeight,
              width: kWidth,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius12,
                gradient: LinearGradient(
                    colors: fruit.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                image: DecorationImage(
                  image: AssetImage('images/${fruit.image}.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruit.title,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 17.5, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      fruit.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: fruit.gradientColors[1],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FruitDetailScreen(fruit: fruit)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
