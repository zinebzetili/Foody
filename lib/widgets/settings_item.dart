import 'package:recipe_app/widgets/Forward_Button.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title ; 
  final Color bgcolor ; 
  final Color iconcolor  ; 
  final IconData icon ; 
  final String? value ; 
  final Function() onTap ; 
  const SettingsItem({
    super.key , required this.title ,required this.bgcolor , required this.iconcolor , required this.icon, required this.onTap,   this.value ,
  });

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
             value!=null?  
             Text(value! ,
             style: const TextStyle(
              fontSize: 14 , 
              color: Colors.grey , 
             ), 
             ) : const SizedBox() , 
             const SizedBox(width: 10 ,) , 
             ForwardButton(onTap: onTap ,) ,
             const SizedBox(height: 20,) ,  
          ]
          ),
        );
  }
}