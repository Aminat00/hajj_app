import 'package:flutter/material.dart';

class TaskSheet {
  static show(BuildContext context, Function(String, String) onTap) {
    final GlobalKey<FormState> _formState = GlobalKey();
    final GlobalKey<FormFieldState<String>> _headerKey = GlobalKey();
    final GlobalKey<FormFieldState<String>> _bodyKey = GlobalKey();

    void validate() {
      if (_formState.currentState!.validate()) {
        onTap.call(_headerKey.currentState!.value!, _bodyKey.currentState!.value!);
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Wrap(
            children: [
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    const ListTile(
                      title: Text('Add task:'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        key: _headerKey,
                        initialValue: '',
                        decoration: InputDecoration(hintText: 'Enter task title'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        key: _bodyKey,
                        initialValue: '',
                        decoration: InputDecoration(hintText: 'Enter task description'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: validate,
                        icon: Icon(Icons.add),
                        label: Text("Add task"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
