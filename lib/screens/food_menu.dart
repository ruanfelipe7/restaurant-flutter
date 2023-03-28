import 'package:flutter/material.dart';
import 'package:restaurant/cardapio.dart';
import 'package:restaurant/components/food_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => FoodItem(
                imageURI: items[index]['image'],
                itemTitle: items[index]['name'],
                itemPrice: items[index]['price'],
              ),
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
