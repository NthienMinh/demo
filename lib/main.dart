import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter App'),
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bấm vào dấu cộng để bộ đềm thêm 1!',
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Số đếm hiện tại: ',
                    )),
                BlocBuilder<CounterCubit, int>(
                    builder: (c, state) {

                  var cubit = BlocProvider.of<CounterCubit>(c);
                  return InkWell(
                    onTap: (){
                      cubit.increment(true);
                    },
                    child: Text(
                      '${cubit.number1} == $state',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                }),
                BlocBuilder<CounterCubit, int>(builder: (cc, s) {
                  var cubit = BlocProvider.of<CounterCubit>(cc);
                  return InkWell(
                    onTap: (){
                      cubit.increment(false);
                    },
                    child: Text(
                      '${cubit.number2} == $s',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                }),


              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ) );
  }
}
