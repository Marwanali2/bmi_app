import 'dart:math';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.isMale, this.age, this.result,this.weight,this.height, {super.key});

  final bool isMale;
  final int age;
  final double result;
  final int weight;
  final double height;
  TextStyle textStyle = TextStyle(
      fontSize: 35, fontWeight: FontWeight.bold, color: Colors.purple);

  String get resultstate{
    String resultstate='';
    if(result<18.5) resultstate='UnderWeight';
      else if (result>=18.5&&result<=24.9) resultstate='Normal';
      else if (result>=25.0&&result<=29.9) resultstate='OverWeight';
      else{resultstate='Obese';}
    return resultstate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon( Icons.home_outlined, color:Color(0xFF343A40),),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.purple,
            height: 4.0,
          ),
        ),
        title: Text(
          'Result',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea( //  الsafe area علشان ابعاد الابب تكون نظبوطه علي الاجهزة المختلفه زي ايفون و ويب و هكذا
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender : ${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
              ),
              Text(
                'age : $age years',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
              ),

              Text(
                'Weight : ${weight} Kg',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                'Height : ${height.toStringAsFixed(1)} cm',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                'result : ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
              ),

              Text(
                'Healthiness : ${resultstate}',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),


            ],

          ),

        ),

      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.pop(context);
      }, label: Text('Restart',style: TextStyle(fontSize: 20,color: Colors.black),),icon: Icon(Icons.replay_sharp,color: Colors.black,),backgroundColor: Theme.of(context).iconTheme.color),
    );
  }
}
