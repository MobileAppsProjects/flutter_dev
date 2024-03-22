import 'package:flutter/material.dart';
import 'package:flutter_dev/src/constants/colors.dart';
import 'package:flutter_dev/src/constants/images.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TsecondaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                bottom: MediaQuery.of(context).size.height * 0.25,
                child: Image(
                  image: AssetImage(MapStatic),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                )),
            Positioned(
              left: 16,
              top: 16,
              child: FloatingActionButton(
                child: Icon(Icons.menu),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
            ),
            Positioned.fill(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  setState(() {
                    percentage = 2 * notification.extent - 0.8;
                  });
                  return true;
                },
                child: DraggableScrollableSheet(
                  maxChildSize: 0.9,
                  minChildSize: 0.4,
                  builder: (_, controller) {
                    return Material(
                      elevation: 10,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: TsecondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 150),
                              child: Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const Text("Algun texto"),
                            const SizedBox(height: 5),
                            Text(
                              "A donde vas",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Escribe tu destino",
                                border: UnderlineInputBorder(),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.only(bottom: 30),
                                  controller: controller,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text('Item $index'),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -170 * (1 - percentage),
              child: Opacity(
                opacity: percentage,
                child: _SearchDestimation(),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -50 * (1 - percentage),
              child: Opacity(
                opacity: percentage,
                child: _PickPlaceInMap(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PickPlaceInMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.place_sharp, color: Colors.grey, size: 20),
              const SizedBox(width: 10),
              const SizedBox(width: 10),
              Text(
                'Elegir destino',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ));
  }
}

class _SearchDestimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              BackButton(),
              Text(
                'Elegir destino',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.search),
                      hintText: "Escribe tu destino",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.search),
                      hintText: "Escribe tu destino",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
