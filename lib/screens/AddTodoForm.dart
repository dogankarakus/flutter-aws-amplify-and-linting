import "package:amplify_flutter/amplify_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_with_aws/models/ModelProvider.dart";

class AddTodoForm extends StatefulWidget {
  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveTodo() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    Todo newTodo = Todo(
        name: name, description: description, isCompleted: false, id: null);

    try {
      await Amplify.DataStore.save(newTodo);
      Navigator.of(context).pop();
    } catch (e) {
      print("An error occurred while saving Todo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFC),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFBFC),
        elevation: 0.0,
        foregroundColor: Color(0xff303030),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 12.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: const Color(0xff303030).withOpacity(0.25),
                            offset: Offset(0, 4))
                      ]),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          textAlign: TextAlign.start,
                          controller: _nameController,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "add title",
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xff303030).withOpacity(0.5)),
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 12.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: const Color(0xff303030).withOpacity(0.25),
                            offset: const Offset(0, 4))
                      ]),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20)
                          ],
                          textAlign: TextAlign.start,
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "add description",
                            hintStyle: TextStyle(
                                fontSize: 20,
                                color: Color(0xff303030).withOpacity(0.5)),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 162, height: 51),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff8C9EFF),
                        ),
                      ),
                      onPressed: _saveTodo,
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            color: Color(0xffFAFAFA),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
