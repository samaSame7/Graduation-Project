import '../utils/app_assets.dart';
import 'faq_dm.dart';

abstract final class AppConstants {
  static final List<FaqDm> faqItems = [
    FaqDm(
        id: 0, title: "السؤال الأول؟", content: "جواب مختصر للسؤال الأول."),
    FaqDm(
        id: 1, title: "السؤال التاني؟", content: "جواب مختصر للسؤال التاني."),
    FaqDm(
        id: 2, title: "السؤال التالت؟", content: "جواب مختصر للسؤال التالت."),
    FaqDm(
      id: 3,
      title: "السؤال الرابع؟",
      content:
      "ده نص طويل توضيحي عشان يبقى شكل الكارد لما يفتح: هذا النص مثال توضيحي يُستخدم لملأ مساحة داخل العنصر. يمكنك تغييره لأي محتوى تريده — تعليمات، تفاصيل خدمة، شروط، خطوات أو أي معلومات أخرى.",
    ),
    FaqDm(id: 4, title: "السؤال الخامس؟", content: "جواب مختصر."),
    FaqDm(id: 5, title: "السؤال السادس؟", content: "جواب مختصر."),
  ];

  static final List<FaqDm> SRtems = [
    FaqDm(id: 0, title: "متطلب 1", content: "تفصيل المتطلب الأول."),
    FaqDm(id: 1, title: "متطلب 2", content: "تفصيل المتطلب الثاني."),
    FaqDm(id: 2, title: "متطلب 3", content: "تفصيل المتطلب الثالث."),
    FaqDm(
      id: 3,
      title: "متطلب 4",
      content:
      "نص توضيحي طويل للمتطلب الرابع لعرض كيف يظهر المحتوى متعدد الأسطر داخل الكارد.",
    ),
  ];

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