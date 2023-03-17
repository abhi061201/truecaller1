import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:truecaller1/truecallerLogin.dart';

import 'package:truecaller_sdk/truecaller_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Stream<TruecallerSdkCallback> _stream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = TruecallerSdk.streamCallbackData;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Truecaller Login')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: ()async {
                  TruecallerSdk.initializeSDK(
                      sdkOptions: TruecallerSdkScope.SDK_OPTION_WITH_OTP,
                      consentMode: TruecallerSdkScope.CONSENT_MODE_BOTTOMSHEET,                    
                      );                   
                 bool isUsable = await TruecallerSdk.isUsable;
                 TruecallerSdk.getProfile;
                 if(isUsable)
                 {
                    Get.to(homeview(streamdata: _stream));
                 }
                 else {
                  Fluttertoast.showToast(msg: 'cant login');
                 }
                },
                child: Text('Initialize sdk and get profile'),
              ),
              Divider(
                color: Colors.grey,
                height: Get.height * 0.01,
              ),
              StreamBuilder(
                stream: _stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.result) {
                      case TruecallerSdkCallbackResult.success:
                        {
                          return Text('');
                        }
                      default:
                        {
                          return Text('cant get profile');
                        }
                    }
                  } else {
                    return Text('');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
