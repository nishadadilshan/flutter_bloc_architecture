import 'package:block_architecture_hexcorder/blocs/counter/counter_bloc.dart';
import 'package:block_architecture_hexcorder/my_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: BlocProvider(
        create: (context) => CounterBloc(),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
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
  int _counter = 0;
  late CounterBloc counterBloc;
  // MyBloc myBloc = MyBloc();
  // CounterBloc counterBloc = CounterBloc();
  @override
  void initState() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState >(
              builder: (context, state) {
                if (state is IncrementState) {
                  _counter = state.value;
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is DecrementState) {
                  _counter = state.value;
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    '0',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            )

            // StreamBuilder<MyState>(
            //     stream: myBloc.stateStream,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         MyState? state = snapshot.data;
            //         if (state is IncrementState) {
            //           _counter = state.value;
            //           return Text(
            //             '${state.value}',
            //             style: Theme.of(context).textTheme.headlineMedium,
            //           );
            //         } else if (state is DecrementState) {
            //           _counter = state.value;
            //           return Text(
            //             '${state.value}',
            //             style: Theme.of(context).textTheme.headlineMedium,
            //           );
            //         } else {
            //           return Container();
            //         }
            //       } else {
            //         // return
            //           // const CircularProgressIndicator();
            //         return Text(
            //           '0',
            //           style: Theme.of(context).textTheme.headlineMedium,
            //         );
            //       }
            //     }),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(IncrementEvent(value: _counter));
                // myBloc.eventStreamSink.add(IncrementEvent(value: _counter));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            // const SizedBox(
            //   width: 50,
            // ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(DecrementEvent(value: _counter));
                // myBloc.eventStreamSink.add(DecrementEvent(value: _counter));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
