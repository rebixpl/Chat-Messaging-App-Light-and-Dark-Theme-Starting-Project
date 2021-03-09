import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:flutter/material.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage message;

  const AudioMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: kPrimaryColor.withOpacity(
          message.isSender ? 1 : 0.1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : kPrimaryColor,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 2.0,
                  color: message.isSender
                      ? Colors.white
                      : kPrimaryColor.withOpacity(0.4),
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: kDefaultPadding / 2),
          Text(
            "0.37",
            style: TextStyle(
              fontSize: 12.0,
              color: message.isSender ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
