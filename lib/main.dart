// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// // ignore: must_be_immutable
// class MyApp extends StatelessWidget {
//   List<Widget> myNumber = List.generate(
//       10,
//       (index) => Text(
//             index.toString(),
//           ));
//   List<Color> myColor = [
//     Colors.redAccent,
//     Colors.amberAccent,
//     Colors.greenAccent,
//     Colors.blueAccent
//   ];

//   List<Widget> myList = [
//     Container(
//       width: 300,
//       height: 300,
//       color: Colors.amberAccent,
//     ),
//     Container(width: 250, height: 250, color: Colors.amber),
//     Container(width: 200, height: 200, color: Colors.blue),
//     Container(width: 150, height: 150, color: Colors.blueAccent),
//     Container(width: 250, height: 250, color: Colors.amber),
//     Container(width: 200, height: 200, color: Colors.blue),
//     Container(width: 150, height: 150, color: Colors.blueAccent),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.amber,
//             title: const Center(
//               child: Text('My Apps'),
//             ),
//           ),
//           body: ListView.separated(
//               separatorBuilder: (context, index) {
//                 return const Divider(
//                   color: Colors.black38,
//                   height: 15,
//                 );
//               },
//               itemCount: myColor.length,
//               itemBuilder: (context, index) {
//                 return Container(width: 0, height: 300, color: myColor[index]);
//               }),
//         ));
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:faker/faker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   var faker = Faker();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       debugShowCheckedModeBanner: false,

//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           centerTitle: true,
//           title: const Text(
//             'My EL app',
//           ),
//         ),
//         body: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return ChatItems(
//               imageUrl: 'https://picsum.photos/id/${index + 10}/200/300',
//               title: faker.person.name(),
//               subtitle: faker.lorem.sentence(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ChatItems extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String subtitle;

//   ChatItems(
//       {super.key,
//       required this.imageUrl,
//       required this.title,
//       required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//       title: Text(title),
//       subtitle: Text(
//         subtitle,
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//       ),
//       dense: true,
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage(imageUrl),
//       ),
//       trailing: const Text('10:00 PM'),
//       tileColor: Colors.white10,
//     );
//   }
// }

// ////////////////////////   Stateful Counter Increment  ///////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int counter = 10;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.redAccent,
//           title: const Text('Dyanamic Apps'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               counter.toString(),
//               style: TextStyle(fontSize: 50 + double.parse(counter.toString())),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       if (counter != 1) {
//                         setState(() {
//                           counter--;
//                         });
//                       }
//                       print(counter);
//                     },
//                     child: Icon(Icons.remove)),
//                 ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         counter++;
//                       });

//                       print(counter);
//                     },
//                     child: Icon(Icons.add)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// ////////////////////////  SPLASH SCREEN   ///////////////////////////////////////////////////////////////

import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColors.primaryColor, // warna untuk header
          onPrimary: Colors.white, // warna teks di header
          surface: Colors.purple, // background dialog
          onSurface: Colors.black, // warna untuk teks dan icon
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary:
                  AppColors.primaryColor), // Warna untuk tombol OK dan CANCEL
        ),
      ),
      home: Splash(),
    );
  }
}
