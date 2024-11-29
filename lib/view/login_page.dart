import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Center(child: Image.asset('assets/images/whatsapp-icon.png',height: 80,width: 80,)),
                ),
                Padding(padding: EdgeInsets.only(top: 20,
                ),
                  child: Text('akshck',style: TextStyle(
                color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 120,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
            
                    borderRadius: BorderRadius.circular(10),
                  ),
            
                  child: CustomTextField(hintText: 'Username/Email',
                  controller: emailController,
            
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
            
                    borderRadius: BorderRadius.circular(10),
                  ),
            
                  child: CustomTextField(hintText: 'Password',
                    controller: emailController,
            
                  ),
                ),
                SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                SizedBox(height: 50),
                InkWell(
                   onTap: (){
            
                   },
                    child: CustomButton(name: 'button',)),
                
              ],
              
            ),
            SizedBox(height: 10,),
           Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.check_box_outline_blank),
                   Text('ajlvjgasihhlooj[p'),
                 ],
               ),
              SizedBox(height: 100,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('ajlvjgasihhlooj[p?'),
                   Text('  create',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                 ],
               ),
        
        
             ],
           )
          ],
        ),
      ),
      
    );
  }
}
