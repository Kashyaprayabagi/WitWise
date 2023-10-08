import 'package:flutter/material.dart';


class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(22.0),
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                         Center(
                            child: Container(
                                  height: 75.0,
                                  width: 75.0,
                                  child: Image.asset('images/open.png'),
                                  ),
                                  ),
                          const Text(
                          'WitWise',
                          style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                          ),
                          ),
                          const SizedBox(height: 100.0,),


          ],
        ),),),
    );
  }
}
