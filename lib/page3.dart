import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class page3 extends StatefulWidget {
  const page3({Key? key}) : super(key: key);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(96, 125, 139,1),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 20,),
          Container(height: 50,child: Text('原汁原味',style: TextStyle(fontSize: 20,color: Colors.white),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            BottomForSay(title: '联合国演讲', yinpin: 'sound/WWW.mp3'),Container(width: 20,),BottomForSay(title: '丁真的一天', yinpin: 'sound/DJONEDAY.mp3'),
          ],),
          Container(height: 30,),
          Container(height: 40,child: Text('似真非真',style: TextStyle(fontSize: 20,color: Colors.white),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomForSay(title: '我的好事', yinpin: 'sound/haoshi.mp3'),
              Container(width: 20,),
              BottomForSay(title: '没有烟灰', yinpin: 'sound/meiyouyanhui1.mp3'),
            ],
          ),
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomForSay(title: '你是讨口子吗', yinpin: 'sound/taokouzi.mp3'),
              Container(width: 20,),
              BottomForSay(title: '说藏话了', yinpin: 'sound/cema.mp3'),
            ],
          ),
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomForSay(title: '雪豹闭嘴', yinpin: 'sound/xuebao.mp3'),
              Container(width: 20,),
              BottomForSay(title: '动物朋友', yinpin: 'sound/dongwupengyou.mp3'),
            ],
          ),
          Container(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomForSay(title: '我是丁真', yinpin: 'sound/woshidingzhen.mp3'),
              Container(width: 20,),
              BottomForSay(title: '在山里', yinpin: 'sound/jiaosheng.mp3'),
            ],
          ),
          //BottomForSay(title: '你是讨口子吗', yinpin: 'sound/taokouzi.mp3'),
        ],
      ),
    );
  }
}




class BottomForSay extends StatefulWidget {

  final String title;
  final String yinpin;
  BottomForSay({Key? key,required this.title,required this.yinpin}) : super(key: key);

  @override
  _BottomForSayState createState(){
    return _BottomForSayState();
  }
}

class _BottomForSayState extends State<BottomForSay> {
  @override
  //final player = AudioPlayer();
  final player = AudioPlayer();
  double gaodu =20;
  bool bofang = false;
  Color yanse= Color.fromRGBO(207, 216, 220, 1);
  Widget build(BuildContext context) {
    //final player1 = AudioPlayer();
    //player1.setAudioSource(source)
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(yanse),
        elevation: MaterialStateProperty.all(gaodu),
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
            width: 150,height: 80,
            child: Row(
              children: [
                Container(width: 20,),
                Text(this.widget.title,style: TextStyle(fontSize: 16,color: Colors.black),),
              ],
            ),
          ),
        ],
      ),
      onPressed:()async{
        if(bofang == true){
          player.pause();
          setState(() {
            yanse = Color.fromRGBO(207, 216, 220, 1);
            bofang = false;
            gaodu = 20;
            //player.pause();
          });
        }
        else{
          await player.play(AssetSource(this.widget.yinpin));
          await player.onPlayerComplete.listen((event) {
            setState(() {
              bofang = false;
              yanse = Color.fromRGBO(207, 216, 220, 1);
              player.release();
              gaodu = 20;
            });
          });
          //await player.setAsset(this.widget.yinpin);
          setState(() {
            bofang = true;
            yanse = Colors.orange;
            gaodu = 1;
            //player.setUrl(this.widget.yinpin);
          });
        }
        //player.setUrl('http://m701.music.126.net/20230422143226/5ddc1b84393440ce98e1ba2e72bc62a5/jdymusic/obj/wo3DlMOGwrbDjj7DisKw/14362050469/3def/82d0/1f11/e1fedf012e54e2f6c6d970cd94ff59a5.mp3');
        //player.play();
      },
    );
  }
}