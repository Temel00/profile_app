import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String phone;
  String email;
  String description;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.description,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Assuming you have a User class
  User user = User(
    firstName: 'John',
    lastName: 'Doe',
    phone: '123-456-7890',
    email: 'john.doe@example.com',
    description: 'Flutter Developer',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar_placeholder.jpg'),
            ),
            SizedBox(height: 20),
            // Editable TextFields
            EditableField(
              user: user,
              field: 'Full Name',
              onUpdate: (newValue) {
                setState(() {
                  user = newValue;
                });
              },
            ),
            EditableField(
              user: user,
              field: 'Phone',
              onUpdate: (newValue) {
                setState(() {
                  user = newValue;
                });
              },
            ),
            EditableField(
              user: user,
              field: 'Email',
              onUpdate: (newValue) {
                setState(() {
                  user = newValue;
                });
              },
            ),
            EditableField(
              user: user,
              field: 'Description',
              onUpdate: (newValue) {
                setState(() {
                  user = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditableField extends StatelessWidget {
  final User user;
  final String field;
  final Function(User) onUpdate;

  EditableField(
      {required this.user, required this.field, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigate to the respective editing page
        User updatedUser = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditFieldPage(user: user, field: field),
          ),
        );

        if (updatedUser != null) {
          onUpdate(updatedUser);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          _getFieldValue(), // <-- Call the method here
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  String _getFieldValue() {
    switch (field) {
      case 'Full Name':
        return '${user.firstName} ${user.lastName}';
      case 'Phone':
        return user.phone;
      case 'Email':
        return user.email;
      case 'Description':
        return user.description;
      default:
        return '';
    }
  }
}

class EditFieldPage extends StatefulWidget {
  final User user;
  final String field;

  EditFieldPage({required this.user, required this.field});

  @override
  _EditFieldPageState createState() => _EditFieldPageState();
}

class _EditFieldPageState extends State<EditFieldPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _getFieldValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.field}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: widget.field),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field cannot be empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateUser();
                Navigator.pop(context, widget.user);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUser() {
    String newValue = _controller.text;

    switch (widget.field) {
      case 'Full Name':
        List<String> names = newValue.split(' ');
        widget.user.firstName = names.first;
        widget.user.lastName = names.length > 1 ? names.last : '';
        break;
      case 'Phone':
        widget.user.phone = newValue;
        break;
      case 'Email':
        widget.user.email = newValue;
        break;
      case 'Description':
        widget.user.description = newValue;
        break;
    }
  }

  String _getFieldValue() {
    switch (widget.field) {
      case 'Full Name':
        return '${widget.user.firstName} ${widget.user.lastName}';
      case 'Phone':
        return widget.user.phone;
      case 'Email':
        return widget.user.email;
      case 'Description':
        return widget.user.description;
      default:
        return '';
    }
  }
}
