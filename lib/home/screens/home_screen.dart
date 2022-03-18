import 'package:flutter/material.dart';
import 'package:fruitsapp/home/models/fruit_model.dart';
import 'package:fruitsapp/home/widgets/fruit_widget.dart';
import 'package:fruitsapp/services/db_service.dart';
import 'package:fruitsapp/utils/app_logger.dart';
import 'package:fruitsapp/utils/utils.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constants.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FruitModel> fruits = [];

  bool isEmptyList = false;
  @override
  void initState() {
    fetchFruits();
    super.initState();
  }

  /// Fetch fruits
  fetchFruits() async {
    var listData = await DBService.getAllFruits();
    setState(() {
      fruits = listData;
      if (fruits.isEmpty) {
        isEmptyList = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          toolbarHeight: 100,
          centerTitle: true,
          title: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "images/ono_apps_icon.png",
                height: 100,
                width: 100,
              )),
        ),
        body: SingleChildScrollView(
          child: !isEmptyList
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Utils.screenWidthSize(context) * 0.05,
                          vertical: Utils.screenHeightSize(context) * 0.1),
                      child: ListView.builder(
                        itemCount: fruits.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FruitWidget(
                            height: 80,
                            width: Utils.screenWidthSize(context) * 0.7,
                            fruitModel: fruits[index],
                            onTap: () async {
                              AppLogger.log(
                                  "clicked on fruit name: ${fruits[index].name}");
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: DetailsScreen(
                                        fruitModel: fruits[index],
                                      )));
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text("There aren't any fruits to display...",
                      style: Utils.setTextStyle(
                          color: secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center)),
        ));
  }
}
