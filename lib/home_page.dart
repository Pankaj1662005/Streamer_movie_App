import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_stream/streamer_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  RewardedAd? rewardedAd;
  int rewardscore = 0;
  bool isRewardEarned = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    loadRewardAds();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void loadRewardAds() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Use your ad unit ID here
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          rewardedAd = null;
        },
      ),
    );
  }

  void showAd() {
    if (rewardedAd != null) {
      rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          setState(() {
            rewardedAd!.dispose();
            loadRewardAds();
          });
        },
      );
      rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          setState(() {
            rewardscore++;
            isRewardEarned = true;
          });
        },
      );
    }
  }

  void openStreamer() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Webviewr()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Streamer",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Made with ❤️ by Shokeen for students",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Centered animated background using Lottie
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
              height: MediaQuery.of(context).size.height * 0.5, // Adjust height as needed
              child: Lottie.asset(
                'assets/animations/Animation - 1722238967015.json', // Ensure the correct path
                fit: BoxFit.contain, // Adjust fit as needed
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rewarded Score: $rewardscore',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        _controller.forward().then((_) {
                          _controller.reverse().then((_) {
                            showAd();
                          });
                        });
                      },
                      child: Text('Show Rewarded Ad'),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          // Streamer button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: isRewardEarned
                  ? ScaleTransition(
                scale: _scaleAnimation,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 74, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      _controller.forward().then((_) {
                        _controller.reverse().then((_) {
                          openStreamer();
                        });
                      });
                    },
                    icon: Icon(Icons.arrow_forward, size: 18),
                    label: Text('Open Streamer'),
                  ),
                ),
              )
                  : SizedBox.shrink(), // Empty space if no reward is earned
            ),
          ),
        ],
      ),
      endDrawer: Drawer(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    rewardedAd?.dispose();
    super.dispose();
  }
}
