import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_generator/models/UserHandler.dart';
import 'package:gift_generator/models/UserHistoryModel.dart';

class HistoryBlocks extends StatefulWidget {
  UserHistoryModel _historyBlocks;

  HistoryBlocks(this._historyBlocks);

  @override
  _HistoryBlocksState createState() => _HistoryBlocksState(this._historyBlocks);
}

class _HistoryBlocksState extends State<HistoryBlocks> {
  bool isFirstOpen = false;
  bool isSecondOpen = false;

  var _openBox = false;
  UserHistoryModel _historyBlocks;

  _HistoryBlocksState(this._historyBlocks);

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
    return Center(
      child: Container(
          height: _openBox ? 330 : 210,
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffC3CCFA),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
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
                _historyBlocks.holiday,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.date,
                style: new TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            _historyBlocks.interests.join(', '),
            style: new TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10)),
          Text(
            _historyBlocks.link != "null"? _historyBlocks.link : "Посилання на соціальну мережу не надавалося",
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5)),
          Text(
            _historyBlocks.gender + " " + _historyBlocks.age.toString(),
            style: new TextStyle(
              fontSize: 15.0,
              color: Colors.black54,
            ),
          ),
          Padding(padding: EdgeInsets.only(top:10),child: _openGifts(_openBox),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffC3CCFA),
              padding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: 0),
              elevation: 0,
            ),
            onPressed: () => {
              setState(() => _openBox = !_openBox)
            },
            child: Container(
                child: Image.asset(
                  "assets/bottom_arrow.png",
                  height: 40,
                )),
          ),
        ],
      ),
    )));
  }

  _openGifts(bool isOpen) {
    if(isOpen) {
      return Column(children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(
                '1. ' + _historyBlocks.gifts[0].name,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.gifts[0].rate.toString(),
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ]),
            Text(
              _historyBlocks.gifts[0].link,
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
                _historyBlocks.gifts[1].name,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.gifts[1].rate.toString(),
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ]),
            Text(
              _historyBlocks.gifts[1].link,
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
                _historyBlocks.gifts[2].name,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.gifts[2].rate.toString(),
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ]),
            Text(
              _historyBlocks.gifts[2].link,
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
                _historyBlocks.gifts[3].name,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.gifts[3].rate.toString(),
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ]),
            Text(
              _historyBlocks.gifts[3].link,
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
                _historyBlocks.gifts[4].name,
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              Text(
                _historyBlocks.gifts[4].rate.toString(),
                style: new TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ]),
            Text(
              _historyBlocks.gifts[4].link,
              style: new TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],);
    }
    return Row();
  }
}
