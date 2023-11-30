import 'package:flutter/material.dart';
import 'package:profile_app/profile_field_page.dart';
import 'package:http/http.dart' as http;

// The Profile Field widget returns the vertically stacked respective Label and Title that are inside the ListTiles on the HomeScreen
Future<String> fetchImage(http.Client client) async {
  final response = await client.get(Uri.parse(
      "https://firebasestorage.googleapis.com/v0/b/profile-demo-53d30.appspot.com/o/headshot_ph.jpg?alt=media&token=3c1658a9-8378-471f-87a4-9f0d8f4fb8fe"));

  if (response.statusCode == 200) {
    return response.body.toString();
  } else {
    throw Exception('Failed to fetch image');
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circular Profile Image with Border
        CircleAvatar(
          radius: 60,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipOval(
                child: CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(imageURL),
            )),
          ),
        ),
        // Edit Icon Button
        Positioned(
          top: 1,
          right: 1,
          child: ElevatedButton(
              // When Edit button is pressed, navigate to the 'image' ProfilePagField passing user.image
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileFieldPage(
                      initialValue1: imageURL,
                      initialValue2: '',
                      field: "image",
                      updateUserCallback:
                          (String val1, String val2, String val3) {},
                    ),
                  ),
                );
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
    );
  }
}
