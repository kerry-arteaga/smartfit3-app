import 'package:mysql1/mysql1.dart';

class Mysql {
  static String url = 'jdbc:mysql://localhost:3306/mysql';
  static String host = 'localhost';
  static String user = 'root';
  static String password = 'root@0701';
  static String db = 'fitness';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port, // Ensure this is the correct port
      user: user,
      password: password,
      db: db,
    );

    try {
      MySqlConnection connection = await MySqlConnection.connect(settings);
      print('Connected to MySQL');
      return connection;
    } catch (e) {
      print('Error connecting to MySQL: $e');
      rethrow; // Rethrow the exception for further analysis
    }
  }
}
