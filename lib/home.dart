import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHome extends StatefulWidget {
  const MyHome({
    super.key,
  });

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var temp1 = 0;
  var temp2 = 0;
  var temp3 = 0;
  String texttoShow = '-';

  void ChangeText() {
    texttoShow = 'glorry$temp1$temp2$temp3@gmail.com';
    setState(() {
      temp1 = Random().nextInt(9);
      temp2 = Random().nextInt(9);
      temp3 = Random().nextInt(9);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: const Text(
          'Mail Generator',
          style: TextStyle(
            fontFamily: 'PyidaungSu',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: width,
            height: width / 3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/email.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Mail Generator',
                    style: TextStyle(
                        fontFamily: 'PyidaungSu',
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            width: width,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Your Mail Result is',
                    style: TextStyle(
                      fontFamily: 'PyidaungSu',
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    thickness: 2,
                    height: 10,
                    color: Colors.blue,
                    endIndent: 0,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: texttoShow));
                          setState(() {
                            texttoShow = 'copied';
                          });
                        },
                        child: Text(
                          texttoShow,
                          style: const TextStyle(
                            fontFamily: 'PyidaungSu',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ChangeText();
            },
            child: Container(
              alignment: Alignment.center,
              width: width / 2,
              height: 60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                shape: BoxShape.rectangle,
              ),
              child: const Text(
                'Generate',
                style: TextStyle(
                  fontFamily: 'PyidaungSu',
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
