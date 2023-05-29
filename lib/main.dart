import 'package:flutter/material.dart';
import "./custom_input.dart";
import "package:email_validator/email_validator.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card Details Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Payment Method'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _authFormKey = GlobalKey<FormState>();
  RegExp exp = RegExp(r'(\w+)');

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Object>> itemsList = [];
    void _handleAuthForm() {
      // signup user
      if (_authFormKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Submitting data..')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _authFormKey,
          child: Column(
            children: [
              // const Text(
              //   "Payment Method",
              //   style: TextStyle(fontSize: 20),
              // ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Card Details",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Enter Your Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                },
              ),
              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                },
                labelText: "Expiry Date",
                hintText: "Enter Expiry To",
                kbt: TextInputType.datetime,
              ),
              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                },
                labelText: "",
                hintText: "Enter Expiry From",
                kbt: TextInputType.datetime,
              ),
              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                  if (value.length < 12 || value.length > 12) {
                    return "Card Number Can not be less or greater than 12 Digits";
                  }
                },
                labelText: "Card No.",
                hintText: "Enter Card Number Here!",
                obscureText: true,
                kbt: TextInputType.number,
              ),
              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                  if (value.length < 3 || value.length > 3) {
                    return "Cvv Length Can't Be less or greater than 3 digits";
                  }
                },
                labelText: "CVV",
                hintText: "Enter 3 Digit CVV Here!",
                obscureText: true,
                kbt: TextInputType.number,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                  label: Text("Email Adress"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Email adress";
                  }
                  if (!EmailValidator.validate(value)) {
                    return "Please Enter a Valid Email Adress";
                  }
                  // if (!value.endsWith(".com")) {
                  //   return "Invalid Email Adress";
                  // }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Street Adress",
                  label: Text("Street Adress"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Street Adress";
                  }
                },
                keyboardType: TextInputType.streetAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Please Enter Your City",
                  label: Text("City"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your City";
                  }
                },
                keyboardType: TextInputType.text,
              ),
              DropdownButton(items: itemsList, onChanged: (_) {}),

              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                },
                labelText: "State/Province",
                hintText: "Enter Your State Name",
                kbt: TextInputType.text,
              ),
              CustomInputField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field Can't be Left Blank";
                  }
                  if (value.length < 6) {
                    return "Zip Code's Length Can't Be less than 6 digits";
                  }
                },
                labelText: "",
                hintText: "Enter Your Sate's Zip Code",
                kbt: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Please Enter Your Country",
                  label: Text("Country"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Country";
                  }
                },
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _handleAuthForm();
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
