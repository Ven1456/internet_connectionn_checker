import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({Key? key}) : super(key: key);

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Divider(),

            AnimatedSize(duration: const Duration(microseconds: 300),
            curve: Curves.fastOutSlowIn,
              child:isMore ?  Column(
                children: const[
                  Text("dataclass"),
                  Text("data"),
                  Text("eas"),
                  Text("dastard"),
                  Text("dats"),
                  Text("consolidation"),
                  Text("databased"),
                ],
              ): const SizedBox(),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  isMore = !isMore;
                });
              },
              child: isMore ? const Text("More") :const Text("Less")
            )
          ],
        ),
      ),
    );
  }
}
