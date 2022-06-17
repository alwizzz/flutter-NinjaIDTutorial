import 'package:flutter/material.dart';
import 'Quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote? quote;
  final Function()? deleteFunction;

  QuoteCard({this.quote, this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "\"${quote?.content}\"",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 15),
            Text(
              "${quote?.author}",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            TextButton.icon(
              onPressed: deleteFunction,
              label: Text('delete'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
