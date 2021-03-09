import 'package:chat/constants.dart';
import 'package:chat/models/ChatMessage.dart';
import 'package:chat/screens/messages/components/audio_message.dart';
import 'package:chat/screens/messages/components/text_message.dart';
import 'package:chat/screens/messages/components/video_message.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
          break;
        case ChatMessageType.audio:
          return AudioMessage(message: message);
          break;
        case ChatMessageType.video:
          return VideoMessage();
          break;
        default:
          return SizedBox();
          break;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(
              width: kDefaultPadding / 2,
            ),
          ],
          messageContaint(message),
          if (message.isSender) ...[
            MessageStatudDot(status: message.messageStatus),
          ],
        ],
      ),
    );
  }
}

class MessageStatudDot extends StatelessWidget {
  final MessageStatus status;

  const MessageStatudDot({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.1);
          break;
        case MessageStatus.viewed:
          return kPrimaryColor;
          break;
        default:
          return Colors.transparent;
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: kDefaultPadding / 2),
      child: Container(
        height: 12.0,
        width: 12.0,
        decoration: BoxDecoration(
          color: dotColor(status),
          shape: BoxShape.circle,
        ),
        child: Icon(
          status == MessageStatus.not_sent ? Icons.close : Icons.done,
          size: 8.0,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
