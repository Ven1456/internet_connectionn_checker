import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BioMetric extends StatefulWidget {
  const BioMetric({Key? key}) : super(key: key);

  @override
  State<BioMetric> createState() => _BioMetricState();
}

class _BioMetricState extends State<BioMetric> {
  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<bool> checkBiometrics() async {
    try {
      bool canCheckBiometric = await localAuthentication.canCheckBiometrics;
      return canCheckBiometric;
    } catch (e) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    try {
      bool isAuthenticate =
          await localAuthentication.authenticateWithBiometrics(
              localizedReason: "please authenticate using the app",
              useErrorDialogs: true,
              stickyAuth: true);
      return isAuthenticate;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              if (await checkBiometrics()) {
                bool isAuthenticated = await authenticate();
                if (isAuthenticated) {
                  print("user authenticate successfully");
                } else {
                  print("user authenticate failed");
                }
              } else {
                print("Bio metrics not available");
              }
            },
            child: const Text("Click")),
      ),
    );
  }
}

class AppToggle extends StatefulWidget {
  const AppToggle({Key? key}) : super(key: key);

  @override
  State<AppToggle> createState() => AppToggleState();
}

class AppToggleState extends State<AppToggle> {
  bool isSwitched = false;
  var txtValue = 'Public';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          Container(
            height: 25,
            width: 50,
            decoration: (isSwitched)
                ? BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(40))
                : BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40)),
            child: Switch(
                value: isSwitched,
                inactiveThumbColor: Colors.white,
                activeColor: Colors.white,
                trackColor: const MaterialStatePropertyAll(Colors.transparent),
                onChanged: toggleSwitch),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            txtValue,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SharePre extends StatefulWidget {
  const SharePre({Key? key}) : super(key: key);

  @override
  State<SharePre> createState() => _SharePreState();
}

class _SharePreState extends State<SharePre> {
  final TextEditingController textEditingController = TextEditingController();
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController;
    _getText();
  }

  Future<void> _getText() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    setState(() {
      name = share.getString("demo") ?? "";
      textEditingController.text = name;
    });
  }

  Future<void> _saveText() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    setState(() {
      share.setString("demo", name);
      name = textEditingController.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  hintText: "enter", border: OutlineInputBorder()),
            ),
            Text(name),
            ElevatedButton(
                onPressed: () {
                  _saveText();
                  if (kDebugMode) {
                    print(name);
                  }
                },

                // () async {

                // SharedPreferences  sharepref = await SharedPreferences.getInstance();
                // sharepref.setString("demo", textEditingController.toString());
                // setState(() {
                //   name = sharepref.getString("demo").toString();
                // });

                // },
                child: const Text("Click"))
          ],
        ),
      ),
    );
  }
}

class LoginPageUsingShared extends StatefulWidget {
  const LoginPageUsingShared({Key? key}) : super(key: key);

  @override
  State<LoginPageUsingShared> createState() => _LoginPageUsingSharedState();
}

class _LoginPageUsingSharedState extends State<LoginPageUsingShared> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _rememberMe = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }
Future<void> getPref() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = share.getBool("rememberMe") ?? false;
      if(_rememberMe)
        {
          _emailController.text= share.getString("email") ??"";
          _passController.text = share.getString("pass") ?? "";
        }
    });
}
  Future<void> setPref() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    setState(() {
      if(_rememberMe){
        share.setString("email", _emailController.text);
        share.setString("pass", _passController.text);
      }
      else
      {
        share.remove("email");
        share.remove("pass");
      }
      share.setBool("rememberMe", _rememberMe);
    });
  }

  void login(){
    setPref();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SharePre()));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintText: "enter", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                  hintText: "enter", border: OutlineInputBorder()),
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                setState(() {
                  _rememberMe =  value! ;
                });
                  }),
                const Text("Remember Me")
              ],

            ),
            ElevatedButton(onPressed: login, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
