import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/generated/l10n.dart';

class DiseaseDetail extends StatefulWidget {
  final String disease;
  const DiseaseDetail({this.disease});
  @override
  _DiseaseDetailState createState() => _DiseaseDetailState();
}

class _DiseaseDetailState extends State<DiseaseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.disease,
          style: GoogleFonts.lato(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('disease')
              .orderBy('Name')
              .startAt([widget.disease]).endAt(
                  [widget.disease + '\uf8ff']).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
                physics: ClampingScrollPhysics(),
                children: snapshot.data.docs.map((document) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsetsDirectional.only(start: 15, end: 15),
                            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[50],
                            ),
                            child: Text(
                              document['Description'],
                              style: GoogleFonts.lato(
                                  color: Colors.black54, fontSize: 18),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsetsDirectional.only(start: 15, end: 15),
                            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[50],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.how_does_it_spread,
                                  style: GoogleFonts.lato(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  document['Spread'],
                                  style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsetsDirectional.only(start: 15, end: 15),
                            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[50],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.symtomps,
                                  style: GoogleFonts.lato(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  document['Symtomps'],
                                  style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsetsDirectional.only(start: 15, end: 15),
                            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[50],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.current.warning_signs,
                                  style: GoogleFonts.lato(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  document['Warning'],
                                  style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  );
                }).toList());
          }),
    );
  }
}
