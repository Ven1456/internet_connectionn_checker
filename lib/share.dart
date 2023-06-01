import 'package:dimensions_theme/dimensions_theme.dart';
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


class AddToCartWidget extends StatelessWidget {
  double? height;
  double? width;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget buttonIcon;
  final String? text;
  final String? dollorText;
  bool? showDivider;
  final String? price;
  final TextStyle? textStyle;

  AddToCartWidget({Key? key,
    this.height,
    this.width,
    this.dollorText,
    this.backgroundColor,
    this.borderRadius,
    required this.buttonIcon,
    this.showDivider = false,
    this.text,
    this.textStyle,
    this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          buttonIcon,
          SizedBox(
            width: 10,
          ),
          Text(
            text ?? '',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),

          showDivider!
              ? const VerticalDivider(
            thickness: 1,
            width: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.grey,
          )
              : Container(),

          Row(
            children: [
              Text(
                dollorText ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                price ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String? bankName;
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;
  final Widget? cardTypeIcon;
  final BoxDecoration? decoration;
  final Widget? backgroundImage1;
  final Widget? backgroundImage2;
  final Widget? visaCardBackgroundImage;
  final bool? masterCardDesign;
  final bool? visaCardLogo;
  const CardWidget({
    super.key,
    this.bankName,
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
    this.cardTypeIcon,
    this.decoration,
    this.backgroundImage1,
    this.backgroundImage2,
    this.masterCardDesign,
    this.visaCardLogo,
    this.visaCardBackgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return Stack(
      children: [
        Container(
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
          width: 31,
          child: Padding(
            padding: EdgeInsetsOf(context).only(
              left: DimensionToken.small,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsOf(context).only(
                    top: DimensionToken.small,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          bankName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                          maxLines: 2, // set a max number of lines
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsOf(context).only(
                          left: DimensionToken.small,
                          right: DimensionToken.small,
                        ),
                        child: cardTypeIcon ?? const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
                const SpaceLarge(),
                Padding(
                  padding: EdgeInsetsOf(context).only(
                    bottom: DimensionToken.large,
                  ),
                  child: Text(
                    cardNumber!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "cardHolderName",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 17),
                        child: Text(
                          "expiryDate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsetsOf(context).only(
                            right: DimensionToken.small,
                            bottom: DimensionToken.smaller),
                        child: Text(
                          cardHolderName!,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsOf(context)
                          .only(right: DimensionToken.large),
                      child: Text(
                        expiryDate!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        visaCardLogo ?? false
            ? Positioned(
          bottom: -18,
          right: 5,
          left: 5,
          child: visaCardBackgroundImage ?? const SizedBox.shrink(),
        )
            : const SizedBox.shrink(),
        masterCardDesign ?? false
            ? Positioned(
          left: 128,
          bottom: -33,
          child: backgroundImage1!,
        )
            : const SizedBox.shrink(),
        masterCardDesign ?? false
            ? Positioned(
          right: -10,
          bottom: 0,
          child: backgroundImage2!,
        )
            : const SizedBox.shrink()
      ],
    );
  }
}








// part '_dimension_themes.dart';
//
// final lightTheme = ThemeData(
//   useMaterial3: true,
//   // textTheme: _textTheme,
//   fontFamily: 'Poppins',
//   extensions: [
//     Dimensions(
//       spaces: _spaceDimensions,
//       insets: _insetsDimensions,
//       borderWidths: _borderWidthDimensions,
//       radii: _radiiDimensions,
//     ),
//   ],
//   // appBarTheme: _appBar,
//   // elevatedButtonTheme: _elevatedButton,
//   // textButtonTheme: _textButton,
//   // outlinedButtonTheme: _outlinedButton,
//   // dividerTheme: _divider,
// );