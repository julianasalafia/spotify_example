import 'dart:developer';

import 'package:clone_spotify/core/shared/app_text_styles.dart';
import 'package:clone_spotify/feature/models/card_info_model.dart';
import 'package:clone_spotify/main.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class LastPlay extends StatelessWidget {
  final CardInfoModel cardInfoModel;

  const LastPlay({
    super.key,
    required this.cardInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.deepBlack,
      onTap: () {
        log('Botão clicado: ${cardInfoModel.title}');
      },
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
              child: SizedBox(
                child: Image.asset(
                  cardInfoModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: themeController.value ? AppColors.softBlack : AppColors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.33,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Text(
                      cardInfoModel.title,
                      style:themeController.value ?  AppTextStyles.white12w400 : AppTextStyles.black12w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
