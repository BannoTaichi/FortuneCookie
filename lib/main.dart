import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  String _currentFortune = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";

  final _fortuneList = [
    "You will find a new friend",
    "You will find a new friend tomorrow",
    "A truly rich life contains love and art in abundance",
    "Accept something that you cannot change, and you will feel better",
    "Adventure can be real happiness.",
    "Advice is like kissing. It costs nothing and is a pleasant thing to do.",
    "Advice, when most needed, is least heeded.",
  ];

  void _randomFortune() {
    var random = Random();
    int fortune = random.nextInt(_fortuneList.length);
    setState(() {
      _currentFortune = _fortuneList[fortune];
    });

    print(_currentFortune);
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold: アプリ全体の外見の構造を設定できる基本ウィジェット
    return Scaffold(
      appBar: AppBar(), //アプリ上部のバー
      body: Center(
        //Column: 上から下へレイアウト
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //画面上に配置できるものはすべてウィジェット(リスト型を配置)
          children: <Widget>[
            // Text("Other things/."),
            // Text('Your fortune is:',
            //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),

            //Card: 箱のようなものを表示
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${_currentFortune}',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune, child: Text("Get Fortune"))
          ],
        ),
      ),

      //右下のクリックボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _randomFortune,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
