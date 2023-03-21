import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =  TextEditingController();
    FocusNode passwordFocus = FocusNode();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
             // enableInteractiveSelection: false,
              obscureText: true,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                paste: true,
                selectAll: true,
                cut: true,
              ),
              textInputAction: TextInputAction.done,
              controller: passwordController,
              focusNode: passwordFocus,
              onFieldSubmitted: (term){
                passwordFocus.unfocus();
              },
              keyboardType: TextInputType.text,

              decoration: const InputDecoration(
                  hintText: 'Password'),
            ),
          ],
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
    this.width, this.trailing,
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
            padding:  const EdgeInsets.only(left: 25),
            child: SvgPicture.asset(
              iconAsset,
              height: 33,
              width: 33,
            ),
          ),
          title: Padding(
            padding:  const EdgeInsets.only(bottom: 10),
            child: Text(title),
          ),

          trailing: (flag!)
              ? const Padding(
            padding:  EdgeInsets.only(right: 20),
            child: Icon(
            (Icons.add),
            ),
          )
              : (flag!) ?const Padding(
            padding:  EdgeInsets.only(right: 20),
            child: Text(
              "StringManager.header",
            ),
          ) :  const SizedBox()
      )
    );
  }
}

class AppButtons extends StatefulWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final String? text;
  final TextStyle? textStyle;
  final Icon? buttonIcon;

  final VoidCallback? onPressed;
  double? size;
  List<Color>? colorList;

  AppButtons(
      {Key? key,
        this.textColor,
        this.backgroundColor,
        this.text,
        this.onPressed,
        this.size,
        this.buttonIcon,
        this.colorList,
        this.textStyle})
      : super(key: key);

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
          height: 100,
          width: 630,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: widget.backgroundColor,
            gradient: widget.backgroundColor == null
                ? LinearGradient(colors: widget.colorList!)
                : null,
            borderRadius: BorderRadius.circular(30),
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
              const Spacer(),
              Text(
                widget.text ?? '',
                style: widget.textStyle,
                // style:
              ),
              const Spacer(),

            ],
          ),
        ));
  }
}

TextStyle getTextStyleUnspecifiedSize({
  Color fontColor = Colors.purpleAccent,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return TextStyle(
      color: fontColor,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      fontSize: fontSize);
}


