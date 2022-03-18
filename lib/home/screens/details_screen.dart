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
              color: Colors.black,
              borderRadius: BorderRadius.circular(50)
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded, color: secondaryColor, size: 20),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      color: primaryColor,
                  height: Utils.screenHeightSize(context) * 0.2),
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(88)))),
                Center(child: CircleImageWidget(image: widget.fruitModel.image, size: Utils.screenHeightSize(context) * 0.3,))
              ],
            ),
          ),
          SizedBox(
            height: Utils.screenHeightSize(context) * 0.5,
            child: Stack(
              children: [
                Container(color: secondaryColor),
                Container(
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(88)))),
                DetailsWidget(fruitModel: widget.fruitModel)
              ],
            ),
          ),
        ],
      )
    );
  }
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height/8);
    path.cubicTo(size.width/4, 3*(size.height/3), 3*(size.width/4), size.height/8, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
