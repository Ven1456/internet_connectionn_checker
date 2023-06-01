
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internet_connectionn_checker/container.dart';
import 'package:internet_connectionn_checker/share.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home:CardWidget(cardNumber: "5345645646565656566",expiryDate: "12/23"),
    // home: AppButtons(
    //   isColor: true,
    //   text: "dsas",
    //   size: 25,
    //   backgroundColor: Colors.red,
    // )
  ));
}



class MyHomePage0 extends StatefulWidget {
  @override
  _MyHomePage0State createState() => _MyHomePage0State();
}

class _MyHomePage0State extends State<MyHomePage0> {

  bool _showUI = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showUI ? const Text('Press the Button') :Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _showUI = true;

                });
              },
              child: const Text('Press Me'),
            ),
            const SizedBox(height: 20),
            _showUI ?
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'UI Displayed!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ) : Container(),
          ],
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    _scrollController.jumpTo(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('Disable Scroll Example'),
              pinned: true,
              expandedHeight: 200.0,

              flexibleSpace: const FlexibleSpaceBar(
                background: FlutterLogo(),
              ),

            ),
          ];
        },
        body: ListView.builder(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),

      ),
    );
  }
}




class ChatMessage {
  String text;
  DateTime time;

  ChatMessage({required this.text, required this.time});
}





class MyApp extends StatelessWidget {
  bool isContr = true;
  bool _isScrollEnabled = false;
  @override
  Widget build(BuildContext context) {
    final title = 'GeeksforGeeks';
    final ScrollController scrollController = ScrollController();

    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(parent: NeverScrollableScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.network(
                    "https://i.ibb.co/QpWGK5j/Geeksfor-Geeks.png",
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 230,
                backgroundColor: Colors.greenAccent[400],
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  tooltip: 'Menu',
                  onPressed: () {},
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.comment),
                    tooltip: 'Comment Icon',
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    tooltip: 'Setting Icon',
                    onPressed: () {},
                  ),
                ],
              ),
            ];
          },
          body: CustomScrollView(
            // Set the physics property to disable scrolling for the body
            physics: _isScrollEnabled ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ],
          ),
        ),
        ),


    );
  }
}

