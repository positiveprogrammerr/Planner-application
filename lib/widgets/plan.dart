import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/plan_model.dart';

class Plan extends StatelessWidget {
  final PlanModel plan;
  final Function switchOn;
  final Function del;
  Plan(this.plan, this.switchOn, this.del);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 7.7),
        leading: IconButton(
          onPressed: () {
            switchOn(plan.id);
          },
          icon: Icon(
              plan.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
              color: plan.isDone ? Colors.green : Colors.grey),
        ),
        title: Text(
          plan.name,
          style: TextStyle(
            fontSize: 18,
            fontFamily: GoogleFonts.oxygen().fontFamily,
            fontWeight: FontWeight.w600,
            decoration:
                plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: plan.isDone ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            del(plan.id);
          },
          color: Colors.black,
          icon: Icon(Icons.delete_outline),
          iconSize: 27,
        ),
      ),
    );
  }
}
