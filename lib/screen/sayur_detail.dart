import 'package:flutter/material.dart';
import 'package:sayur_mayur/widget/navbar_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SayurDetail extends StatelessWidget {
  final String assetPath;
  final String sayurPrice;
  final String sayurName;

  const SayurDetail({
    super.key,
    required this.assetPath,
    required this.sayurPrice,
    required this.sayurName,
  });

  Future<void> pesanWhatsapp() async {
    final Uri url = Uri.parse(
      'https://wa.me/628123456789?text=Hi%20Tegar%20Sayur%2C%20Saya%20mau%20order%20$sayurName%20untuk%20hari%20ini.',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Pesan',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Sayur Mayur',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF177532),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Hero(
              tag: assetPath,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(assetPath),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              'Rp $sayurPrice',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF177532),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Text(
              sayurName,
              style: const TextStyle(
                color: Color(0xFFF575E67),
                fontSize: 24,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52,
              child: const Text(
                'Sayur mayur yang diambil dari pertanian terbaik di Indonesia akan menjadi bahan dasar terbaik untuk membuat cita rasa masakan nusantara.',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: const Color(0xFFF177532),
              ),
              child: Center(
                child: InkWell(
                  onTap: pesanWhatsapp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 32,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Pesan via Whatsapp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF177532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}