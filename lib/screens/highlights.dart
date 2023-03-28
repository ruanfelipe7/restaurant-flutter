import 'package:flutter/material.dart';
import 'package:restaurant/cardapio.dart';
import 'package:restaurant/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    bool isOrientationLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Destaques do Dia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
              ),
            ),
          ),
          isOrientationLandscape
              ? const _LandscapeList()
              : const _PortraitList(),
        ],
      ),
    );
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        ),
        childCount: items.length,
      ),
    );
  }
}

class _LandscapeList extends StatelessWidget {
  const _LandscapeList({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => HighlightItem(
          imageURI: items[index]['image'],
          itemTitle: items[index]['name'],
          itemPrice: items[index]['price'],
          itemDescription: items[index]['description'],
        ),
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
    );
  }
}
