
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{
  //TODO: import images

  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage cross =  const AssetImage("images/cross.png");
  AssetImage edit =   const AssetImage("images/edit.png");
  bool isCross = true;
  late String message;
  late List<String> gameState;

  //TODO: initialise the state

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState= [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",

      ]; this.message="";
    });
  }
  //ToDo: play game
  playGame(int index){
    if(this.gameState[index] == "empty"){
      setState(() {
        if(this.isCross){
          this.gameState[index]= "cross";
        }else{
          this.gameState[index]="circle";
        }this.isCross = !this.isCross;
        this.checkWin();
      }
      );}
  }

  //TODO: reset game
  resetGame(){
    setState(() {
      this.gameState=[
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",

      ];this.message="";
    });

  }
  //TODO:delay add

  Future delaygame() async{
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      this.gameState=resetGame();
      this.message="";
    });

  }

  //TODO:to get images
  getImage(String value) {
    switch (value) {
      case 'empty' :
        return edit;
        break;
      case 'cross' :
        return cross;
        break;
      case 'circle' :
        return circle;
        break;
    }
  }
  //TODO: win game logic
  checkWin(){

    if (( this.gameState[0]!= 'empty') &&
        (this.gameState[0] == this.gameState[1])&&
        (this.gameState[1] == this.gameState[2])) {
      setState(() {
        this.message= '${this.gameState[0]} wins ';
        delaygame();
      });
    }else if (( this.gameState[3]!= 'empty') &&
        (this.gameState[3] == this.gameState[4])&&
        (this.gameState[4] == this.gameState[5])) {
      setState(() {
        this.message= '${this.gameState[3]} wins ';
        delaygame();

      });
    }else if (( this.gameState[6]!= 'empty') &&
        (this.gameState[6] == this.gameState[7])&&
        (this.gameState[7] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins ';
        delaygame();

      });
    }else if (( this.gameState[0]!= 'empty') &&
        (this.gameState[0] == this.gameState[3])&&
        (this.gameState[3] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins ';
        delaygame();

      });
    }else if (( this.gameState[1]!= 'empty') &&
        (this.gameState[1] == this.gameState[4])&&
        (this.gameState[4] == this.gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins ';
        delaygame();

      });
    }else if (( this.gameState[2]!= 'empty') &&
        (this.gameState[2] == this.gameState[5])&&
        (this.gameState[5] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins ';
        delaygame();

      });
    }else if (( this.gameState[0]!= 'empty') &&
        (this.gameState[0] == this.gameState[4])&&
        (this.gameState[4] == this.gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins ';
        delaygame();

      });
    }else if (( this.gameState[2]!= 'empty') &&
        (this.gameState[2] == this.gameState[4])&&
        (this.gameState[4] == this.gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins ';
        delaygame();

      });
    }else if (!this.gameState.contains('empty')){
      setState(() {
        this.message = 'Game Draw';
        delaygame();

      });
    }

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tic tac toe game', style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover)),
          child:  Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Expanded(

                  child: GridView.builder(
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: this.gameState.length,
                      itemBuilder:  (context ,i)=> SizedBox(
                        height: 80.0,
                        width: 80.0,
                        child: MaterialButton(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white10,
                          splashColor: Colors.blueAccent,
                          onPressed: (){
                            return playGame(i);
                          },
                          child: Image(
                            image: this.getImage(this.gameState[i]),
                          ),
                        ),
                      )
                  )
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(this.message,style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              MaterialButton( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  padding: EdgeInsets.all(10.0),
                  color: Colors.purple,
                  minWidth: 300.0,
                  height: 40.0,
                  child: Text(
                    "Reset Game",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed:(){this.resetGame();}),
              Container(
                padding: EdgeInsets.all(1.0),
                child: Text(
                  "created by vikram",

                  style: TextStyle(
                      color:Colors.white,fontSize: 18.0),
                ),
              )
            ],
          ),
        ));
  }

}