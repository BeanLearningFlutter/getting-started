// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// CodeLab Step 3
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange), //
          // You can change this color, and the color scheme of the whole app,
          // by changing the seed color for the ColorScheme here.


        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() { // The new getNext() method reassigns current with a new random WordPair. It also calls notifyListeners()(a method of ChangeNotifier) that ensures that anyone watching MyAppState is notified.
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Every widget defines a build() method that's automatically called every time the widget's circumstances change so that the widget is always up to date.
    var appState = context.watch<MyAppState>(); // MyHomePage tracks changes to the app's current state using the watch method.
    var pair = appState.current;                 // ← Add this.


    return Scaffold(
      // Every build method must return a widget or (more typically) a nested tree of widgets. In this case, the top-level widget is Scaffold. You aren't going to work with Scaffold in this codelab, but it's a helpful widget and is found in the vast majority of real-world Flutter apps.
      body: Center(
        child: Column(
          // Column is one of the most basic layout widgets in Flutter.
          // It takes any number of children and puts them in a column from top
          // to bottom.
          // By default, the column visually places its children at the top.
          mainAxisAlignment: MainAxisAlignment.center,  // ← Add this so that
          // the column is centered.

          children: [
            // Text('A random AWESOME idea:'), // You can remove the Text widget
            // above BigCard. It could be argued that the descriptive text
            // ("A random AWESOME idea:") isn't needed anymore since the UI
            // makes sense even without it. And it's cleaner that way.
            // You changed this Text widget in the first step.
            BigCard(pair: pair),                // ← Change to this.
            // This second Text widget takes appState, and accesses the only
            // member of that class, current (which is a WordPair).
            // WordPair provides several helpful getters, such as asPascalCase
            // or asSnakeCase. Here, we use asLowerCase but you can change this
            // now if you prefer one of the alternatives.

            SizedBox(height: 10), // You can also add a SizedBox(height: 10)
            // widget between BigCard and ElevatedButton. This way, there's a
            // bit more separation between the two widgets.
            // The SizedBox widget just takes space and doesn't render anything
            // by itself. It's commonly used to create visual "gaps".

            // ↓ Add this.
            ElevatedButton(
              onPressed: () {
                appState.getNext();  // ← This instead of print().
              },
              child: Text('Next'),
            ),
          ], // Notice how Flutter code makes heavy use of trailing commas. This particular comma doesn't need to be here, because children is the last (and also only) member of this particular Column parameter list. Yet it is generally a good idea to use trailing commas: they make adding more members trivial, and they also serve as a hint for Dart's auto-formatter to put a newline there. For more information, see Code formatting.
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    // First, the code requests the app's current theme with Theme.of(context).
    final theme = Theme.of(context);       // ← Add this.
    // The card still has a problem: the text is too small and its color is
    // hard to read. To fix this, make the following changes to
    // BigCard's build() method.
    // ↓ Add this.
    final style = theme.textTheme.displayMedium!.copyWith( // By using
      // theme.textTheme, you access the app's font theme.
      // This class includes members such as bodyMedium
      // (for standard text of medium size), caption (for captions of images),
      // or headlineLarge (for large headlines).

      // The displayMedium property is a large style meant for display text.
      // The word display is used in the typographic sense here, such as in
      // display typeface. The documentation for displayMedium says that
      // "display styles are reserved for short, important text"—exactly
      // our use case.

      // The theme's displayMedium property could theoretically be null. Dart,
      // the programming language in which you're writing this app, is
      // null-safe, so it won't let you call methods of objects that are
      // potentially null. In this case, though, you can use the ! operator
      // ("bang operator") to assure Dart you know what you're doing.
      // (displayMedium is definitely not null in this case. The reason we know
      // this is beyond the scope of this codelab, though.)

      // Calling copyWith() on displayMedium returns a copy of the text
      // style with the changes you define. In this case, you're only
      // changing the text's color.

      // To get the new color, you once again access the app's theme.
      // The color scheme's onPrimary property defines a color that is a
      // good fit for use on the app's primary color.

      /**
       * If you feel like it, change the card further. Here are some ideas:
          copyWith() lets you change a lot more about the text style than just
          the color. To get the full list of properties you can change,
          put your cursor anywhere inside copyWith()'s parentheses, and hit
          Ctrl+Shift+Space (Win/Linux) or Cmd+Shift+Space (Mac).

          Similarly, you can change more about the Card widget.
          For example, you can enlarge the card's shadow by increasing
          the elevation parameter's value.

          Try experimenting with colors. Apart from theme.colorScheme.primary,
          there's also .secondary, .surface, and a myriad of others.
          All of these colors have their onPrimary equivalents.
       */
    color: theme.colorScheme.onPrimary,
    );

    return Card(
      // Then, the code defines the card's color to be the same as the theme's
      // colorScheme property. The color scheme contains many colors, and
      // primary is the most prominent, defining color of the app.
      color: theme.colorScheme.primary,    // ← And also this.
      child: Padding(
        padding: const EdgeInsets.all(20),
        // ↓ Make the following change.
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
    // Note: Flutter uses Composition over Inheritance whenever it can.
    // Here, instead of padding being an attribute of Text, it's a widget!
    // This way, widgets can focus on their single responsibility, and you,
    // the developer, have total freedom in how to compose your UI.
    // For example, you can use the Padding widget to pad text, images, buttons,
    // your own custom widgets, or the whole app.
    // The widget doesn't care what it's wrapping.



    }
}
