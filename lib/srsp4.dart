import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String phoneNumber = '';
  String country = '';
  String password = '';
  String email = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NextPage(
          name: name,
          phoneNumber: phoneNumber,
          country: country,
          password: password,
          email: email,
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) => name = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: (value) => phoneNumber = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Country'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
              onSaved: (value) => country = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
              onSaved: (value) => password = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => email = value!,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String country;
  final String password;
  final String email;

  const NextPage({super.key, 
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.password,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Phone Number: $phoneNumber'),
            Text('Country: $country'),
            Text('Password: $password'),
            Text('Email: $email'),
          ],
        ),
      ),
    );
  }
}
