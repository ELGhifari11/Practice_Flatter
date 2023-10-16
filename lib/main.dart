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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

// Splash Screen

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

// Splash Navigator animation

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => ScreenOptions(),
              transitionDuration: Duration(milliseconds: 150),
              transitionsBuilder: (context, animation1, animation2, child) {
                return ScaleTransition(
                  scale: animation1,
                  child: child,
                );
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 33, 33),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'),
                opacity: 0.1,
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Image(
              image: AssetImage(
                'images/panther.png',
              ),
              height: 300,
            ),
          ),
          if (defaultTargetPlatform == TargetPlatform.android)
            const CupertinoActivityIndicator(
              color: Color.fromARGB(255, 255, 255, 255),
              radius: 20,
              animating: true,
            )
          else
            const CircularProgressIndicator(
              color: Colors.amber,
            )
        ]),
      ),
    );
  }
}

//  HOME Screen

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

//  Chat Items widget

class ChatItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  ChatItems(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      title: Text(title),
      titleTextStyle: TextStyle(
        color: const Color.fromARGB(255, 7, 5, 0),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      dense: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: const Text('10:00 PM'),
      tileColor: Colors.white10,
    );
  }
}

//  Screen options

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
                  image: AssetImage('images/bg.png'),
                  opacity: 0.1,
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                  child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      'images/panther.png',
                    ),
                    height: 200,
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

// Tombol Login

class Tombol extends StatelessWidget {
  const Tombol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                // Masukkan fungsi untuk login di sini
              },
              child: Text(
                'Scan ID',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),

          SizedBox(height: 20), // Memberikan jarak antar tombol
          Container(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                // Masukkan fungsi untuk login di sini
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Memberikan jarak antar tombol
          Container(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                // Masukkan fungsi untuk login di sini
              },
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
