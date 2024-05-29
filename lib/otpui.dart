import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTpUi extends StatelessWidget {


  List<TextEditingController> controllers = [];

  List<FocusNode> focusNodes = [];

  String targetOTP = "1234";

  @override
  Widget build(BuildContext context) {
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    4,
                    (index) => Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle),
                        child: TextFormField(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counter: Offstage(),
                            border: InputBorder.none
                          ),
                          onChanged: (a) {
                            if(a.length!=4) {
                              FocusScope.of(context).requestFocus(focusNodes[index+1]);
                            }
                          },
                        )))),
          ),
        ],
      ),
    );
  }
}
