import 'package:flutter/material.dart';
import 'package:sample_shop/Items/Shoes.dart';
import 'Items/categories.dart';
void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>{
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text(
      'Shoes',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      )
    );
  List<Shoes> shoes = List();
  List<Shoes> filteredShoes = List();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState(){
    shoes = [
        Shoes(url: 'https://cdn.pixabay.com/photo/2016/11/19/18/06/feet-1840619_960_720.jpg', name: 'Nike', price: '100', category: 'None'),
        Shoes(url: 'https://cdn.pixabay.com/photo/2017/04/09/18/54/shoes-2216498_960_720.jpg', name: 'Adidas', price: '100', category: 'None'),
        Shoes(url: 'https://cdn.pixabay.com/photo/2019/10/11/14/47/sport-shoe-4542014_960_720.jpg', name: 'Salomon', price: '100', category: 'None')
    ];
    filteredShoes = shoes;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: <Widget>[
            IconButton(
            icon: searchIcon,
            color: Colors.black,
            onPressed: (){
              setState(() {
                if(this.searchIcon.icon == Icons.search){
                  this.searchIcon = Icon(Icons.cancel);
                  this.searchBar = TextField(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Search",
                        focusColor: Colors.grey,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 20
                        )
                      ),
                      onChanged: (string){
                        _debouncer.run((){
                          setState(() {
                          filteredShoes = shoes.where((u) => (u.name
                                                .toLowerCase()
                                                .contains(string.toLowerCase())))
                                                .toList();
                          });
                        });
                      },
                    );
                }else{
                  filteredShoes = shoes;
                  this.searchIcon = Icon(Icons.search);
                  this.searchBar = Text(
                        'Shoes',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )
                      );
                }
              });
        
            }),
          
          IconButton(
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            onPressed: (){},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CategoryCard(name: 'All', activeColor: Colors.grey[300],),
                      CategoryCard(name: 'Sneakers'),
                      CategoryCard(name: 'Football'),
                      CategoryCard(name: 'Soccer')
                    ],
                  ),
                ),
                SizedBox(height: 15,),

                Expanded(
                  child: getItems(filteredShoes)
                )
            ],
          )
        
      )
      );
  }
}

//RR