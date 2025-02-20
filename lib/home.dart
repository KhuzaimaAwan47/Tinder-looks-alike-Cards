import 'package:flutter/material.dart';
import 'package:scrumlab_flutter_tindercard/scrumlab_flutter_tindercard.dart';

import 'bar_chart.dart';


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<Home>{

  List<String> images =[
    'assets/image_1.png',
    'assets/image_2.png',
    'assets/image_3.png',
    'assets/image_4.png',
    'assets/image_5.png',
    'assets/image_6.png',
  ];

  @override
  Widget build(BuildContext context) {

    Image.asset('assets/image_1.png');
    CardController controller;
   return Scaffold(
     appBar: AppBar(
       actions: [
         IconButton(onPressed: ()
         {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const BarChart()));
         }, icon: Icon(Icons.bar_chart))
       ],
       automaticallyImplyLeading: false,
       title: const Text('Tinder Like Cards'),
     ),
     body: Center(
       child: AspectRatio(
         aspectRatio: 9 / 16,  // Maintain 9:16 aspect ratio
         child: TinderSwapCard(
           swipeUp: true,
           swipeDown: true,
           orientation: AmassOrientation.bottom,
           totalNum: images.length,
           stackNum: 3,
           swipeEdge: 4.0,
           maxWidth: MediaQuery.of(context).size.width * 0.9,
           maxHeight: MediaQuery.of(context).size.height * 0.6,  // Adjust height dynamically
           minHeight: MediaQuery.of(context).size.height * 0.5,
           minWidth: (MediaQuery.of(context).size.height * 0.6) * (9 / 16), // Match 9:16 ratio
           cardBuilder: (context, index) => Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0),
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             child: Image.asset(
               images[index],
               fit: BoxFit.cover,
             ),
           ),
           cardController: controller = CardController(),
           swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
             if (align.x < 0) {
               // Swiped left
             } else if (align.x > 0) {
               // Swiped right
             }
           },
           swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
             // Handle swipe completion
           },
         ),
       ),
     ),
   );
  }
}