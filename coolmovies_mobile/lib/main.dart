import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'core/core.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  final client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Coolmovies'),
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
  final ValueNotifier<Map<String, dynamic>?> _data = ValueNotifier(null);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future _fetchData() async {
    debugPrint('Fetching data...');
    final client = GraphQLProvider.of(context).value;

    final QueryResult result = await client.query(QueryOptions(
      document:
          gql(GQLQueries.getReview(id: "e8edc53a-29cf-4470-8351-ed22cc144a3f")),
    ));

    if (result.hasException) {
      debugPrint(result.exception.toString());
    }

    if (result.data != null) {
      _data.value = result.data!['allMovies'] as Map<String, dynamic>;
    }
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 36.0),
                  child: Text(
                    """
Thank you for taking the time to take our test. We really appreciate it.
All the information on what is required can be found in the README at the root of this repo.
Please dont spend ages on this and just get through as much of it as you can.
Good luck! :)""",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: Text('Increment: $_counter'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _fetchData,
                  icon: const Icon(Icons.download),
                  label: const Text('Fetch data'),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder(
                  valueListenable: _data,
                  builder: (BuildContext context, Map<String, dynamic>? data,
                      Widget? _) {
                    return data != null
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: Colors.grey.shade700),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(data.toString()),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
