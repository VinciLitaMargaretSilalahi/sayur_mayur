import 'package:flutter/material.dart';
import 'package:sayur_mayur/screen/sayur_detail.dart';

class Sayur {
  final String name;
  final String imageUrl;
  final int price;
  final bool isFavorite;

  Sayur({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
}

class SayurPage extends StatelessWidget {
  const SayurPage({super.key});

  List<Sayur> get listSayurs {
    return [
      Sayur(
        name: 'Bayam',
        imageUrl: 'assets/box1.jpg',
        price: 5000,
      ),
      Sayur(
        name: 'Cabai',
        imageUrl: 'assets/box2.jpg',
        price: 6000,
      ),
      Sayur(
        name: 'Kentang',
        imageUrl: 'assets/box3.jpg',
        price: 12000,
      ),
      Sayur(
        name: 'Sawi',
        imageUrl: 'assets/box4.jpg',
        price: 3000,
      ),
      Sayur(
        name: 'Terong',
        imageUrl: 'assets/box5.jpg',
        price: 3000,
      ),
      Sayur(
        name: 'Tomat',
        imageUrl: 'assets/box6.jpg',
        price: 3000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCAF8),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: listSayurs.length,
          itemBuilder: (context, index) {
            return buildCard(
              listSayurs[index],
              context,
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(
    Sayur sayur,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SayurDetail(
                  assetPath: sayur.imageUrl,
                  sayurPrice: sayur.price.toString(),
                  sayurName: sayur.name,
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
            color: Colors.white,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  top: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      sayur.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: const Color(0xFFFF7532),
                    ),
                  ],
                ),
              ),

              Hero(
                tag: sayur.imageUrl,
                child: Container(
                  height: 92,
                  width: 92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(sayur.imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  'Rp ${sayur.price}',
                  style: const TextStyle(
                    color: Color(0xFFFCC8053),
                    fontSize: 16,
                  ),
                ),
              ),

              Center(
                child: Text(
                  sayur.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFF575E67),
                    fontSize: 14,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  color: const Color(0xFFFEBEBEB),
                  height: 1,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat,
                      color: Color(0xFFFFD17E50),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Chat',
                      style: TextStyle(
                        color: Color(0xFFFFD17E50),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.remove_circle_outline,
                      color: Color(0xFFFFD17E50),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '3',
                      style: TextStyle(
                        color: Color(0xFFFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.add_circle_outline,
                      color: Color(0xFFFFD17E50),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}