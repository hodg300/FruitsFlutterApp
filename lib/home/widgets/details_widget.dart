import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/home/models/fruit_model.dart';
import 'package:fruitsapp/utils/utils.dart';

import '../../utils/constants.dart';

class DetailsWidget extends StatelessWidget {
  final FruitModel fruitModel;
  const DetailsWidget({Key? key, required this.fruitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utils.screenWidthSize(context) * 0.15, vertical: Utils.screenHeightSize(context) * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(fruitModel.name, style: Utils.setTextStyle(color: secondaryColor, fontSize: 35, fontWeight: FontWeight.bold),),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(fruitModel.description, style: Utils.setTextStyle(color: secondaryColor, fontSize: 22, fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 50,
          ),
          Text("Price: ${fruitModel.price.toString()}${Utils.currency(context)}", style: Utils.setTextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.normal),),
        ],
      ),
    );
  }
}
