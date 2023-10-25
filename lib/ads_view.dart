
import 'package:flutter/material.dart';
import 'package:google_ads_test/google_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsView extends StatefulWidget {
  const AdsView({Key? key}) : super(key: key);

  @override
  _AdsViewState createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {

 GoogleAds googleAds = GoogleAds(); 

 // passing this to loadBannerAd(), when it loads I want to referest this screen to show the banner ad
 refreshScreen(){
  setState(() {
  });
 }

 // displaying snackbar, if and when user watches the whole rewarded ad.
 showReward(){
  ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Congrats you watched the ad.'), // Replace with your desired message.
    duration: Duration(seconds: 3), // Adjust the duration as needed.
  ),
);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Ads'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const SizedBox(width: double.infinity),
          ElevatedButton(
            onPressed: () => googleAds.loadBannerAd(refreshScreen),
            child:const Text('Banner Ad'),
          ),

          //showing banner ad in this position
          if (googleAds.bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  width: googleAds.bannerAd!.size.width.toDouble(),
                  height: googleAds.bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: googleAds.bannerAd!),
                ),
              ),
            ),

            ElevatedButton(onPressed: () =>googleAds.loadInterAd(), child: const Text('Interstitial')),
           
            ElevatedButton(onPressed: () => googleAds.loadRewardAd(showReward), child: const Text('Rewarded')),
        
        ],
      ),
    );
  }
}
