import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/theme/color.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.selectedColor = AppColor.actionColor,
  }) : super(key: key);

  final data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.red : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1), // changes position of shadow
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              data["icon"],
              color: isSelected ? selectedColor : AppColor.textColor,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
