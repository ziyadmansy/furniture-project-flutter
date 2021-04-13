import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameFormKey = GlobalKey<FormState>();
  String name = 'Ziyad Mansy';
  DateTime pickedDate = DateTime.now();
  void pickDate() async {
    final now = DateTime.now();
    DateTime selectedDate;
    selectedDate = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(now.year - 100),
      lastDate: DateTime(now.year + 100),
    );
    if (selectedDate != null) {
      setState(() {
        pickedDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: mainColor,
                radius: screenWidth / 6,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 28.0),
              ),
              SizedBox(
                height: 16,
              ),
              Divider(),
              SizedBox(
                height: 16,
              ),
              Container(
                width: screenWidth,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'Name'.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              color: mainColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.edit,
                            ),
                            label: Text('Edit'),
                            style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                    child: Form(
                                      key: _nameFormKey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Edit your Name',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                  color: mainColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Name',
                                                labelText: 'Name',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1,
                                                        )),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: mainColor,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                              validator: (text) {
                                                if (text.isEmpty) {
                                                  return 'Please enter a name';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (text) {
                                                setState(() {
                                                  name = text;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            Container(
                                              height: 48,
                                              width: screenWidth,
                                              child: ElevatedButton.icon(
                                                icon: Icon(
                                                  Icons.save,
                                                ),
                                                label: Text('Save'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: mainColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (_nameFormKey.currentState
                                                      .validate()) {
                                                    _nameFormKey.currentState
                                                        .save();
                                                    Navigator.pop(context);
                                                  }
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: screenWidth,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'Birthdate'.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              color: mainColor,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              '${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.edit,
                            ),
                            label: Text('Edit'),
                            style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              pickDate();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              'Social Media'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: mainColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Website',
                              labelText: 'Website',
                              enabledBorder: kEnabledBorder,
                              focusedBorder: kFocusedBorder,
                              icon: Icon(
                                Icons.web,
                                size: 24,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Linkedin',
                              labelText: 'Linkedin',
                              enabledBorder: kEnabledBorder,
                              focusedBorder: kFocusedBorder,
                              icon: FaIcon(
                                FontAwesomeIcons.linkedin,
                                size: 28,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Facebook',
                              labelText: 'Facebook',
                              enabledBorder: kEnabledBorder,
                              focusedBorder: kFocusedBorder,
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 24,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 40,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.edit,
                              ),
                              label: Text('Save'),
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
