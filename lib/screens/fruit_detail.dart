import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/components/content_source.dart';
import 'package:fruits_app/components/nutrition.dart';
import 'package:fruits_app/components/sliver_bar.dart';
import 'package:fruits_app/model/fruit_model.dart';
import 'package:fruits_app/utilities/constants.dart';

class FruitDetailScreen extends StatefulWidget {
  const FruitDetailScreen({required this.fruit});
  final Fruit fruit;

  @override
  _FruitDetailScreenState createState() => _FruitDetailScreenState();
}

class _FruitDetailScreenState extends State<FruitDetailScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CupertinoScrollbar(
          child: CustomScrollView(
            slivers: [
              SliverBar(fruit: widget.fruit),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        widget.fruit.title,
                        style: TextStyle(
                          color: widget.fruit.gradientColors[1],
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      padding: kPadding,
                    ),
                    Container(
                      padding: kPadding,
                      child: Text(
                        widget.fruit.headline,
                        style: kInfoDataTextStyle,
                      ),
                    ),
                    Padding(
                      padding: kPadding,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.zero,
                          animationDuration: const Duration(milliseconds: 500),
                          elevation: 0,
                          children: [
                            ExpansionPanel(
                              backgroundColor:
                                  Theme.of(context).backgroundColor,
                              body: Nutrition(
                                fruit: widget.fruit,
                              ),
                              headerBuilder: (context, isOpen) {
                                return Container(
                                  padding: const EdgeInsets.only(top: 11),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '  Nutritional values per 100g',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      _isExpanded
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: const Divider(),
                                            )
                                          : const Text(''),
                                    ],
                                  ),
                                );
                              },
                              isExpanded: _isExpanded,
                            ),
                          ],
                          expansionCallback: (i, isOpen) {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: kPadding,
                      child: Text(
                        'Learn more about ${widget.fruit.title}',
                        style: TextStyle(
                          fontSize: 20,
                          color: widget.fruit.gradientColors[1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: kPadding,
                      child: Text(
                        '${widget.fruit.description}',
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    ContentSource(),
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
