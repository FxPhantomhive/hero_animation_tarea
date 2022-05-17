import 'package:flutter/material.dart';
import 'package:hero_animation_tarea/datos/informacion.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hero_animation_tarea/pantallas/Detalle.dart';
import 'package:flutter/scheduler.dart'
    show
        timeDilation; //esta libreria sirve para dilatar el tiempo que toman las animaciones

class Listado extends StatefulWidget {
  Listado({Key? key}) : super(key: key);

  @override
  State<Listado> createState() => _ListadoState();
}

class _ListadoState extends State<Listado> {
  @override
  Widget build(BuildContext context) {
    timeDilation =
        10.0; //Esta variable controla el tiempo de las animaciones en general, el valor normal es 1.0
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation tarea"),
      ),
      body: Cuerpo(),
    );
  }

  Widget Cuerpo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(informacion.length, (index) {
          print(informacion[index]["urlimg"]);
          return Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 248, 248),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        child: Detalle(id: index),
                        type: PageTransitionType.fade),
                  );
                },
                child: Row(children: [
                  Container(
                    //hero es el widget que permite identificar el elemento que sera afectado por la animacion
                    child: Hero(
                      //tag es el identificador del elemento del listado que va a interactuar de un lugar a otro, debe ser unico
                      tag: informacion[index]["id"],
                      //transitionOnUserGestures activa la animacion cuando el usuario realiza un gesto sobre el child del hero
                      transitionOnUserGestures: true,
                      //dentro del child se ponen los elementos que seran afectados por la animacion

                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(informacion[index]["urlimg"]),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 230,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                informacion[index]["nombre"],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 83, 83, 83),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 230,
                            child: Text(
                              informacion[index]["descrip_corta"],
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 83, 83, 83),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
