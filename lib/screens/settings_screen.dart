import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSearchFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
        trailing: isSearchFieldVisible
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    isSearchFieldVisible = false;
                  });
                },
                child: Icon(CupertinoIcons.clear),
              )
            : null,
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: CupertinoColors.systemGrey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Settings'),
              background: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.4), BlendMode.darken),
                child: Image.asset(
                  'assets/images/profile_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.all(16),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  color: Colors.orange,
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text('Terms & Conditions'),
                        message: Text('Your terms and conditions here.'),
                        actions: [
                          CupertinoActionSheetAction(
                            child: Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'View Terms & Conditions',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ]),
          ),
          SliverToBoxAdapter(
            child: AnimatedOpacity(
              opacity: isSearchFieldVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: isSearchFieldVisible
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: CupertinoSearchTextField(
                        onSubmitted: (query) {
                          setState(() {
                            isSearchFieldVisible = false;
                          });
                        },
                      ),
                    )
                  : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
