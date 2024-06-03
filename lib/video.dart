import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(Helo());
}

class Helo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: VideoScreen(),
    );
  }
}

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Section'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // First segment with text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Morse code  Learning Videos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            // First row of videos
            GridView.count(
              crossAxisCount: 2, // Two videos per row
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/7.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 1',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/8.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 2',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/9.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 3',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/11.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 4',
                ),
                // Add more VideoCards here
              ],
            ),
            SizedBox(height: 20),
            // Second segment with text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Second Segment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            // Second row of videos
            GridView.count(
              crossAxisCount: 2, // Two videos per row
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/9.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 3',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/11.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 4',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/7.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 1',
                ),
                VideoCard(
                  imageUrl: 'https://silent-speaks.netlify.app/images/11.png',
                  videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
                  title: 'Video 2',
                ),
                // Add more VideoCards here
              ],
            ),
            SizedBox(height: 20),
            // Footer Section
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Designed by Ankit ©',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String videoUrl;
  final String imageUrl;
  final String title;

  VideoCard({
    required this.videoUrl,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
          ),
        );
      },
      child: Card(
        elevation: 5, // Adding elevation for 3D effect
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
