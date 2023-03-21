import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  //1st list
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "venkat", "age": 25},
    {"id": 2, "name": "ben", "age": 25},
    {"id": 3, "name": "hel", "age": 56},
    {"id": 4, "name": "hari", "age": 25},
    {"id": 5, "name": "prt", "age": 25},
    {"id": 6, "name": "hod", "age": 56}
  ];
 // 2nd dummy list
  List<Map<String, dynamic>> _fetchUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers = _allUsers;
  }

  void filter(String fetch) {
    List<Map<String, dynamic>> result = [];
    if (fetch.isEmpty) {
      // it will display default list
      result = _allUsers;
    } else {
      // search option logic is here
      result = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(fetch.toLowerCase()))
          .toList();
    }
    setState(() {
      _fetchUsers = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (value) => filter(value),
            decoration: const InputDecoration(
                label: Text("Search"), suffixIcon: Icon(Icons.search_rounded)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _fetchUsers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                    //  key: ValueKey(_fetchUsers[index]['id']),
                      child: ListTile(
                        leading: Text(_fetchUsers[index]["id"].toString()),
                        title: Text(_fetchUsers[index]['name'].toString()),
                        subtitle: Text(_fetchUsers[index]["age"].toString()),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
