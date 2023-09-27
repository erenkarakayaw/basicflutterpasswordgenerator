import 'package:flutter/material.dart';
import 'dart:math';

class PasswordGenerator {
  PasswordGenerator() {}

  static String Generate(int length, bool uppercase, bool special, bool number) {
    String temelalfabe = "abcdefghijklmnoprstuvyzwqx";
    String ozelkarakter = ".\$#-*=";
    String numbers = "0123456789";
    String kullanilacakalfabe = temelalfabe;
    String sifre = "";

    if (uppercase) {
      kullanilacakalfabe += temelalfabe.toUpperCase();
    }
    if (number) kullanilacakalfabe += numbers;
    if (special) kullanilacakalfabe += ozelkarakter;

    for (int i = 0;i < length;i++) {
      Random rnd = Random();
      if (i == 0) sifre += temelalfabe[rnd.nextInt(temelalfabe.length)];
      else {
        sifre += kullanilacakalfabe[rnd.nextInt(kullanilacakalfabe.length)];
      }
    }


    return sifre;
  }
}