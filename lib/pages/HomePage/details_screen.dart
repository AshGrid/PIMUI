import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

const Color primaryColor = Color.fromRGBO(105, 156, 244, 1);
const Color secondaryColor = Color.fromRGBO(44, 54, 88, 1);

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;

  const DetailsScreen({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Course Days',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
              ),
            ),
            SizedBox(height: 10),
            DayCard(day: 'Day 1', videoPath: 'assets/Videos/Iv01s.mp4'),
            DayCard(day: 'Day 2', videoPath: 'assets/Videos/Iv02s.mp4'),
            DayCard(day: 'Day 3', videoPath: 'assets/Videos/Iv03s.mp4'),
          ],
        ),
      ),
    );
  }
}
class DayCard extends StatefulWidget {
  final String day;
  final String videoPath;

  const DayCard({
    Key? key,
    required this.day,
    required this.videoPath,
  }) : super(key: key);

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8), // Add margin around the card
      width: double.infinity, // Set width to match the screen width
      child: Card(
        elevation: 4,
        color: secondaryColor,
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: isExpanded
              ? Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.day,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 400,
                  child: ChewieListItem(videoPlayerController: VideoPlayerController.asset(widget.videoPath)),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.day,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  ChewieListItem({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      looping: false,
      aspectRatio: 16 / 9,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}
