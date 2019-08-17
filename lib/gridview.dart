
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountyGridView extends StatelessWidget {
  final List<Country> country;

  CountyGridView({Key key, this.country}) : super(key: key);

  Card getStructuredGridCell(Country country) {
    return
      new Card(
        elevation: 2,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,

          children: <Widget>[
            new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            new Center(
              child: SvgPicture.network(
                country.flag.replaceAll('https', 'http'),
                height: 30.0,
                width: 30.0,
                placeholderBuilder: (BuildContext context) => new Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const CircularProgressIndicator()),
              ),
            ),

            new Center(

              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(country.name),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      padding: EdgeInsets.all(25),
      crossAxisCount: 2,
      childAspectRatio: 1.20,  //card side hight weight ratio
      mainAxisSpacing: 32.0,  //space from two card
      crossAxisSpacing: 32.0, // space from two card
      children: List.generate(country.length, (index) {
        return getStructuredGridCell(country[index]);
      }),
    );
  }
}