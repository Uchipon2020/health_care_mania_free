import 'dart:io';

class AdUnits {
  // true: テスト広告 / false: 本番広告
  static const bool useTestAds = false;

  // テスト用（Google公式）
  static const String _androidTestBanner = 'ca-app-pub-3940256099942544/6300978111';
  static const String _iosTestBanner = 'ca-app-pub-6658769444839234~4262075603';

  // ここに本番の広告ユニットIDを入れる（/ が入っている方）
  static const String _androidProdBanner = 'ca-app-pub-6658769444839234/1966553639';
  static const String _iosProdBanner = 'ca-app-pub-6658769444839234/2797559501';

  static String banner() {
    if (useTestAds) {
      return Platform.isIOS ? _iosTestBanner : _androidTestBanner;
    }

    final prod = Platform.isIOS ? _iosProdBanner : _androidProdBanner;

    // 本番IDが未設定なら事故防止でテストに落とす
    if (prod.startsWith('REPLACE_WITH_')) {
      return Platform.isIOS ? _iosTestBanner : _androidTestBanner;
    }
    return prod;
  }
}
