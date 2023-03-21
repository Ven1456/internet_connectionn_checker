import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class Html extends StatefulWidget {
  const Html({Key? key}) : super(key: key);

  @override
  State<Html> createState() => _HtmlState();
}

class _HtmlState extends State<Html> {
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEdit.dispose();
    _focusNode.dispose();
  }

  HtmlEditorController controller = HtmlEditorController();
  TextEditingController textEdit = TextEditingController();
  ScrollController scrollController = ScrollController();
 // final GlobalKey<_HtmlState> _keyEditor = GlobalKey();


  FocusNode _focusNode = FocusNode();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center
        ,
        children: [

          TextField(
            decoration: InputDecoration(
              hintText: "djshdfs",
            ),
            controller: textEdit,
            focusNode: _focusNode,
            onEditingComplete: () {
              _focusNode.addListener(() {
                if (!_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
            },

          ),


          HtmlEditor(
         //   key: _keyEditor,
                  controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                hint: "helllo"
              ),
              //required
                  //other options
                  htmlToolbarOptions: const HtmlToolbarOptions(
                      defaultToolbarButtons: [
                        StyleButtons(),
                        ParagraphButtons(lineHeight: false, caseConverter: false)
                      ]
                  )
              ),
          TextField(
            decoration: InputDecoration(
              hintText: "djshdfs",

            ),

            controller: textEdit,

          ),

        ],
      ),
    );
  }
}

class TextF extends StatelessWidget {
  const TextF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEdit = TextEditingController();

    return TextField(
      controller:textEdit ,
      decoration: InputDecoration(
        hintText: "gdhgad"
      ),
    );
  }
}


