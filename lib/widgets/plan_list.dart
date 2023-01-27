import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/plan_model.dart';
import 'package:to_do_list/widgets/plan.dart';

class PlanList extends StatelessWidget {
  final List<PlanModel> plansModel;
  final Function switchOn;
  final Function del;
  PlanList( this.plansModel,this.switchOn,this.del); 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: plansModel.length > 0?ListView.builder(itemCount: plansModel.length, itemBuilder: (ctx, index) {
        return Plan(plansModel[index],switchOn,del);
      }
      ): Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Plans!',style:TextStyle(fontFamily:GoogleFonts.oxygen().fontFamily, fontWeight: FontWeight.w700,fontSize: 29)),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/sleep.png',
              fit: BoxFit.cover,
              width: 150,
              ),
          ],
        ),
      ),
      
    );
  }
}
