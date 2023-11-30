import 'package:flutter/material.dart';

// The Profile Field Page conditionally renders the appropriate fields and allows the user to input and update their profile information

// Define Callback function types
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
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController(text: widget.initialValue1);
    _controller2 = TextEditingController(text: widget.initialValue2);
    _formKey = GlobalKey<FormState>();
    _imageUrl = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        // Creating Form widget to hold the TextFormFields for user input
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Conditionally render the Name heading text
                if (widget.field == "name")
                  Text(
                    "What's your name?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                // Conditionally render the Phone heading text
                if (widget.field == "phone")
                  Text(
                    "What's your phone number?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                // Conditionally render the Email heading text
                if (widget.field == "email")
                  Text(
                    "What's your email?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                // Conditionally render the Bio heading text
                if (widget.field == "bio")
                  Text(
                    "What type of passenger are you?",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                // Conditionally render the Image heading text
                if (widget.field == "image")
                  Text(
                    "Upload a photo of yourself:",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                // Spacer between Title and Form content
                const SizedBox(
                  height: 26,
                ),
                // Row aligns Name fields next to each other
                Row(
                  children: <Widget>[
                    // Conditionally render the First Name Form Field with TextController1 controlling updating
                    if (widget.field == "name")
                      Expanded(
                        // Container to add border around Text Field
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          //  Text Form Field to hold First Name input
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
                            // First Name field input validation checks for null or empty values
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    // Conditionally render the Phone Form Field with TextController1 controlling updating
                    if (widget.field == "phone")
                      Expanded(
                        // Container to add border around Text Field
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          //  Text Form Field to hold Phone input
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
                            // Phone field input validation checks for null or empty values
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    // Conditionally render the Email Form Field with TextController1 controlling updating
                    if (widget.field == "email")
                      Expanded(
                        // Container to add border around Text Field
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          //  Text Form Field to hold Email input
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
                            // Email field input validation checks for null or empty values
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    // Conditionally render the Bio Form Field with TextController1 controlling updating
                    if (widget.field == "bio")
                      Expanded(
                        // Container to add border around Text Field
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          //  Text Form Field to hold Bio multiline Input
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: null,
                            controller: _controller1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  "Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.",
                              labelStyle:
                                  Theme.of(context).textTheme.labelSmall,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                            style: Theme.of(context).textTheme.bodySmall,
                            validator: (value) {
                              // Bio field input validation checks for null or empty values
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    // Conditionally render the Image Box allowing user to update profile image
                    if (widget.field == "image")
                      Expanded(
                        child: SizedBox(
                            width: 300,
                            height: 200,
                            child: ElevatedButton(
                                onPressed: () {
                                  debugPrint("Image clicked");
                                },
                                child: const Text("Test Image"))),
                      ),
                    const SizedBox(width: 20),
                    // Conditionally render the Last Name Form Field with TextController2 controlling updating
                    if (widget.field == "name")
                      Flexible(
                        // Container to add border around Text Field
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          //  Text Form Field to hold Last Name input
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
                            // Last Name field input validation checks for null or empty values
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

                // Conditionally adjust Gap Size betewen FormFields and Update Button
                if (widget.field == "bio") const SizedBox(height: 150),
                if (widget.field == "name" ||
                    widget.field == "phone" ||
                    widget.field == "email")
                  const SizedBox(height: 230),
                if (widget.field == "image") const SizedBox(height: 90),

                // Column to hold the Update Button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 26),
                        shape: const ContinuousRectangleBorder(),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          widget.updateUserCallback(_controller1.text,
                              _controller2.text, widget.field);
                          // Validate successful, pass the updated value back
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
