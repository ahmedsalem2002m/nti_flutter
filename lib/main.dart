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

class HomeView extends StatelessWidget {
  HomeView({super.key});

  Map<String, String> countriesCodes = {
    'Egypt': '+20',
    'KSA': '+966',
    'UAE': '+971',
  };
  TextEditingController email = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
                  height: 250,
                  child: Image.asset("assets/images/eat.jpg"),
                ),
              ),
              Text("Ahmed Salem"),
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
                      (String countryName, countryCode) => MapEntry(
                        countryName,
                        DropdownMenuItem(
                          value: countryCode,
                          child: Row(
                            children: [
                              Icon(Icons.flag),
                              Text(countryName),
                              Text(countryCode),
                            ],
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState!.validate();
                  print(email.text);
                },
                child: Text("press"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
