import 'package:flatter_project/widget/buttons.dart';
import 'package:flutter/material.dart';

class ScreenOptions extends StatelessWidget {
  const ScreenOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 33, 33),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/images/bgg.png'), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.fromLTRB(
                55, MediaQuery.of(context).size.height * 0.2, 40, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                  child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      'lib/images/car.png',
                    ),
                    height: 300,
                  ),
                  Container(
                    child: Tombol(),
                  ),
                ],
              )),
            ]),
          )),
    );
  }
}
