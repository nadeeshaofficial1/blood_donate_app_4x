import 'package:flutter/material.dart';

class BloodRequestForm extends StatefulWidget {
  const BloodRequestForm({super.key});

  @override
  _BloodRequestFormState createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  String? _selectedBloodType;

  final List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Blood"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact Information'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact information';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedBloodType,
                decoration: const InputDecoration(labelText: 'Blood Type'),
                items: _bloodTypes.map((String bloodType) {
                  return DropdownMenuItem<String>(
                    value: bloodType,
                    child: Text(bloodType),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBloodType = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a blood type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the request
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Request submitted')),
                    );
                  }
                },
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
