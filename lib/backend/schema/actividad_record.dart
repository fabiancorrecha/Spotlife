import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActividadRecord extends FirestoreRecord {
  ActividadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "creadorActividad" field.
  DocumentReference? _creadorActividad;
  DocumentReference? get creadorActividad => _creadorActividad;
  bool hasCreadorActividad() => _creadorActividad != null;

  // "recibeActividad" field.
  DocumentReference? _recibeActividad;
  DocumentReference? get recibeActividad => _recibeActividad;
  bool hasRecibeActividad() => _recibeActividad != null;

  // "sinLeer" field.
  bool? _sinLeer;
  bool get sinLeer => _sinLeer ?? false;
  bool hasSinLeer() => _sinLeer != null;

  // "meGusta" field.
  bool? _meGusta;
  bool get meGusta => _meGusta ?? false;
  bool hasMeGusta() => _meGusta != null;

  // "esComentario" field.
  bool? _esComentario;
  bool get esComentario => _esComentario ?? false;
  bool hasEsComentario() => _esComentario != null;

  // "esSeguir" field.
  bool? _esSeguir;
  bool get esSeguir => _esSeguir ?? false;
  bool hasEsSeguir() => _esSeguir != null;

  // "nombreUsuarioCreador" field.
  String? _nombreUsuarioCreador;
  String get nombreUsuarioCreador => _nombreUsuarioCreador ?? '';
  bool hasNombreUsuarioCreador() => _nombreUsuarioCreador != null;

  // "nombreUsuarioReceptor" field.
  String? _nombreUsuarioReceptor;
  String get nombreUsuarioReceptor => _nombreUsuarioReceptor ?? '';
  bool hasNombreUsuarioReceptor() => _nombreUsuarioReceptor != null;

  // "fechaCreacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "postRelacionado" field.
  DocumentReference? _postRelacionado;
  DocumentReference? get postRelacionado => _postRelacionado;
  bool hasPostRelacionado() => _postRelacionado != null;

  // "comentarioRelacionado" field.
  DocumentReference? _comentarioRelacionado;
  DocumentReference? get comentarioRelacionado => _comentarioRelacionado;
  bool hasComentarioRelacionado() => _comentarioRelacionado != null;

  // "meGustaComentario" field.
  bool? _meGustaComentario;
  bool get meGustaComentario => _meGustaComentario ?? false;
  bool hasMeGustaComentario() => _meGustaComentario != null;

  // "imagenUsuario" field.
  String? _imagenUsuario;
  String get imagenUsuario => _imagenUsuario ?? '';
  bool hasImagenUsuario() => _imagenUsuario != null;

  // "imagenPost" field.
  String? _imagenPost;
  String get imagenPost => _imagenPost ?? '';
  bool hasImagenPost() => _imagenPost != null;

  // "imagenPostList" field.
  List<String>? _imagenPostList;
  List<String> get imagenPostList => _imagenPostList ?? const [];
  bool hasImagenPostList() => _imagenPostList != null;

  void _initializeFields() {
    _creadorActividad = snapshotData['creadorActividad'] as DocumentReference?;
    _recibeActividad = snapshotData['recibeActividad'] as DocumentReference?;
    _sinLeer = snapshotData['sinLeer'] as bool?;
    _meGusta = snapshotData['meGusta'] as bool?;
    _esComentario = snapshotData['esComentario'] as bool?;
    _esSeguir = snapshotData['esSeguir'] as bool?;
    _nombreUsuarioCreador = snapshotData['nombreUsuarioCreador'] as String?;
    _nombreUsuarioReceptor = snapshotData['nombreUsuarioReceptor'] as String?;
    _fechaCreacion = snapshotData['fechaCreacion'] as DateTime?;
    _postRelacionado = snapshotData['postRelacionado'] as DocumentReference?;
    _comentarioRelacionado =
        snapshotData['comentarioRelacionado'] as DocumentReference?;
    _meGustaComentario = snapshotData['meGustaComentario'] as bool?;
    _imagenUsuario = snapshotData['imagenUsuario'] as String?;
    _imagenPost = snapshotData['imagenPost'] as String?;
    _imagenPostList = getDataList(snapshotData['imagenPostList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('actividad');

  static Stream<ActividadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActividadRecord.fromSnapshot(s));

  static Future<ActividadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActividadRecord.fromSnapshot(s));

  static ActividadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActividadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActividadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActividadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActividadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActividadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActividadRecordData({
  DocumentReference? creadorActividad,
  DocumentReference? recibeActividad,
  bool? sinLeer,
  bool? meGusta,
  bool? esComentario,
  bool? esSeguir,
  String? nombreUsuarioCreador,
  String? nombreUsuarioReceptor,
  DateTime? fechaCreacion,
  DocumentReference? postRelacionado,
  DocumentReference? comentarioRelacionado,
  bool? meGustaComentario,
  String? imagenUsuario,
  String? imagenPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creadorActividad': creadorActividad,
      'recibeActividad': recibeActividad,
      'sinLeer': sinLeer,
      'meGusta': meGusta,
      'esComentario': esComentario,
      'esSeguir': esSeguir,
      'nombreUsuarioCreador': nombreUsuarioCreador,
      'nombreUsuarioReceptor': nombreUsuarioReceptor,
      'fechaCreacion': fechaCreacion,
      'postRelacionado': postRelacionado,
      'comentarioRelacionado': comentarioRelacionado,
      'meGustaComentario': meGustaComentario,
      'imagenUsuario': imagenUsuario,
      'imagenPost': imagenPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActividadRecordDocumentEquality implements Equality<ActividadRecord> {
  const ActividadRecordDocumentEquality();

  @override
  bool equals(ActividadRecord? e1, ActividadRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creadorActividad == e2?.creadorActividad &&
        e1?.recibeActividad == e2?.recibeActividad &&
        e1?.sinLeer == e2?.sinLeer &&
        e1?.meGusta == e2?.meGusta &&
        e1?.esComentario == e2?.esComentario &&
        e1?.esSeguir == e2?.esSeguir &&
        e1?.nombreUsuarioCreador == e2?.nombreUsuarioCreador &&
        e1?.nombreUsuarioReceptor == e2?.nombreUsuarioReceptor &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.postRelacionado == e2?.postRelacionado &&
        e1?.comentarioRelacionado == e2?.comentarioRelacionado &&
        e1?.meGustaComentario == e2?.meGustaComentario &&
        e1?.imagenUsuario == e2?.imagenUsuario &&
        e1?.imagenPost == e2?.imagenPost &&
        listEquality.equals(e1?.imagenPostList, e2?.imagenPostList);
  }

  @override
  int hash(ActividadRecord? e) => const ListEquality().hash([
        e?.creadorActividad,
        e?.recibeActividad,
        e?.sinLeer,
        e?.meGusta,
        e?.esComentario,
        e?.esSeguir,
        e?.nombreUsuarioCreador,
        e?.nombreUsuarioReceptor,
        e?.fechaCreacion,
        e?.postRelacionado,
        e?.comentarioRelacionado,
        e?.meGustaComentario,
        e?.imagenUsuario,
        e?.imagenPost,
        e?.imagenPostList
      ]);

  @override
  bool isValidKey(Object? o) => o is ActividadRecord;
}
