import 'package:faker/faker.dart';
import 'package:flatter_project/colors/colors.dart';
import 'package:flatter_project/app/controllers/authControllers.dart';
import 'package:flutter/material.dart';
import 'package:flatter_project/widget/CustomIconButton.dart';
import 'package:flatter_project/widget/textField.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authC = Get.find<AuthController>();

  TextEditingController _searchTextController = TextEditingController();

  var faker = Faker();
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            authC.logout();
          }),
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white.withOpacity(0.0),
            floating: true,
            snap: true,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.height / 4.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage('lib/images/bgg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          150, MediaQuery.of(context).size.height / 20, 0, 0),
                      child: Image(
                        image: AssetImage('lib/images/app-logo.png'),
                        height: 70,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height / 100, 150, 0),
                      child: Text(
                        'Selamat datang {User}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 65,
                      padding: EdgeInsets.fromLTRB(
                          10, MediaQuery.of(context).size.height / 50, 10, 0),
                      child: CustomTextField(
                        text: 'Search',
                        icon: Icons.search,
                        isPasswordType: false,
                        controller: _searchTextController,
                        borderColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 900,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var item in [
                      {'image': 'lib/images/chat.png', 'label': 'Chat admin'},
                      {'image': 'lib/images/date.png', 'label': 'Agenda'},
                      {'image': 'lib/images/box.png', 'label': 'Produk'},
                      {'image': 'lib/images/sos.png', 'label': 'SOS'},
                      {'image': 'lib/images/profile.png', 'label': 'Profile'}
                    ])
                      Column(
                        children: [
                          CustomIconButton(image: item['image']!),
                          SizedBox(height: 5),
                          Text(
                            item['label']!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
