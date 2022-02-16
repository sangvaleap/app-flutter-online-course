
import 'package:flutter/material.dart';
import 'package:online_course/theme/color.dart';
import 'chat_notify.dart';
import 'custom_image.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(this.chatData, { Key? key, this.onTap, this.isNotified = true, this.profileSize = 50}) : super(key: key);
  final chatData;
  final bool isNotified;
  final GestureTapCallback? onTap;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  chatData['image'], 
                  width: profileSize, height: profileSize,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: 
                  Container(
                    child:
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(chatData['name'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                                )
                              ),
                              SizedBox(width: 5),
                              Container(
                                child: Text(chatData['date'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: Colors.grey))
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Expanded(child: Text(chatData['last_text'], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13))),
                              if(isNotified)
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: ChatNotify(number: chatData['notify'], boxSize: 17, color: red,),
                                )
                            ],
                          ),
                        ],
                      )
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
