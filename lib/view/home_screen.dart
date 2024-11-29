import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/carousel_slider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;

  List<String> imag  = [
    'assets/images/pic5.png',
    'assets/images/pic2.png',
    'assets/images/pic3.png',
    'assets/images/pic1.png'
  ];


  
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
        final width = MediaQuery.of(context).size.width*1;
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child:Column(
              children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Colors.grey
                              ),
                            ]
                          ),
                          child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Text('Home Screen',style: TextStyle(color: Colors.grey,fontSize: 28,fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){}, icon: Icon(Icons.notification_add,size: 28,color: Colors.green.withOpacity(0.7),))
                ],
               ),
               SizedBox(height: 20,),
               CarouselSliderWidget(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Images',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                 ),
               ),
               SizedBox(height: 10,),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(   
                   children: [
                    for(int i=0;i<imag.length;i++)
                     Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      height: height*0.2,
                      decoration: BoxDecoration(
                       color: Colors.green,
                       boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      
                       ]
                      ),
                     child:Image.asset(
                  imag[i], // Use the image path at index i
                  fit: BoxFit.cover,),
                     )
                   ],
                 ),
               ),
               SizedBox(height: 10,),
               Container(
                 margin: EdgeInsets.all(10),
                 padding: EdgeInsets.all(10),
                 height: 60,
                 width: 330,
                 decoration: BoxDecoration(
                   color: Colors.grey,
                   boxShadow: [
                     BoxShadow(
                       blurRadius: 4,
                        spreadRadius: 1,
                        color: Colors.black
                     ),
                   ]
                 ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          index=1;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          color:index==1? Colors.amber:Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                     InkWell(
                      onTap: (){
                        setState(() {
                          index=2;
                        });
                      },
                      child: Container(
                       height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          color:index==2? Colors.amber:Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                     InkWell(
                      onTap: (){
                        setState(() {
                          index=3;
                        });
                      },
                      child: Container(
                       height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                          color:index==3? Colors.amber:Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('3',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                      ),
                    )

                  ],
                 ),
               )
              ],
            ),
             ),
        ),
        
    );
  }
}