import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/card_info_model.dart';

class GridController with ChangeNotifier {
  final List<CardInfoModel> cardInfo = [];
  List<CardInfoModel> currentList = [];
  final ValueNotifier<int> updateNotifier = ValueNotifier(0);

  GridController() {
    getCardInfo().then((value) {
      cardInfo.addAll(value);
      currentList = cardInfo;
      updateNotifier.value++;
    });
  }

  Future<List<CardInfoModel>> getCardInfo() async {
    final String response = await rootBundle.loadString('assets/json/data.json');
    final data = json.decode(response);
    return List<CardInfoModel>.from(
      data.map((x) => CardInfoModel.fromJson(x)),
    );
  }

  void setList(int value) {
    if (value == -1) {
      showAll();
    } else if (value == 0) {
      filterAlbum();
    } else {
      filterPodcast();
    }
  }

  void filterAlbum() {
    currentList = cardInfo.where((element) => element.type == 'Álbum').toList();
    updateNotifier.value++;
  }

  void filterPodcast() {
    currentList = cardInfo.where((element) => element.type == 'Podcast').toList();
    updateNotifier.value++;
  }

  void showAll() {
    currentList = cardInfo;
    updateNotifier.value++;
  }
}
