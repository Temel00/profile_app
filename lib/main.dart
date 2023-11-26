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
      SizedBox(height: 30),
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
                debugPrint("List Tile Name was clicked");
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(
                  field: "Name",
                  fieldValue: "${user.firstName} ${user.lastName}"),
            ),
            ListTile(
              onTap: () {
                debugPrint("List Tile Phone was clicked");
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(field: "Phone", fieldValue: user.phone),
            ),
            ListTile(
              onTap: () {
                debugPrint("List Tile Email was clicked");
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(field: "Email", fieldValue: user.email),
            ),
            ListTile(
              onTap: () {
                debugPrint("List Tile Bio was clicked");
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              contentPadding: EdgeInsets.zero,
              title: ProfileField(field: "Bio", fieldValue: user.bio),
            ),
          ]).toList(),
        ),
      ),
    ]));
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
