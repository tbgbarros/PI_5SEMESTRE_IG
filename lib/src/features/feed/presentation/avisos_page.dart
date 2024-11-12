import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as f;

class CardPostWidget extends StatefulWidget {
  const CardPostWidget({super.key});

  @override
  State<CardPostWidget> createState() => _CardPostWidgetState();
}

class _CardPostWidgetState extends State<CardPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: List.generate(
          15,
          (index) {
            final url = f.faker.image.loremPicsum(
                height: 480,
                width: 820,
                imageFormat: f.ImageFormat.jpg,
                random: index * 4);
            return Card.filled(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 35,
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/id/237/200/200'),
                      ),
                      title: Text('Avisos'),
                      subtitle: Text('22/10/24 18:00'),
                    ),
                  ),
                  Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 18),
                        child: Text(
                          f.faker.conference.name(),
                          style: Theme.of(context).textTheme.headlineMedium,
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
                        ),
                      ),
                      OverflowBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_add_outlined),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
