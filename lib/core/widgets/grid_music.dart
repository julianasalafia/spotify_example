import 'package:clone_spotify/controller/grid_controller.dart';
import 'package:flutter/material.dart';

import 'music_card.dart';

class GridMusic extends StatelessWidget {
  GridController gridController;

  GridMusic({
    super.key,
    required this.gridController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: gridController.updateNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
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
                    return MusicCard(
                      cardInfoModel: gridController.currentList[index],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
