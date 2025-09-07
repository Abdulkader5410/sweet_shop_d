// import 'dart:developer';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static Database? _database;

//   static Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   static Future<Database> initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'app.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//       onUpgrade: _onUpgrade,
//     );
//   }

//   static _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < newVersion) {}
//   }

//   static Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''


//     CREATE TABLE cart (
//       id_cart INTEGER PRIMARY KEY AUTOINCREMENT,
//       user_id text,
//       id_pro text,
//       name TEXT,
//       image text,
//       price DOUBLE,
//       size text,
//       qun integer default 1
//       )
//     ''');

//     await db.execute('''
//     CREATE TABLE curr_order (
//       id_order INTEGER PRIMARY KEY AUTOINCREMENT,
//       n_order text,
//       total_price TEXT,
//       time_left text,
//       time_pre DOUBLE,
//       time_del text,
//       time_fin text
//     )
   

//     ''');

//     // await db.execute('''
//     // CREATE TABLE pro_fav (
//     //   id_pro INTEGER PRIMARY KEY AUTOINCREMENT,
//     //   title TEXT,
//     //   image text,
//     //   price double
//     // )
//     // ''');

//     // await db.execute('''
//     // CREATE TABLE fav (
//     //   id_fav INTEGER PRIMARY KEY AUTOINCREMENT,
//     //   id_pro INTEGER,
//     //   is_fav integer,
//     //   FOREIGN KEY (id_pro) REFERENCES pro_fav(id_pro) ON DELETE CASCADE ON UPDATE CASCADE
//     // )
//     // ''');

//     // await db.execute('''
//     // CREATE TABLE orderr (
//     //   id_or INTEGER PRIMARY KEY AUTOINCREMENT,
//     //   status text,
//     //   phone text,
//     //   address text,
//     //   date_order date,
//     //   price double
//     // )
//     // ''');

//     // await db.execute('''
//     // CREATE TABLE order_item (
//     // id_or_it INTEGER PRIMARY KEY AUTOINCREMENT,
//     // id_or INTEGER,
//     // id_cart INTEGER,
//     // FOREIGN KEY (id_or) REFERENCES orderr(id_or) ON DELETE CASCADE ON UPDATE CASCADE,
//     // FOREIGN KEY (id_cart) REFERENCES cart(id_cart) ON DELETE CASCADE ON UPDATE CASCADE
//     // )
//     // ''');

//     // await db.execute('''
//     // CREATE TABLE user(
//     // id INTEGER PRIMARY KEY,
//     // username text,
//     // email text,
//     // token text,
//     // refreshToken text,
//     // firstName text,
//     // lastName text,
//     // gender text,
//     // image text
//     // )
//     // ''');

//     log("CREATED DATABSE");
//   }

//   //insert
//   static Future<int> addCart(Map<String, dynamic> cart) async {
//     final db = await database;
//     return await db.insert('cart', cart);
//   }

//   //udapte
//   static Future<int> updateCart(Map<String, dynamic> cart) async {
//     final db = await database;
//     return await db.update('cart', cart,
//         where: 'id_cart = ? and id_pro = ?',
//         whereArgs: [cart['id_cart'], cart['id_pro']]);
//   }

//   //delelte
//   static Future<int> deleteCartById(String id) async {
//     final db = await database;
//     return await db.delete('cart', where: 'id_pro = ?', whereArgs: [id]);
//   }

//   static Future<int> deleteAllCart() async {
//     final db = await database;
//     return await db.delete('cart');
//   }

//   //get
//   static Future<List<Map<String, dynamic>>> getCart(String userId) async {
//     final db = await database;
//     return await db.query('cart', where: "user_id = ?", whereArgs: [userId]);
//   }

//   // static Future<Map<String, dynamic>?> getProCartByTitle(String title) async {
//   //   final db = await database;
//   //   final res = await db.query('pro_cart',
//   //       where: 'title like ?', whereArgs: ["%$title%"], limit: 1);
//   //   if (res.isNotEmpty) {
//   //     return res.first;
//   //   } else {
//   //     return null;
//   //   }
//   // }

//   static Future<double> getTotalPriceInCart(String userId) async {
//     final db = await database;

//     String query = '''
//                 select sum(c.price * c.qun) as total_price
//                 from cart c where c.user_id = ?
// ''';

//     List<Map> res = await db.rawQuery(query, [userId]);
//     double? totalPrices = res[0]['total_price'];

//     if (totalPrices != null) {
//       return totalPrices;
//     } else {
//       return 0.0;
//     }
//   }

//   static Future<int> getTotalQunInCart(String userId) async {
//     final db = await database;

//     String query = '''
//                 select sum(c.qun) as total_qun
//                 from cart c where c.user_id = ?
// ''';

//     List<Map> res = await db.rawQuery(query, [userId]);
//     int? totalQun = res[0]['total_qun'];

//     if (totalQun != null) {
//       return totalQun;
//     } else {
//       return 0;
//     }
//   }

//   //insert
//   static Future<int> addOrderDetails(Map<String, dynamic> order) async {
//     final db = await database;
//     return await db.insert('curr_order', order);
//   }

// //get
//   static Future<List<Map<String, dynamic>>> getOrderDeatails() async {
//     final db = await database;
//     return await db.query('curr_order');
//   }
// }
