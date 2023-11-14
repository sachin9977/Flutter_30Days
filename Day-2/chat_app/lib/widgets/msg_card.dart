import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/api/apis.dart';
import 'package:chat_app/helper/my_date_util.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class msgCard extends StatefulWidget {
  final Message message;
  const msgCard({super.key, required this.message});

  @override
  State<msgCard> createState() => _msgCardState();
}

class _msgCardState extends State<msgCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.fromId
        ? _greenMessage()
        : _blueMessage();
  }

// Sender or another user
  Widget _blueMessage() {
    //  update last read message if sender and receiver are different.

    if (widget.message.read.isEmpty) {
      APIs.updateMessageReadStatus(widget.message);
      print("Message read updated");
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            padding: EdgeInsets.all(widget.message.type == Type.image
                ? mq.width * .03
                : mq.width * .05),
            child: widget.message.type == Type.text
                ? Text(
                    widget.message.msg,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      // width: mq.height * .05,
                      // height: mq.height * .05,
                      imageUrl: widget.message.msg,
                      placeholder: (context, url) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(strokeAlign: 2,),
                          ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        child: Icon(
                          Icons.image,
                          size: 70,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        // Sent Time
        Padding(
          padding: EdgeInsets.only(right: mq.width * .04),
          child: Text(
            MyDateUtil.getFormatedTime(
                context: context, time: widget.message.sent),
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
      ],
    );
  }

// our or user message
  Widget _greenMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: mq.width * .04,
            ),
            if (widget.message.read.isNotEmpty)
              Icon(
                Icons.done_all_rounded,
                color: Colors.blue,
                size: 20,
              ),
            SizedBox(
              width: mq.width * .02,
            ),
            Text(
              MyDateUtil.getFormatedTime(
                  context: context, time: widget.message.sent),
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            padding: EdgeInsets.all(widget.message.type == Type.image
                ? mq.width * .03
                : mq.width * .05),
            child: widget.message.type == Type.text
                ? Text(
                    widget.message.msg,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      // width: mq.height * .05,
                      // height: mq.height * .05,
                      imageUrl: widget.message.msg,
                      placeholder: (context, url) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(strokeWidth: 2,),
                          ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        child: Icon(
                          Icons.image,
                          size: 70,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
