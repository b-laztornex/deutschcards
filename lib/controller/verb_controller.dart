import 'package:german_card/db/database_utils.dart';
import 'package:german_card/model/verb_model.dart';

class VerbController {
  static Future<List<VerbModel>> getAllVerbs( String lvl ) async {
    final sql = "SELECT * FROM verb WHERE level = '$lvl'";
    final data = await db.rawQuery(sql);
    final verb = data.map((i) => VerbModel.fromMap(i)).toList();
    return verb;
  }
}
