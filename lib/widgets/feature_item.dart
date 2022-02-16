import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';

import 'custom_image.dart';

class FeatureItem extends StatelessWidget {
  FeatureItem({ Key? key, required this.data, this.width = 280, this.height = 290, this.onTap}) : super(key: key);
  final data;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              CustomImage(data["image"],
                width: double.infinity, height: 190,
                radius: 15,
              ),
              Positioned(
                top: 170, right: 15,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Text(data["price"], 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                child: Container(
                  width: width - 20,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, 
                        style: TextStyle(fontSize: 17, color: textColor, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getAttribute(Icons.play_circle_outlined, labelColor, data["session"]),
                          SizedBox(width: 12,),
                          getAttribute(Icons.schedule_rounded, labelColor, data["duration"]),
                          SizedBox(width: 12,),
                          getAttribute(Icons.star, yellow, data["review"]),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  getAttribute(IconData icon, Color color, String info){
    return
      Row(
        children: [
          Icon(icon, size: 18, color: color,),
          SizedBox(width: 3,),
          Text(info, maxLines: 1, overflow: TextOverflow.ellipsis, 
            style: TextStyle(color: labelColor, fontSize: 13),
          ),
        ],
      );
  }

}