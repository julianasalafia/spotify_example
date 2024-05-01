import 'dart:developer';

import 'package:clone_spotify/core/shared/app_styles.dart';
import 'package:clone_spotify/models/card_info_model.dart';
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
              decoration: const BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.only(
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
                      style: AppStyles.white12w400,
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
