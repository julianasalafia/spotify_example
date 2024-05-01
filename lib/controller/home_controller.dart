import 'grid_controller.dart';

class HomeController {
  final GridController gridController = GridController();

  chosenMenu(int index) {
    if (index == 0) {
      gridController.filterAlbum();
    } else {
      gridController.filterPodcast();
    }
  }
}
