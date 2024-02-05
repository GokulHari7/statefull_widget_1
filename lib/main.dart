import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //stateless widget is created by just typing st and we can choose whether stateless or stateful is needed according to our wish.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.blue),//colors.indigo is the color of navbar and such things but this is not working //Homescreen class is given to a  parameter called home 
        home:ScreenHome() 
    );
  }
}

class ScreenHome extends StatefulWidget {  //this was a stateless widget. to understand the working of statefull widget, we converted to statefull widget by just clicking of stateless and clicked on the bulb and chose 'convert to statefull widget'
ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _textController=TextEditingController();  

  /* texteditingController is a controller for an editable text field which updates the value in the text field when the user 
                                                     modifies it and the controller this to its listeners.We have assigned this controller into a private variable thats why underscore for the variable. */
  String _displayText='Text will be displayed here';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Padding( //here we have wrapped with widget called padding inorder to pad the column
          padding:EdgeInsets.only(  //this is used to specially pad left, right only //EdgeInsets.all(40),//padding of size 40 is done from all (4sides) sides
            left:20,
            right:20
          ),
          child: Container(
            color:Colors.yellow[200], //when we applied color property to the container, we are able to see the woring of padding property on the screen 
            child: Column(children:[ //three widgets are placed inside children which are textfield,elevatedbutton,and text
              TextField(
                controller:_textController, //controller is an object which is used to control several widgets programitically
                decoration:InputDecoration( //for textfield, we have to use input decoration
                border:OutlineInputBorder(),
                hintText:'Type Something',
                )
              ),//privide textfield for the user to text something
              ElevatedButton(onPressed: (){
                print(_textController.text); //the text which is written by the user gets printed in the console with the help of the controller object and textEditingController function
                print('ELEVATED BUTTON PRESSED');
                setState((){ // we have set the displaytext inside setState fn, then only ui understands that the state has changed to this on pressing the elevated button
                  _displayText=_textController.text;
                });
                }, child: Text('Click Here')),
              Text(_displayText)
            ]),
          ),
        ),
      )
    );
  }
}