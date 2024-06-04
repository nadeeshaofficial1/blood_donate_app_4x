import 'package:auth_firebase/home_screen.dart';
import 'package:flutter/material.dart';

class BecomeDonorPage extends StatelessWidget {
  const BecomeDonorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Become a donor',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              DonorForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find Donor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Donor',
          ),
        ],
        currentIndex: 0, // Update as per current index
        onTap: (index) {
          // Handle navigation based on index
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
            // Navigate to Find Donor page
          } else if (index == 2) {
            // Navigate to Request page
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BecomeDonorPage()),
            );
          } else if (index == 4) {
            // Navigate to Donor page
          }
        },
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Become a donor',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class DonorForm extends StatefulWidget {
  const DonorForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DonorFormState createState() => _DonorFormState();
}

class _DonorFormState extends State<DonorForm> {
  String _gender = 'Male';
  String _bloodGroup = 'B+';
  bool _isContactVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            labelText: 'E-Mail',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Gender', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text('Male'),
                leading: Radio(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Female'),
                leading: Radio(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value.toString();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Select Blood Group', style: TextStyle(fontSize: 16)),
        Wrap(
          spacing: 8.0,
          children: [
            BloodGroupChip(
              label: 'A+',
              isSelected: _bloodGroup == 'A+',
              onTap: () {
                setState(() {
                  _bloodGroup = 'A+';
                });
              },
            ),
            BloodGroupChip(
              label: 'A-',
              isSelected: _bloodGroup == 'A-',
              onTap: () {
                setState(() {
                  _bloodGroup = 'A-';
                });
              },
            ),
            BloodGroupChip(
              label: 'B+',
              isSelected: _bloodGroup == 'B+',
              onTap: () {
                setState(() {
                  _bloodGroup = 'B+';
                });
              },
            ),
            BloodGroupChip(
              label: 'B-',
              isSelected: _bloodGroup == 'B-',
              onTap: () {
                setState(() {
                  _bloodGroup = 'B-';
                });
              },
            ),
            BloodGroupChip(
              label: 'O+',
              isSelected: _bloodGroup == 'O+',
              onTap: () {
                setState(() {
                  _bloodGroup = 'O+';
                });
              },
            ),
            BloodGroupChip(
              label: 'O-',
              isSelected: _bloodGroup == 'O-',
              onTap: () {
                setState(() {
                  _bloodGroup = 'O-';
                });
              },
            ),
            BloodGroupChip(
              label: 'AB+',
              isSelected: _bloodGroup == 'AB+',
              onTap: () {
                setState(() {
                  _bloodGroup = 'AB+';
                });
              },
            ),
            BloodGroupChip(
              label: 'AB-',
              isSelected: _bloodGroup == 'AB-',
              onTap: () {
                setState(() {
                  _bloodGroup = 'AB-';
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              value: _isContactVisible,
              onChanged: (value) {
                setState(() {
                  _isContactVisible = value!;
                });
              },
            ),
            const Text('Do you want to make your contact number\nvisible for others?')
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Submit form
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 212, 14, 129),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            ),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class BloodGroupChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function onTap;

  const BloodGroupChip({super.key, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        onTap();
      },
      selectedColor: Colors.red,
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }
}
