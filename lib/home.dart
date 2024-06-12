import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:todo_with_flutter/todoInput.dart' as todoInputPage;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
			backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
				backgroundColor: const Color(0xDB188BDF),
        title: const Text(
          'My ToDo',
          
					style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'matrix',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
				
				centerTitle: true,
      ),

			body: ListView.builder(
        itemCount: todoInputPage.todos.length,
        itemBuilder: (context, index) {
          String item = todoInputPage.todos.keys.elementAt(index);
          bool status = todoInputPage.todos[item]!;

          return ListTile(
            title: Checkbox(
              value: status,
              onChanged: (newValue) {
                // Update the map with the new value
                todoInputPage.todos[item] = newValue!;
                // Trigger a rebuild
                setState(() {});
              }
            ),
            trailing: Text(
              item,
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'matrix'
              ),
            )
          );
        }
      ),

			floatingActionButton: FloatingActionButton(
				backgroundColor: const Color(0xDB188BDF),
				shape: const CircleBorder(
					side: BorderSide(
						color: Color.fromRGBO(107, 189, 255, 1),
						width: 2.0,
					),
				),
				onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const todoInputPage.UserInputBox());
        },
				child: const Icon(
					Icons.add,
					size: 50.0,
					color: Color(0xFF1E1E1E),
				),
   		),
		);
  }
}
