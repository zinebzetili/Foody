import 'package:recipe_app/widgets/edit_item.dart';
import 'package:flutter/material.dart';


class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String gender="man" ; 
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
          actions:[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(onPressed: (){},
              style: IconButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent , 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                ),
                fixedSize : const Size(60, 50) , 
                elevation: 3 ,
              ),
               icon: const Icon(Icons.check , color: Colors.white) ),
            ), 
          ]
      ),
      
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
              "Account" , 
               style: TextStyle(
                fontSize: 36 , 
                fontWeight: FontWeight.bold , 
               ),
              ) ,
              const SizedBox(height: 40 ) ,
              EditItem(
                title: "photo" ,
                widget: Column(
                      children: [
                       const CircleAvatar(
                       backgroundColor: const Color(0xffffb5607),
                      radius: 30,
                      backgroundImage: AssetImage("assets/man.png")
                      ),
                        TextButton(onPressed: (){}, 
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent , 
                        ),
                        child: const Text("upload image"),
                        )
                      ],
                     )
                  ),
                  const EditItem(
                    widget: TextField(), 
                    title: "User Name" , 
                 ) , 
                 const SizedBox(height: 40) , 
                   EditItem(
                    title: "Gender" , 
                    widget: Row(
                      children: [
                      const SizedBox(width: 10 ,),
                      IconButton(
                        onPressed:() {
                          setState(() {
                            gender="man" ; 
                          });
                        }, 
                        style: IconButton.styleFrom(
                          backgroundColor: gender=="man"
                          ?Colors.deepPurple 
                          :Colors.grey.shade200 , 
                          fixedSize: Size(50, 50) , 
                        ),
                        icon:  Icon(
                          Icons.male , 
                          color: gender=="man" 
                          ?Colors.white 
                          :Colors.black ,
                           size: 20,) , 
                      ),
                      const SizedBox(width: 30) , 
                       IconButton(
                        onPressed:() {
                          setState(() {
                            gender="woman" ;
                          });
                        }, 
                        style: IconButton.styleFrom(
                          backgroundColor: gender=="woman"
                          ?Colors.deepPurple 
                          :Colors.grey.shade200 , 
                          fixedSize: Size(50, 50) , 
                        ),
                        icon:  Icon(
                          Icons.female , 
                          color: gender=="woman" 
                          ?Colors.white 
                          :Colors.black ,
                           size: 20,) , 
                       )
                    ],
                  ), 
                 ) , 
                const SizedBox(height: 40), 
                const EditItem(
                    widget: TextField(), 
                    title: "Age" , 
                 ) ,
                const SizedBox(height: 40), 
                const EditItem(
                    widget: TextField(), 
                    title: "Email" , 
                 ) , 
              ]
            ),
        ),
      ),
    );
  }
}
