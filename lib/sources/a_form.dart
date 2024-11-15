import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

void main() {
  runApp(const AForm());
}

class AForm extends StatelessWidget {
  const AForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form (A)',
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
            const FormTitle(),
            FormBuilder(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-------------
                    FormLabelGroup(
                      title: 'Please provide the speed of vehicle',
                      subtitle: 'please select one option given below',
                    ),
                    FormBuilderRadioGroup(
                      decoration: const InputDecoration(border: InputBorder.none), 
                      name: 'speed',
                      orientation: OptionsOrientation.vertical,
                      options: const [
                        FormBuilderFieldOption(value: 'above 40km/h'),
                        FormBuilderFieldOption(value: 'below 40km/h'),
                        FormBuilderFieldOption(value: '0km/h')
                      ],
                      onChanged: (String? value) {
                        debugPrint(value);
                      },
                    ),
                    //-------------
                    FormLabelGroup(
                      title: 'Enter remarks',
                    ),
                    FormBuilderTextField(
                      name: 'remarks',
                      decoration: InputDecoration(
                        hintText: 'Enter your remarks',
                        filled: true,
                        fillColor: Colors.grey[350],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      // S'ha d'afegir el estil de tot l'apartat
                    ),
                    //-------------
                    FormLabelGroup(
                      title: 'Please provide the high speed of the vehicle',
                      subtitle: 'please select one option given below',
                    ),
                    FormBuilderDropdown(
                      name: 'opctions', 
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        hintText: 'Select option',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: 0, child: Text('100km/h')),
                        DropdownMenuItem(value: 1, child: Text('120km/h')),
                        DropdownMenuItem(value: 2, child: Text('140km/h')),
                      ],
                    ),
                    //-------------
                    FormLabelGroup(
                      title: 'Please provide the speed of vehicle past 1 hour',
                      subtitle: 'please seelct one or more options given below',
                    ),
                    FormBuilderCheckboxGroup(
                      name: 'speedHour',
                      options: const [
                        FormBuilderFieldOption(value: '20km/h'),
                        FormBuilderFieldOption(value: '30km/h'),
                        FormBuilderFieldOption(value: '40km/h'),
                        FormBuilderFieldOption(value: '50km/h'),
                      ],
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

class FormLabelGroup extends StatelessWidget {
  FormLabelGroup({super.key, required this.title, this.subtitle});
  
  String title;
  String? subtitle;

  Widget conditionalSubtitle(BuildContext context) {
    if (subtitle != null) {
      return Text(subtitle!,
        style: Theme.of(context).textTheme.labelLarge?.apply(
          fontSizeFactor: 1.25,
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.5) 
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0)
        ),
        Text(title,
          style: Theme.of(context).textTheme.labelLarge?.apply(
            fontSizeFactor: 1.25,
          ),
        ),
        conditionalSubtitle(context)
      ]
    );
  }
}

class FormTitle extends StatelessWidget {
  const FormTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Driving Form',
            style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text('Form exemple', style: Theme.of(context).textTheme.labelLarge),
        ],
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