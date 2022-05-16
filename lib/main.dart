import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/countermodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => CounterModel()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(
          title: 'new app',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  /* int _counter = 0;

  void _incrementCounter () {
    setState(() {
      _counter++; 
    });
  } */

  @override
  Widget build(BuildContext context) {
   // return Consumer<CounterModel>(builder: (context, data, _) { */
    final data = Provider.of<CounterModel>(context);
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${data.getCounter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end, 
            children: [
              FloatingActionButton(
                  onPressed: () {
                  data.incrementCounter();
                  },
                  tooltip: 'increment',
                  child: const Icon(Icons.add),
                 ),

                 FloatingActionButton(
                  onPressed: () {
                data.decrementCounter();
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove),
                 ),
              
            ],
          ),
            );
          
 }
}
