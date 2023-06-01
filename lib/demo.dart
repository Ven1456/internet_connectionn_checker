import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    FocusNode passwordFocus = FocusNode();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text('Static Widget'),
              ),
            ),
            Container(
              height: 500,
              color: Colors.red,
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       TextFormField(
    //        // enableInteractiveSelection: false,
    //         obscureText: true,
    //         toolbarOptions: const ToolbarOptions(
    //           copy: true,
    //           paste: true,
    //           selectAll: true,
    //           cut: true,
    //         ),
    //         textInputAction: TextInputAction.done,
    //         controller: passwordController,
    //         focusNode: passwordFocus,
    //         onFieldSubmitted: (term){
    //           passwordFocus.unfocus();
    //         },
    //         keyboardType: TextInputType.text,
    //
    //         decoration: const InputDecoration(
    //             hintText: 'Password'),
    //       ),
    //     ],
    //   ),
    // ),
  }
}

class MyHomePage545 extends StatefulWidget {
  @override
  _MyHomePage545State createState() => _MyHomePage545State();
}

class _MyHomePage545State extends State<MyHomePage545> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showTextField = true;
  String _enteredText = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 05 && _showTextField) {
        setState(() {
          _showTextField = false;
          _enteredText = _textController.text;
        });
      } else if (_scrollController.offset < 00 && !_showTextField) {
        setState(() {
          _showTextField = true;
          _enteredText = '';
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(150.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _showTextField
                  ? TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Enter text',
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_enteredText),
                    ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                itemCount: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({
    Key? key,
    required this.iconAsset,
    required this.title,
    this.flag = true,
    this.width,
    this.trailing,
  }) : super(key: key);

  final String iconAsset;
  final String title;
  final Widget? trailing;
  final bool? flag;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 98,
        width: double.infinity,
        color: Colors.white,
        child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SvgPicture.asset(
                iconAsset,
                height: 33,
                width: 33,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(title),
            ),
            trailing: (flag!)
                ? const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      (Icons.add),
                    ),
                  )
                : (flag!)
                    ? const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "StringManager.header",
                        ),
                      )
                    : const SizedBox()));
  }
}

// ignore_for_file: must_be_immutable

class AppButtons extends StatefulWidget {
  bool? isColor = false;
  final Color? textColor;
  final Color? backgroundColor;
  final String? text;
  final TextStyle? textStyle;
  final String? buttonIcon;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  double? size;
  List<Color>? colorList;

  AppButtons(
      {Key? key,
      this.isColor,
      this.textColor,
      this.backgroundColor,
      this.text,
      this.onPressed,
      this.size,
      this.buttonIcon,
      this.colorList,
      this.textStyle,
      this.borderRadius})
      : super(key: key);

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
                onTap: widget.onPressed,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pinkAccent),
                    color: widget.isColor == true
                        ? null
                        : Colors.deepPurple.shade400,
                    gradient: widget.isColor == true
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(12, 15, 15, 1.0), // Black
                              Color.fromRGBO(255, 255, 255, 1.0), // White
                            ],
                            stops: [0.0, 1.0],
                          )
                        : null,
                    borderRadius: widget.borderRadius,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.buttonIcon != null
                          ? Image.asset(
                              widget.buttonIcon.toString(),
                              height: widget.size,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          widget.text ?? '',
                          style: widget.textStyle,
                          // style:
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class MyHomePage12 extends StatelessWidget {
  MyHomePage12({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          pinned: true,
                          floating: true,
                          expandedHeight: 0,
                          title: const Text("Space"),
                          centerTitle: true,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.pink,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/classroom.png"))),
                                child: const Center(
                                    child: Text(
                                  "Today's lesson cancelled",
                                ))),
                          ),
                        )),
                  ];
                },
                body: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ))));

    // return Scaffold(
    //   body: DefaultTabController(
    //     length: 2,
    //     child: NestedScrollView(
    //       headerSliverBuilder: (context, innerBoxIsScrolled) => [
    //         const SliverAppBar(
    //           floating: true,
    //           pinned: true,
    //           title: Text('Title'),
    //
    //         ),
    //       ],
    //       body: MediaQuery.removePadding(
    //         removeTop: true,
    //         context: context,
    //         child: ListView.builder(
    //           itemCount: 24,
    //           itemBuilder: (context, index) => Container(
    //             height: 40,
    //             alignment: Alignment.center,
    //             color: Colors.yellow,
    //             margin: EdgeInsets.only(top: index != 0 ? 8 : 0),
    //             child: Text('Body $index'),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String backgroundImageUrl;

  MySliverPersistentHeaderDelegate({
    required this.title,
    required this.backgroundImageUrl,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class Rt extends StatelessWidget {
  Rt({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false, // Step 1
      body: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Step 2
        child: CustomScrollView(
          controller: _scrollController, // Step 4
          slivers: [
            SliverAppBar(
              pinned: false, // Step 3
              floating: true, // Step 3
              title: const Text('My App Bar'),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                    ),
                    child: const Center(
                        child: Text(
                      "Today's lesson cancelled",
                    ))),
              ),
            ),
            // Add other Sliver widgets here
          ],
        ),
      ),
    );
  }
}

class MyHomePage54556 extends StatefulWidget {
  MyHomePage54556({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePage54556State createState() => _MyHomePage54556State();
}

class _MyHomePage54556State extends State<MyHomePage54556> {
  ScrollController _scrollController = ScrollController();

  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        drawer: Container(),
        key: scaffoldKey,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Container(
                  child: Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.only(top: 10.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: const Icon(
                              Icons.sort,
                              color: Colors.black54,
                            ),
                            onTap: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "What are you looking for?"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              searchController.clear();
                            },
                            child: const Icon(
                              Icons.clear,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                elevation: 10.0,
                automaticallyImplyLeading: false,
                expandedHeight: 70,
                floating: true,
                snap: true,
              )
            ];
          },
          body: ListView(
            children: const <Widget>[
              Text('I\'m dedicating every day to you'),
              Text('Domestic life was never quite my style'),
              Text('When you smile, you knock me out, I fall apart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('I realize I am crazy'),
              Text('I\'m dedicating every day to you'),
              Text('Domestic life was never quite my style'),
              Text('When you smile, you knock me out, I fall apart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('And I thought I was so smart'),
              Text('I realize I am crazy'),
            ],
          ),
        ),
        bottomNavigationBar: _isVisible
            ? Stack(
                children: [
                  BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.card_giftcard),
                        label: 'Offers',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_box),
                        label: 'Account',
                      ),
                    ],
                    currentIndex: 0,
                  ),
                ],
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              )

//                _isVisible
//                  ? bottomNavigationBar()
//                  : Container(
//                      height: 0.0,
//                      width: MediaQuery.of(context).size.width,
//                    ),
        );
  }
}

class helo123 extends StatefulWidget {
  const helo123({Key? key}) : super(key: key);

  @override
  State<helo123> createState() => _helo123State();
}

int _currentIndex = 0;

final List<Widget> _screens = [
  const ScreenOne(),
  const ScreenTwo(),
  const ScreenThree(),
];
ScrollController _scrollController = ScrollController();

class _helo123State extends State<helo123> {
  ScrollController _scrollController = ScrollController();
  var _isVisible;

  @override
  initState() {
    super.initState();
    _isVisible = true;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  _isVisible ? Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(

                controller:_scrollController,

                  children: const <Widget>[
                    Text('I\'m dedicating every day to you'),
                    Text('Domestic life was never quite my style'),
                    Text('When you smile, you knock me out, I fall apart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('I realize I am crazy'),
                    Text('I\'m dedicating every day to you'),
                    Text('Domestic life was never quite my style'),
                    Text('When you smile, you knock me out, I fall apart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),

                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('And I thought I was so smart'),
                    Text('I realize I am crazy'),

                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ],

      ) : const SizedBox(),

    );
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('Screen One'),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('Screen Two'),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Screen Three'),
      ),
    );
  }
}


class MyHomePage855 extends StatefulWidget {
  const MyHomePage855({Key? key}) : super(key: key);

  @override
  _MyHomePage855State createState() => _MyHomePage855State();
}

class _MyHomePage855State extends State<MyHomePage855> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My App'),
              background: Image(
                image: NetworkImage(
                  'https://source.unsplash.com/random/800x200',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 800),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? 56.0 : 0.0,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'My Bottom Bar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10.0,
              bottom: 10.0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollListener();
  }

  void _scrollListener() {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible)
          setState(() {
            _isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
          });
      }
    });
  }
}





class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> contacts = [
    'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',
    'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',  'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',  'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',  'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',  'John Doe (johndoe@example.com)',
    'Jane Smith (janesmith@example.com)',
    'Bob Johnson (bobjohnson@example.com)',
    'Alice Brown (alicebrown@example.com)',
    'Mike Davis (mikedavis@example.com)',

  ];

   Offset? _tapPosition;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(contact.split(' ')[0]),
            subtitle: Text(contact.split(' ')[1]),
            trailing:  GestureDetector(
              behavior: HitTestBehavior.opaque,
                onTapDown: (TapDownDetails downDetails){
                   downDetails.globalPosition;
                  _showMenu(context, downDetails.globalPosition);
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text("data"),
                      ),
                      Icon(Icons.arrow_forward,semanticLabel: ("dfghfhs"),),
                    ],
                  ),
                )),


          );
        },
      ),
    );
  }

  void _showMenu1(BuildContext context, Offset tapPosition) async {
    double topPadding = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    double offsetY = tapPosition.dy - _scrollController.offset - topPadding - appBarHeight;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        tapPosition.dx,
        offsetY,
        tapPosition.dx + 1,
        offsetY + 1,
      ),
      items: <PopupMenuEntry>[
        const PopupMenuItem(
          value: 1,
          child: Text('Option 1'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Option 2'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected option $value')),
        );
      }
    });
  }
}

  void _showMenu(BuildContext context, Offset position) async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - 20,
        position.dy + 40,
        position.dx + 56,
        position.dy + 50,),
      items: <PopupMenuEntry>[
        const PopupMenuItem(
          value: 1,
          child: Text('Option 1'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Option 2'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        // Do something with the selected value
      }
    });
  }

