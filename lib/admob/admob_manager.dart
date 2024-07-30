class AdmobManager {
  AdmobManager._();

  //====== Key note====================

  // 1: Pubdev.yml
  // #Flutter admob ads
  // google_mobile_ads: ^2.3.0

  // 2: Android Manifest work
  // <uses-permission android:name="com.google.android.gms.permission.AD_ID" />

  // 3: Android Manifest work
  // <meta-data
  // android:name="com.google.android.gms.ads.APPLICATION_ID"
  // android:value="ca-app-pub-3940256099942544~3347511713"/>
  //
  // <!--  <meta-data
  // android:name="com.google.android.gms.ads.APPLICATION_ID"
  // android:value="ca-app-pub-8957406679356515~7809599225"/>-->

  // 4: android minimum sdk version is 19

  // 5: IOS Infor.plist work
  // <key>GADApplicationIdentifier</key>
  // <string>ca-app-pub-3940256099942544~3347511713</string>
  // <key>SKAdNetworkItems</key>
  // <array>
  // <dict>
  // <key>SKAdNetworkIdentifier</key>
  // <string>cstr6suwn9.skadnetwork</string>
  // </dict>
  // </array>

  // 6: in main.dart file
  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await MobileAds.instance.initialize();
  //
  //   AdmobManager.loadAppOpenAd();
  //   runApp(MyApp());
  // }

  //  In scaffold
  // resizeToAvoidBottomInset: false,

  //=============== Testing Ids ==================================================
  static final app_id = "ca-app-pub-3940256099942544~3347511713";
  static final app_open_id = "ca-app-pub-3940256099942544/3419835294";
  static final banner_id = "ca-app-pub-3940256099942544/6300978111";
  static final inter_id = "ca-app-pub-3940256099942544/1033173712";
  static final inter_video_id = "ca-app-pub-3940256099942544/8691691433";
  static final rewarded_id = "ca-app-pub-3940256099942544/5224354917";
  static final rewarded_intertitial_id =
      "ca-app-pub-3940256099942544/1033173712";
  static final native_advanced_id = "ca-app-pub-3940256099942544/2247696110";
  static final native_advanced_video_id =
      "ca-app-pub-3940256099942544/1044960115";

//=============== Real Ids ==================================================

// static final String app_id = Platform.isAndroid
//     ? 'ca-app-pub-2972720642664088~1026983237' // android
//     : 'ca-app-pub-2972720642664088~3338038538'; // ios
//
// static final String app_open_id = Platform.isAndroid
//     ? 'ca-app-pub-2972720642664088/6870089432' // android
//     : 'ca-app-pub-2972720642664088/2575621200'; // ios
//
// static final String banner_id = Platform.isAndroid
//     ? 'ca-app-pub-2972720642664088/3214162878' // android
//     : 'ca-app-pub-2972720642664088/9328731810'; // ios
//
// static final String inter_id = Platform.isAndroid
//     ? 'ca-app-pub-2972720642664088/9013284465' // android
//     : 'ca-app-pub-2972720642664088/4750605820'; // ios
//
// static final String rewarded_id = Platform.isAndroid
//     ? 'ca-app-pub-2972720642664088/7317059412' // android
//     : 'ca-app-pub-2972720642664088/3489495046'; // ios

//================ Admob ==============================

}