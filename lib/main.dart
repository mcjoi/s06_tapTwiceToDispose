import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import './intro.dart';

void main() => runApp(MaterialApp(
      home: Intro(), //To Intro Page
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static bool isSort = false;
  static List _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ];

  static DateTime currentBackPressTime;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  _isEnd() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      _globalKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text('To finish, tap a backbutton one more time.'),
        ));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: WillPopScope(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.sort_by_alpha),
            onPressed: () {
              setState(() {
                isSort = !isSort;
                _items.sort((a, b) => isSort ? a.compareTo(b) : b.compareTo(a));
              });
            },
          ),
          key: _globalKey,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('ReoderableList'),
          ),
          body: buildBody(context),
        ),
        onWillPop: () async {
          bool result = _isEnd();
          return await Future.value(result);
        },
      ),
    );
  }

  buildBody(BuildContext context) {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final moveItem = _items.removeAt(oldIndex);
          _items.insert(newIndex, moveItem);
        });
      },
      children: _items
          .map((item) => ListTile(
                key: Key(item),
                title: Text('this is represents $item'),
                subtitle: Text('Item : $item'),
                leading: Icon(Icons.drag_handle),
              ))
          .toList(),
    );
  }
}
