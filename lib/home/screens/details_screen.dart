import 'package:flutter/material.dart';
import 'package:fruitsapp/home/models/fruit_model.dart';
import 'package:fruitsapp/home/widgets/circle_image_widget.dart';
import 'package:fruitsapp/home/widgets/details_widget.dart';
import 'package:fruitsapp/utils/utils.dart';

import '../../utils/constants.dart';

class DetailsScreen extends StatefulWidget {
  final FruitModel fruitModel;
  const DetailsScreen({Key? key, required this.fruitModel}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          shadowColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded,
                    color: secondaryColor, size: 20),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Utils.screenHeightSize(context) * 0.1),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: Utils.screenWidthSize(context) * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor, width: 0),
                      color: secondaryColor,
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: Utils.screenWidthSize(context) * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor, width: 0),
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              // border: Border.all(color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(150)))),
                      Center(
                          child: CircleImageWidget(
                            image: widget.fruitModel.image,
                            size: Utils.screenHeightSize(context) * 0.3,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: Utils.screenHeightSize(context) * 0.5,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              // border: Border.all(color: Colors.black, width: 0),
                              borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(150)))),
                      DetailsWidget(fruitModel: widget.fruitModel)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

    );
  }
}

