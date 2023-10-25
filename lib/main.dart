import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ads_test/ads_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Need to set targetApi to 20 or higher
// Update your app's android/app/src/main/AndroidManifest.xml file by adding a <meta-data> tag with the name
//<manifest>
//     <application>
//         <!-- Sample AdMob app ID: ca-app-pub-3940256099942544~3347511713 -->
//         <meta-data
//             android:name="com.google.android.gms.ads.APPLICATION_ID"
//             android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
//     </application>
// </manifest>

//Ios, In your app's ios/Runner/Info.plist file, add;
// <key>GADApplicationIdentifier</key>
// <string>ca-app-pub-################~##########</string>

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //need to init ads before use
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdsView(),
    );
  }
}
