import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // قائمة تحتوي على بيانات الكروت
  final List<Map<String, String>> cardData = [
    {
      'image': 'assets/image/Intellectual_Disability.jpg',
      'text': 'Intellectual Disability',
      'url': 'https://youtu.be/aCsuCnMaONk?si=jGJYBj5CcpXLobTv',
    },
    {
      'image': 'assets/image/Hearing_Disability.jpg',
      'text': 'Hearing Disability',
      'url': 'https://youtu.be/hGCk9ucJCeo?si=hZZV53GyOI30e0P3',
    },
    {
      'image': 'assets/image/Visual_Disability.jpg',
      'text': 'Visual Disability',
      'url': 'https://youtu.be/X-APTCXwsm0?si=rjyEMDF6eGOiohCI',
    },
    {
      'image': 'assets/image/physical_disability.jpg',
      'text': 'Physical Disability',
      'url': 'https://youtu.be/KuZX9WS_tfQ?si=QvOyiX6tde_SoRIx',
    },
    {
      'image': 'assets/image/psychological_disability.jpg',
      'text': 'Psychological Disability',
      'url': 'https://youtu.be/V5VK1rPQKmo?si=tgUW0LFTapxLQDEZ',
    },
    {
      'image': 'assets/image/multiple_disability.jpg',
      'text': 'Multiple Disabilities',
      'url': 'https://youtu.be/seQ_Rtm7qWA?si=82jGq_DvL-1-ZCOv',
    },
  ];


   Future<void> launchurl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(246, 181, 59, 179),
        centerTitle: true,
        title: const Text(
          "Disability",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: cardData.length, // عدد الكروت بناءً على القائمة
          itemBuilder: (context, index) {
            final card = cardData[index]; // استدعاء بيانات الكرت الحالي
            return GestureDetector(
              onTap: () {
                launchurl(card['url']!);
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        card['image']!, // صورة الكرت
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        card['text']!, // نص الكرت
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
