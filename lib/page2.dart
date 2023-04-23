import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CategoryPage extends StatefulWidget{
  CategoryPage({Key? key}):super (key:key);
  _CategoryPageState createState()=>_CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{

  //final String PLAYING = '没有播放任何歌曲哦';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 600,
      color: Color.fromRGBO(96, 125, 139,1),
      child: Column(
        children: [
          Container(height: 30,),
          Container(height: 200,width:400,child: Image(image: AssetImage('assets/image/zhen.png')),),
          Container(height: 50,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomForMusic(title: '烟 Distance', yinpin: 'sound/distance.mp3',tupian: 'assets/image/distance.png',),
              Container(height: 20,),
              BottomForMusic(title: 'I got Smoke', yinpin: 'sound/gotsmoke.m4a',tupian: 'assets/image/zhen.png',),
              Container(height: 20,),
              BottomForMusic(title: 'Zood', yinpin: 'sound/ZOOD.m4a',tupian: 'assets/image/zood.png',),],
          ),
          Container(height: 50,),
          //Container(child: Text(PLAYING,style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}

class BottomForMusic extends StatefulWidget {

  final String title;
  final String yinpin;
  final String tupian;
  BottomForMusic({Key? key,required this.title,required this.yinpin,required this.tupian}) : super(key: key);

  @override
  State<BottomForMusic> createState(){
    return _BottomForMusicState();
  }
}

class _BottomForMusicState extends State<BottomForMusic> {
  @override
  final player = AudioPlayer();
  double gaodu = 20;
  bool bofang = false;
  Color yanse= Color.fromRGBO(207, 216, 220, 1);
  Widget build(BuildContext context) {
    //final player1 = AudioPlayer();
    //player1.setAudioSource(source)
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(gaodu),
        backgroundColor: MaterialStateProperty.all(yanse),
        shape: MaterialStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
      //fillColor: Colors.grey,
      //padding: EdgeInsets.only(left:10,),
      //splashColor: Colors.orange,
      //shape: StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 300,height: 100,
            child: Row(children: [
              Container(child: Image(image: AssetImage(this.widget.tupian),),width: 80,),
              Container(width: 10,),
              Text(this.widget.title,style: TextStyle(fontSize: 30,color: Color.fromRGBO(33, 33, 33, 1)),)
            ],)
          ),
        ],
      ),
      onPressed:()async{
        if(bofang == true){
          await player.stop();
          await player.release();
          setState(() {
            yanse = Color.fromRGBO(207, 216, 220, 1);
            bofang = false;
            gaodu = 20;
          });
        }
        else{
          await player.play(AssetSource(this.widget.yinpin));
          await player.onPlayerComplete.listen((event) {
            setState(() {
              bofang = false;
              yanse = Color.fromRGBO(207, 216, 220, 1);
              gaodu = 20;
            });
          });
          setState(() {
            bofang = true;
            yanse = Colors.orange;
            gaodu = 1;
          });
        }
        //player.setUrl('http://m701.music.126.net/20230422143226/5ddc1b84393440ce98e1ba2e72bc62a5/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14362050469/3def/82d0/1f11/e1fedf012e54e2f6c6d970cd94ff59a5.mp3');
        //player.play();
      },
    );
  }
}
