import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/providers/posts.dart';
import 'package:furniture_app/screens/image_screen.dart';
import 'package:furniture_app/screens/post_description_screen.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:furniture_app/widgets/custom_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool _isLoading = false;
  bool _hasCrashed = false;

  @override
  void initState() {
    super.initState();
    getPosts();
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

  Future<void> getPosts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Posts>(context, listen: false).getPosts();
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final postsData = Provider.of<Posts>(context, listen: false);
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
                      onPressed: getPosts,
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
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: postsData.posts.length,
                  itemBuilder: (context, i) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                      ),
                      elevation: 8,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            PostsDescriptionScreen.ROUTE_NAME,
                            arguments: postsData.posts[i],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  postsData.posts[i].postTitle,
                                  style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                subtitle: Text(
                                    'Posted on ${postsData.posts[i].publishedDate}'),
                              ),
                              Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return ImageScreen(
                                            '${postsData.posts[i].postId}',
                                            postsData.posts[i].imgUrl,
                                          );
                                        },
                                      ));
                                    },
                                    child: Hero(
                                      tag: '${postsData.posts[i].postId}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        child: Image.network(
                                          postsData.posts[i].imgUrl,
                                          width: screenWidth,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    // Expanded(
                                    //   child: TextButton.icon(
                                    //     onPressed: () {
                                    //       // _launchUrl(postsData.posts[i].link);
                                    //     },
                                    //     label: Text('Visit'),
                                    //     icon: Icon(Icons.link),
                                    //   ),
                                    // ),
                                    // const VerticalDivider(),
                                    // Expanded(
                                    //   child: TextButton.icon(
                                    //     onPressed: () {},
                                    //     label: Text('Buy'),
                                    //     icon: Icon(Icons.shopping_bag),
                                    //   ),
                                    // ),
                                    const VerticalDivider(),
                                    Expanded(
                                      child: TextButton.icon(
                                        onPressed: () async {
                                          await _launchUrl('tel:01023843232');
                                        },
                                        label: Text('Contact'),
                                        icon: FaIcon(FontAwesomeIcons.phone),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
  }
}
