import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:health_and_doctor_appointment/generated/l10n.dart';

class CardModel {
  String doctor;
  int cardBackground;
  var cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}

List<CardModel> cards = [
  new CardModel(S.current.cardiologist, 0xFFec407a, FlutterIcons.heart_ant),
  new CardModel(S.current.dentist, 0xFF5c6bc0, FlutterIcons.tooth_mco),
  new CardModel(S.current.eye_special, 0xFFfbc02d, TablerIcons.eye),
  new CardModel(S.current.orthopaedic, 0xFF1565C0, Icons.wheelchair_pickup_sharp),
  new CardModel(S.current.paeditrician, 0xFF2E7D32, FlutterIcons.baby_faw5s),
];