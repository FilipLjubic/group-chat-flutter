import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final DateTime timestamp;
  final bool isMe;

  MessageBubble({this.sender, this.text, this.isMe, timestamp})
      : this.timestamp = DateTime.parse(timestamp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              TimeWidget(isMe: isMe, timestamp: timestamp),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.only(
                  topLeft: isMe ? Radius.circular(30.0) : Radius.zero,
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: isMe ? Radius.zero : Radius.circular(30.0),
                ),
                color: isMe ? Colors.lightBlueAccent : Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "$text",
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black54,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ),
              TimeWidget(isMe: !isMe, timestamp: timestamp),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key key,
    @required this.isMe,
    @required this.timestamp,
  }) : super(key: key);

  final bool isMe;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isMe ? true : false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Text(
          "${timestamp.hour}:${timestamp.minute}",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
