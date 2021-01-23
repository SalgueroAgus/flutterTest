import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/personaje.dart';

double mainTab = 150;

class CharacterCard extends StatefulWidget {
  final Future<Personaje> personaje;
  final bool loading;
  CharacterCard({this.personaje, this.loading});

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Personaje>(
      future: widget.personaje,
      builder: (context, snapshot) {
        if (snapshot.hasData && !widget.loading) {
          return Container(
              height: 400,
              width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFBF8737), Color(0xD0BF8737)]),
                border: Border.all(
                  color: Color(0xFF363944),
                  width: 10,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 210,
                    margin: const EdgeInsets.all(7.5),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF4A442D), width: 3.5)),
                    child: Text(
                      snapshot.data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontFamily: 'CardFont'),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 250,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 10,
                        color: Colors.grey[700],
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(snapshot.data.image),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 0, left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              width: 220,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFB34930), width: 2),
                                  color: Color(0xFFDDCCB3)),
                              child: Center(
                                  child: Text(
                                snapshot.data.species,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontFamily: 'CardFont'),
                              ))),
                          /* Container(
                            width: 95,
                            height: 100,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.8),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: Offset(3, 3),
                                  )
                                ],
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.lime[300]),
                            padding: const EdgeInsets.only(left: 13, right: 10),
                            alignment: Alignment.center,
                            child: Text(
                              '''
                              ${snapshot.data.status}
                              ${snapshot.data.gender}                            
                              ''',
                              style: TextStyle(fontSize: 20),
                            ),
                          ) */
                        ],
                      ))
                ],
              ));
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
