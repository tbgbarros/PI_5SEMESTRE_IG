import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter/widgets.dart';
import 'package:pi5_app_manaciais/src/features/feed/presentation/ministerios_page.dart';
import 'package:pi5_app_manaciais/src/features/feed/presentation/perfil_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  // void _onBottomNavMinisterios(int index) {
  //   if (index == 0) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MinisteriosPage()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          SizedBox.expand(
            child: Image.network(
              'https://i.pinimg.com/736x/99/70/07/9970077d9497cac7390a4647b1072e72.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo principal com efeito de glassmorphism
          Padding(
            padding:
                const EdgeInsets.only(top: 55), // deixa espaço para a AppBar
            child: ListView(
              children: List.generate(
                15,
                (index) {
                  final url = f.faker.image.loremPicsum(
                      height: 480,
                      width: 820,
                      imageFormat: f.ImageFormat.jpg,
                      random: index * 4);
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    child: Column(
                      children: [
                        // Aplicando blur no ListTile
                        ClipRRect(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.zero,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2.5,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    maxRadius: 35,
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/id/237/200/200'),
                                  ),
                                  title: Text('Avisos'),
                                  subtitle: Text('22/10/24 18:00'),
                                  textColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Imagem entre o ListTile e o conteúdo da Column
                        Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                        // Aplicando blur no conteúdo da Column
                        ClipRRect(
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.zero,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2.5,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Text(
                                      f.faker.conference.name(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 58, 58, 58)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Text(
                                      f.faker.lorem.sentences(2).join(''),
                                      textAlign: TextAlign.justify,
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 56, 56, 56)),
                                    ),
                                  ),
                                  OverflowBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_outline,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.share_outlined,
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // AppBar personalizada
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80, // Altura da AppBar
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/logo.png', // Caminho da imagem logo
                    fit: BoxFit.contain,
                  ),
                ),
                title: const Text(
                  'Mananciais',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      // Ação de busca
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color(0xFF1A85F9),
        onPressed: () {},
        child: const Icon(Icons.favorite),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Ministérios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) => _onBottomNavTapped(context, index),
      ),
    );
  }
}

void _onBottomNavTapped(BuildContext context, int index) {
  if (index == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MinisteriosPage()),
    );
  } else if (index == 2) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PerfilPage()),
    );
  }
}
