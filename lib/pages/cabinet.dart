import 'package:flutter/material.dart';
import 'package:gift_generator/pages/notification.dart';
import 'package:gift_generator/pages/find.dart';
import 'package:page_transition/page_transition.dart';

class Cabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconTitleWidget(),
      ),
      //You should use `Scaffold` if you have `TextField` in body.
      //Otherwise on focus your `TextField` won`t scroll when keyboard popup.
      body: //SafeArea(child:
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Header Container
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.blue,
              alignment: Alignment.bottomLeft,
              child:
                Row(
                //   textDirection: TextDirection.ltr,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     Image.asset("assets/setting.png"),
                     Text('Кабінет'),
                     Image.asset("assets/moon.png")
                  ],
                ),
            ),

            //Body Container
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
            ),

            //Footer Container
            //Here you will get unexpected behaviour when keyboard pops-up.
            //So its better to use `bottomNavigationBar` to avoid this.
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white70,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: 7, vertical: 7),
                  //     ),
                  //     child:Image.asset("assets/present.png"),
                  //     onPressed:(){ print("Clicked1!!!");}
                  // ),
                  // ElevatedButton(
                  //     child:Text("Click", style: TextStyle(fontSize: 22)),
                  //     onPressed:(){ Navigator.push(
                  //         context,
                  //         PageTransition(
                  //             type: PageTransitionType.fade,
                  //             child: NotificationPage()));
                  //     }
                  // ),
                  InkWell(
                  onTap: ()=> Navigator.push(context,PageTransition(
                                type: PageTransitionType.fade,
                                child: Find())),

                  child:Image.asset("assets/present.png"),
                  ),
                  SizedBox (
                    width: 10,
                  ),
                  InkWell(
                    onTap: ()=> Navigator.push(context,PageTransition(
                        type: PageTransitionType.fade,
                        child: NotificationPage())),
                    child:Image.asset("assets/notify.png"),
                  ),
                  SizedBox (
                    width: 10,
                  ),
                  InkWell(
                    onTap: ()=> Navigator.push(context,PageTransition(
                        type: PageTransitionType.fade,
                        child: Cabinet())),
                    child:Image.asset("assets/cabinet.png"),
                  ),
                  // ElevatedButton(
                  //     child:Text("Click", style: TextStyle(fontSize: 22)),
                  //     onPressed:(){ print("Clicked3!!!");}
                  // )
                ],
              ),
            ),
          ],
        ),
      //),
    );
  }
}
class IconTitleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Image.asset("assets/setting.png"),
        ),
        SizedBox (
          width: 10,
        ),
        Text('Кабінет'),
        SizedBox (
          width: 10,
        ),
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Image.asset("assets/moon.png")
        ),
      ],
    );
  }
}