import 'package:flutter/material.dart';
import 'package:flutter_kim_lhc/main.dart';

String selectedRating = '0';
void main() => runApp(const Step1of3App());

class Step1of3App extends StatelessWidget {
  const Step1of3App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Step1of3Field(),
    );
  }
}

class Step1of3Field extends StatefulWidget {
  const Step1of3Field({super.key});

  @override
  Step1of3FieldState createState() => Step1of3FieldState();
}

class Step1of3FieldState extends State<Step1of3Field> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '步驟一(3/3)',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              color: const Color(0xFFFFDCB2),
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: const Text(
                '請根據下圖的姿勢評級表選擇合適的姿勢評級',
                style: TextStyle(color: Colors.black, fontSize: 19),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'picture/topic-1.png',
              width: 370,
              height: 370,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '姿勢評級:',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedRating,
                  items: [
                    '0',
                    '03',
                    '05',
                    '07',
                    '09',
                    '10',
                    '13',
                    '15',
                    '18',
                    '20',
                  ].map((rating) {
                    return DropdownMenuItem<String>(
                      value: rating,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.2,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          rating,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRating = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getLhcApp("2")),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(170, 50)),
              ),
              child: const Text('下一步', style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
