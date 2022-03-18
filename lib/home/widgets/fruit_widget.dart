import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/home/models/fruit_model.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';

class FruitWidget extends StatelessWidget {
  final double height;
  final double width;
  final FruitModel fruitModel;
  final Function onTap;
  const FruitWidget(
      {Key? key,
      this.height = 50,
      required this.width,
      required this.fruitModel,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: const Border.fromBorderSide(
                BorderSide(width: 1.5, color: Colors.grey)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.35),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 5)),
            ],
            color: Colors.black),
        child: ElevatedButton(
          onPressed: () => onTap(),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, padding: EdgeInsets.zero),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: height,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: fruitModel.image,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              // const Spacer(
              //   flex: 1,
              // ),
              Expanded(
                flex: 14,
                child: SizedBox(
                  height: height,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      child: Center(
                        child: Text(
                          fruitModel.name,
                          style: Utils.setTextStyle(
                              color: secondaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
