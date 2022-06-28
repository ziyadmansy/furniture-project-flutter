import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/providers/auth.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/widgets/custom_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameFormKey = GlobalKey<FormState>();
  String name = 'Ziyad Mansy';
  DateTime pickedDate = DateTime.now();

  bool _isLoading = false;
  bool _hasCrashed = false;

  @override
  void initState() {
    super.initState();
    // getProfile();
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      errorDialog(
        context: context,
        title: 'Error',
        body: 'Something went wrong!',
      );
    }
  }

  Future<void> getProfile() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final authData = Provider.of<Auth>(context, listen: false);
      // await Provider.of<Auth>(context, listen: false).getProfile(authData.id);
      setState(() {
        _isLoading = false;
        _hasCrashed = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasCrashed = true;
      });
    }
  }

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
    final authData = Provider.of<Auth>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    // final profileData = Provider.of<Auth>(context, listen: true);

    return _isLoading
        ? Center(
            child: appLoader,
          )
        : _hasCrashed
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      INTERNET_WARNING_MESSAGE,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      onPressed: getProfile,
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          width: screenWidth,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
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
                                        authData.profileName,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 40,
                                  //   child: ElevatedButton.icon(
                                  //     icon: Icon(
                                  //       Icons.edit,
                                  //     ),
                                  //     label: Text('Edit'),
                                  //     style: ElevatedButton.styleFrom(
                                  //       primary: mainColor,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(8),
                                  //       ),
                                  //     ),
                                  //     onPressed: () {
                                  //       showModalBottomSheet(
                                  //         context: context,
                                  //         isScrollControlled: true,
                                  //         builder: (context) {
                                  //           return Container(
                                  //             child: Form(
                                  //               key: _nameFormKey,
                                  //               child: Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     16.0),
                                  //                 child: Column(
                                  //                   mainAxisSize:
                                  //                       MainAxisSize.min,
                                  //                   children: [
                                  //                     Padding(
                                  //                       padding:
                                  //                           const EdgeInsets
                                  //                               .all(8.0),
                                  //                       child: Text(
                                  //                         'Edit your Name',
                                  //                         style: TextStyle(
                                  //                           fontWeight:
                                  //                               FontWeight.bold,
                                  //                           fontSize: 24,
                                  //                           color: mainColor,
                                  //                         ),
                                  //                       ),
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 16,
                                  //                     ),
                                  //                     TextFormField(
                                  //                       decoration:
                                  //                           InputDecoration(
                                  //                         hintText: 'Name',
                                  //                         labelText: 'Name',
                                  //                         enabledBorder:
                                  //                             OutlineInputBorder(
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             8),
                                  //                                 borderSide:
                                  //                                     BorderSide(
                                  //                                   color: Colors
                                  //                                       .grey,
                                  //                                   width: 1,
                                  //                                 )),
                                  //                         focusedBorder:
                                  //                             OutlineInputBorder(
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       8),
                                  //                           borderSide:
                                  //                               BorderSide(
                                  //                             color: mainColor,
                                  //                             width: 2,
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       validator: (text) {
                                  //                         if (text.isEmpty) {
                                  //                           return 'Please enter a name';
                                  //                         } else {
                                  //                           return null;
                                  //                         }
                                  //                       },
                                  //                       onSaved: (text) {
                                  //                         setState(() {
                                  //                           name = text;
                                  //                         });
                                  //                       },
                                  //                     ),
                                  //                     SizedBox(
                                  //                       height: 32,
                                  //                     ),
                                  //                     Container(
                                  //                       height: 48,
                                  //                       width: screenWidth,
                                  //                       child:
                                  //                           ElevatedButton.icon(
                                  //                         icon: Icon(
                                  //                           Icons.save,
                                  //                         ),
                                  //                         label: Text('Save'),
                                  //                         style: ElevatedButton
                                  //                             .styleFrom(
                                  //                           primary: mainColor,
                                  //                           shape:
                                  //                               RoundedRectangleBorder(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(
                                  //                                         8),
                                  //                           ),
                                  //                         ),
                                  //                         onPressed: () {
                                  //                           if (_nameFormKey
                                  //                               .currentState
                                  //                               .validate()) {
                                  //                             _nameFormKey
                                  //                                 .currentState
                                  //                                 .save();
                                  //                             Navigator.pop(
                                  //                                 context);
                                  //                           }
                                  //                         },
                                  //                       ),
                                  //                     )
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
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
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: Text(
                                      'City'.toUpperCase(),
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
                                        '${authData.profileCity}',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 40,
                                  //   child: ElevatedButton.icon(
                                  //     icon: Icon(
                                  //       Icons.edit,
                                  //     ),
                                  //     label: Text('Edit'),
                                  //     style: ElevatedButton.styleFrom(
                                  //       primary: mainColor,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(8),
                                  //       ),
                                  //     ),
                                  //     onPressed: () {
                                  //       pickDate();
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   width: screenWidth,
                        //   child: Card(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(kBorderRadius),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(16.0),
                        //       child: Center(
                        //         child: Column(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.stretch,
                        //           children: [
                        //             Center(
                        //               child: Text(
                        //                 'Website'.toUpperCase(),
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.w900,
                        //                   fontSize: 24,
                        //                   color: mainColor,
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 16,
                        //             ),
                        //             TextField(
                        //               decoration: InputDecoration(
                        //                 hintText: 'Website',
                        //                 labelText: 'Website',
                        //                 enabledBorder: kEnabledBorder,
                        //                 focusedBorder: kFocusedBorder,
                        //                 icon: Icon(
                        //                   Icons.web,
                        //                   size: 24,
                        //                   color: Colors.blue,
                        //                 ),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 8,
                        //             ),
                        //             Container(
                        //               height: 40,
                        //               child: ElevatedButton.icon(
                        //                 icon: Icon(
                        //                   Icons.edit,
                        //                 ),
                        //                 label: Text('Visit'),
                        //                 style: ElevatedButton.styleFrom(
                        //                   primary: mainColor,
                        //                   shape: RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         BorderRadius.circular(8),
                        //                   ),
                        //                 ),
                        //                 onPressed: () {
                        //                   _launchUrl(profileData.websiteLink);
                        //                 },
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
