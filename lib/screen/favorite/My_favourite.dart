import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite_provider.dart';
class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouritetoProvider =Provider.of<favoriteitemsProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('selected heart'),
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
                itemCount: favouritetoProvider.selectedItem.length,
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
