import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DateandTime extends StatelessWidget {
  const DateandTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 66,left: 20),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 10,),
                  const Text('Date and Time',style: TextStyle(
                    fontSize: 20,
                    fontFamily: "robotic",fontWeight: FontWeight.w500,color: Colors.black
                  ),),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 196, 189, 161),
                    
                  ),
                  child: 
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Container(
                          height: 80,
                          width: 90,
                          
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            
                            
                            child: Image.asset("assets/indianwedding.jpeg",
                            fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      const Gap(25),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(children: [
                          Text("Love Events",style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                            Icon(Icons.currency_rupee),
                            SizedBox(width: 4,),
                            Text("80000",style: TextStyle(
                              fontSize: 16,
                            ),)
                          ],)
                          
                        ],),
                      ),
                      const Gap(10),
                      Column(children: [
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.location_on)),
                           const Text("kochi",style: TextStyle(fontSize: 16),)
                          ],
                        )
                      ],)
                    ],

                  ),
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
}