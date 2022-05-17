import 'package:flutter/material.dart';
import 'package:hero_animation_tarea/datos/informacion.dart';

class Detalle extends StatefulWidget {
  final int id;

  Detalle({Key? key, required this.id}) : super(key: key);

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: Tarjeta(),
    );
  }

  Widget Tarjeta() {
    //int index = int.parse(widget.id);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Hero(
                tag: informacion[widget.id]["id"],
                transitionOnUserGestures: true,
                child: Container(
                  width: 360,
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(informacion[widget.id]["urlimg"]),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    informacion[widget.id]["nombre"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 83, 83, 83),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    informacion[widget.id]["descripcion"],
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 83, 83, 83),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
