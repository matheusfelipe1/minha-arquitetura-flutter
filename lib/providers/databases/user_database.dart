import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class UserDatabase {
  static final UserDatabase _instance = UserDatabase._();
  UserDatabase._();
  factory UserDatabase() => UserDatabase._instance;

  static String get dbName => 'downloads_db.db';
  Future<String> get databasePath async => await getDatabasesPath();
  Future<String> get path async => join(await databasePath, dbName);

  _onCreate(Database db, int version) async {
    await db.execute(user);
  }

  _onConfigure(Database db) async {
    await db.execute(user);
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Database version is updated, alter the table
    await db.execute(user);
  }

  _onDowngrade(Database db, int oldVersion, int newVersion) async {
    // Database version is updated, alter the table
    await db.execute(user);
  }

  _onOpen(Database db) async {
    await db.execute(user);
    
  }
  Future<Database> _open() async {
    return await openDatabase(await path,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onOpen: _onOpen,
        onDowngrade: _onDowngrade,
        version: 2);
  }

  Future<void> start() async {
    try {
      await Directory(await databasePath).create(recursive: true);
      await _open();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  insertDatas(Map<String, Object> data) async {
    try {
      final database = await _open();
      if (database.isOpen) {
        await database.insert('user', data);
      } else {
        throw ErrorDescription('Database is not open or already has data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static String get user => "CREATE TABLE IF NOT EXISTS user(id TEXT PRIMARY KEY, name TEXT, email TEXT)";
}