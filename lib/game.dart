import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/padrao.png");
  var result = "";

  void _optionSelected(String userChoice) {
    var options = ["Pedra", "Papel", "Tesoura"];
    var cpuOptionNumber = Random().nextInt(3);
    var cpuOption = options[cpuOptionNumber];

    switch (cpuOption) {
      case "Pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "Papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "Tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    if ((userChoice == "Papel" && cpuOption == "Pedra") ||
        (userChoice == "Pedra" && cpuOption == "Tesoura") ||
        (userChoice == "Tesoura" && cpuOption == "Papel")) {
      setState(() {
        this.result = "Win";
      });
    } else if ((cpuOption == "Papel" && userChoice == "Pedra") ||
        (cpuOption == "Pedra" && userChoice == "Tesoura") ||
        (cpuOption == "Tesoura" && userChoice == "Papel")) {
      setState(() {
        this.result = "Lose";
      });
    } else {
      setState(() {
        this.result = "Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jo-Ken-Po!",
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "CPU",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Choose an option!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _optionSelected(
                      "Pedra"), //declarar func anonima pra func void funcionar
                  child: Image.asset(
                    "images/pedra.png",
                    height: 75,
                    width: 75,
                  )),
              GestureDetector(
                  onTap: () => _optionSelected(
                      "Papel"), //declarar func anonima pra func void funcionar
                  child: Image.asset(
                    "images/papel.png",
                    height: 75,
                    width: 75,
                  )),
              GestureDetector(
                  onTap: () => _optionSelected(
                      "Tesoura"), //declarar func anonima pra func void funcionar
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 75,
                    width: 75,
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 26),
            child: Text(
              this.result,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
