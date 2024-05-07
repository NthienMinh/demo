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
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final NumberCubit cubit = NumberCubit();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocBuilder<NumberCubit, int>(
            bloc: widget.cubit..init(),
            builder: (c, state) {
              if(state == 0){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return  ListView.builder(
                itemCount: widget.cubit.listNumber!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.cubit.listNumber![index]),
                  );
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.cubit.addNumber('Number ${widget.cubit.listNumber!.length+1}');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
    );
  }
}


