import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterwave_checkout_lbtech/flutterwave_checkout_lbtech.dart';
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final context = SecurityContext.defaultContext;
  context.allowLegacyUnsafeRenegotiation = true;
  runApp(const MyApp());
}

/// the base App
class MyApp extends StatelessWidget {
  /// base app constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// homepage widget
class MyHomePage extends StatefulWidget {
  /// example homepage constructor
  const MyHomePage({super.key, required this.title});
  /// homepage title parameter
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "";
  void _incrementCounter() async {
    final FlwCheckoutRequest flwCheckoutRequest = FlwCheckoutRequest(
        redirectUrl: "https://vivapayltd.com",
        amount: 2000.50,
        email: "solotechblast@gmail.com",
        transactionRef: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: "Solomon Oluwafemi",
        currency: "NGN",
        onSuccess: (data) {},
        onError: (message) {
          setState(() {
            _counter = message;
          });
        },
        publicKey: "FLWPUBK_TEST-83ad40c66f3dd5c545e87a2f88fcff1f-X");
    _counter = (await FlutterwaveChecoutLbtech.checkout(
            checkoutRequest: flwCheckoutRequest, context: context))
        .toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _counter,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
