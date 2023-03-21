import 'package:flutter/material.dart';

class ExpansionClass extends StatefulWidget {
  const ExpansionClass({Key? key}) : super(key: key);

  @override
  State<ExpansionClass> createState() => _ExpansionClassState();
}

class _ExpansionClassState extends State<ExpansionClass> {
  // int currentIndex =2 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ExpansionTile(
        title: const Text('Parent'),
        children: <Widget>[
          ExpansionTile(
            title: const Text('Child 1'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ExpansionTile(
                  leading: const Icon(Icons.chevron_right),
                  trailing: const SizedBox.shrink(),
                  title: const Text("welcome"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ExpansionTile(
                        collapsedBackgroundColor: Colors.grey,
                        leading: const Icon(Icons.chevron_right),
                        trailing: const SizedBox.shrink(),
                        title: const Text("helllo"),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: ExpansionTile(
                              leading: const Icon(Icons.arrow_downward),
                              trailing: const SizedBox.shrink(),
                              title: const Text("helllo"),
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const Text("something")),
                                const Text("something"),
                                const Text("something")
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Text('Grandchild 2'),
            ],
          ),
          const ExpansionTile(
            title: Text('Child 2'),
            children: <Widget>[
              Text('Grandchild 3'),
              Text('Grandchild 4'),
            ],
          ),
        ],
      ),
      // child: ExpansionTile(
      //     title: Text("Click To Open Tile"),
      //     children: screenText.map((data) {
      //       return Column(
      //         children: [
      //           ListTile(
      //             title: Text("demo"),
      //             leading:  Icon(Icons.keyboard_arrow_down_sharp),
      //             onTap: (){
      //               print("ds");
      //             ExpansionTile(
      //               title: Text("Click"),
      //
      //
      //               children: [
      //                 ListTile(
      //                 title: Text(data),
      //               leading: Icon(Icons.keyboard_arrow_down_sharp),
      //               )
      //               ],
      //             );
      //             },
      //           ),
      //           InkWell(
      //             onTap: () {},
      //             child: ListTile(
      //               title: Text(data),
      //               leading: Icon(Icons.keyboard_arrow_down_sharp),
      //             ),
      //           ),
      //         ],
      //       );
      //     }).toList()
      //     // Container(
      //     //   height: 250,
      //     //   child: ListView.builder(
      //     //     shrinkWrap: true,
      //     //     itemCount: screenText.length,
      //     //     itemBuilder: (BuildContext con, int index){
      //     //       return ListTile(
      //     //         title:Text(screenText[index]) ,
      //     //         leading: Icon(Icons.keyboard_arrow_down_rounded),
      //     //
      //     //       );
      //     //     },
      //     //   ),
      //     // )
      //     ),
    ));
  }

  get() {}
}
