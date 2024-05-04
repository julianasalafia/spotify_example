import 'dart:convert';

import 'package:clone_spotify/feature/models/filter_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/card_info_model.dart';

class GridController with ChangeNotifier {
  final ValueNotifier<List<CardInfoModel>> filteredList = ValueNotifier([]);
  final ValueNotifier<FilterType> currentFilter = ValueNotifier(FilterType.all);
  final List<CardInfoModel> unfilteredList = [];

  GridController() {
    setCurrentList();
  }

  void setCurrentList() async {
    final String response = await rootBundle.loadString('assets/json/data.json');
    final data = json.decode(response);

    final result = List<CardInfoModel>.from(
      data.map((x) => CardInfoModel.fromJson(x)),
    );

    unfilteredList.clear();
    unfilteredList.addAll(result);

    filteredList.value = getCurrentList(
      type: currentFilter.value,
      list: unfilteredList,
    );
  }

  void setList({required FilterType type}) {
    if (type == currentFilter.value) {
      currentFilter.value = FilterType.all;
    } else {
      currentFilter.value = type;
    }

    filteredList.value = getCurrentList(
      type: currentFilter.value,
      list: unfilteredList,
    );
  }

  List<CardInfoModel> getCurrentList({
    required FilterType type,
    required List<CardInfoModel> list,
  }) {
    switch (type) {
      case FilterType.album:
        return list.where((element) => element.type == 'Álbum').toList();
      case FilterType.podcast:
        return list.where((element) => element.type == 'Podcast').toList();
      default:
        return list;
    }
  }
}
