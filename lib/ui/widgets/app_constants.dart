import '../utils/app_assets.dart';

abstract final class AppConstants {
  static final List<Map<String, String>> pages = [
    {
      "image": AppAssets.slide1Img,
      "desc": "منظومة مبتكرة لتيسير خدمة الطالب",
    },
    {
      "image": AppAssets.slide2Img,
      "desc": "إنتظار أقل ... خدمة أسرع",
    },
    {
      "image": AppAssets.slide3Img,
      "desc": "منصة إدارة خدمات الطلاب",
    },
  ];
}