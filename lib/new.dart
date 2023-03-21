import 'package:flutter/material.dart';

class New extends StatelessWidget {
  const New(this.hinttext,
      this.icon,
      this.iconsufix,
      this.isObsecure,
      this.controller,
      {Key? key})
      : super(key: key);
  final String? hinttext;
  final IconData icon;
  final IconData? iconsufix;
  final bool isObsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    bool obsecureText = false;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) {
        //  validator: (item) => item!.contains("@")  ?  null : "Enter a Valid Email",
        if (email!.isEmpty ||
            !RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(email)) {
          return ("please  enter Email-id");
        } else {
          return null;
        }
      },
      autofocus: true,
      controller: controller,
      obscureText: isObsecure,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),
          hintText: hinttext,
          prefixIcon: Icon(icon, color: Colors.green),
          suffixIcon: Icon(iconsufix, color: Colors.green,),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder()),
    );
  }
}

class CustomButton extends StatefulWidget {
  CustomButton(
      {Key? key, required this.text, this.onPressed, required this.iscontainer, required this.istext})
      : super(key: key);
  final String text;
  final VoidCallback? onPressed;
  bool iscontainer = false;
  bool istext = false;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: widget.onPressed,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  widget.iscontainer ? Container(
                    height: 50,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                  ) : SizedBox(),
                  Positioned(
                    top: 20, left: 160,
                    child: Center(
                      child: widget.istext ? Text(
                          widget.text ?? "",
                          style: const TextStyle(
                              color: Colors.black))
                          : SizedBox(),),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  List<String> dropDownList = ["vinay", "tarun", "heel", "abc"];
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            DropdownButton(
              isExpanded: true,
              hint: Text("select one"),
                value: selected,
                items:dropDownList.map((dropdown) {
                  return DropdownMenuItem(
                    child: Text(dropdown),
                    value: dropdown,
                  );
                }).toList(),
                onChanged: (selectedvalue)

                {
                  setState(() {
                    selected = selectedvalue;
                  });
                }

            )
          ],
        ),
      ),
    );
  }
}
