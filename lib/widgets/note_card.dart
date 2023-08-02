import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notice_app/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['note_title'],
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            doc['creation_date'],
            style: AppStyle.dateTitle,
          ),
          SizedBox(height: 8.0),
          Text(
            doc['note_content'],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    ),
  );
}


//KOD BİLGİSİ

//Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc): Bu satır, noteCard adında bir widget tanımlar ve iki parametre alır. 
//onTap, tıklama işleminin gerçekleştiğinde çağrılacak bir fonksiyon olabilir veya null olabilir (Function()? nullable bir fonksiyon türüdür)
// . doc ise bir Firestore veri tabanı belgesini temsil eden bir QueryDocumentSnapshot nesnesidir.
//return InkWell(...: Widget, InkWell adı verilen dokunma efektine sahip bir widget içinde tanımlanır. 
//Böylece not kartına tıklama özelliği eklenmiş olur. InkWell, tıklama veya dokunma anında su dalgası efekti sağlayan bir görsel geri bildirim sağlar.
//onTap: onTap,: InkWell widget'ının onTap özelliği, noteCard fonksiyonuna geçirilen onTap fonksiyonuyla eşleştirilir. 
//Yani, not kartına tıklandığında onTap adlı fonksiyon çalıştırılacaktır.
//child: Container(...: InkWell widget'ının çocuğu olarak bir Container tanımlanır. 
//Container, not kartını çevreleyen kutuyu temsil eder ve tüm not kartını düzenlemek için kullanılır.
//padding: EdgeInsets.all(8.0),: Container'ın iç içe dolgusu 8.0 birim olarak ayarlanır. 
//Bu, not kartının içeriklerini kartın kenarlarından içeriye doğru 8 birim boşluk bırakır.
//margin: EdgeInsets.all(8.0),: Container'ın dış dolgusu da 8.0 birim olarak ayarlanır. 
//Bu, not kartını diğer elementlerden (örneğin diğer not kartlarından) 8 birim uzakta tutar.
//decoration: BoxDecoration(...: Container'ın görünümünü düzenlemek için bir dekorasyon tanımlanır. 
//Bu dekorasyon, kartın rengini ve köşelerinin yuvarlaklığını belirler.
//color: AppStyle.cardsColor[doc['color_id']],: Kartın rengi, AppStyle adlı bir stil sınıfındaki cardsColor listesinden alınır. 
//Burada, doc adlı QueryDocumentSnapshot nesnesinin 'color_id' alanına göre rengi belirlenir. Bu, not kartlarının farklı renklere sahip olmasını sağlar.
//borderRadius: BorderRadius.circular(8.0),: Kartın köşelerini yuvarlatmak için bir 
////BorderRadius.circular değeri atanır. 8.0 birimlik yuvarlaklık belirtilir.
//child: Column(...: Container'ın çocuğu olarak bir Column tanımlanır.
// Bu, not kartı içindeki metin ve içerikleri düzenlemek için kullanılır. 
//Column, dikey olarak sıralanmış birden fazla çocuk widget'ı içerir.
//crossAxisAlignment: CrossAxisAlignment.start,: Column'un içindeki çocukları yatay olarak hizalama ayarı yapılır. 
//Bu durumda, çocukları sola (başlangıç noktasına) hizalayacaktır.
//children: [...: Column'un çocukları belirtilir, bu da not kartının içeriğini oluşturur.
//Text(doc['note_title'], style: AppStyle.mainTitle,),: Not kartının başlık alanını temsil eden bir Text widget'ıdır. 
//Başlık, doc nesnesinin 'note_title' alanından alınır ve //AppStyle sınıfındaki mainTitle stiliyle biçimlendirilir.
//Text(doc['creation_date'], style: AppStyle.dateTitle,),: Not kartının oluşturulma tarihini temsil eden bir Text widget'ıdır. 
//Tarih, doc nesnesinin 'creation_date' alanından alınır ve AppStyle sınıfındaki dateTitle stiliyle biçimlendirilir.
//Text(doc['note_content'], style: AppStyle.mainContent,),: Not kartının içeriğini temsil eden bir Text widget'ıdır. 
//İçerik, doc nesnesinin 'note_content' alanından alınır ve AppStyle sınıfındaki mainContent stiliyle biçimlendirilir.
//overflow: TextOverflow.ellipsis ifadesi, Flutter'da bir Text widget'ında 
//metin içeriğinin belirli bir alanın sığmaması durumunda nasıl davranacağını 
//belirlemek için kullanılan bir özelliktir.
