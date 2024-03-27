// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  resetToZero({bool resetBut = false}) {
    resetBut == true ? setBut(_but = 1) : null;
    setCount(_counter = 0);
    setTime(_time = 0);
    setSum(_sum = 0);
  }

  setCount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', value);
    getData();
  }

  setTime(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', value);
    getData();
  }

  setBut(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('but', value);
    getData();
  }

  setSum(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('sum', value);
    getData();
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
      _time = prefs.getInt('time') ?? 0;
      _but = prefs.getInt('but') ?? 1;
      _sum = prefs.getInt('sum') ?? 0;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  late Color backColor = Color.fromARGB(255, 154, 1, 131);
  int _counter = 0;
  int _but = 1;
  int _time = 0;
  int _sum = 0;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            isActive ? Icons.palette_outlined : Icons.palette,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isActive = !isActive;
            });
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: backColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'الهدف',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setBut(_but + 1);
                            resetToZero();
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: 30,
                            color: Colors.white,
                          )),
                      Text(
                        '$_but',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setBut(_but - 1);
                            resetToZero();
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            size: 30,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setBut(_but + 1000);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: Text(
                          '1000+',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setBut(_but + 100);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: Text(
                          '100+',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setBut(_but = 100);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(13),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: Text(
                          '100',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setBut(_but = 33);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(13),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: Text(
                            '33',
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            setBut(_but = 1);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 13.0),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'الإستغفار',
                      style: TextStyle(fontSize: 30, color: backColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(fontSize: 30, color: backColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 5.0,
                      percent: _counter / _but,
                      center: IconButton(
                        iconSize: 55,
                        icon: Icon(Icons.touch_app),
                        color: backColor,
                        onPressed: () {
                          setState(() {
                            if (_counter == _but) {
                              setSum(_sum = _sum + _counter);
                              setCount(_counter = 0);
                              setTime(_time + 1);
                            }
                            setCount(_counter + 1);
                          });
                        },
                      ),
                      backgroundColor: backColor
                          .withOpacity(0.3), // Color.fromARGB(80, 154, 1, 131),
                      progressColor: backColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$_time :مرات التكرار',
                      style: TextStyle(fontSize: 25, color: backColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$_sum :المجموع',
                      style: TextStyle(fontSize: 25, color: backColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: isActive,
            child: Row(
              children: [
                Radio(
                  fillColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 154, 1, 131)),
                  activeColor: Color.fromARGB(255, 154, 1, 131),
                  value: Color.fromARGB(255, 154, 1, 131),
                  groupValue: backColor,
                  onChanged: (value) {
                    setState(() {
                      backColor = value!;
                    });
                  },
                ),
                Radio(
                  fillColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 154, 1, 77)),
                  activeColor: Color.fromARGB(255, 154, 1, 77),
                  value: Color.fromARGB(255, 154, 1, 77),
                  groupValue: backColor,
                  onChanged: (value) {
                    setState(() {
                      backColor = value!;
                    });
                  },
                ),
                Radio(
                  fillColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 156, 69, 2)),
                  activeColor: Color.fromARGB(255, 156, 69, 2),
                  value: Color.fromARGB(255, 156, 69, 2),
                  groupValue: backColor,
                  onChanged: (value) {
                    setState(() {
                      backColor = value!;
                    });
                  },
                ),
                Radio(
                  fillColor: WidgetStatePropertyAll(Colors.black87),
                  activeColor: Colors.black87,
                  value: Colors.black87,
                  groupValue: backColor,
                  onChanged: (value) {
                    setState(() {
                      backColor = value!;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backColor,
        onPressed: () {
          resetToZero(resetBut: true);
        },
        child: Icon(
          Icons.restart_alt_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
