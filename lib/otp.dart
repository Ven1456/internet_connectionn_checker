import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Pinput Example'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        body:
        const FractionallySizedBox(widthFactor: 1, child: PinputExample()),
      ),
    ),
  );
}

class Formatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.length <= 3) {
      return oldValue;
    }
    return newValue;
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController(text: 'Hello');
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      length: 10,
      toolbarEnabled: false,
      inputFormatters: [Formatter()],
    );
  }
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({Key? key}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    // return TextField(
    //   contextMenuBuilder: (_, EditableTextState editableTextState) {
    //     print('HEHE');
    //     return AdaptiveTextSelectionToolbar(
    //       anchors: editableTextState.contextMenuAnchors,
    //       children: editableTextState.contextMenuButtonItems.map((ContextMenuButtonItem buttonItem) {
    //         return CupertinoButton(
    //           borderRadius: null,
    //           color: const Color(0xffaaaa00),
    //           disabledColor: const Color(0xffaaaaff),
    //           onPressed: buttonItem.onPressed,
    //           padding: const EdgeInsets.all(10.0),
    //           pressedOpacity: 0.7,
    //           child: SizedBox(
    //             width: 200.0,
    //             child: Text(
    //               CupertinoTextSelectionToolbarButton.getButtonLabel(context, buttonItem),
    //             ),
    //           ),
    //         );
    //       }).toList(),
    //     );
    //   },
    // );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
            },
            child: const Text('Validate'),
          ),
        ],
      ),
    );
  }
}
class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  ScrollController _hideButtonController = ScrollController();

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if(_isVisible)
          setState(() {
            _isVisible = false;
            print("**** $_isVisible up");
          });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if(!_isVisible)
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kfkldfgd"),
      ),
      body: Center(
          child: CustomScrollView(
            controller: _hideButtonController,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      const Text('I\'m dedicating every day to you'),
                      const Text('Domestic life was never quite my style'),
                      const Text('When you smile, you knock me out, I fall apart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('And I thought I was so smart'),
                      const Text('I realize I am crazy'),
                    ],
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisible ? 60.0 : 0.0,
        child: _isVisible
            ? BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "dssfd",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: "dssfd",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "dssfd",
            ),
          ],
          currentIndex: 0,

        )
            : Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
        ),
      ),

    );
  }
}




