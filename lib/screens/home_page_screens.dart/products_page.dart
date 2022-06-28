import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/providers/posts.dart';
import 'package:furniture_app/screens/product_description_screen.dart';
import 'package:furniture_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/custom_dialogs.dart';
import '../image_screen.dart';
import '../post_description_screen.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _selectedChip = 0;
  bool _isLoading = false;
  bool _hasCrashed = false;

  @override
  void initState() {
    super.initState();
    getProducts();
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

  Future<void> getProducts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Posts>(context, listen: false).getProducts();
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
    final postsData = Provider.of<Posts>(context, listen: true);
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
                      onPressed: getProducts,
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
                  itemCount: postsData.products.length,
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
                            ProductDescriptionScreen.ROUTE_NAME,
                            arguments: postsData.products[i],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  postsData.products[i].name,
                                  style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                subtitle: Text(
                                  '${postsData.products[i].material}',
                                ),
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
                                            '${postsData.products[i].id}',
                                            postsData.products[i].imgUrl,
                                          );
                                        },
                                      ));
                                    },
                                    child: Hero(
                                      tag: '${postsData.products[i].id}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            kBorderRadius),
                                        child: Banner(
                                          location: BannerLocation.topEnd,
                                          color: mainColor,
                                          message:
                                              '\$${postsData.products[i].cost.toStringAsFixed(1)}',
                                          child: Image.network(
                                            postsData.products[i].imgUrl,
                                            width: screenWidth,
                                            fit: BoxFit.fill,
                                          ),
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
                                    //       // _launchUrl(postsData.products[i].link);
                                    //     },
                                    //     label: Text('Vist'),
                                    //     icon: Icon(Icons.link),
                                    //   ),
                                    // ),
                                    VerticalDivider(),
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
