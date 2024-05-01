import 'dart:convert';

import 'package:clone_spotify/feature/models/filter_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/card_info_model.dart';

class GridController with ChangeNotifier {
  final List<CardInfoModel> cardInfo = [];
  final ValueNotifier<FilterType> updateList = ValueNotifier(FilterType.all);
  List<CardInfoModel> currentList = [];
  FilterType currentFilter = FilterType.all;

  GridController() {
    getCardInfo().then((value) {
      cardInfo.addAll(value);
      currentList = cardInfo;
      notifyListeners();
    });
  }

  Future<List<CardInfoModel>> getCardInfo() async {
    final String response = await rootBundle.loadString('assets/json/data.json');
    final data = json.decode(response);
    return List<CardInfoModel>.from(
      data.map((x) => CardInfoModel.fromJson(x)),
    );
  }

  void setList({required FilterType type}) {
    if (currentFilter == type) {
      currentFilter = FilterType.all;
      showAll();
    } else {
      currentFilter = type;
      switch (type) {
        case FilterType.album:
          filterAlbum();
          break;
        case FilterType.podcast:
          filterPodcast();
          break;
        default:
          showAll();
          break;
      }
    }
    updateList.value = currentFilter;
  }

  void filterAlbum() {
    currentList = cardInfo.where((element) => element.type == 'Álbum').toList();
    notifyListeners();
  }

  void filterPodcast() {
    currentList = cardInfo.where((element) => element.type == 'Podcast').toList();
    notifyListeners();
  }

  void showAll() {
    currentList = cardInfo;
    notifyListeners();
  }
}
