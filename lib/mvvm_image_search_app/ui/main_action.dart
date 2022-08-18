abstract class MainAction {
  factory MainAction.getImages(String query) = GetImages;

  factory MainAction.addAction() = AddAction;

  factory MainAction.refresh() = Refresh;
}

class GetImages implements MainAction {
  final String query;

  GetImages(this.query);
}

class AddAction implements MainAction {}

class Refresh implements MainAction {}
