import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String title ; 
  final Color bgcolor ; 
  final Color iconcolor  ; 
  final IconData icon ; 
  final bool value ; 
  final Function(bool value) onTap ; 
  const SettingSwitch({super.key, required this.title, required this.bgcolor, required this.iconcolor, required this.icon, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.infinity ,
          child: 
          Row(
            children: [
             Container(
              width: 50 ,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle , 
                color: bgcolor, 
              ),
              child: Icon(
               icon , 
               color: iconcolor ,
              ),
             ), 
             const  SizedBox(width: 20,) , 
             Text(title , 
             style: const TextStyle(
              fontSize: 16 , 
              fontWeight: FontWeight.w500 , 
             ), 
             ), 
             const Spacer() , 
 
             Text( value?
              "on" : "off" ,
             style: const TextStyle(
              fontSize: 14 , 
              color: Colors.grey , 
             ), 
             ) , 
             
             const SizedBox(height: 20,) ,  
             CupertinoSwitch(value: value, onChanged: onTap)
          ]
          ),
        );
  }
}