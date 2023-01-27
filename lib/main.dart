import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/plan_model.dart';
import 'package:to_do_list/widgets/new_plan_screen.dart';
import 'widgets/plan_date.dart';
import 'widgets/plan_info.dart';
import 'widgets/plan_list.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 24, 64, 98),
        fontFamily: GoogleFonts.oxygen().fontFamily,
      ),
      home: SplashScreen(),
    );
  }
}



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: 'assets/images/splash.png',
      nextScreen: FuturePlan(),
      splashTransition: SplashTransition.rotationTransition,
      splashIconSize: 150,
      backgroundColor: Colors.white,
      animationDuration: Duration(seconds: 2),
    );
}
}

class FuturePlan extends StatefulWidget {
  @override
  State<FuturePlan> createState() => _FuturePlanState();
}

class _FuturePlanState extends State<FuturePlan> {
  Plans _plans = Plans();
  DateTime _choosendate = DateTime.now();

  void _chooseDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2030))
        .then((choosen) {
      setState(() {
        if (choosen != null) {
          _choosendate = choosen;
        }
      });
    });
  }

   

  void _previusDate(){
    setState(() {
      _choosendate = DateTime(_choosendate.year,_choosendate.month,_choosendate.day-1);
    });
  }

  void _nextDate(){
    setState(() {
      _choosendate = DateTime(_choosendate.year,_choosendate.month,_choosendate.day+1);
    });
  }

  void _switchOn(String id){
     setState(() {
        _plans.toDoByDay(_choosendate).firstWhere((plan) => plan.id == id).toggleDone();
     });
  }

  void _addPlan(String name,DateTime day){
    setState(() {
      _plans.addToDo(name, day);
    });
    Navigator.of(context).pop();
  }

  void _delete(String id){
    setState(() {
       _plans.remove(id);
    });
  }

  int get _planCount{
    return _plans.toDoByDay(_choosendate).length;
  }

  int get _numberDone{
    return _plans.toDoByDay(_choosendate).where((element) => element.isDone).length;
  }

  void _writePart(BuildContext context){
      showModalBottomSheet(context: context, isDismissible: false,isScrollControlled: true,builder:(ctx){
        return NewPlan(_addPlan);
      } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 24, 64, 98),
        leading: Icon(Icons.check,color: Colors.white),
        title: Text('Planner'),
      ),
      body: Column(
        children: [
          PlanDate(_chooseDate, _choosendate,_previusDate,_nextDate),
          PlanInfo(_planCount,_numberDone),
          PlanList(_plans.toDoByDay(_choosendate),_switchOn,_delete),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 15),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 24, 64, 98),
            elevation: 5, child: Icon(Icons.add, size: 20), onPressed: () {
              _writePart(context);
            }),
      ),
    );
  }
}
