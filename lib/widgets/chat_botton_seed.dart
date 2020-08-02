import 'package:chat_app/themes/appColors.dart';
import 'package:flutter/material.dart';

class BottonSeedBar extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  Function onSend;

  BottonSeedBar({@required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Color(0xffbbbbbb), offset: Offset(2, 2), blurRadius: 25)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Escreva sua mensagen',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lightViolet,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: () {
                    onSend(_controller.text);
                    _controller.clear();
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
