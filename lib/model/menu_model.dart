final String tableMenu = 'menu';
final String columnTitle = 'title';
final String columnPath = 'path';

class MenuModel {
  String title;
  String path;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnPath: path,
    };
    return map;
  }

  MenuModel();

  MenuModel.fromMap(Map<String, dynamic> map) {
    this.title = map[columnTitle];
    this.path = map[columnPath];
  }
}
