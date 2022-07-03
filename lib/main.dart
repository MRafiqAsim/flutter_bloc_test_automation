import 'package:blocexample/cubit/counter_cubit.dart';
import 'package:blocexample/cubit/counter_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
  create: (context) => CounterCubit(),
  child: MaterialApp(
      title: 'Bloc State Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cubit at work!'),
    ),
);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
      if(!state.isIncrement)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Decremented'),duration: Duration(microseconds: 200),
              ),
            );
          }
      if(state.counterVal%7==0)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Multiple of 5'),duration: Duration(microseconds: 200),
            ),
          );
        }
  },
  child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if(state.counterVal<0) {
              return Text(
                    "Ahh "+state.counterVal.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
            }
            else if (state.counterVal%2==0)
              {
              return Text(
              "Even "+state.counterVal.toString(),
              style: Theme.of(context).textTheme.headline3,
              );
              }
            else
              {
                return Text(
                  state.counterVal.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              }
            },
          ),
            const SizedBox(height: 20,),
           Text("only build this widget when value is multiple of 5",
      style: Theme.of(context).textTheme.bodySmall,
    ),
    const SizedBox(height: 20,),
            BlocBuilder<CounterCubit, CounterState>(
              buildWhen: (previous, current) => current!=previous && current.counterVal%5==0,
              builder: (context, state) {

                if(state.counterVal<0) {
                  return Text(
                    "Ahh "+state.counterVal.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
                else if (state.counterVal>0)
                {
                  return Text(
                    "Yahh "+state.counterVal.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
                else
                {
                  return Text(
                    state.counterVal.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
              },
            ),
            const SizedBox(height: 20,),
            Text("this is to show the use case of bloc consumer",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<CounterCubit,CounterState>(
                      builder: (context, state) {
                    if(state.counterVal<0) {
                      return Text(
                        "Ahh "+state.counterVal.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }
                    else if (state.counterVal>0)
                    {
                      return Text(
                        "Yahh "+state.counterVal.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }
                    else
                    {
                      return Text(
                        state.counterVal.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }
                  },
                      listener: (context, state) {
                        if(state.isIncrement)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Incremented'),duration: Duration(microseconds: 200),
                            ),
                          );
                        }
                        if(state.counterVal%3==0)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Multiple of 3'),duration: Duration(microseconds: 200),
                            ),
                          );
                        }
                      }),
                ],),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              FloatingActionButton(
                onPressed:(){ BlocProvider.of<CounterCubit>(context).increment();},
                tooltip: "Increment",
                child: const Icon(Icons.add),
              ),
                FloatingActionButton(
                  onPressed:(){ BlocProvider.of<CounterCubit>(context).decrement();},
                  tooltip: "Decrement",
                  child: const Icon(Icons.remove),
                ),
            ],)
          ],
        ),
      ),
),
    );
  }
}
