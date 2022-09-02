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


  Offset offset = Offset.zero;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
              child: Image.asset(
                'assets/image.webp',
                width: MediaQuery.of(context).size.width,
              ),
              onLongPress: () => showMessage('Long Press', context),

              onPanUpdate: (details){
                setState((){
                  offset = Offset(offset.dx +  details.delta.dx,
                      offset.dy + details.delta.dy);
                });
              },

              // onDoubleTapDown: handleDoubleTapDown,
              // onDoubleTap: handleDoubleTap,

            ),
          )
        ],
      ),
    );
  }
}
