import 'package:flutter/material.dart';

class VCartCards extends StatefulWidget {
  @override
  _VCartCardsState createState() => _VCartCardsState();
}

class _VCartCardsState extends State<VCartCards> {
  final items = List<String>.generate(100, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Carrinho Virtual'),
        ),
        body: Scrollbar(
          child: ListView(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              children: [
                for (final destination in items)
                  Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: TappableTravelDestinationItem(destination: destination)
                  )
              ]
          ),
        ));
  }


}


class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  final String destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: destination),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {
                    print('Card was tapped');
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                  Theme
                      .of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .subtitle1),
      ),
    );
  }
}
