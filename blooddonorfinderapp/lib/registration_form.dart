import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedBloodGroup;

  // Controllers
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _birthdateController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final messenger = ScaffoldMessenger.of(context);

    if (_formKey.currentState!.validate()) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Creating account...')),
      );

      try {
        // Firebase Authentication - Account Creation
        final UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final uid = userCredential.user!.uid;

        // Firebase Realtime Database - Donor Data
        final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('donors').child(uid);

        Map<String, String> donorData = {
          'name': _nameController.text.trim(),
          'contact': _contactController.text.trim(),
          'email': _emailController.text.trim(),
          'birthdate': _birthdateController.text.trim(),
          'address': _addressController.text.trim(),
          'bloodGroup': selectedBloodGroup ?? '',
        };

        await dbRef.set(donorData);

        messenger.showSnackBar(
          const SnackBar(content: Text('Donor registered successfully!')),
        );

        _formKey.currentState!.reset();
        setState(() {
          selectedBloodGroup = null;
        });
      } on FirebaseAuthException catch (e) {
        messenger.showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      } catch (e) {
        messenger.showSnackBar(
          SnackBar(content: Text('Unexpected error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Donor'),
        backgroundColor: const Color(0xFFF53935),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Full Name', controller: _nameController),
              const SizedBox(height: 16),
              _buildTextField('Contact Number',
                  keyboardType: TextInputType.phone, controller: _contactController),
              const SizedBox(height: 16),
              _buildTextField('Email Address',
                  keyboardType: TextInputType.emailAddress, controller: _emailController),
              const SizedBox(height: 16),
              _buildTextField('Birthdate (DD/MM/YYYY)', controller: _birthdateController),
              const SizedBox(height: 16),
              _buildTextField('Address', controller: _addressController),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Blood Group',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                value: selectedBloodGroup,
                items: bloodGroups.map((String group) {
                  return DropdownMenuItem<String>(
                    value: group,
                    child: Text(group),
                  );
                }).toList(),
                onChanged: (value) => setState(() => selectedBloodGroup = value),
                validator: (value) =>
                value == null ? 'Please select a blood group' : null,
              ),
              const SizedBox(height: 16),
              _buildPasswordField('Password', controller: _passwordController),
              const SizedBox(height: 16),
              _buildPasswordField('Confirm Password',
                  controller: _confirmPasswordController,
                  confirm: true),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF53935),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {TextInputType keyboardType = TextInputType.text,
        required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
    );
  }

  Widget _buildPasswordField(String label,
      {required TextEditingController controller, bool confirm = false}) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        if (confirm && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
