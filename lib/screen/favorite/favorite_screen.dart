import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider.dart';
import 'package:provider_practice/screen/favorite/My_favourite.dart';

import '../../provider/favorite_provider.dart';
class favoriteScreen extends StatefulWidget {
  const favoriteScreen({super.key});

  @override
  State<favoriteScreen> createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    //final favouritetoProvider =Provider.of<favoriteitemsProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteItemScreen()));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body:Column(
        children: [
       Expanded(
         child: ListView.builder(
            itemCount: 100,
             itemBuilder: (context, index){
           return Consumer<favoriteitemsProvider>(
               builder:(context, value, child){
                 return ListTile(
                   onTap: (){
                     if(value.selectedItem.contains(index)){
                    value.removeItem(index);
                     }else{
                       value.addItems(index);
                     }

                   },
                   title: Text('item'+index.toString()),
                   trailing: Icon(
                       value.selectedItem.contains(index) ?Icons.favorite : Icons.favorite_border_outlined),
                 );
               });
             }
         ),
       )
        ],
      ),
    );
  }
}
