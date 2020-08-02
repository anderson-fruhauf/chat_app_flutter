import 'package:chat_app/constants/app_contants.dart';
import 'package:chat_app/models/messege.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  List<Message> list;

  ConversationList({@required this.list});

  @override
  Widget build(BuildContext context) {
    Widget _baseMessage(Message msg) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            color: Color(0xffF5F3F7),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: -5,
                  color: Color(0xffaeaadc),
                  offset: Offset(1.5, 1.5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            msg.text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    Widget _leftMessage(Message msg) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _baseMessage(msg),
          ],
        ),
      );
    }

    Widget _rigthMessage(Message msg) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _baseMessage(msg),
          ],
        ),
      );
    }

    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          semanticChildCount: list.length,
          reverse: true,
          children: [
            ...list.reversed.map((e) => e.originId == AppConstants.user.id
                ? _rigthMessage(e)
                : _leftMessage(e)),
          ],
        ),
      ),
    );
  }
}
