import 'dart:math';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool isMale = true;
  int age = 20;
  int weight = 50;
  double height = 100;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.purple,
            height: 4.0,
          ),
        ),
        title: Center(
          child: Text('BMI App',
              style: TextStyle(
                color: Colors.purple,
              )),
        ),
        centerTitle:
            true, // لان في الايفون او الاجهزة التانيه هيختلف مكان التايتل فانا ثبته في النص علي كل الاجهزة
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  typeExpanded('male'),
                  SizedBox(
                    width: 15,
                  ),
                  typeExpanded('female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: heightExpanded()
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  age_weight_Expanded('Weight'),
                  SizedBox(
                    width: 15,
                  ),
                  age_weight_Expanded('Age'),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width / 1.5, // علشان الابعاد تاخد الحجم الثابت ده من ابعاد الشاشة اللي هتتعرض عليه و بالتالي هتكون االابعاد ثابته دايما
              height: MediaQuery.of(context).size.height / 16,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(100)),
              child: TextButton(
                  onPressed: () {
                    var result = weight / pow(height / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(isMale, age, 30, weight,height);
                    }));
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.black),
                  )))
        ],
      )),
    );
  }

  Expanded typeExpanded(String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () => setState(() => isMale = type == 'male' ? true : false),
      child: Container(
        decoration: BoxDecoration(
          color: (isMale && type == 'male') || (!isMale && type == 'female')
              ? Colors.purple
              : Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'male' ? Icons.male_outlined : Icons.female_outlined,
              color: Colors.white,
              size: 90,
            ),
            SizedBox(height: 10),
            Text(type == 'male' ? 'male' : 'female',
                style: Theme.of(context).textTheme.headline3)
          ],
        ),
      ),
    ));
  }

  Expanded heightExpanded() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height',style: Theme.of(context).textTheme.headline3,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('${height.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headline2,),
                SizedBox(width: 5,),
                Text('cm',style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 25),),
              ],
            ),
            SizedBox(height: 20,),
            Slider(
                activeColor: Color(0xFF00BFA5), // لون الاسلايدر اللي بحركه
                inactiveColor: Colors.white, // لون الاسلايدر اللي تحت

                min: 50,
                max: 200,
                value: height,
                onChanged: (newValue){
                  setState(() {
                    height=newValue;
                  });
                })
          ],
        ),
      ),
    );
  }

  Expanded age_weight_Expanded(String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type == 'Weight' ? 'Weight' : 'Age',
              style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 20),
          Text(type == 'Weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headline2),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'Weight' ? 'weight--' : 'age--',
                onPressed: () {
                  setState(() {
                    type == 'Weight' ? weight-- : age--;
                  });
                },
                child: Icon(Icons.remove),
                backgroundColor: Theme.of(context).iconTheme.color,
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                heroTag: type == 'Weight' ? 'weight++' : 'age++',
                onPressed: () {
                  setState(() {
                    type == 'Weight' ? weight++ : age++;
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
        ],
      ),
    ));
  }


}
