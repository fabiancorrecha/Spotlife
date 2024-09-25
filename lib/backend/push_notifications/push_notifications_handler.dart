import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Spotlife_logo_white.png',
              width: 300.0,
              height: 400.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'inicio': (data) async => ParameterData(
        allParams: {
          'ref': getParameter<DocumentReference>(data, 'ref'),
        },
      ),
  'ingresaConTelefono': ParameterData.none(),
  'ingresaTelefonoValidacion': ParameterData.none(),
  'ingresaConUsernameValidacion': (data) async => ParameterData(
        allParams: {
          'temporalEmail': getParameter<String>(data, 'temporalEmail'),
        },
      ),
  'ingresaConCorreo': ParameterData.none(),
  'restauraContrasena': ParameterData.none(),
  'ingresoOlvidoContrasena': ParameterData.none(),
  'ingresaContrasenaListo': ParameterData.none(),
  'creaCuentaUserName-telefono': ParameterData.none(),
  'creaCuentaUserName-Correo': ParameterData.none(),
  'creaCuentaCorreo': ParameterData.none(),
  'creaCuentaCelular': ParameterData.none(),
  'crearCuentaTelefonoValidacion': ParameterData.none(),
  'creaCuentaContrasenha': ParameterData.none(),
  'Intereses': ParameterData.none(),
  'primerosSeguidos': ParameterData.none(),
  'Bienvenida': ParameterData.none(),
  'Feed': ParameterData.none(),
  'gridPostFiltradosUbicacion': (data) async => ParameterData(
        allParams: {
          'postUser': await getDocumentParameter<UserPostsRecord>(
              data, 'postUser', UserPostsRecord.fromSnapshot),
        },
      ),
  'listaPostFiltradosUbicacion': (data) async => ParameterData(
        allParams: {
          'userPost': await getDocumentParameter<UserPostsRecord>(
              data, 'userPost', UserPostsRecord.fromSnapshot),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'mapa_ir_lugar': (data) async => const ParameterData(
        allParams: {},
      ),
  'seguidoresYSeguidos': (data) async => ParameterData(
        allParams: {
          'usuario': getParameter<DocumentReference>(data, 'usuario'),
        },
      ),
  'miperfilDetalleColeccion': (data) async => ParameterData(
        allParams: {
          'coleccion': await getDocumentParameter<CollectionsRecord>(
              data, 'coleccion', CollectionsRecord.fromSnapshot),
          'esFavorito': getParameter<bool>(data, 'esFavorito'),
        },
      ),
  'miperfilMapaPin2': (data) async => ParameterData(
        allParams: {
          'coleccion': await getDocumentParameter<CollectionsRecord>(
              data, 'coleccion', CollectionsRecord.fromSnapshot),
        },
      ),
  'perfilPropio': ParameterData.none(),
  'miperfilMapa': ParameterData.none(),
  'miperfilColeciones': ParameterData.none(),
  'miPerfilMapaPin3': ParameterData.none(),
  'miPerfilEditarPerfil': ParameterData.none(),
  'ajustes_Favoritos': ParameterData.none(),
  'CrearColeccionConPost': (data) async => ParameterData(
        allParams: {
          'post': getParameter<DocumentReference>(data, 'post'),
          'esColeccionFavorito':
              getParameter<bool>(data, 'esColeccionFavorito'),
        },
      ),
  'AjusteMejoresAmigos': ParameterData.none(),
  'otroPerfil': (data) async => ParameterData(
        allParams: {
          'perfilAjeno': getParameter<DocumentReference>(data, 'perfilAjeno'),
        },
      ),
  'AjustesPedidosPagos': ParameterData.none(),
  'otroPerfilMapa': (data) async => ParameterData(
        allParams: {
          'usuario': getParameter<DocumentReference>(data, 'usuario'),
        },
      ),
  'otroPerfilColecciones': (data) async => ParameterData(
        allParams: {
          'usuario': getParameter<DocumentReference>(data, 'usuario'),
        },
      ),
  'otroPerfilMapaPin': ParameterData.none(),
  'mapaPosrRecomendados': ParameterData.none(),
  'notificaciones': ParameterData.none(),
  'mapaPrincipal': ParameterData.none(),
  'mapaPost': ParameterData.none(),
  'mapaFiltrarSpots': ParameterData.none(),
  'buscarSpots': ParameterData.none(),
  'buscarPerfil': ParameterData.none(),
  'buscarLugares': ParameterData.none(),
  'CrearPost': (data) async => ParameterData(
        allParams: {
          'esImagen': getParameter<bool>(data, 'esImagen'),
        },
      ),
  'paginaTOS': ParameterData.none(),
  'cuentasBloqueadas': ParameterData.none(),
  'detallePost': (data) async {
    final allParams = {
      'post': await getDocumentParameter<UserPostsRecord>(
          data, 'post', UserPostsRecord.fromSnapshot),
    };
    return ParameterData(
      requiredParams: {
        'post': serializeParam(
          allParams['post'],
          ParamType.Document,
        ),
      },
      allParams: allParams,
    );
  },
  'EditarPost': (data) async => ParameterData(
        allParams: {
          'post': await getDocumentParameter<UserPostsRecord>(
              data, 'post', UserPostsRecord.fromSnapshot),
        },
      ),
  'CrearColeccionSinPost': (data) async => ParameterData(
        allParams: {
          'esColeccionFavorito':
              getParameter<bool>(data, 'esColeccionFavorito'),
        },
      ),
  'editarColeccion': (data) async => ParameterData(
        allParams: {
          'coleccion': getParameter<DocumentReference>(data, 'coleccion'),
          'coleccionPublica': getParameter<bool>(data, 'coleccionPublica'),
          'coleccionAmigos': getParameter<bool>(data, 'coleccionAmigos'),
          'coleccionPrivado': getParameter<bool>(data, 'coleccionPrivado'),
        },
      ),
  'usuariosMeGusta': (data) async => ParameterData(
        allParams: {
          'userPost': getParameter<DocumentReference>(data, 'userPost'),
        },
      ),
  'metodo_de_pago': ParameterData.none(),
  'informacin_contacto': ParameterData.none(),
  'configuracion_pagina': ParameterData.none(),
  'invitar_amigos_pagina': ParameterData.none(),
  'notificaciones_pagina': ParameterData.none(),
  'privacidad_cuenta': ParameterData.none(),
  'seguridad_pagina': ParameterData.none(),
  'cuenta_ajuste_pagina': ParameterData.none(),
  'ayuda_pagina': ParameterData.none(),
  'informacion_ajuste_pagina': ParameterData.none(),
  'busquedas_recientes_pagina': ParameterData.none(),
  'idioma_ajuste': ParameterData.none(),
  'cuenta_ajuste_paginaCopy': ParameterData.none(),
  'FechadeNacimiento': ParameterData.none(),
  'mapaPrincipalCopy': ParameterData.none(),
  'TodosLosChats': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'receiveChat': getParameter<DocumentReference>(data, 'receiveChat'),
        },
      ),
  'HerramientasPromocion': ParameterData.none(),
  'paginaProvisional': ParameterData.none(),
  'suscripcionactivada': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'suscripcionFallida': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'PaginaEnContruccion': ParameterData.none(),
  'mapaAmigos': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
