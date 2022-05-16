
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
      home: const  MyHomePage(title: 'new app',),
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
    return Consumer<CounterModel>(
      builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title:  Text(widget.title),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text('You have pushed the button this many times:',
              ),
              Text(' ',
              style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: 'increment',
          child: const Icon(Icons.add),
        )
      );
    }
    );
  }
}
