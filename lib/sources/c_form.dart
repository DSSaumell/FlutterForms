import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';


void main() {
  runApp(const CForm());
}

class CForm extends StatelessWidget {
  const CForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form (C)',
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

  var countrieOptions = ['Findland', 'Spain', 'United Kingdom'];
  final int maxLenght = 15;
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
                    FormBuilderChoiceChip(
                      name: 'speed',
                      options: const [
                        FormBuilderChipOption(
                          value: 'Flutter',
                          avatar: CircleAvatar(child: FlutterLogo()),
                        ),
                        FormBuilderChipOption(
                          value: 'Android',
                          avatar: CircleAvatar(child: Text(' ')),
                        ),
                        FormBuilderChipOption(
                          value: 'Chrome OS',
                        ),
                      ],
                      // Escollir color de les Opcions
                      backgroundColor: const Color.fromARGB(255, 47, 124, 163),
                      selectedColor: Colors.blueGrey,
                      // Separació horitzontals entre Opcions
                      spacing: 10,
                      // Separació vertical entre Opcions
                      runSpacing: 10,
                      // Distribució equitativa dins del container
                      alignment: WrapAlignment.spaceEvenly,
                      // Decoració pel contenidor d'Opcions
                      decoration: const InputDecoration(
                        labelText: "Choice Chips",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      // Per poder afegir un estil redondejat a les opcions s'ha de fer a partir de shape
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: Colors.transparent),
                      ),
                      onChanged: (String? value) {
                        debugPrint(value);
                      },
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderSwitch(
                      title: const Text('This is a switch'),
                      name: 'switch',
                      initialValue: false,
                      decoration: const InputDecoration(
                        labelText: "Switch",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      onChanged: _onChanged,
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderTextField(
                      name: 'Text Field',
                      decoration: const InputDecoration(
                        labelText: "Text Field",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        prefixIcon: Icon(Icons.text_format_outlined)
                      ),
                      maxLength: maxLenght,
                      // Treiem la funcionalitat de no poder superar el límit
                      maxLengthEnforcement: MaxLengthEnforcement.none,
                      // Posem el text d'error automàtic
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // Afegim els validadors de valor mínim y màxim
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(1),
                        FormBuilderValidators.maxLength(15),
                      ]),
                      // s'hauria d'afegir l'icona inicial del control
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderDropdown(
                      name: 'Dropdown Field',
                      decoration: const InputDecoration(
                        labelText: "DropDown Field",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      items: countrieOptions
                      .map((countrie) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: countrie,
                            child: Text(countrie),
                          ))
                      .toList(),
                    ),
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderRadioGroup<String>(
                      name: "Radio Group",
                      initialValue: null,
                      onChanged: _onChanged,
                      decoration: const InputDecoration(
                        labelText: "Radio Group Model",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      // Creem les opcions automàticamet a partir de la funcionalitat map
                      options: ['1', '2', '3', '4']
                        .map((lang) => FormBuilderFieldOption(
                          value: lang,
                          child: Text(lang),
                        ))
                        .toList(growable: false),
                        orientation: OptionsOrientation.vertical,
                    )
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