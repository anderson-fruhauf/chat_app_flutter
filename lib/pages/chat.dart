import 'package:chat_app/models/messege.dart';
import 'package:chat_app/themes/appColors.dart';
import 'package:chat_app/widgets/chat_app_bar.dart';
import 'package:chat_app/widgets/chat_botton_seed.dart';
import 'package:chat_app/widgets/conversation_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> list = new List<Message>();

  @override
  void initState() {
    this.list = [
      Message(text: "teste 1", destiniId: 1, originId: 2),
      Message(text: "teste 2", destiniId: 1, originId: 2),
      Message(text: "teste 3", destiniId: 2, originId: 1),
      Message(text: "teste 4", destiniId: 2, originId: 1),
      Message(text: "teste 5", destiniId: 2, originId: 1),
      Message(text: "teste 6", destiniId: 1, originId: 2),
      Message(text: "teste 7", destiniId: 2, originId: 1),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroud,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChatAppBar(
              name: "Oscar",
              image: AssetImage('lib/images/avatar.jpg'),
            ),
            ConversationList(list: list),
            BottonSeedBar(
              onSend: onSend,
            ),
          ],
        ),
      ),
    );
  }

  onSend(String msg) {
    setState(() {
      this.list.add(Message(destiniId: 2, originId: 1, text: msg));
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.list.add(Message(
            destiniId: 1, originId: 2, text: 'Resposta automatica rsrsrsrs'));
      });
    });
  }
}
