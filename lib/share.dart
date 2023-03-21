import 'package:flutter/material.dart';
import 'package:internet_connectionn_checker/demo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Share extends StatefulWidget {
  const Share({Key? key}) : super(key: key);

  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {
  final username = TextEditingController();
  final password = TextEditingController();

  SharedPreferences? login;
  bool? newUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Your password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
              String user = username.text;
              String pass = password.text;

              if(user != "" && pass != "")
                {
                  login?.setBool("login", false);
                  login?.setString("username", username.toString());

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ShareOutput()));
                }
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
  Future<void> CheckUserLogin() async {
    login =  await SharedPreferences.getInstance();
    newUser= (login?.getBool("login") ?? true);

    if(newUser == false)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ShareOutput()));
      }
  }
}


class ShareOutput extends StatefulWidget {
  const ShareOutput({Key? key}) : super(key: key);

  @override
  State<ShareOutput> createState() => _ShareOutputState();
}

class _ShareOutputState extends State<ShareOutput> {
  SharedPreferences? login;
  String? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Intial();

  }

 void Intial()
  async {
    login = await SharedPreferences.getInstance();
    setState(() {
      user=login!.getString("user");
    });
  }
  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$user"),
          ElevatedButton(onPressed: () {
            login?.setBool("login", true);
          }, child: const Text(("Logout"))),

        ],
      ),
    );
  }
}
