import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notice_app/screen/note_editor.dart';
import 'package:notice_app/screen/note_reader.dart';
import 'package:notice_app/style/app_style.dart';
import 'package:notice_app/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("FireNotes"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your recent Notes',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
            const SizedBox(
              height: 20.0,
            ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NoteReaderScreen(note),
                                    ));
                              }, note))
                          .toList(),
                    );
                    //gridDelegate özelliği, SliverGridDelegateWithFixedCrossAxisCount sınıfı ile tanımlanır.
                    //Bu sınıf, çapraz eksen üzerinde sabit sayıda öğe içeren bir ızgara düzeni oluşturur.
                    //Burada crossAxisCount: 2 ile çapraz eksen üzerinde 2 öğe içeren bir ızgara oluşturulur.
                    //children özelliği, GridView içinde gösterilecek öğelerin listesini belirtir.
                    //snapshot.data!.docs ifadesi, snapshot'ın içindeki veriye erişir ve docs adlı bir öğe içerdiği varsayılır.
                    //Burada her bir belge için map fonksiyonu kullanılarak bir Widget listesi oluşturulur.
                    //noteCard(() {}, note) ifadesi, noteCard adında bir Widget üreten bir fonksiyon çağrısını temsil eder.
                    //Bu fonksiyon, () {} ile temsil edilen bir boş fonksiyon ve bir note nesnesi alır.
                    //.toList() ifadesi, oluşturulan Widget listesini bir Listeye dönüştürür.
                    //GridView'in children özelliği bir liste bekler, bu nedenle toList() fonksiyonu kullanılır.
                  }
                  return Text(
                    "there's no Notes",
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            )
            //Firestore'dan "Notes" adlı koleksiyonun anlık görüntülerini alarak bunları kullanıcı arayüzünde göstermek için bir StreamBuilder kullanıldı
            //Veriler henüz gelmediyse yükleniyor göstergesi gösterilecek
            //Veriler geldiğinde ise GridView içinde listelenecek.
            //Eğer veri yoksa "there's no Notes" metni gösterilecek.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        },
        label: Text('Add Note'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
