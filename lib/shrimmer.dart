import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Wrap the widget you want to add the shimmer effect to with a Shimmer widget
class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 200, maxHeight: 600, minWidth: 600, maxWidth: 600),
            child: Shimmer(
              direction: ShimmerDirection.rtl,
              period: const Duration(seconds: 4),
              // specify the duration of the shimmer animation

              gradient: LinearGradient(
                colors: [
                  Colors.blue[300] ?? Colors.white,
                  Colors.pink[100] ?? Colors.white,
                  Colors.red[300] ?? Colors.white,
                ],
                stops: const [
                  0.0,
                  0.5,
                  1.0,
                ],
                begin: const Alignment(-0.2, -0.5),
                end: const Alignment(1.0, 0.5),
              ),
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 200, maxHeight: 600, minWidth: 600, maxWidth: 600),
            child: Shimmer(
              direction: ShimmerDirection.rtl,
              period: const Duration(seconds: 4),
              // specify the duration of the shimmer animation

              gradient: LinearGradient(
                colors: [
                  Colors.blue[300] ?? Colors.white,
                  Colors.pink[100] ?? Colors.white,
                  Colors.red[300] ?? Colors.white,
                ],
                stops: const [
                  0.0,
                  0.5,
                  1.0,
                ],
                begin: const Alignment(-0.2, -0.5),
                end: const Alignment(1.0, 0.5),
              ),
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: const Text(
                'Shimmer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      routes: <String, WidgetBuilder>{
        'loading': (_) => LoadingListPage(),
        'slide': (_) => SlideToUnlockPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Loading List'),
            onTap: () => Navigator.of(context).pushNamed('loading'),
          ),
          ListTile(
            title: const Text('Slide To Unlock'),
            onTap: () => Navigator.of(context).pushNamed('slide'),
          )
        ],
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading List'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[420] ?? Colors.grey,
                highlightColor: Colors.grey[100] ?? Colors.grey,
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 150.0,
                              height: 120.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.0),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 8.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  itemCount: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _enabled = !_enabled;
                    });
                  },
                  child: Text(
                    _enabled ? 'Stop' : 'Play',
                    style: Theme
                        .of(context)
                        .textTheme
                        .button
                        ?.copyWith(
                        fontSize: 18.0,
                        color: _enabled ? Colors.redAccent : Colors.green),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class SlideToUnlockPage extends StatelessWidget {
  final List<String> days = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.now();
    final int hour = time.hour;
    final int minute = time.minute;
    final int day = time.weekday;
    final int month = time.month;
    final int dayInMonth = time.day;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide To Unlock'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48.0,
            right: 0.0,
            left: 0.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10
                        ? '0$minute'
                        : '$minute'}',
                    style: const TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
                    style: const TextStyle(fontSize: 24.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 24.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Shimmer.fromColors(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/chevron_right.png',
                          height: 20.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                        ),
                        const Text(
                          'Slide to unlock',
                          style: TextStyle(
                            fontSize: 28.0,
                          ),
                        )
                      ],
                    ),
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    loop: 3,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ShimmerPractice extends StatefulWidget {
   ShimmerPractice({Key? key}) : super(key: key);

  @override
  State<ShimmerPractice> createState() => _ShimmerPracticeState();
}

class _ShimmerPracticeState extends State<ShimmerPractice> {
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Column(

            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[400] ?? Colors.grey,
                  highlightColor:  Colors.grey[350] ?? Colors.grey,
                  enabled: isEnable,
                  period: const Duration(seconds: 03),
                  child: ListView.builder(itemBuilder: (_,con) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 200,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 10,
                                width: 100,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Colors.white,
                              ),


                            ],
                          ),
                        ),


                      ],
                    );
                  },
                    itemCount: 20,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isEnable ?Colors.black : Colors.red,
        onPressed: (){
          setState(() {
            isEnable =!isEnable;
          });
        },
        child: Text(isEnable ? "Stop" : "Start" ,style:TextStyle( color: isEnable ?Colors.red : Colors.yellowAccent)  ,),
      ),
    );
  }
}

class ApiShimmer extends StatefulWidget {
  const ApiShimmer({Key? key}) : super(key: key);

  @override
  State<ApiShimmer> createState() => _ApiShimmerState();
}

class _ApiShimmerState extends State<ApiShimmer> {
  bool isEnable = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Column(

            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[500] ?? Colors.grey,
                  highlightColor:  Colors.grey[500] ?? Colors.grey,
                  enabled: isEnable,
                  period: const Duration(seconds: 03),
                  child: ListView.builder(itemBuilder: (_,con) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 45,
                              width: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 20,
                          child: Column(
                            children: [
                              const SizedBox(height: 12,width: 12,),
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 200,
                                    color: Colors.white,
                                  ),

                                ],
                              ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 200,
                                color: Colors.white,
                              ),
                            ],
                          ),
                              const SizedBox(height: 20,),

                            ],
                          ),
                        ),


                      ],
                    );
                  },
                    itemCount: 50,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
