import 'package:clone_spotify/feature/controller/grid_controller.dart';
import 'package:flutter/material.dart';

import 'last_play.dart';

class Grid extends StatelessWidget {
  final GridController gridController;

  const Grid({
    super.key,
    required this.gridController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ValueListenableBuilder(
        valueListenable: gridController.updateList,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).width,
              child: FutureBuilder(
                future: gridController.getCardInfo(),
                builder: (context, snapshot) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3.5,
                    ),
                    itemCount: gridController.currentList.length,
                    itemBuilder: (context, index) {
                      return LastPlay(
                        cardInfoModel: gridController.currentList[index],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
