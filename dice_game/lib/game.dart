import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
   final _diceList = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  
  ];
  int _index1= 0, _index2=0, _diceSum=0, _point=0;
  bool _hasGameStarted = false;
  final _random = Random.secure(); 
  @override

  Widget build(BuildContext context) {
return Scaffold (
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 74, 68),
        title: const Text("Dicce Game"),
        centerTitle: true,
      ),
      body: Center(
        child: _hasGameStarted ? _gamePage(): _startPage(),
      ),
    );

  }
  _startPage(){
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _hasGameStarted=true;
        });
        
      }, 
      style: ElevatedButton.styleFrom(
            
            shape: BeveledRectangleBorder(
              
              borderRadius: BorderRadius.circular(2),
        
            ),
            backgroundColor: const Color.fromARGB(255, 8, 74, 68),
            side: const BorderSide(color: Colors.black,width:0.5),
          textStyle: const TextStyle(
            fontSize: 20
          )
           ),
      child: const Text("Start"),
      );
  }
  _gamePage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_diceList[_index1],width: 100,height: 100,),
            const SizedBox(width: 25,
            child: Icon(Icons.add, size: 27, color:Color.fromARGB(255, 8, 74, 68),)
            ),
             Image.asset(_diceList[_index2],width: 100,height: 100,),
          ],
        ),
        SizedBox(
          height:30,
          width: 80,
          
          child: ElevatedButton(
            
           style: ElevatedButton.styleFrom(
            
            shape: BeveledRectangleBorder(
              
              borderRadius: BorderRadius.circular(5),
        
            ),
            backgroundColor: const Color.fromARGB(255, 8, 74, 68),
            side: const BorderSide(color: Colors.black,width:0.5),
          textStyle: const TextStyle(
            fontSize: 20
          )
           ),
           
            onPressed: _rollThedice,
            child: const Text('Roll',style: TextStyle(fontSize: 20),),
        
            ),
        ),
          
          Text('Dice Sum: $_diceSum', style: const TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold, color: Color.fromARGB(255, 8, 74, 68),
          
          ),
          ),
      ],
    );
  }


  void _rollThedice() {
    setState(() {
      _index1= _random.nextInt(6);
        _index2= _random.nextInt(6);
        _diceSum=_index1+_index2+2;

    });
  }
}