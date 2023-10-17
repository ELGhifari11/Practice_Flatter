import 'package:faker/faker.dart';
import 'package:flatter_project/widget/listTile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  var faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 33, 33),
        title: Text('Panther Mania'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: 'DancingScript'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ChatItems(
            imageUrl: 'https://picsum.photos/id/${index + 10}/200/300',
            title: faker.person.name(),
            subtitle: faker.lorem.sentence(),
          );
        },
      ),
    );
  }
}
