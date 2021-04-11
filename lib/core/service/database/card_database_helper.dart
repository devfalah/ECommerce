import 'package:path/path.dart';
import 'package:shopping/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../constance.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "cartProducts.db");
    return await openDatabase(path, version: 1, onCreate: (db, int vers) async {
      await db.execute('''
      CREATE TABLE $tableCart (
        $columnImage TEXT NOT NULL,
        $columnName TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnproductId TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL)
      ''');
    });
  }

//! ---> CRUD
// * CREATE
  Future<void> insertProduct(CartModel cart) async {
    var db = await database;
    db.insert(
      tableCart,
      cart.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// * UPDATE
  Future<void> updateCart(CartModel cart) async {
    var db = await database;
    db.update(
      tableCart,
      cart.toJson(),
      where: '$columnproductId = ?',
      whereArgs: [cart.productId],
    );
  }
//   // * READ

//   Future<UserModel> getUser(int id) async {
//     var db = await database;
//     List<Map> maps = await db.query(
//       tableUser,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//     if (maps.length > 0)
//       return UserModel.fromMap(maps.first);
//     else
//       return null;
//   }

  Future<List<CartModel>> getAllProducts() async {
    var db = await database;
    List<Map> maps = await db.query(tableCart);
    if (maps.isNotEmpty)
      return maps.map((cart) => CartModel.fromJson(cart)).toList();
    else
      return [];
  }

//   Future<void> deleteUser(int id) async {
//     var db = await database;
//     db.delete(
//       tableUser,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }
}
