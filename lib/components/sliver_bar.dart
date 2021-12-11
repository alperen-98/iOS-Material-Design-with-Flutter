import 'package:flutter/material.dart';
import 'package:fruits_app/model/fruit_model.dart';

class SliverBar extends StatelessWidget {
  const SliverBar({required this.fruit});
  final Fruit fruit;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/${fruit.image}.png'),
            ),
            gradient: LinearGradient(
              colors: fruit.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}
