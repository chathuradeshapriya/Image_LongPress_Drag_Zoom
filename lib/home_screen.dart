import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showMessage(String message, BuildContext context) {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(300, 300, 300, 300),
        items: <PopupMenuEntry>[
          PopupMenuItem(
              child: Text(
                message,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ]);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Flutter Gesture Detector'),
        centerTitle: true,
      ),
      body: GestureDetector(
        child: Image.asset(
          'assets/image.webp',
          width: MediaQuery.of(context).size.width,
        ),
        onLongPress: () => showMessage('Long Press', context),

        // onDoubleTapDown: handleDoubleTapDown,
        // onDoubleTap: handleDoubleTap,

      ),
    );
  }
}
