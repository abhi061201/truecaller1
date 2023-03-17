import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:truecaller_sdk/truecaller_sdk.dart';

class homeview extends StatelessWidget {
   homeview({super.key,required this.streamdata});
  late Stream<TruecallerSdkCallback> streamdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home View'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Hii '+ profiledata.profile!.firstName+ " " + profiledata.profile!.lastName.toString())
        ],
      ),
    );
  }
}