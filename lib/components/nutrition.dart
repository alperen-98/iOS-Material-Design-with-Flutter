import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits_app/model/fruit_model.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({required this.fruit});
  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        children: [
          _Info(fruit: fruit, index: 0),
          _Info(fruit: fruit, index: 1),
          _Info(fruit: fruit, index: 2),
          _Info(fruit: fruit, index: 3),
          _Info(fruit: fruit, index: 4),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  _Info({required this.fruit, required this.index});
  final Fruit fruit;
  final int index;
  final nutritions = [
    'Energy',
    'Sugar',
    'Fat',
    'Protein',
    'Vitamins',
    'Minerals'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              CupertinoIcons.info_circle,
              color: fruit.gradientColors[1],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              nutritions[index],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                fruit.nutrition[index],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
