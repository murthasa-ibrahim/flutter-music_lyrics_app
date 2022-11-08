import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
           children: [
            CupertinoSearchTextField()
           ],
        ),
      )),
     );

  }
}