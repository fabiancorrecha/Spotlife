import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionsRecord extends FirestoreRecord {
  CollectionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "postuUserList" field.
  List<DocumentReference>? _postuUserList;
  List<DocumentReference> get postuUserList => _postuUserList ?? const [];
  bool hasPostuUserList() => _postuUserList != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "coleccionFavoritos" field.
  bool? _coleccionFavoritos;
  bool get coleccionFavoritos => _coleccionFavoritos ?? false;
  bool hasColeccionFavoritos() => _coleccionFavoritos != null;

  // "coleccionPublica" field.
  bool? _coleccionPublica;
  bool get coleccionPublica => _coleccionPublica ?? false;
  bool hasColeccionPublica() => _coleccionPublica != null;

  // "coleccionPrivada" field.
  bool? _coleccionPrivada;
  bool get coleccionPrivada => _coleccionPrivada ?? false;
  bool hasColeccionPrivada() => _coleccionPrivada != null;

  // "coleccionAmigos" field.
  bool? _coleccionAmigos;
  bool get coleccionAmigos => _coleccionAmigos ?? false;
  bool hasColeccionAmigos() => _coleccionAmigos != null;

  // "placeInfo" field.
  PlaceInfoStruct? _placeInfo;
  PlaceInfoStruct get placeInfo => _placeInfo ?? PlaceInfoStruct();
  bool hasPlaceInfo() => _placeInfo != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _postuUserList = getDataList(snapshotData['postuUserList']);
    _descripcion = snapshotData['descripcion'] as String?;
    _imagen = snapshotData['imagen'] as String?;
    _coleccionFavoritos = snapshotData['coleccionFavoritos'] as bool?;
    _coleccionPublica = snapshotData['coleccionPublica'] as bool?;
    _coleccionPrivada = snapshotData['coleccionPrivada'] as bool?;
    _coleccionAmigos = snapshotData['coleccionAmigos'] as bool?;
    _placeInfo = PlaceInfoStruct.maybeFromMap(snapshotData['placeInfo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collections');

  static Stream<CollectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollectionsRecord.fromSnapshot(s));

  static Future<CollectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CollectionsRecord.fromSnapshot(s));

  static CollectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectionsRecord._(reference, mapFromFirestore(data));

  static CollectionsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CollectionsRecord.getDocumentFromData(
        {
          'nombre': snapshot.data['nombre'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'createdBy': convertAlgoliaParam(
            snapshot.data['createdBy'],
            ParamType.DocumentReference,
            false,
          ),
          'modified_at': convertAlgoliaParam(
            snapshot.data['modified_at'],
            ParamType.DateTime,
            false,
          ),
          'postuUserList': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['postuUserList'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'descripcion': snapshot.data['descripcion'],
          'imagen': snapshot.data['imagen'],
          'coleccionFavoritos': snapshot.data['coleccionFavoritos'],
          'coleccionPublica': snapshot.data['coleccionPublica'],
          'coleccionPrivada': snapshot.data['coleccionPrivada'],
          'coleccionAmigos': snapshot.data['coleccionAmigos'],
          'placeInfo':
              PlaceInfoStruct.fromAlgoliaData(snapshot.data['placeInfo'] ?? {})
                  .toMap(),
        },
        CollectionsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CollectionsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'collections',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CollectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectionsRecordData({
  String? nombre,
  DateTime? createdAt,
  DocumentReference? createdBy,
  DateTime? modifiedAt,
  String? descripcion,
  String? imagen,
  bool? coleccionFavoritos,
  bool? coleccionPublica,
  bool? coleccionPrivada,
  bool? coleccionAmigos,
  PlaceInfoStruct? placeInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'created_at': createdAt,
      'createdBy': createdBy,
      'modified_at': modifiedAt,
      'descripcion': descripcion,
      'imagen': imagen,
      'coleccionFavoritos': coleccionFavoritos,
      'coleccionPublica': coleccionPublica,
      'coleccionPrivada': coleccionPrivada,
      'coleccionAmigos': coleccionAmigos,
      'placeInfo': PlaceInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "placeInfo" field.
  addPlaceInfoStructData(firestoreData, placeInfo, 'placeInfo');

  return firestoreData;
}

class CollectionsRecordDocumentEquality implements Equality<CollectionsRecord> {
  const CollectionsRecordDocumentEquality();

  @override
  bool equals(CollectionsRecord? e1, CollectionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.modifiedAt == e2?.modifiedAt &&
        listEquality.equals(e1?.postuUserList, e2?.postuUserList) &&
        e1?.descripcion == e2?.descripcion &&
        e1?.imagen == e2?.imagen &&
        e1?.coleccionFavoritos == e2?.coleccionFavoritos &&
        e1?.coleccionPublica == e2?.coleccionPublica &&
        e1?.coleccionPrivada == e2?.coleccionPrivada &&
        e1?.coleccionAmigos == e2?.coleccionAmigos &&
        e1?.placeInfo == e2?.placeInfo;
  }

  @override
  int hash(CollectionsRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.createdAt,
        e?.createdBy,
        e?.modifiedAt,
        e?.postuUserList,
        e?.descripcion,
        e?.imagen,
        e?.coleccionFavoritos,
        e?.coleccionPublica,
        e?.coleccionPrivada,
        e?.coleccionAmigos,
        e?.placeInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is CollectionsRecord;
}
