import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;

  NewPlan(this.addPlan);

  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  DateTime? _inputdate;
  final planName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _inputedDate(BuildContext context) {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2019),
              lastDate: DateTime(2030))
          .then((choosen) {
        setState(() {
          if (choosen != null) {
            _inputdate = choosen;
          }
        });
      });
    }

    void submit() {
      if (planName.text.isEmpty || _inputdate == null) {
        return;
      }
      widget.addPlan(planName.text, _inputdate);
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 12,
            left: 28,
            right: 28,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom + 30
                : MediaQuery.of(context).viewInsets.bottom + 140),
        child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              TextField(
                controller: planName,
                decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color.fromARGB(255, 8, 38, 65)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color.fromARGB(255, 8, 38, 65)),
                    ),
                    disabledBorder:OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color.fromARGB(255, 8, 38, 65)),
                    ), 
                    labelText: 'Plan name',
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 24, 64, 98),
                      fontFamily: GoogleFonts.oxygen().fontFamily,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      _inputdate == null
                          ? 'Plan date not selected'
                          : '${DateFormat(" d MMM yyy").format(_inputdate!)}',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 6, 33, 54),
                        fontSize: 12,
                        fontFamily: GoogleFonts.oxygen().fontFamily,
                      )),
                  TextButton.icon(
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        size: 15,
                        color: const Color.fromARGB(255, 30, 85, 133),
                      ),
                      onPressed: () {
                        _inputedDate(context);
                      },
                      label: Text(
                        'choose date',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: GoogleFonts.oxygen().fontFamily,
                            color: const Color.fromARGB(255, 6, 33, 54)),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(left: 20, right: 20)),
                          foregroundColor: MaterialStateProperty.all< Color>(
                              const Color.fromARGB(255, 162, 7, 7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              const Color.fromARGB(255, 162, 7, 7))))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.oxygen().fontFamily,
                            color: const Color.fromARGB(255, 162, 7, 7)),
                      )),
                  TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(left: 25, right: 25)),
                          foregroundColor: MaterialStateProperty.all< Color>(
                              const Color.fromARGB(255, 6, 33, 54)),
                          shape: MaterialStateProperty
                              .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: const Color.fromARGB(255, 6, 33, 54))))),
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        'Enter',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.oxygen().fontFamily,
                            color: const Color.fromARGB(255, 6, 33, 54)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
