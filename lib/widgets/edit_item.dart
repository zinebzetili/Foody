import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  final Widget widget ; 
  final String title ; 
  const EditItem({super.key, required this.widget, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
               Expanded(
                child : 
                Text(
                 title , 
                 style:const TextStyle(
                  fontSize: 18 , 
                  color: Colors.grey , 
                 ),
                )
              ),
              const SizedBox(width: 40) , 
              Expanded(
                flex: 2,
                child: widget ,
                 
                )
            ],
          );
  }
}