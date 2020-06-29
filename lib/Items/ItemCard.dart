import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class ItemCard extends StatelessWidget {
  final String url;
  final String name;
  final String price;
  const ItemCard({
    Key key,
    this.url,
    this.price,
    this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(20),
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
            image: NetworkImage(url),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BorderedText(
                        strokeWidth: 1,
                        strokeColor: Colors.black,
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 130,),
                      BorderedText(
                        strokeWidth: 1,
                        strokeColor: Colors.black,
                        child: Text(
                          '$price\$',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}