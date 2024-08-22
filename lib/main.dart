import 'package:app1/models/note_database.dart';
import 'package:app1/pages/notes_page.dart';
import 'package:app1/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //intialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const NotesPage(),
        theme: Provider.of<ThemeProvider>(context).themeData);
  }
}
