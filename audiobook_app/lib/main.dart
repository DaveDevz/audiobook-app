import 'package:flutter/material.dart';  // Import the flutter material package for UI components
import 'audio_player.dart'; // Importing the custon AudioPlayerProvider class for handling audio playback

void main() {
  runApp(const MyApp()); // This is the entry point of the application. It runs the Myapp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp, using a key for widget Identification

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audiobook App', // Sets the title of the application
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Sets a theme for the app with a color scheme based on deep purple
        useMaterial3: true, // Enables Material 3 design components
      ),
      home: const MyHomePage(title: 'Audiobook App'), //Sets the homepage of the app to be MyHomePage, passing the title
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // Constructor for MyHomePage which takes a title as a required parameter

  final String title; // A final variable that holds the title of the page

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Creates the mutable state of my MyHomePage
} 

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Sets the background color of the AppBar based on the inverse primary color
        title: Text(widget.title), // Displays the title passed to MyHomePage in the AppBar.
      ),
      body: Center(
        child: AudioPlayerWidget(), // Display the AudioPlayerWidget which includes the chapters list and playback controls
      ),
    );
  }
}