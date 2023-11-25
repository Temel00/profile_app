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
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.zero,
                title: ProfileField(
                    field: "Name",
                    fieldValue: "${user.firstName} ${user.lastName}"),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.zero,
                title: ProfileField(field: "Phone", fieldValue: user.phone),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.zero,
                title: ProfileField(field: "Email", fieldValue: user.email),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                contentPadding: EdgeInsets.zero,
                title: ProfileField(field: "Bio", fieldValue: user.bio),
              ),
            ]).toList(),
          ),
        ));
  }
}

class ProfileField extends StatelessWidget {
  const ProfileField(
      {super.key, required this.field, required this.fieldValue});

  final String field;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field,
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
