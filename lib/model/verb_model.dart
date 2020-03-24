final String tableVerb = 'verb';
final String columnInfinitiv = 'infinitiv';
final String columnPresent = 'present';
final String columnPerfect = 'perfect';
final String columnPreterite = 'preterite';
final String columnType = 'type';
final String columnMeaning = 'meaning';
final String columnTranslation = 'translation';
final String columnImage = 'image';
final String columnLevel = 'level';

class VerbModel {
  String infinitiv;
  String present;
  String perfect;
  String preterite;
  String type;
  String meaning;
  String translation;
  String image;
  String level;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnInfinitiv: infinitiv,
      columnPresent: present,
      columnPerfect: perfect,
      columnPreterite: preterite,
      columnType: type,
      columnMeaning: meaning,
      columnTranslation: translation,
      columnImage: image,
      columnLevel: level,
    };
    return map;
  }

  VerbModel();

  VerbModel.fromMap(Map<String, dynamic> map) {
    this.infinitiv = map[columnInfinitiv];
    this.present = map[columnPresent];
    this.perfect = map[columnPerfect];
    this.preterite = map[columnPreterite];
    this.type = map[columnType];
    this.meaning = map[columnMeaning];
    this.translation = map[columnTranslation];
    this.image = map[columnImage];
    this.level = map[columnLevel];
  }
}
