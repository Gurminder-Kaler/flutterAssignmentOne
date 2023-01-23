import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final noOfHoursController = TextEditingController();
    final hourlyRateController = TextEditingController();
    final resultController = TextEditingController();
    computeFunc() {
      if (noOfHoursController.text.isEmpty == true) {
        showAlertDialog(context, const Text('No of hours field is required!'));
        return;
      }
      if (hourlyRateController.text.isEmpty == true) {
        showAlertDialog(context, const Text('Hourly rate field is required!'));
        return;
      }
      var noOfHours = int.parse(noOfHoursController.text);
      var hourlyRate = int.parse(hourlyRateController.text);
      var total = 0.0;
      var extra = 0.0;
      var tax = 0.0;
      if (noOfHours <= 40) {
        total = noOfHours * 1.0 * hourlyRate;
      } else {
        extra = hourlyRate * 1.5;
        total = (noOfHours - 40) * extra + (40 * hourlyRate);
      }
      print(extra);
      tax = total * 0.18;
      resultController.text =
          'Report (All Amounts are in CAD \$)\nRegular Pay: ${total.toStringAsFixed(2)}\n+40 hrs Overtime Pay: ${extra..toStringAsFixed(2)}\nTotal Pay: ${(total + tax).toStringAsFixed(2)}\nTax: ${tax.toStringAsFixed(2)} \n';
      tax.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: noOfHoursController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter No. of Hours',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: hourlyRateController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Hourly Rate',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextButton(
                    onPressed: computeFunc,
                    child: const Text('Click to Compute the Wage'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: resultController,
                          enabled: false,
                          maxLines: 8, //or null
                          decoration: const InputDecoration.collapsed(
                              hintText: "See you income here.."),
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text('Gurminder Singh\n 301294300'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, message) {
  print(message);
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: message,
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
