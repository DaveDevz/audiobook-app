import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'chapter.dart'; // Import the Chapter class from the chapter.dart file

// Define the AudioPlayerWidget as a StatefulWidget
class AudioPlayerWidget extends StatefulWidget {
  final Key? key;

  // Constructor with a named 'key' parameter
  AudioPlayerWidget({this.key}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();

}

// Define the state class for the AudioPlayerWidget
class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {


  // A list of chapters to be displayed in the UI.
  List<Chapter> _chapters = [
    Chapter('Introduction', Duration(minutes: 0)), // Chapter 1 starts at 0:00
    Chapter('Chapter 1', Duration(minutes: 5)),    // Chapter 2 starts at 5:00
    // Add more chapters as needed
  ];

  // Instantiate the audio player provider
  final AudioPlayerProvider _audioPlayerProvider = AudioPlayerProvider();

  // The build method is called whenever the UI needs to be rendered
  @override
  Widget build(BuildContext context) {
    return Column( // Using a Column widget to arrange children vertically
      mainAxisAlignment: MainAxisAlignment.center, // Centering the column's children
      children: <Widget>[
        // Playback controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () => _audioPlayerProvider.play('your_audio_url'),
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () => _audioPlayerProvider.pause(),
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () => _audioPlayerProvider.stop(),
            ),
          ],
        ),

        // An expanded widget to allow the ListView to take up remaining space
        Expanded(
          child: ListView.builder( // A ListView.builder to create a scrollable list of chapters
            itemCount: _chapters.length, // The number of items in the list equals the number of chapters
            itemBuilder: (context, index) { // A function to build each item in the list
              final chapter = _chapters[index]; // Get the current chapter based on the index

              // Return a ListTile for each chapter with a title and tap behavior
              return ListTile(
                title: Text(chapter.title), // Display the chapter title
                onTap: () {
                  _audioPlayerProvider.play('your_audio_url'); // Start playing the audio (replace with actual URL)

                  // Seek to the start time of the selected chapter
                  _audioPlayerProvider.seek(chapter.startTime);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Define a class named AudioPlayerProvider to manage audio playback.
class AudioPlayerProvider { 
  // Create a private instance of AudioPlayer which handles audio playback.
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Define an asynchronous method named play to start audio playback from a URL.
  Future<void> play(String url) async {
    // Use the UrlSource class to play audio from a URL.
    await _audioPlayer.play(UrlSource(url));
  }

  // Define an asynchronous method named pause to pause audio playback.
  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  // Define an asynchronous method named stop to stop audio playback and reset the position.
  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  // Define a method named getPositionStream to retrieve the current playback position.
  // Retrieve the current position by listening to the onPositionChanged stream.
  Stream<Duration> getPositionStream() {
    return _audioPlayer.onPositionChanged;
  }

  // Define a method named seek to move to a specific point in the audio.
  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
}
