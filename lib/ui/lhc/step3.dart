import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

void main() => runApp(const Step3App());

class Step3App extends StatefulWidget {
  const Step3App({super.key});

  @override
  Step3FieldState createState() => Step3FieldState();
}

class Step3FieldState extends State<Step3App> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var appTitle = const Align(
        alignment: Alignment.center,
        child:
            Text('步驟三', style: TextStyle(fontSize: 40, color: Colors.white)));

    var times1 = const Text('時間評級',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold));
    var times3 = const Text('                           ',
        style: TextStyle(fontSize: 20));
    var times2 = const Text('步驟一動作的每日執行次數',
        style: TextStyle(fontSize: 30, color: Colors.black));

    var appBody = Stack(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  times3,
                  times1,
                  times3,
                  times2,
                  times3,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.2)),
                    child: DropdownButton<String>(
                        value: selectedOption,
                        hint: const Text(' 大約為', textAlign: TextAlign.center),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                        items: <String>[
                          '5次',
                          '20次',
                          '50次',
                          '100次',
                          '150次',
                          '220次',
                          '300次',
                          '500次',
                          '750次',
                          '1000次',
                          '1500次',
                          '2000次',
                          '2500次',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList()),
                  ),
                ]),
          ),
        ),

        // 下一步按鈕
        Positioned(
          bottom: 30,
          right: 20,
          child: ElevatedButton(
              onPressed: () {
                if (selectedOption != null) {
                  if (selectedOption == '5次') {
                    step3Data = 1.0;
                  } else if (selectedOption == '20次') {
                    step3Data = 1.5;
                  } else if (selectedOption == '50次') {
                    step3Data = 2.0;
                  } else if (selectedOption == '100次') {
                    step3Data = 2.5;
                  } else if (selectedOption == '150次') {
                    step3Data = 3.0;
                  } else if (selectedOption == '220次') {
                    step3Data = 3.5;
                  } else if (selectedOption == '300次') {
                    step3Data = 4.0;
                  } else if (selectedOption == '500次') {
                    step3Data = 5.0;
                  } else if (selectedOption == '750次') {
                    step3Data = 6.0;
                  } else if (selectedOption == '1000次') {
                    step3Data = 7.0;
                  } else if (selectedOption == '1500次') {
                    step3Data = 8.0;
                  } else if (selectedOption == '2000次') {
                    step3Data = 9.0;
                  } else if (selectedOption == '2500次') {
                    step3Data = 10.0;
                  }
                }

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getLhcApp("4")));
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(170, 50))),
              child: const Text('下一步', style: TextStyle(fontSize: 30))),
        ),

        // 上一步按鈕
        Positioned(
          bottom: 30,
          left: 20,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(170, 50))),
            child: const Text('上一步', style: TextStyle(fontSize: 30)),
          ),
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue, title: appTitle),
          body: appBody),
    );
  }
}
