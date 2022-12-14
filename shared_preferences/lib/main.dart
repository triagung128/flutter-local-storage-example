import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shared Preferences'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const String counterKey = "COUNTER KEY";

  void _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt(counterKey) != null) prefs.remove(counterKey);
    prefs.setInt(counterKey, _counter);
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterKey) ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveCounter();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
        _saveCounter();
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _saveCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () => _decrementCounter(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () => _incrementCounter(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: () => _resetCounter(),
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
