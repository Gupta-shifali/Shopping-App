import 'package:flutter/material.dart';
import 'package:shopping_app/ItemDetails.dart';

class ShoppingUiItem extends StatelessWidget {
  final List data;
  final int index;

  ShoppingUiItem(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Item(data, index);
  }
}

class Item extends StatefulWidget {
  final List data;
  final int index;

  Item(this.data, this.index);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          debugPrint("Opening Item details..");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ItemDetails(widget.data, widget.index)));
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildCardImage(),
              _buildCardText(
                  widget.data[widget.index]['title'], Colors.black, 14),
              _buildCardText(
                  widget.data[widget.index]['price'], Color(0xffB2A8DF), 13),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCardText(String text, Color textColor, double textSize) =>
      Container(
          padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold),
          ));

  Container _buildCardImage() => Container(
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.data[widget.index]['image'])),
        ),
      );
}
