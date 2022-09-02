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

  final transController = TransformationController();
   late TapDownDetails doubleTapDetails;

  handleDoubleTapDown(TapDownDetails details){
    doubleTapDetails = details;
  }

  handleDoubleTap(){
    if(transController.value != Matrix4.identity()){
      transController.value = Matrix4.identity();
    }else{
      final position = doubleTapDetails.localPosition;
      transController.value = Matrix4.identity()
      ..translate(-position.dx, -position.dy)
      ..scale(2.0);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Flutter Gesture Detector'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
              child: InteractiveViewer(
                transformationController: transController,
                child: Image.asset(
                  'assets/image.webp',
                  width: MediaQuery.of(context).size.width,
                ),
              ),

             /* For Long press code*/
              // onLongPress: () => showMessage('Long Press', context),


              /* For Image Drag code*/
              // onPanUpdate: (details){
              //   setState((){
              //     offset = Offset(offset.dx +  details.delta.dx,
              //         offset.dy + details.delta.dy);
              //   });
              // },


              /* For Image Zoom code*/
              onDoubleTapDown: handleDoubleTapDown,
              onDoubleTap: handleDoubleTap,

            ),
          )
        ],
      ),
    );
  }
}
