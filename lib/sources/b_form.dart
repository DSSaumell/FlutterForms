import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const BForm());
}

class BForm extends StatelessWidget {
  const BForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form (B)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String title = 'David Segura Saumell';
  final _formkey = GlobalKey<FormBuilderState>();
  final TextEditingController autocompleteController = TextEditingController();

  var fase = 0;

  _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormBuilder(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 122, 205, 243),),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 122, 205, 243),),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color.fromARGB(255, 122, 205, 243),)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(width: 2 ,color: Color.fromARGB(255, 18, 35, 66))
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderTextField(
                      name: 'address',
                      maxLines: 4,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.house, color: Color.fromARGB(255, 122, 205, 243)),
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 122, 205, 243)),
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 122, 205, 243))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(width: 2 ,color: Color.fromARGB(255, 18, 35, 66))
                        ),
                      ),
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderTextField(
                      name: 'phone_Number',
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: Color.fromARGB(255, 122, 205, 243)),
                        labelText: 'Mobile No',
                        labelStyle: TextStyle(color: Color.fromARGB(255, 122, 205, 243)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Color.fromARGB(255, 122, 205, 243))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 2 ,color: Color.fromARGB(255, 18, 35, 66))
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload),
        onPressed: () {
          _formkey.currentState?.saveAndValidate();
          String? formString = _formkey.currentState?.value.toString();
          alertDialog(context, formString!);
        }
      ),
    );
  }

  void alertDialog(BuildContext context, String contentText) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Submission Completed'),
        icon: const Icon(Icons.check_circle),
        content: Text(contentText),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Close'),
            child: const Text('Close'),
          ),
        ],
      )
    );
  }
}