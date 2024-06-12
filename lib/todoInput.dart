// ignore: file_names
import 'package:flutter/material.dart';

// Define a custom Form widget.
class UserInputBox extends StatefulWidget {
  const UserInputBox({super.key});

  @override
  State<UserInputBox> createState() => _UserInputBoxState();
}

final todos = <String, bool>{};

// Define a corresponding State class.
// This class holds the data related to the Form.
class _UserInputBoxState extends State<UserInputBox> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dialog userInputBox = Dialog(
        insetPadding: const EdgeInsets.all(10.0),
        child: Container(
          width: 330,
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xDB188BDF),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 330,
                  height: 64,
                  decoration: const ShapeDecoration(
                    color: Color(0xDB188BDF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 91,
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(19),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 200,
                child: Container(
                  width: 330,
                  height: 136,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),

              const Positioned(
                left: 9,
                top: 8,
                child: SizedBox(
                  width: 141,
                  height: 47,
                  child: Text(
                    'Add a new ToDo Item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'matrix',
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 292,
                top: 3,
                child: Container(
                  width: 35,
                  height: 35,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const IconButton(
                    onPressed: null, 
                    icon: Icon(Icons.close)
                  )
                ),
              ),

              Positioned(
                left: 9,
                top: 106,
                child: SizedBox(
                  width: 226,
                  height: 21,
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                        hintText: 'Enter your todo title',
                        hintFadeDuration: Duration(seconds: 1)
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'matrix',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 280,
                top: 158,
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        final newEntry = <String, bool>{myController.text: false};
                        todos.addEntries(newEntry.entries);
                      });
                      print(todos);
                    },
                    child: const Icon(Icons.done_outline_rounded),
                  ),
                ),
              ),
            ],
          ),
        )
      );
    return userInputBox;
  }
}
