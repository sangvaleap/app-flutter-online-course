
import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
import 'package:online_course/widgets/custom_image.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({ Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(data["image"],
                radius: 15,
                height: 80,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"], maxLines: 1, overflow: TextOverflow.ellipsis, 
                    style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5,),
                  Text(data["price"], style: TextStyle(fontSize: 14, color: textColor),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.schedule_rounded, color: labelColor, size: 14,), 
                      SizedBox(width: 2,),
                      Text(data["duration"], style: TextStyle(fontSize: 12, color: labelColor),),
                      SizedBox(width: 20,),
                      Icon(Icons.star, color: orange, size: 14,), 
                      SizedBox(width: 2,),
                      Text(data["review"], style: TextStyle(fontSize: 12, color: labelColor),)
                    ],
                  )
                ],
              )
            ],
          )
        ),
    );
  }
}