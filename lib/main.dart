import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: "Pacifico"),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, String> countriesCodes = {
    'Egypt': '+20',
    'KSA': '+966',
    'UAE': '+971',
  };
  TextEditingController email = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? dropdown;

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 300,
                  height: 100,
                  child: Image.asset("assets/images/eat.jpg"),
                ),
              ),
              Text("Ahmed Salem"),
              Switch(
                splashRadius: 100,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                    if(value == true){
                      exit(0);
                    }
                  });
                  print(value);
                },
              ),
              // SwitchListTile(
              //   value: switchValue,
              //   onChanged: (value) {
              //     setState(() {
              //       switchValue = value;
              //     });
              //     print(value);
              //   },
              // ),
              // CheckboxListTile(value: switchValue, onChanged: (value) {
              //   setState(() {
              //     switchValue = value!;
              //   });
              //   print(value);
              // }),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  }
                  return "field is required";
                },
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.lock),
                  ),
                  labelText: "Enter email",
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField(
                items: countriesCodes
                    .map(
                      (String countryName, countryCode) =>
                      MapEntry(
                        countryName,
                        DropdownMenuItem(
                          value: countryCode,
                          child: Row(
                            children: [Text(countryName), Text(countryCode)],
                          ),
                        ),
                      ),
                )
                    .values
                    .toList(),
                onChanged: (value) {
                  // setState(() {
                  dropdown = value;
                  // });
                  print(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  formKey.currentState!.validate();
                  print(email.text);
                },
                child: Text("press"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text("Email: ${email.text}"),
                  Text("Drop:  ${dropdown}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
