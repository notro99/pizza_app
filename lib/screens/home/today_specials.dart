import 'package:flutter/material.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:pizza_app/models/pizza.dart';
import 'package:pizza_app/screens/home/pizza_card.dart';
import 'package:pizza_app/screens/home_page.dart';

class TodaySpecials extends StatelessWidget {
  final OnPizzaSelect onPizzaSelect;

  const TodaySpecials({Key key, this.onPizzaSelect}) : super(key: key);
  // Ez a metódus a lista elemeit építi fel. Az elemek a PIZZAS listában
  // találhatók.
  Widget _buildItem(BuildContext context, int index) {
    var pizza = PIZZAS[index];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      height: 230,
      child: Stack(
        children: [
          Positioned.fill(
            left: 60,
            child: Container(
              // Felhasználjuk a már létező PizzaCard widget-ünket
              child: PizzaCard(
                pizza: PIZZAS[index],
                padding: EdgeInsets.only(left: 60),
                onPizzaSelect: onPizzaSelect,
              ),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            margin: EdgeInsets.only(top: 35),
            child: Image.asset(pizza.imagePath),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              PizzaAppLocalizations.of(context).todaySpecials,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            // A ListView egy görgethető listát ad nekünk.
            // A ListView.builder-nek egy builder függvényt adhatunk meg,
            // amivel a lista elemeit kigenerálja nekünk. Emellett szükség van
            // az elemszámra is.
            child: ListView.builder(
              itemCount: PIZZAS.length,
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),
    );
  }
}
