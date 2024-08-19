import 'package:recipe_app/screens/edit_account.dart';
import 'package:recipe_app/widgets/Forward_Button.dart';
import 'package:recipe_app/widgets/settings_item.dart';
import 'package:recipe_app/widgets/settings_switch.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isdarkmode = false ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb5607), // Set the background color of the app bar

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context) ;
          }, 
          icon: const Icon(Icons.chevron_left_outlined),
          ),
          leadingWidth: 80, 
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [ 
              const Text("Settings" ,
              style: TextStyle(
                fontSize: 36 , 
                fontWeight: FontWeight.bold , 
              ),
              ) , 
              const SizedBox( height: 30 ) , 
          
              const Text("Account" , 
              style: TextStyle(
                fontSize: 24 , 
                fontWeight: FontWeight.w500 , 
              ),
             ) , 
             const SizedBox( height: 20 ) , 
          
             SizedBox(
              width: double.infinity ,
              child: 
               Row(
                children: [
                  const CircleAvatar(
                      backgroundColor: const Color(0xffffb5607),
                      radius: 30,
                      backgroundImage: AssetImage("assets/man.png"),

                      ),
                    
                  const SizedBox(width: 20 ,) , 
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text("houari lacoste " , 
                      style: TextStyle(
                        fontSize: 18 , 
                        fontWeight: FontWeight.w500 , 
                      ),
                      ),
                      SizedBox(height: 10,) , 
                      Text("houari_31", 
                      style: TextStyle(
                        fontSize: 14 , 
                        color: Colors.grey , 
                      ),
                      )
                    ],
                  ),  
                  const Spacer() ,
                  ForwardButton(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const EditAccount() ,
                    )
                    );
                    },
                  ), 
                ]
              ),
             ) ,
             const SizedBox(height: 40 ,) , 
          
             const Text("Settings" , 
              style: TextStyle(
                fontSize: 24 , 
                fontWeight: FontWeight.w500 , 
              ),
             ) , 
               const SizedBox(height: 20 ,) , 
          
               SettingsItem(title: "language" , 
               bgcolor: Colors.orange.shade200, 
               iconcolor: Colors.orange,
               icon: Icons.language, 
               onTap: () {}, 
               value: "english"
               ) , 
               const SizedBox(height: 20) , 
               
          
               SettingsItem(title: "Notifications" , 
               bgcolor: Colors.blue.shade200, 
               iconcolor: Colors.blue,
               icon: Icons.notifications_active, 
               onTap: () {},  
               ) , 
               const SizedBox(height: 20) ,
               
               SettingSwitch(
               title: "Dark Mode" , 
               bgcolor: Colors.deepPurple.shade200, 
               iconcolor: Colors.deepPurple,
               icon: Icons.dark_mode, 
               onTap: (value) {
                setState(() {
                  isdarkmode = value ; 
                });
               }, 
               value: isdarkmode , 
               ) , 
               const SizedBox(height: 20) ,
          
               SettingsItem(title: "Help" , 
               bgcolor: Colors.red.shade200, 
               iconcolor: Colors.red,
               icon: Icons.help, 
               onTap: () {},  
               ) , 
              
               ]
              ),
        ),
      )
        );
     }
}