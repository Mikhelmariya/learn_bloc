import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/counter_event.dart';
import 'package:learn_bloc/bloc/counter_state.dart';
import 'package:learn_bloc/cubit/countercubit.dart';
import 'package:learn_bloc/cubit/countercubit_state.dart';
import 'package:learn_bloc/visibility_bloc/visibility_bloc.dart';
import 'package:learn_bloc/visibility_bloc/visibility_event.dart';
import 'package:learn_bloc/visibility_bloc/visibility_state.dart';

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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterCubit()),
            BlocProvider(create: (context) => CounterBloc()),
            BlocProvider(create: (context) => VisibilityBloc()),
          ],
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(listener: (context, state) {
              if (state.count == 3) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Count is 3")));
              }
            }, builder: (context, state) {
              return Text(
                state.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            BlocBuilder<VisibilityBloc, VisibilityState>(
                builder: (context, state) {
              return Visibility(
                visible: state.isVisible,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              );
            }),
            SizedBox(height: 20),
            BlocBuilder<CounterCubit, CounterCubitState>(
                builder: (context, state) {
              return Text(
                state.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              //add event
              context
                  .read<CounterBloc>()
                  .add(CounterIncrementEvent()); // "create" is called
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              //add event
              context
                  .read<CounterBloc>()
                  .add(CounterDecrementEvent()); // "create" is called
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
              onPressed: () {
                //add event
                context
                    .read<VisibilityBloc>()
                    .add(MakeVisible()); // "create" is called
              },
              child: Text("Make visible")),
          FloatingActionButton(
              onPressed: () {
                //add event
                context
                    .read<VisibilityBloc>()
                    .add(MakeInvisible()); // "create" is called
              },
              child: Text("Make Invisible")),
          FloatingActionButton(
            onPressed: () {
              //add event
              context.read<CounterCubit>().increment();
            },
            tooltip: 'Cubit add 3',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              //add event
              context.read<CounterCubit>().decrement(); // "create" is called
            },
            tooltip: 'Cubit sub 3',
            child: const Icon(Icons.minimize),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
