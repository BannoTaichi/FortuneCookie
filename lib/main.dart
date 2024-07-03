import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp()); //class MyAppを呼び出し
}

class MyApp extends StatelessWidget {
  //StatelessWidgetの継承：画面に何かを添付するために必要なすべてのものを取得
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //build：ユーザーインターフェースの構築が行なわれる
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(), //ここで実際に子ウィジェットを追加する
    );
  }
}

class MyHomePage extends StatefulWidget {
  //home の定義
  MyHomePage({super.key});

  String _currentFortune = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //MyHomePageのstateを継承
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
      print("State Change==>: $_currentFortune");
    }); //setStateで変更が必要な値に対して変更を与える
    //SetStateの中に入れないと状態の変更は起きない
  }

  @override
  //build : 変更を加えるために再構築が必要なものの再構築のために呼び出される
  Widget build(BuildContext context) {
    //Scaffold: アプリ全体の外見の構造を設定できる基本ウィジェット
    print("Building the widget");
    return Scaffold(
      appBar: AppBar(), //アプリ上部のバー
      body: Center(
        //Column: 上から下へレイアウト
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //画面上に配置できるものはすべてウィジェット(リスト型を配置)
          children: <Widget>[
            Image.asset(
              'assets/images/camera.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Text("Other things/."),
            // Text('Your fortune is:',
            //     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),

            //Card: 箱のようなものを表示
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                //const : 変更できないウィジェット
                //メモリの削減され、パフォーマンスが向上
                //スムーズなアニメーションやアプリの応答性に重要
                child: Text(_currentFortune,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune, child: const Text("Get Fortune"))
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
