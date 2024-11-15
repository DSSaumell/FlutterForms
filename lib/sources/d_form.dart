import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const DForm());
}

class DForm extends StatelessWidget {
  const DForm({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form (D)',
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
  static const List<String> countries = <String> ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Congo-Brazzaville)", "Congo (DRC)", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czechia (Czech Republic)", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini (fmr. Swaziland)", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Holy See", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea (North)", "Korea (South)", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (Burma)", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine State", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"];

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
                    // Aquesta seria la part de l'autocompletament del text, però em demana afegir les opcions de desenvolupador al ordinador així que ho deixaré sense la dependència
                    // FormBuilderTypeAhead(
                    //   name: "Countrie", 
                    //   controller: autocompleteController,
                    //   decoration: const InputDecoration(
                    //     labelText: "Where are you from",
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(10))
                    //     ),
                    //   ),
                    //   itemBuilder: (context, suggestion) {
                    //       return ListTile(
                    //         title: Text(suggestion),
                    //       );
                    //     },
                    //   suggestionsCallback: (pattern) {
                    //       return countries.where((country) => country.toLowerCase().startsWith(pattern.toLowerCase())).toList();
                    //     },
                    //   onSelected: (country) {
                    //       autocompleteController.text = country;
                    //     },
                    // ),
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderDateTimePicker(
                      name: 'date_picker',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: DateTime(2024),
                      decoration: const InputDecoration(
                        labelText: 'Date Picker',
                        suffixIcon: Icon(Icons.calendar_month_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      // per que no sorti l'elecció d'hora
                      inputType: InputType.date,
                      format: DateFormat('EEEE, MMMM dd, yyyy'),
                    ),
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2030),
                      format: DateFormat('yyyy-MM-dd'),
                      onChanged: _onChanged,
                      decoration: const InputDecoration(
                        labelText: 'Date Rage',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderDateTimePicker(
                      name: 'time_picker',
                      decoration: const InputDecoration(
                          labelText: 'Time Picker',
                          suffixIcon: Icon(Icons.access_time),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        initialValue: null,
                        format: DateFormat('HH:mm'),
                        // per apareixer directament l'elecció horaria
                        inputType: InputType.time,
                    ),
                    //-------------
                    const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                    FormBuilderChoiceChip<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      name: 'speed',
                      options: const [
                        FormBuilderChipOption(
                          value: 'HTML',
                        ),
                        FormBuilderChipOption(
                          value: 'CSS',
                        ),
                        FormBuilderChipOption(
                          value: 'React',
                        ),
                        FormBuilderChipOption(
                          value: 'Dart',
                        ),
                        FormBuilderChipOption(
                          value: 'TypeScript',
                        ),
                        FormBuilderChipOption(
                          value: 'Angular',
                        ),
                      ],
                      // Escollir color de les Opcions
                      backgroundColor: const Color.fromARGB(255, 66, 164, 212),
                      selectedColor: Colors.blueGrey,
                      // Separació horitzontals entre Opcions
                      spacing: 5,
                      // Separació vertical entre Opcions
                      runSpacing: 5,
                      // Distribució equitativa dins del container
                      alignment: WrapAlignment.spaceEvenly,
                      // Decoració pel contenidor d'Opcions
                      decoration: const InputDecoration(
                        labelText: "Input Chipt (Filter Chip)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                      // Per poder afegir un estil redondejat a les opcions s'ha de fer a partir de shape
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(color: Colors.transparent),
                      ),
                      onChanged: _onChanged,
                      showCheckmark: false,
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