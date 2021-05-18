import 'package:flutter/material.dart';
import 'package:gift_generator/pages/cabinet.dart';
import 'package:gift_generator/pages/find.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gift_generator/pages/notification.dart';

import 'notification.dart';

class NavigationBar extends  StatelessWidget{
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard, color: const Color(0xfffa6f38), size: 30),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: const Color(0xfffa6f38), size: 30),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: const Color(0xfffa6f38), size: 30),
              title: Text(''),
            ),
          ],
          onTap: (index){
            switch(index){
              case 0:
                Navigator.push(context,PageTransition(
                    type: PageTransitionType.fade,
                    child: Find()));
                break;
              case 1:
                Navigator.push(context,PageTransition(
                    type: PageTransitionType.fade,
                    child: NotificationPage()));
                break;
              case 2:
                Navigator.push(context,PageTransition(
                    type: PageTransitionType.fade,
                    child: Cabinet()));
                break;
            }
          }
    );
  }
}