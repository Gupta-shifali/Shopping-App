import 'package:flutter/material.dart';
import 'package:shopping_app/NavigationBar.dart';

class ItemDetails extends StatelessWidget {
  final List data;
  final int index;

  ItemDetails(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return ItemDetailsUi(data, index);
  }
}

class ItemDetailsUi extends StatefulWidget {
  final List data;
  final int index;

  ItemDetailsUi(this.data, this.index);

  @override
  _ItemDetailsUiState createState() => _ItemDetailsUiState();
}

class _ItemDetailsUiState extends State<ItemDetailsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildItemImage(context),
            _buildTextWidget(
                'category', Color(0xff7260CB), 15, FontWeight.bold),
            _buildItemHeader(),
            _buildTextWidget('price', Color(0xff6250C1), 25, FontWeight.bold),
            _buildColorOptions(),
            _buildButtons()
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }

  Row _buildButtons() {
//    var colors = widget.data[widget.index]['colors'];
////    for(Color color: colors){
//
//    }
    return Row(
//      children: <Widget>[
////        Container(
////          color: Color,
////        )
//      ],
        );
  }

  Row _buildColorOptions() {
    return Row(
      children: <Widget>[],
    );
  }

  Row _buildItemHeader() {
    return Row(
      children: <Widget>[
        _buildTextWidget('description', Colors.black, 30, FontWeight.bold),
        Icon(Icons.favorite),
      ],
    );
  }

  Container _buildItemImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.data[widget.index]['image'])),
      ),
    );
  }

  Container _buildTextWidget(
      String text, Color color, double size, FontWeight weight) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 4.0),
      alignment: Alignment.centerLeft,
      child: Text(
        widget.data[widget.index][text],
        style: TextStyle(color: color, fontSize: size, fontWeight: weight),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
