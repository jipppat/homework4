import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LED Matrix Counter',
      theme: ThemeData(
       
       
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter == 99) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 99;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 61, 125),
        centerTitle: true,
        title: Text(
          'CP-SU LED MATRIX',
          style: TextStyle(
            fontWeight: FontWeight.bold, // กำหนดให้ข้อความหนาขึ้น
          ),
        ),
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            IconButton(
              onPressed: _incrementCounter,
              icon: Icon(Icons.keyboard_arrow_up_outlined),
              iconSize: 80, // ขนาดไอคอน
              padding: EdgeInsets.all(12),
              color: Color.fromARGB(255, 230, 109, 190),
              splashColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(30), 
              width: 300,// ระยะห่างภายใน Container
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                    width: 8), // สร้างเส้นขอบสีดำขนาด 2 พิกเซล
                borderRadius: BorderRadius.circular(10), // สร้างมุมมนส์รอบกรอบ
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildDigit(_counter ~/ 10), 
                  const SizedBox(width: 20),
                  _buildDigit(_counter % 10), 
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: _decrementCounter,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  iconSize: 80, 
                  padding: EdgeInsets.all(12),
                  color: Color.fromARGB(255, 230, 109, 190),
                  splashColor: Color.fromARGB(255, 180, 178, 178),

                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDigit(int digit) {
    final List<List<bool>> digitMap = _digitMap[digit];
    final double dotSize = 20.0;
    return SizedBox(
      width: 5 * dotSize, 
      height: 7 * dotSize, 
      child: Column(
        children: List.generate(7, (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (colIndex) {
              final isLit = digitMap[rowIndex][colIndex];
              return Container(
                width: dotSize,
                height: dotSize,
                margin:  EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isLit ? Color.fromARGB(255, 240, 83, 138) : Color.fromARGB(255, 66, 66, 66),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}

const List<List<List<bool>>> _digitMap = [
  // 0
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
  ],
  // 1
  [
    [false, false, true, false, false],
    [false, true, true, false, false],
    [false, false, true, false, false],
    [false, false, true, false, false],
    [false, false, true, false, false],
    [false, false, true, false, false],
    [false, true, true, true, false],
  ],
  // 2
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [false, false, false, false, true],
    [false, false, false, true, false],
    [false, false, true, false, false],
    [false, true, false, false, false],
    [true, true, true, true, true],
  ],
  // 3
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [false, false, false, false, true],
    [false, true, true, true, false],
    [false, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
  ],
  // 4
  [
    [false, false, false, true, false],
    [false, false, true, true, false],
    [false, true, false, true, false],
    [true, false, false, true, false],
    [true, true, true, true, true],
    [false, false, false, true, false],
    [false, false, false, true, false],
  ],
  // 5
  [
    [true, true, true, true, true],
    [true, false, false, false, false],
    [true, true, true, true, false],
    [false, false, false, false, true],
    [false, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
  ],
  // 6
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, false],
    [true, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
  ],
  // 7
  [
    [true, true, true, true, true],
    [false, false, false, false, true],
    [false, false, false, true, false],
    [false, false, true, false, false],
    [false, true, false, false, false],
    [false, true, false, false, false],
    [false, true, false, false, false],
  ],
  // 8
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, false],
  ],
  // 9
  [
    [false, true, true, true, false],
    [true, false, false, false, true],
    [true, false, false, false, true],
    [false, true, true, true, true],
    [false, false, false, false, true],
    [false, false, false, false, true],
    [false, true, true, true, false],
  ],
];
