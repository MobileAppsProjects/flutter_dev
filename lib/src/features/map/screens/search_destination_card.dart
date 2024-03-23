import 'package:flutter/material.dart';
import 'package:flutter_dev/src/constants/colors.dart';

class SearchDestination extends StatelessWidget {
  const SearchDestination({Key? key}) : super(key: key);
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
                                      .copyWith(color: TprimaryColor)),
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
