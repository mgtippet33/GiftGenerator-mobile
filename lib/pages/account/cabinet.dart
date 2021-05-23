import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gift_generator/api/api.dart';
import 'package:gift_generator/models/User.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/models/UserHistoryModel.dart';
import 'package:gift_generator/pages/account/HistoryBlocks.dart';
import 'package:gift_generator/pages/authorization/loginPage.dart';
import 'package:gift_generator/pages/payment/payment.dart';
import 'package:gift_generator/pages/search/find.dart';
import 'package:gift_generator/pages/account/setting.dart';
import 'package:image_picker/image_picker.dart';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation.dart';

class Cabinet extends StatefulWidget {
  @override
  _CabinetState createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  User user = null;
  Future<UserHistoryModel> _historyFuture;
  UserHistoryModel historyBlocks;
  bool _isPremium = false;
  final box = GetStorage('MyStorage');
  File _image;
  final picker = ImagePicker();
  Widget _resultWidget;
  String _userName = "";
  bool _loadHistory;

  Future<File> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image.toString());
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    _checkUser(context);
    return FutureBuilder(
        future: _historyFuture,
        builder: (context, snapshot) {
          if(_isPremium && snapshot.hasData) {
            if(snapshot.data.holiday == null && snapshot.data.date == null && snapshot.data.interests == null) {
              _loadHistory = false;
              _resultWidget = Center(
                child: Text(
                  'Швидше за все,ви ще не шукали подарунки!',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              );
            }
            else{
              _loadHistory = true;
            }
          }
           else if (_isPremium && !snapshot.hasData) {
             _loadHistory = false;
            _resultWidget = Center(
                child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                backgroundColor: Colors.cyanAccent,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ));
          } else {
             _loadHistory = false;
            _resultWidget = Center(
              child: Text(
                'Будь ласка, активуйте преміум,\nякщо хочете переглядати історію',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: IconTitleWidget(),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, left: 5, right: 5, bottom: 10),
                            child: Container(
                              width: 90.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: _isPremium == true
                                    ? Colors.deepOrangeAccent
                                    : Colors.white,
                              ),
                              child: _image == null
                                  ? Image.asset("assets/account_img.png")
                                  : Image.file(_image),
                            ),
                          ),
                          Column(children: [
                            Text(
                              _userName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 22),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 7),
                                    shadowColor: Colors.black,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0))),
                                onPressed: () => {
                                  if (_isPremium == false)
                                    {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentPage()))
                                    }
                                },
                                child: Row(children: [
                                  Image.asset(
                                    _isPremium == true
                                        ? "assets/premium_active.png"
                                        : "assets/primium_unactive.png",
                                    height: 35,
                                  ),
                                  Text(
                                    'Преміум акаунт',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ]),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                          shadowColor: Colors.white,
                          elevation: 0,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0))),
                      onPressed: () => getImage(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: Text(
                          "Історія",
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    _loadHistory ? HistoryBlocks(snapshot.data): _resultWidget,
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: NavigationBar(),
          );
        });
  }

  _checkUser(BuildContext context) {
    if (UserHandler.instance.getUser() == null) {
      SharedPreferences.getInstance().then((prefs) {
        var userToken = prefs.getString('userToken');
        if (userToken == null)
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage()));
        else {
          ApiManager().getUser(userToken).then((value) {
            if (value.statusCode == 200) {
              var data = json.decode(value.body);
              var userData = data["data"][0];
              userData["token"] = userToken;
              userData["email"] = prefs.getString('email');
              userData["googleSignIn"] = prefs.getBool('googleSignIn');
              User user = User.fromJson(userData);
              print(user.name);
              UserHandler(user);
              _setCurrentUser(UserHandler.instance.getUser());
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            }
          });
        }
      });
    }
    else if(UserHandler.instance.getUser() != null) {
      _setCurrentUser(UserHandler.instance.getUser());
    }
  }

  _setCurrentUser(User user) {
    this.user = user;
    _isPremium = user.premium;
    _userName = user.name;
    if (user != null && _isPremium == true) {
      _historyFuture = ApiManager().getHistory(user.token, user.email);
    }
  }
}

class IconTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () => Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: SettingPage())),
          child: Icon(Icons.settings, color: const Color(0xff6d6b6b), size: 30),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Кабінет'),
        SizedBox(
          width: 10,
        ),
        InkWell(
          // onTap: ()=> Navigator.push(context,PageTransition(
          //     type: PageTransitionType.fade,
          //     child: NotificationPage())),
          child: Icon(Icons.nightlight_round,
              color: const Color(0xff6d6b6b), size: 30),
        ),
      ],
    );
  }
}
