// cards

import 'package:flutter/material.dart';
import 'Quote.dart';
import 'QuoteCard.dart';

void main() {
  runApp(const MaterialApp(
    home: Quotes(),
  ));
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<Quote> quoteList = [
    Quote(
      content:
          'All our dreams can come true, if we have the courage to pursue them.',
      author: 'Walt Disney',
    ),
    Quote(
      content: 'The secret of getting ahead is getting started.',
      author: 'Mark Twain',
    ),
    Quote(
      content: 'I’ve missed more than 9,000 shots in my career. ' +
          'I’ve lost almost 300 games, 26 times I’ve been trusted ' +
          'to take the game winning shot and missed. I’ve failed over ' +
          'and over and over again in my life and that is why I succeed.',
      author: 'Michael Jordan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: quoteList
              .map((item) => QuoteCard(
                    quote: item,
                    deleteFunction: () {
                      setState(() {
                        quoteList.remove(item);
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
