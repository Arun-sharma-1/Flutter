// import 'package:flutter/material.dart';
//
// class CustomSlideUpPanel extends StatefulWidget {
//
//
//   @override
//   State<CustomSlideUpPanel> createState() => _CustomSlideUpPanelState();
// }
//
// class _CustomSlideUpPanelState extends State<CustomSlideUpPanel> {
//   final _panelController = PanelController();
//
//   void tooglePanel() => _panelController.isPanelOpen
//       ? _panelController.close
//       : _panelController.open();
//   void closePanel() {
//     setState(() {
//       _panelController.isPanelOpen
//           ? _panelController.close()
//           : _panelController.close();
//     });
//   }
//
//   var firstNum;
//   var secondNum;
//   var operation;
//   var res;
//   var textTodisplay;
//
//   void btnOnClick(String btnValue) {
//     if (btnValue == 'C') {
//       res = '';
//       firstNum = 0;
//       secondNum = 0;
//       textTodisplay = '';
//     } else if (btnValue == 'AC') {
//       textTodisplay = '';
//     } else if (btnValue == '+' ||
//         btnValue == '-' ||
//         btnValue == 'x' ||
//         btnValue == '÷') {
//       firstNum = int.parse(textTodisplay);
//       res = '';
//       operation = btnValue;
//     } else if (btnValue == '=') {
//       secondNum = int.parse(textTodisplay);
//       if (operation == '+') {
//         res = (firstNum + secondNum).toString();
//       }
//       if (operation == '-') {
//         res = (firstNum - secondNum).toString();
//       }
//       if (operation == 'x') {
//         res = (firstNum * secondNum).toString();
//       }
//       if (operation == '÷') {
//         res = (firstNum / secondNum).toString();
//       }
//       else
//         {
//           res = int.parse(textTodisplay).toString();
//         }
//
//       setState( (){
//         textTodisplay = res;
//         // widget.result = res;
//       } );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SlidingUpPanel(
//         // controller: _panelController,
//         maxHeight: MediaQuery.of(context).size.height * 0.49,
//         minHeight: MediaQuery.of(context).size.height * 0.025,
//         panel: Container(
//           color: Colors.black,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: tooglePanel,
//                 child: Container(
//                   color: Colors.white,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 10,
//                         width: 40,
//                         margin: const EdgeInsets.all(7),
//                         decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   CustomButton(
//                     title: 'AC',
//                     onTap: btnOnClick,
//                     size: 20,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: 'C', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '<', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '-', onTap: btnOnClick),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   CustomButton(title: '7', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '8', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '9', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '÷', onTap: btnOnClick)
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   CustomButton(title: '4', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '5', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '6', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: 'x', onTap: btnOnClick)
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   CustomButton(title: '1', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '2', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '3', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '.', onTap: btnOnClick),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   CustomButton(title: '+/-', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(title: '0', onTap: btnOnClick),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(
//                     title: '00',
//                     onTap: btnOnClick,
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   CustomButton(
//                     title: '=',
//                     onTap: btnOnClick,
//                     backcolor: Colors.green,
//                     fontcolor: Colors.red,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   final String title;
//   final Function onTap;
//   Color fontcolor;
//   double size;
//   Color backcolor;
//   CustomButton(
//       {required this.title,
//       required this.onTap,
//       this.size = 25,
//       this.fontcolor = Colors.black,
//       this.backcolor = Colors.white});
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => onTap(title),
//         child: CircleAvatar(
//           radius: 32,
//           backgroundColor: Color.fromRGBO(82, 80, 75, 100),
//           child: Container(
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: size,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/*
Widget CustomXButton(String text , VoidCallback onTap) {
    return Expanded(
    flex: 1,
    child: Material(
      elevation: 1,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: backcolor == Colors.black
              ? Colors.white.withOpacity(0.1)
              : backcolor,
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: fontcolor,
              ),
            )),
      ),
    ),
  );
}
 */
