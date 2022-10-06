import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/injection.dart';
import 'package:to_do_app/presentation/core/my_app.dart';

Future<void >main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

