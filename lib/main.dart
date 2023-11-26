import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String phone;
  String email;
  String bio;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.bio,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  User user = User(
    firstName: 'Micah',
    lastName: 'Smith',
    phone: '208-206-5039',
    email: 'micahsmith@gmail.com',
    bio:
        'Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      const SizedBox(height: 30),
      Text(
        "Edit Profile",
        style: Theme.of(
          context,
        ).textTheme.displayMedium,
      ),
      const SizedBox(height: 20),
      Stack(
        children: [
          CircleAvatar(
            radius: 64,
            backgroundColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ClipOval(
                  child: Image.network('https://i.pravatar.cc/150?img=11')),
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: ElevatedButton(
                onPressed: () {
                  debugPrint("Edit Button was clicked");
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                ),
                child: const Icon(Icons.edit, color: Colors.blue)),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFieldPage(
                        initialValue1: user.firstName,
                        initialValue2: user.lastName,
                        field: "name"),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(
                  fieldLabel: "Name",
                  fieldValue: "${user.firstName} ${user.lastName}"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFieldPage(
                      initialValue1: user.phone,
                      initialValue2: '',
                      field: "phone",
                    ),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(fieldLabel: "Phone", fieldValue: user.phone),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFieldPage(
                        initialValue1: user.email,
                        initialValue2: '',
                        field: "email"),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(fieldLabel: "Email", fieldValue: user.email),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFieldPage(
                      initialValue1: user.bio,
                      initialValue2: '',
                      field: "bio",
                    ),
                  ),
                );
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(
                  fieldLabel: "Tell us about yourself", fieldValue: user.bio),
            ),
          ]).toList(),
        ),
      ),
    ]));
  }
}

class ProfileField extends StatelessWidget {
  const ProfileField(
      {super.key, required this.fieldLabel, required this.fieldValue});

  final String fieldLabel;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel,
          style: Theme.of(
            context,
          ).textTheme.labelMedium,
        ),
        Text(fieldValue,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium),
      ],
    );
  }
}

class ProfileFieldPage extends StatefulWidget {
  const ProfileFieldPage(
      {super.key,
      required this.initialValue1,
      required this.initialValue2,
      required this.field});

  final String initialValue1, initialValue2, field;

  @override
  State<ProfileFieldPage> createState() => _ProfileFieldPageState();
}

class _ProfileFieldPageState extends State<ProfileFieldPage> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.initialValue1);
    _controller2 = TextEditingController(text: widget.initialValue2);
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (widget.field == "name") const Text("What's your name?"),
                  if (widget.field == "phone")
                    const Text("What's your phone number?"),
                  if (widget.field == "email") const Text("What's your email?"),
                  if (widget.field == "bio")
                    const Text("What type of passenger are you?"),
                  Row(
                    children: <Widget>[
                      if (widget.field == "name")
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _controller1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(height: 2),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      if (widget.field == "phone")
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _controller1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(height: 2),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      if (widget.field == "email")
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _controller1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(height: 2),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      if (widget.field == "bio")
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _controller1,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(height: 2),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      const SizedBox(width: 20),
                      if (widget.field == "name")
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _controller2,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(height: 2),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Validate successful, pass the updated value back
                        Navigator.pop(context, _controller1.text);
                      }
                    },
                    child: const Text('Update'),
                  ),
                ],
              ))),
    );
  }
}
