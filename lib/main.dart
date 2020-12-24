import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = List<String>.generate(50, (index) => "Item $index");

  int indexToJump = 0;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final Duration duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _scrollToNext,
          child: Icon(Icons.navigate_next_outlined),
        ),
        appBar: AppBar(title: Text("ñoo"), centerTitle: true),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(flex: 1, child: Center(child: Text("HI"))),
            Flexible(
              flex: 5,
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 300,
                    color: Colors.red,
                    child: ListTile(
                      title: Center(child: Text('${items[index]}')),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _scrollToNext() =>
      itemScrollController.scrollTo(index: indexToJump++, duration: duration);
}
