import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/theme/color.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.title,
    this.onTap,
    this.leadingIcon,
    this.leadingIconColor = Colors.white,
    this.bgIconColor = AppColor.primary,
  }) : super(key: key);

  final String? leadingIcon;
  final Color leadingIconColor;
  final Color bgIconColor;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: leadingIcon != null ? _buildItemWithPrefixIcon() : _buildItem(),
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(color: bgIconColor, shape: BoxShape.circle),
      child: SvgPicture.asset(
        leadingIcon!,
        color: leadingIconColor,
        width: 22,
        height: 22,
      ),
    );
  }

  Widget _buildItemWithPrefixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrefixIcon(),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 17,
        )
      ],
    );
  }

  Widget _buildItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColor.darker,
          size: 17,
        )
      ],
    );
  }
}
