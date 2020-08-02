import 'package:chat_app/themes/appColors.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  String name;
  ImageProvider image;

  ChatAppBar({@required this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [AppColors.lightViolet, AppColors.lightMagenta],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 36,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: image,
                ),
              ),
              SizedBox(width: 20),
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
