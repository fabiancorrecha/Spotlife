import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _esVistaAmigos = prefs.getBool('ff_esVistaAmigos') ?? _esVistaAmigos;
    });
    _safeInit(() {
      _esVistaPost = prefs.getBool('ff_esVistaPost') ?? _esVistaPost;
    });
    _safeInit(() {
      _mapStyleA = prefs.getString('ff_mapStyleA') ?? _mapStyleA;
    });
    _safeInit(() {
      _vermapa = prefs.getBool('ff_vermapa') ?? _vermapa;
    });
    _safeInit(() {
      _low = prefs.getString('ff_low') ?? _low;
    });
    _safeInit(() {
      _centro = latLngFromString(prefs.getString('ff_centro')) ?? _centro;
    });
    _safeInit(() {
      _mapaPrincipal = prefs.getBool('ff_mapaPrincipal') ?? _mapaPrincipal;
    });
    _safeInit(() {
      _Global = prefs.getBool('ff_Global') ?? _Global;
    });
    _safeInit(() {
      _ocultar = prefs.getBool('ff_ocultar') ?? _ocultar;
    });
    _safeInit(() {
      _referente = prefs.getString('ff_referente')?.ref ?? _referente;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _contrasena = prefs.getString('ff_contrasena') ?? _contrasena;
    });
    _safeInit(() {
      _recordar = prefs.getBool('ff_recordar') ?? _recordar;
    });
    _safeInit(() {
      _MapaGlobal = prefs.getBool('ff_MapaGlobal') ?? _MapaGlobal;
    });
    _safeInit(() {
      _MapaAmigo = prefs.getBool('ff_MapaAmigo') ?? _MapaAmigo;
    });
    _safeInit(() {
      _PostGlobal = prefs.getBool('ff_PostGlobal') ?? _PostGlobal;
    });
    _safeInit(() {
      _PostAmigo = prefs.getBool('ff_PostAmigo') ?? _PostAmigo;
    });
    _safeInit(() {
      _collectionUse = prefs
              .getStringList('ff_collectionUse')
              ?.map((path) => path.ref)
              .toList() ??
          _collectionUse;
    });
    _safeInit(() {
      _Distancia = prefs.getDouble('ff_Distancia') ?? _Distancia;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ubication')) {
        try {
          final serializedData = prefs.getString('ff_ubication') ?? '{}';
          _ubication =
              PlaceInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _startUbication =
          latLngFromString(prefs.getString('ff_startUbication')) ??
              _startUbication;
    });
    _safeInit(() {
      _Amigos = prefs.getBool('ff_Amigos') ?? _Amigos;
    });
    _safeInit(() {
      _Mapa = prefs.getBool('ff_Mapa') ?? _Mapa;
    });
    _safeInit(() {
      _Post = prefs.getBool('ff_Post') ?? _Post;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String _inicioSesion = '';
  String get inicioSesion => _inicioSesion;
  set inicioSesion(String value) {
    _inicioSesion = value;
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
  }

  String _temporalContrasena = '';
  String get temporalContrasena => _temporalContrasena;
  set temporalContrasena(String value) {
    _temporalContrasena = value;
  }

  bool _crearCuentaTelefono = true;
  bool get crearCuentaTelefono => _crearCuentaTelefono;
  set crearCuentaTelefono(bool value) {
    _crearCuentaTelefono = value;
  }

  List<String> _listaIntereses = [];
  List<String> get listaIntereses => _listaIntereses;
  set listaIntereses(List<String> value) {
    _listaIntereses = value;
  }

  void addToListaIntereses(String value) {
    listaIntereses.add(value);
  }

  void removeFromListaIntereses(String value) {
    listaIntereses.remove(value);
  }

  void removeAtIndexFromListaIntereses(int index) {
    listaIntereses.removeAt(index);
  }

  void updateListaInteresesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaIntereses[index] = updateFn(_listaIntereses[index]);
  }

  void insertAtIndexInListaIntereses(int index, String value) {
    listaIntereses.insert(index, value);
  }

  int _vistas = 0;
  int get vistas => _vistas;
  set vistas(int value) {
    _vistas = value;
  }

  String _indexTabFollow = '0';
  String get indexTabFollow => _indexTabFollow;
  set indexTabFollow(String value) {
    _indexTabFollow = value;
  }

  String _newCollection = '';
  String get newCollection => _newCollection;
  set newCollection(String value) {
    _newCollection = value;
  }

  List<DocumentReference> _collectionSelected = [];
  List<DocumentReference> get collectionSelected => _collectionSelected;
  set collectionSelected(List<DocumentReference> value) {
    _collectionSelected = value;
  }

  void addToCollectionSelected(DocumentReference value) {
    collectionSelected.add(value);
  }

  void removeFromCollectionSelected(DocumentReference value) {
    collectionSelected.remove(value);
  }

  void removeAtIndexFromCollectionSelected(int index) {
    collectionSelected.removeAt(index);
  }

  void updateCollectionSelectedAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    collectionSelected[index] = updateFn(_collectionSelected[index]);
  }

  void insertAtIndexInCollectionSelected(int index, DocumentReference value) {
    collectionSelected.insert(index, value);
  }

  String _pageLink = '';
  String get pageLink => _pageLink;
  set pageLink(String value) {
    _pageLink = value;
  }

  bool _showMessagePopUp = false;
  bool get showMessagePopUp => _showMessagePopUp;
  set showMessagePopUp(bool value) {
    _showMessagePopUp = value;
  }

  String _messagePopUp = '';
  String get messagePopUp => _messagePopUp;
  set messagePopUp(String value) {
    _messagePopUp = value;
  }

  String _motivoReporte = '';
  String get motivoReporte => _motivoReporte;
  set motivoReporte(String value) {
    _motivoReporte = value;
  }

  bool _esVistaAmigos = false;
  bool get esVistaAmigos => _esVistaAmigos;
  set esVistaAmigos(bool value) {
    _esVistaAmigos = value;
    prefs.setBool('ff_esVistaAmigos', value);
  }

  bool _esVistaPost = false;
  bool get esVistaPost => _esVistaPost;
  set esVistaPost(bool value) {
    _esVistaPost = value;
    prefs.setBool('ff_esVistaPost', value);
  }

  String _mapStyleA =
      'String getMapStyle() { return \'\'\'[{\"featureType\":\"all\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"saturation\":36},{\"color\":\"#000000\"},{\"lightness\":40}]},{\"featureType\":\"all\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"visibility\":\"on\"},{\"color\":\"#000000\"},{\"lightness\":16}]},{\"featureType\":\"all\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"administrative\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"lightness\":20}]},{\"featureType\":\"administrative\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#000000\"},{\"lightness\":17},{\"weight\":1.2}]},{\"featureType\":\"administrative.province\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#e3b141\"}]},{\"featureType\":\"administrative.locality\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#e0a64b\"}]},{\"featureType\":\"administrative.locality\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#0e0d0a\"}]},{\"featureType\":\"administrative.neighborhood\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#d1b995\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#000000\"},{\"lightness\":20}]},{\"featureType\":\"poi\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#000000\"},{\"lightness\":21}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#12120f\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"lightness\":\"-77\"},{\"gamma\":\"4.48\"},{\"saturation\":\"24\"},{\"weight\":\"0.65\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"lightness\":29},{\"weight\":0.2}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#f6b044\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#4f4e49\"},{\"weight\":\"0.36\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#c4ac87\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#262307\"}]},{\"featureType\":\"road.local\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#a4875a\"},{\"lightness\":16},{\"weight\":\"0.16\"}]},{\"featureType\":\"road.local\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#deb483\"}]},{\"featureType\":\"transit\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#000000\"},{\"lightness\":19}]},{\"featureType\":\"water\",\"elementType\":\"geometry\",\"stylers\":[{\"color\":\"#0f252e\"},{\"lightness\":17}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#080808\"},{\"gamma\":\"3.14\"},{\"weight\":\"1.07\"}]}]\'\'\';}';
  String get mapStyleA => _mapStyleA;
  set mapStyleA(String value) {
    _mapStyleA = value;
    prefs.setString('ff_mapStyleA', value);
  }

  bool _verCajaComentariosActualizados = false;
  bool get verCajaComentariosActualizados => _verCajaComentariosActualizados;
  set verCajaComentariosActualizados(bool value) {
    _verCajaComentariosActualizados = value;
  }

  bool _vermapa = false;
  bool get vermapa => _vermapa;
  set vermapa(bool value) {
    _vermapa = value;
    prefs.setBool('ff_vermapa', value);
  }

  String _low = '';
  String get low => _low;
  set low(String value) {
    _low = value;
    prefs.setString('ff_low', value);
  }

  LatLng? _centro = const LatLng(40.4149599, -3.7107405);
  LatLng? get centro => _centro;
  set centro(LatLng? value) {
    _centro = value;
    value != null
        ? prefs.setString('ff_centro', value.serialize())
        : prefs.remove('ff_centro');
  }

  bool _mapaPrincipal = false;
  bool get mapaPrincipal => _mapaPrincipal;
  set mapaPrincipal(bool value) {
    _mapaPrincipal = value;
    prefs.setBool('ff_mapaPrincipal', value);
  }

  bool _Global = true;
  bool get Global => _Global;
  set Global(bool value) {
    _Global = value;
    prefs.setBool('ff_Global', value);
  }

  bool _ocultar = true;
  bool get ocultar => _ocultar;
  set ocultar(bool value) {
    _ocultar = value;
    prefs.setBool('ff_ocultar', value);
  }

  DocumentReference? _referente;
  DocumentReference? get referente => _referente;
  set referente(DocumentReference? value) {
    _referente = value;
    value != null
        ? prefs.setString('ff_referente', value.path)
        : prefs.remove('ff_referente');
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    prefs.setString('ff_email', value);
  }

  String _contrasena = '';
  String get contrasena => _contrasena;
  set contrasena(String value) {
    _contrasena = value;
    prefs.setString('ff_contrasena', value);
  }

  bool _recordar = false;
  bool get recordar => _recordar;
  set recordar(bool value) {
    _recordar = value;
    prefs.setBool('ff_recordar', value);
  }

  bool _MapaGlobal = false;
  bool get MapaGlobal => _MapaGlobal;
  set MapaGlobal(bool value) {
    _MapaGlobal = value;
    prefs.setBool('ff_MapaGlobal', value);
  }

  bool _MapaAmigo = false;
  bool get MapaAmigo => _MapaAmigo;
  set MapaAmigo(bool value) {
    _MapaAmigo = value;
    prefs.setBool('ff_MapaAmigo', value);
  }

  bool _PostGlobal = false;
  bool get PostGlobal => _PostGlobal;
  set PostGlobal(bool value) {
    _PostGlobal = value;
    prefs.setBool('ff_PostGlobal', value);
  }

  bool _PostAmigo = false;
  bool get PostAmigo => _PostAmigo;
  set PostAmigo(bool value) {
    _PostAmigo = value;
    prefs.setBool('ff_PostAmigo', value);
  }

  List<DocumentReference> _collectionUse = [];
  List<DocumentReference> get collectionUse => _collectionUse;
  set collectionUse(List<DocumentReference> value) {
    _collectionUse = value;
    prefs.setStringList('ff_collectionUse', value.map((x) => x.path).toList());
  }

  void addToCollectionUse(DocumentReference value) {
    collectionUse.add(value);
    prefs.setStringList(
        'ff_collectionUse', _collectionUse.map((x) => x.path).toList());
  }

  void removeFromCollectionUse(DocumentReference value) {
    collectionUse.remove(value);
    prefs.setStringList(
        'ff_collectionUse', _collectionUse.map((x) => x.path).toList());
  }

  void removeAtIndexFromCollectionUse(int index) {
    collectionUse.removeAt(index);
    prefs.setStringList(
        'ff_collectionUse', _collectionUse.map((x) => x.path).toList());
  }

  void updateCollectionUseAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    collectionUse[index] = updateFn(_collectionUse[index]);
    prefs.setStringList(
        'ff_collectionUse', _collectionUse.map((x) => x.path).toList());
  }

  void insertAtIndexInCollectionUse(int index, DocumentReference value) {
    collectionUse.insert(index, value);
    prefs.setStringList(
        'ff_collectionUse', _collectionUse.map((x) => x.path).toList());
  }

  double _Distancia = 0.0;
  double get Distancia => _Distancia;
  set Distancia(double value) {
    _Distancia = value;
    prefs.setDouble('ff_Distancia', value);
  }

  PlaceInfoStruct _ubication = PlaceInfoStruct();
  PlaceInfoStruct get ubication => _ubication;
  set ubication(PlaceInfoStruct value) {
    _ubication = value;
    prefs.setString('ff_ubication', value.serialize());
  }

  void updateUbicationStruct(Function(PlaceInfoStruct) updateFn) {
    updateFn(_ubication);
    prefs.setString('ff_ubication', _ubication.serialize());
  }

  LatLng? _startUbication;
  LatLng? get startUbication => _startUbication;
  set startUbication(LatLng? value) {
    _startUbication = value;
    value != null
        ? prefs.setString('ff_startUbication', value.serialize())
        : prefs.remove('ff_startUbication');
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  bool _Amigos = false;
  bool get Amigos => _Amigos;
  set Amigos(bool value) {
    _Amigos = value;
    prefs.setBool('ff_Amigos', value);
  }

  bool _Mapa = true;
  bool get Mapa => _Mapa;
  set Mapa(bool value) {
    _Mapa = value;
    prefs.setBool('ff_Mapa', value);
  }

  bool _Post = false;
  bool get Post => _Post;
  set Post(bool value) {
    _Post = value;
    prefs.setBool('ff_Post', value);
  }

  LatLng? _prueba = const LatLng(40.38025669999999, -3.637530599999999);
  LatLng? get prueba => _prueba;
  set prueba(LatLng? value) {
    _prueba = value;
  }

  final _postUsuariosManager = StreamRequestManager<List<UserPostsRecord>>();
  Stream<List<UserPostsRecord>> postUsuarios({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UserPostsRecord>> Function() requestFn,
  }) =>
      _postUsuariosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostUsuariosCache() => _postUsuariosManager.clear();
  void clearPostUsuariosCacheKey(String? uniqueKey) =>
      _postUsuariosManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
