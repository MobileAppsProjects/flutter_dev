import 'package:flutter/material.dart';
import 'package:flutter_dev/src/constants/colors.dart';
import 'package:flutter_dev/src/constants/images.dart';
import 'package:flutter_dev/src/common/widgets/restaurant_card.dart';

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
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                backgroundColor: TsecondaryColor,
                onPressed: () {
                  // Add your onPressed code here!
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
                            const SizedBox(height: 5),
                            const Text("Bienvenido"),
                            const SizedBox(height: 5),
                            Text(
                              "¿Donde deseas comer hoy?",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(Icons.search),
                                hintText: "Escribe tu destino",
                                border: UnderlineInputBorder(),
                                enabled: false,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Restaurantes cercanos",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                controller: controller,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return RestaurantCard(
                                    width: 150.0,
                                    height: 250.0,
                                    onTap: () {
                                      // Perform any desired action when the card is tapped
                                      print('Restaurant card tapped');
                                      // Navigate to a new screen, show a dialog, or perform any other action
                                    },
                                  );
                                },
                              ),
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
          ],
        ),
      ),
    );
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
                      prefixIcon: Icon(Icons.my_location),
                      hintText: "Ubicación actual",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.search),
                      hintText: "Escribe tu destino",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.place_sharp, color: TprimaryColor, size: 20),
                      TextButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para navegar a la pantalla de registro
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Selecciona la ubicación en el mapa',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: TprimaryColor)
                                  // Color del texto "Regístrate"
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
