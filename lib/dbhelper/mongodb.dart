import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:rescue/dbhelper/constant.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static void setData(String objectId, String attribute, String value) async {
    var res = await userCollection.updateOne(
        where.eq('_id', ObjectId.fromHexString(objectId)),
        ModifierBuilder().set(attribute, value),
        writeConcern: WriteConcern(w: 'majority', wtimeout: 5000));

    print('Modified documents: ${res.nModified}'); // 1

    var findResult = await userCollection
        .find(where.eq('_id', ObjectId.fromHexString(objectId)))
        .toList();

    print('Modified element status: '
        '"${findResult.first['status']}"'); // 'A';
  }

  static void unassignProfile(String objectId) async {
    var res = await userCollection.updateOne(
        where.eq('_id', ObjectId.fromHexString(objectId)),
        ModifierBuilder().set('assignedStatus', false),
        writeConcern: WriteConcern(w: 'majority', wtimeout: 5000));

    print('Modified documents: ${res.nModified}'); // 1

    var findResult = await userCollection
        .find(where.eq('_id', ObjectId.fromHexString(objectId)))
        .toList();

    print('Profile unassigned status: '
        '"${findResult.first['status']}"'); // 'A';
  }
}
