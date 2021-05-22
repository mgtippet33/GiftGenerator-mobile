import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryBlocks extends StatefulWidget {
  @override
  _HistoryBlocksState createState() => _HistoryBlocksState();
}

class _HistoryBlocksState extends State<HistoryBlocks> {
  bool isFirstOpen = false;
  bool isSecondOpen = false;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: isFirstOpen == false
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffC3CCFA),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 330,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Свято",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Дата",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Інтерес1, інтерес2",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              Text(
                                "Посилання на соціальну мережу",
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5)),
                              Text(
                                "Стать, вік",
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffC3CCFA),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                ),
                                onPressed: () => {
                                  setState(() => isFirstOpen = !isFirstOpen)
                                },
                                child: Container(
                                    child: Image.asset(
                                  "assets/bottom_arrow.png",
                                  height: 40,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffC3CCFA),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 330,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Свято",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Дата",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Text(
                                      "Gift 1",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "5/5",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                  Text(
                                    "Link",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Text(
                                      "Gift 1",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "5/5",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                  Text(
                                    "Link",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffC3CCFA),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                ),
                                onPressed: () => setState(() => isFirstOpen = !isFirstOpen),
                                child: Container(
                                    child: Image.asset(
                                  "assets/bottom_arrow.png",
                                  height: 40,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: isSecondOpen == false
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffC3CCFA),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 330,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Свято",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Дата",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Інтерес1, інтерес2",
                                style: new TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              Text(
                                "Посилання на соціальну мережу",
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5)),
                              Text(
                                "Стать, вік",
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffC3CCFA),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                ),
                                onPressed: () => setState(() => isSecondOpen = !isSecondOpen),
                                child: Container(
                                    child: Image.asset(
                                  "assets/bottom_arrow.png",
                                  height: 40,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffC3CCFA),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 330,
                        height: 180,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Свято",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Дата",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Text(
                                      "Gift 1",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "5/5",
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                                  Text(
                                    "Link",
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffC3CCFA),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  elevation: 0,
                                ),
                                onPressed: () => setState(() => isSecondOpen = !isSecondOpen),
                                child: Container(
                                    child: Image.asset(
                                  "assets/bottom_arrow.png",
                                  height: 40,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
      ],
    );
  }
}
