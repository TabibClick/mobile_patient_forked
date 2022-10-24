import 'package:flutter/material.dart';
import 'package:health_and_doctor_appointment/generated/l10n.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  new BannerModel(
      S.current.check_disease,
      [
        Color(0xffa1d4ed),
        Color(0xffc0eaff),
      ],
      "assets/414-bg.png"),
  new BannerModel(
      S.current.covid19,
      [
        Color(0xffb6d4fa),
        Color(0xffcfe3fc),
      ],
      "assets/covid-bg.png"),
];
