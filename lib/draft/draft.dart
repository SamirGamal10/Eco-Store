/*
appBar: AppBar(
leading: IconButton(
icon: const Icon(Icons.menu),
color: Colors.black,
onPressed: () {
cubit.scafKey.currentState!.openDrawer();
},
),
title: const Center(
child: Text(
'eco store',
style: TextStyle(
color: Colors.redAccent,
fontStyle: FontStyle.italic,
fontSize: 23),
)),
actions: [
IconButton(
icon: const Icon(Icons.search),
color: Colors.black,
onPressed: () {},
),
const SizedBox(
width: 10,
),
IconButton(
icon: const Icon(Icons.notifications),
color: Colors.black,
onPressed: () {},
),
],
),
drawer: Drawer(
child: ListView(
children: [
const UserAccountsDrawerHeader(
currentAccountPicture: CircleAvatar(
radius: 30,
backgroundImage: AssetImage("assets/images/man.jpg"),
),
accountName: Text("samir gamal"),
decoration: BoxDecoration(
color: Color.fromARGB(255, 102, 124, 133),
),
accountEmail: Text("samirjamal2018@yahoo.com")),
ListTile(
onTap: () {
navgateAndFinsh(context, LayOut());
},
enabled: true,
leading: const Icon(
Icons.home,
size: 35,
),
title: const Text(
"Home",
style: TextStyle(
fontSize: 18,
),
),
),
ListTile(
onTap: () {},
leading: const Icon(
Icons.chat,
size: 35,
),
title: const Text(
"chat",
style: TextStyle(
fontSize: 18,
),
),
),
ListTile(
onTap: () {},
leading: const Icon(
Icons.phone,
size: 35,
),
title: const Text(
"connect us",
style: TextStyle(
fontSize: 18,
),
),
),
ListTile(
onTap: () {},
leading: const Icon(
Icons.info,
size: 35,
),
title: const Text(
"About",
style: TextStyle(
fontSize: 18,
),
),
),
ListTile(
onTap: () {
ShopAppCubit.get(context).changeMode();
navgateAndFinsh(context, LayOut());
},
leading: const Icon(
Icons.brightness_4_rounded,
size: 35,
),
title: const Text(
"Dark mode",
style: TextStyle(
fontSize: 18,
),
),
),
ListTile(
onTap: () {},
leading: const Icon(
Icons.logout,
size: 35,
),
title: const Text(
"logout",
style: TextStyle(
fontSize: 18,
),
),
),
],
),

// TextButton(
//   onPressed: () {
//     CachHelper.removeData(key: 'uid').then((value) {
//       if (value) {
//         navgateAndFinsh(context, const LoginScreen());
//       }
//     });
//   },
//   child: const Text('Sin Up'),
// ),
),
// backgroundColor: Colors.white,
//    body:  Column(
//      children: [
//        Container(
//                  width: double.infinity,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: [
//                      Row(
//                        children: const [
//                          Text(
//                            "Featuerd",
//                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              fontSize: 18,
//                            ),
//                          ),
//                          Spacer(),
//                          Text("see all",
//                              style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 18,
//                              )),
//                        ],
//                      )
//                    ],
//                  ),
//                ),
//        Expanded(
//          child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (context, index) {
//              return mycard(
//                salary: featured["salary"][index]["salary"],
//                text: featured["salary"][index]["text"],
//                image: featured["salary"][index]["image"],
//              );
//            },
//            itemCount: 3,
//          ),
//        ),
//        Expanded(
//          child: ListView.builder(
//            scrollDirection: Axis.horizontal,
//            itemBuilder: (context, index) {
//              return mycard(
//                salary: salary[index],
//                text: text[index],
//                image: image[index],
//              );
//            },
//            itemCount: 3,
//          ),
//        ),
//       Row(
//         children: [
//           Expanded(
//             child: mycard(
//                 salary: "100.00 \$",
//                 text: "watch classic",
//                 image: "assets/images/watch.jpg"),
//           ),
//           Expanded(
//             child: mycard(
//                 salary: "100.00 \$",
//                 text: "watch classic",
//                 image: "assets/images/watch.jpg"),
//           ),
//           Expanded(
//             child: mycard(
//                 salary: "100.00 \$",
//                 text: "watch classic",
//                 image: "assets/images/watch.jpg"),
//           ),
//         ],
//       ),
//      ],
//    ),
body: SingleChildScrollView(
scrollDirection: Axis.vertical,
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: [
Expanded(
child: Container(
height: 200,
child: CarouselSlider(
items: const [
Image(
image: AssetImage(
"assets/images/sales.png",
),
),
Image(image: AssetImage("assets/images/mobile.jpeg")),
Image(
image: AssetImage("assets/images/elecgroub.jpeg")),
Image(image: AssetImage("assets/images/watch.jpg")),
Image(image: AssetImage("assets/images/tman.jpg")),
],
options: CarouselOptions(
height: 200,
initialPage: 0,
viewportFraction: 1,
enableInfiniteScroll: true,
reverse: false,
autoPlay: true,
autoPlayInterval: const Duration(seconds: 3),
autoPlayAnimationDuration: const Duration(seconds: 1),
autoPlayCurve: Curves.fastOutSlowIn,
scrollDirection: Axis.horizontal,
),
),
),
),
Container(
width: double.infinity,
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Row(
children: const [
Text(
"Featuerd",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
Spacer(),
Text("see all",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
)),
],
)
],
),
),
const SizedBox(
height: 20,
),
ListView.builder(
itemBuilder: (context, index) {
return mycard(
salary: salary[index],
text: text[index],
image: image[index],
);
},
itemCount: 3,
),
SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Row(
children: [
mycard(
salary: "30.00 \$",
text: "man T Shirt",
image: "assets/images/tman.jpg"),
mycard(
salary: "30.00 \$",
text: "women T Shirt",
image: "assets/images/women.jpg"),
mycard(
salary: "100.00 \$",
text: "watch classic",
image: "assets/images/watch.jpg"),
],
),
),
const SizedBox(
height: 15,
),
Row(
children: const [
Text(
"Categorie",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
Spacer(),
Text(
"See all",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
],
),
const SizedBox(
height: 10,
),
SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Container(
height: 120,
child: Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
mycategorie(image: "assets/images/address.jpg"),
mycategorie(image: "assets/images/pant.png"),
mycategorie(image: "assets/images/shirt.jpg"),
mycategorie(image: "assets/images/shoes.jpg"),
mycategorie(image: "assets/images/tie.jpeg"),
],
),
),
),
const SizedBox(
height: 15,
),
Row(
children: const [
Text(
"Featuerd",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
Spacer(),
Text("see all",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
)),
],
),
SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Row(
children: [

mycard(
salary: "",
text: "man T Shirt",
image: "assets/images/man.jpg"),
mycard(
salary: "",
text: "women T Shirt",
image: "assets/images/women.jpg"),
mycard(
salary: "",
text: "watch classic",
image: "assets/images/watch.jpg"),
],
),
),
],
),
),
),
*/