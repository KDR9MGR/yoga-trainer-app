import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/user_provider.dart';
import '../models/user.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool showLogin = false;
  bool showRegister = false;

  void _showLogin() => setState(() { showLogin = true; showRegister = false; });
  void _showRegister() => setState(() { showRegister = true; showLogin = false; });
  void _showWelcome() => setState(() { showLogin = false; showRegister = false; });

  @override
  Widget build(BuildContext context) {
    if (showLogin) return LoginForm(onBack: _showWelcome);
    if (showRegister) return RegisterForm(onBack: _showWelcome);
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Yoga App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Yoga App', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _showLogin,
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _showRegister,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final VoidCallback onBack;
  const LoginForm({required this.onBack, Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Demo: create a dummy user
      final user = User(
        id: email,
        name: 'Demo User',
        email: email,
        age: 25,
        weight: 70,
        goals: ['Flexibility'],
      );
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      Navigator.pushReplacementNamed(context, '/trainers_list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (val) => email = val ?? '',
                validator: (val) => val == null || !val.contains('@') ? 'Enter a valid email' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final VoidCallback onBack;
  const RegisterForm({required this.onBack, Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  int age = 18;
  double weight = 60;
  List<String> goals = [];
  final List<String> allGoals = ['Flexibility', 'Strength', 'Relaxation', 'Weight Loss'];

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = User(
        id: email,
        name: name,
        email: email,
        age: age,
        weight: weight,
        goals: goals,
      );
      Provider.of<UserProvider>(context, listen: false).setUser(user);
      Navigator.pushReplacementNamed(context, '/trainers_list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (val) => name = val ?? '',
                validator: (val) => val == null || val.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (val) => email = val ?? '',
                validator: (val) => val == null || !val.contains('@') ? 'Enter a valid email' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (val) => age = int.tryParse(val ?? '18') ?? 18,
                validator: (val) => val == null || int.tryParse(val) == null ? 'Enter age' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                onSaved: (val) => weight = double.tryParse(val ?? '60') ?? 60,
                validator: (val) => val == null || double.tryParse(val) == null ? 'Enter weight' : null,
              ),
              const SizedBox(height: 16),
              const Text('Goals'),
              ...allGoals.map((goal) => CheckboxListTile(
                title: Text(goal),
                value: goals.contains(goal),
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      goals.add(goal);
                    } else {
                      goals.remove(goal);
                    }
                  });
                },
              )),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
