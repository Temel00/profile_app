import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Creating a User Object
class User extends ChangeNotifier {
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

  void setFirstName(String fname) {
    firstName = fname;
  }

  void setLastName(String lname) {
    lastName = lname;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setBio(String bio) {
    this.bio = bio;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor primaryColor =
      const MaterialColor(0xff4169e1, <int, Color>{
    50: Color.fromRGBO(248, 248, 248, 1),
    100: Color.fromRGBO(198, 210, 246, 1),
    200: Color.fromRGBO(154, 175, 239, 1),
    300: Color.fromRGBO(109, 140, 232, 1),
    400: Color.fromRGBO(65, 105, 225, 1),
    500: Color.fromRGBO(32, 76, 207, 1),
    600: Color.fromRGBO(25, 59, 163, 1),
    700: Color.fromRGBO(19, 44, 119, 1),
    800: Color.fromRGBO(12, 28, 75, 1),
    900: Color.fromRGBO(5, 11, 31, 1),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: primaryColor,
            backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
            accentColor: Colors.grey[350]),
        scaffoldBackgroundColor: primaryColor.shade50,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.notoSansKr(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.notoSansKr(
              fontSize: 22, fontWeight: FontWeight.w700, color: primaryColor),
          bodyMedium: GoogleFonts.barlowCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: GoogleFonts.notoSansKr(
            fontSize: 12,
            height: 2,
            color: Colors.grey[400],
          ),
          bodySmall: GoogleFonts.barlowSemiCondensed(
            fontSize: 18,
            height: 2,
            fontWeight: FontWeight.w600,
          ),
          labelSmall: GoogleFonts.notoSansKr(
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = User(
      firstName: 'Micah',
      lastName: 'Smith',
      phone: '208-206-5039',
      email: 'micahsmith@gmail.com',
      bio:
          'Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty',
    );
  }

// Method to update user object in state based on field name
  void updateUser(String updateVal1, String updateVal2, String field) {
    setState(() {
      if (field == "name") {
        user.firstName = updateVal1;
        user.lastName = updateVal2;
      }
      if (field == "phone") {
        user.phone = updateVal1;
      }
      if (field == "email") {
        user.email = updateVal1;
      }
      if (field == "bio") {
        user.bio = updateVal1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      const SizedBox(height: 60),
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
            radius: 60,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: ClipOval(
                  child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.deepOrange[100],
              )),
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
                ),
                child: Icon(Icons.edit,
                    color: Theme.of(context).colorScheme.primary)),
          ),
        ],
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            shrinkWrap: true,
            children: ListTile.divideTiles(
                color: Theme.of(context).colorScheme.secondary,
                context: context,
                tiles: [
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.firstName,
                            initialValue2: user.lastName,
                            field: "name",
                            updateUserCallback: updateUser,
                          ),
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
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.phone,
                            initialValue2: '',
                            field: "phone",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    title: ProfileField(
                        fieldLabel: "Phone", fieldValue: user.phone),
                  ),
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.email,
                            initialValue2: '',
                            field: "email",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    title: ProfileField(
                        fieldLabel: "Email", fieldValue: user.email),
                  ),
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.bio,
                            initialValue2: '',
                            field: "bio",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    title: ProfileField(
                        fieldLabel: "Tell us about yourself",
                        fieldValue: user.bio),
                  ),
                ]).toList(),
          ),
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

typedef UpdateUserCallback = void Function(
    String val1, String val2, String field);

class ProfileFieldPage extends StatefulWidget {
  final String initialValue1, initialValue2, field;
  final UpdateUserCallback updateUserCallback;

  const ProfileFieldPage(
      {super.key,
      required this.initialValue1,
      required this.initialValue2,
      required this.field,
      required this.updateUserCallback});

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.field == "name")
                    Text(
                      "What's your name?",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  if (widget.field == "phone")
                    Text(
                      "What's your phone number?",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  if (widget.field == "email")
                    Text(
                      "What's your email?",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  if (widget.field == "bio")
                    Text(
                      "What type of passenger are you?",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      if (widget.field == "name")
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _controller1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "First Name",
                                labelStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
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
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _controller1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Your phone number",
                                labelStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
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
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _controller1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Your email address",
                                labelStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
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
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: _controller1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Write a little bit about yourself",
                                labelStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
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
                                border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _controller2,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Last Name",
                                labelStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              style: Theme.of(context).textTheme.bodySmall,
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
                        widget.updateUserCallback(
                            _controller1.text, _controller2.text, widget.field);
                        // Validate successful, pass the updated value back
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Update'),
                  ),
                ],
              ))),
    );
  }
}
