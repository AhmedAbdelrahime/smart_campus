import 'package:flutter/material.dart';

class ElecImagesPage extends StatelessWidget {
  const ElecImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'image/elec/1.png',
      'image/elec/2.png',
      'image/elec/3.png',
      'image/elec/4.png',
      'image/elec/5.png',
      'image/elec/6.png',
      'image/elec/7.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10, // Spacing between columns
            mainAxisSpacing: 10, // Spacing between rows
          ),
          itemCount: imagePaths.length, // Number of images
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => FullScreenImageViewer(
                          images: imagePaths,
                          initialIndex: index,
                        ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenImageViewer({
    Key? key,
    required this.images,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // Close the full-screen viewer
          },
        ),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Center(
            child: InteractiveViewer(
              panEnabled: true, // Allow panning
              minScale: 1.0, // Minimum zoom scale
              maxScale: 5.0, // Maximum zoom scale
              child: Image.asset(images[index], fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }
}
