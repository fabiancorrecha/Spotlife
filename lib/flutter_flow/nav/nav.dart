import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const FeedWidget() : const InicioWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const FeedWidget() : const InicioWidget(),
          routes: [
            FFRoute(
              name: 'inicio',
              path: 'inicio',
              builder: (context, params) => InicioWidget(
                ref: params.getParam(
                  'ref',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'ingresaConTelefono',
              path: 'ingresaConTelefono',
              builder: (context, params) => const IngresaConTelefonoWidget(),
            ),
            FFRoute(
              name: 'ingresaTelefonoValidacion',
              path: 'ingresaTelefonoValidacion',
              builder: (context, params) => const IngresaTelefonoValidacionWidget(),
            ),
            FFRoute(
              name: 'ingresaConUsernameValidacion',
              path: 'ingresaConUsernameValidacion',
              builder: (context, params) => IngresaConUsernameValidacionWidget(
                temporalEmail: params.getParam(
                  'temporalEmail',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ingresaConCorreo',
              path: 'ingresaConCorreo',
              builder: (context, params) => const IngresaConCorreoWidget(),
            ),
            FFRoute(
              name: 'restauraContrasena',
              path: 'restauraContrasena',
              builder: (context, params) => const RestauraContrasenaWidget(),
            ),
            FFRoute(
              name: 'ingresoOlvidoContrasena',
              path: 'ingresoOlvidoContrasena',
              builder: (context, params) => const IngresoOlvidoContrasenaWidget(),
            ),
            FFRoute(
              name: 'ingresaContrasenaListo',
              path: 'ingresaContrasenaListo',
              builder: (context, params) => const IngresaContrasenaListoWidget(),
            ),
            FFRoute(
              name: 'creaCuentaUserName-telefono',
              path: 'creaCuentaUserNameTelefono',
              builder: (context, params) => const CreaCuentaUserNameTelefonoWidget(),
            ),
            FFRoute(
              name: 'creaCuentaUserName-Correo',
              path: 'creaCuentaUserNameCorreo',
              builder: (context, params) => const CreaCuentaUserNameCorreoWidget(),
            ),
            FFRoute(
              name: 'creaCuentaCorreo',
              path: 'creaCuentaCorreo',
              builder: (context, params) => const CreaCuentaCorreoWidget(),
            ),
            FFRoute(
              name: 'creaCuentaCelular',
              path: 'creaCuentaCelular',
              builder: (context, params) => const CreaCuentaCelularWidget(),
            ),
            FFRoute(
              name: 'crearCuentaTelefonoValidacion',
              path: 'crearCuentaTelefonoValidacion',
              builder: (context, params) =>
                  const CrearCuentaTelefonoValidacionWidget(),
            ),
            FFRoute(
              name: 'creaCuentaContrasenha',
              path: 'creaCuentaContrasenha',
              builder: (context, params) => const CreaCuentaContrasenhaWidget(),
            ),
            FFRoute(
              name: 'Intereses',
              path: 'intereses',
              requireAuth: true,
              builder: (context, params) => const InteresesWidget(),
            ),
            FFRoute(
              name: 'primerosSeguidos',
              path: 'primerosSeguidos',
              requireAuth: true,
              builder: (context, params) => const PrimerosSeguidosWidget(),
            ),
            FFRoute(
              name: 'Bienvenida',
              path: 'bienvenida',
              builder: (context, params) => const BienvenidaWidget(),
            ),
            FFRoute(
              name: 'Feed',
              path: 'feed',
              requireAuth: true,
              builder: (context, params) => const FeedWidget(),
            ),
            FFRoute(
              name: 'gridPostFiltradosUbicacion',
              path: 'gridPostFiltradosUbicacion',
              requireAuth: true,
              asyncParams: {
                'postUser': getDoc(['userPosts'], UserPostsRecord.fromSnapshot),
              },
              builder: (context, params) => GridPostFiltradosUbicacionWidget(
                postUser: params.getParam(
                  'postUser',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'listaPostFiltradosUbicacion',
              path: 'listaPostFiltradosUbicacion',
              requireAuth: true,
              asyncParams: {
                'userPost': getDoc(['userPosts'], UserPostsRecord.fromSnapshot),
              },
              builder: (context, params) => ListaPostFiltradosUbicacionWidget(
                userPost: params.getParam(
                  'userPost',
                  ParamType.Document,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'mapa_ir_lugar',
              path: 'mapaIrLugar',
              requireAuth: true,
              asyncParams: {
                'userPost':
                    getDocList(['userPosts'], UserPostsRecord.fromSnapshot),
              },
              builder: (context, params) => MapaIrLugarWidget(
                userPost: params.getParam<UserPostsRecord>(
                  'userPost',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'seguidoresYSeguidos',
              path: 'seguidoresYSeguidos',
              requireAuth: true,
              builder: (context, params) => SeguidoresYSeguidosWidget(
                usuario: params.getParam(
                  'usuario',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'miperfilDetalleColeccion',
              path: 'miperfilDetalleColeccion',
              asyncParams: {
                'coleccion':
                    getDoc(['collections'], CollectionsRecord.fromSnapshot),
              },
              builder: (context, params) => MiperfilDetalleColeccionWidget(
                coleccion: params.getParam(
                  'coleccion',
                  ParamType.Document,
                ),
                esFavorito: params.getParam(
                  'esFavorito',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'miperfilMapaPin2',
              path: 'miperfilMapaPin2',
              asyncParams: {
                'coleccion':
                    getDoc(['collections'], CollectionsRecord.fromSnapshot),
              },
              builder: (context, params) => MiperfilMapaPin2Widget(
                coleccion: params.getParam(
                  'coleccion',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'perfilPropio',
              path: 'perfilPropio',
              requireAuth: true,
              builder: (context, params) => const PerfilPropioWidget(),
            ),
            FFRoute(
              name: 'miperfilMapa',
              path: 'miperfilMapa',
              requireAuth: true,
              builder: (context, params) => const MiperfilMapaWidget(),
            ),
            FFRoute(
              name: 'miperfilColeciones',
              path: 'miperfilColeciones',
              requireAuth: true,
              builder: (context, params) => const MiperfilColecionesWidget(),
            ),
            FFRoute(
              name: 'miPerfilMapaPin3',
              path: 'miPerfilMapaPin3',
              requireAuth: true,
              builder: (context, params) => const MiPerfilMapaPin3Widget(),
            ),
            FFRoute(
              name: 'miPerfilEditarPerfil',
              path: 'miPerfilEditarPerfil',
              requireAuth: true,
              builder: (context, params) => const MiPerfilEditarPerfilWidget(),
            ),
            FFRoute(
              name: 'ajustes_Favoritos',
              path: 'ajustesFavoritos',
              requireAuth: true,
              builder: (context, params) => const AjustesFavoritosWidget(),
            ),
            FFRoute(
              name: 'CrearColeccionConPost',
              path: 'crearColeccion',
              requireAuth: true,
              builder: (context, params) => CrearColeccionConPostWidget(
                post: params.getParam(
                  'post',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['userPosts'],
                ),
                esColeccionFavorito: params.getParam(
                  'esColeccionFavorito',
                  ParamType.bool,
                ),
                imagenes: params.getParam<String>(
                  'imagenes',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'AjusteMejoresAmigos',
              path: 'ajusteMejoresAmigos',
              requireAuth: true,
              builder: (context, params) => const AjusteMejoresAmigosWidget(),
            ),
            FFRoute(
              name: 'otroPerfil',
              path: 'otroPerfil',
              requireAuth: true,
              builder: (context, params) => OtroPerfilWidget(
                perfilAjeno: params.getParam(
                  'perfilAjeno',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'AjustesPedidosPagos',
              path: 'ajustesPedidosPagos',
              requireAuth: true,
              builder: (context, params) => const AjustesPedidosPagosWidget(),
            ),
            FFRoute(
              name: 'otroPerfilMapa',
              path: 'otroPerfilMapa',
              requireAuth: true,
              builder: (context, params) => OtroPerfilMapaWidget(
                usuario: params.getParam(
                  'usuario',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'otroPerfilColecciones',
              path: 'otroPerfilColecciones',
              requireAuth: true,
              builder: (context, params) => OtroPerfilColeccionesWidget(
                usuario: params.getParam(
                  'usuario',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: 'otroPerfilMapaPin',
              path: 'otroPerfilMapaPin',
              requireAuth: true,
              builder: (context, params) => const OtroPerfilMapaPinWidget(),
            ),
            FFRoute(
              name: 'mapaPosrRecomendados',
              path: 'mapaPosrRecomendados',
              requireAuth: true,
              builder: (context, params) => const MapaPosrRecomendadosWidget(),
            ),
            FFRoute(
              name: 'notificaciones',
              path: 'notificaciones',
              requireAuth: true,
              builder: (context, params) => const NotificacionesWidget(),
            ),
            FFRoute(
              name: 'mapaPrincipal',
              path: 'mapaPrincipal',
              builder: (context, params) => const MapaPrincipalWidget(),
            ),
            FFRoute(
              name: 'mapaPost',
              path: 'mapaPost',
              requireAuth: true,
              builder: (context, params) => const MapaPostWidget(),
            ),
            FFRoute(
              name: 'mapaFiltrarSpots',
              path: 'mapaFiltrarSpots',
              requireAuth: true,
              builder: (context, params) => const MapaFiltrarSpotsWidget(),
            ),
            FFRoute(
              name: 'buscarSpots',
              path: 'mapaBuscando',
              requireAuth: true,
              builder: (context, params) => const BuscarSpotsWidget(),
            ),
            FFRoute(
              name: 'buscarPerfil',
              path: 'buscarPerfil',
              requireAuth: true,
              builder: (context, params) => const BuscarPerfilWidget(),
            ),
            FFRoute(
              name: 'buscarLugares',
              path: 'buscarLugares',
              requireAuth: true,
              builder: (context, params) => const BuscarLugaresWidget(),
            ),
            FFRoute(
              name: 'CrearPost',
              path: 'crearPost',
              requireAuth: true,
              builder: (context, params) => CrearPostWidget(
                esImagen: params.getParam(
                  'esImagen',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'paginaTOS',
              path: 'paginaTOS',
              builder: (context, params) => const PaginaTOSWidget(),
            ),
            FFRoute(
              name: 'cuentasBloqueadas',
              path: 'cuentasBloqueadas',
              requireAuth: true,
              builder: (context, params) => const CuentasBloqueadasWidget(),
            ),
            FFRoute(
              name: 'detallePost',
              path: 'detallePost/:post',
              requireAuth: true,
              asyncParams: {
                'post': getDoc(['userPosts'], UserPostsRecord.fromSnapshot),
              },
              builder: (context, params) => DetallePostWidget(
                post: params.getParam(
                  'post',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'EditarPost',
              path: 'editarPost',
              requireAuth: true,
              asyncParams: {
                'post': getDoc(['userPosts'], UserPostsRecord.fromSnapshot),
              },
              builder: (context, params) => EditarPostWidget(
                post: params.getParam(
                  'post',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'CrearColeccionSinPost',
              path: 'crearColeccionSinPost',
              requireAuth: true,
              builder: (context, params) => CrearColeccionSinPostWidget(
                esColeccionFavorito: params.getParam(
                  'esColeccionFavorito',
                  ParamType.bool,
                ),
                image: params.getParam<String>(
                  'image',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'editarColeccion',
              path: 'editarColeccion',
              requireAuth: true,
              builder: (context, params) => EditarColeccionWidget(
                coleccion: params.getParam(
                  'coleccion',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['collections'],
                ),
                coleccionPublica: params.getParam(
                  'coleccionPublica',
                  ParamType.bool,
                ),
                coleccionAmigos: params.getParam(
                  'coleccionAmigos',
                  ParamType.bool,
                ),
                coleccionPrivado: params.getParam(
                  'coleccionPrivado',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'usuariosMeGusta',
              path: 'usuariosMeGusta',
              requireAuth: true,
              builder: (context, params) => UsuariosMeGustaWidget(
                userPost: params.getParam(
                  'userPost',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['userPosts'],
                ),
              ),
            ),
            FFRoute(
              name: 'metodo_de_pago',
              path: 'metodoDePago',
              requireAuth: true,
              builder: (context, params) => const MetodoDePagoWidget(),
            ),
            FFRoute(
              name: 'informacin_contacto',
              path: 'informacinContacto',
              requireAuth: true,
              builder: (context, params) => const InformacinContactoWidget(),
            ),
            FFRoute(
              name: 'configuracion_pagina',
              path: 'configuracionPagina',
              builder: (context, params) => const ConfiguracionPaginaWidget(),
            ),
            FFRoute(
              name: 'invitar_amigos_pagina',
              path: 'invitarAmigosPagina',
              builder: (context, params) => const InvitarAmigosPaginaWidget(),
            ),
            FFRoute(
              name: 'notificaciones_pagina',
              path: 'notificacionesPagina',
              builder: (context, params) => const NotificacionesPaginaWidget(),
            ),
            FFRoute(
              name: 'privacidad_cuenta',
              path: 'privacidadCuenta',
              builder: (context, params) => const PrivacidadCuentaWidget(),
            ),
            FFRoute(
              name: 'seguridad_pagina',
              path: 'seguridadPagina',
              builder: (context, params) => const SeguridadPaginaWidget(),
            ),
            FFRoute(
              name: 'cuenta_ajuste_pagina',
              path: 'cuentaAjustePagina',
              builder: (context, params) => const CuentaAjustePaginaWidget(),
            ),
            FFRoute(
              name: 'ayuda_pagina',
              path: 'ayudaPagina',
              builder: (context, params) => const AyudaPaginaWidget(),
            ),
            FFRoute(
              name: 'informacion_ajuste_pagina',
              path: 'informacionAjustePagina',
              builder: (context, params) => const InformacionAjustePaginaWidget(),
            ),
            FFRoute(
              name: 'busquedas_recientes_pagina',
              path: 'busquedasRecientesPagina',
              builder: (context, params) => const BusquedasRecientesPaginaWidget(),
            ),
            FFRoute(
              name: 'idioma_ajuste',
              path: 'idioma_ajuste',
              builder: (context, params) => const IdiomaAjusteWidget(),
            ),
            FFRoute(
              name: 'cuenta_ajuste_paginaCopy',
              path: 'cuentaAjustePaginaCopy',
              builder: (context, params) => const CuentaAjustePaginaCopyWidget(),
            ),
            FFRoute(
              name: 'FechadeNacimiento',
              path: 'fechadeNacimiento',
              requireAuth: true,
              builder: (context, params) => const FechadeNacimientoWidget(),
            ),
            FFRoute(
              name: 'mapaPrincipalCopy',
              path: 'mapaPrincipalCopy',
              builder: (context, params) => const MapaPrincipalCopyWidget(),
            ),
            FFRoute(
              name: 'TodosLosChats',
              path: 'todosLosChats',
              builder: (context, params) => const TodosLosChatsWidget(),
            ),
            FFRoute(
              name: 'ChatPage',
              path: 'chatPage',
              builder: (context, params) => ChatPageWidget(
                receiveChat: params.getParam(
                  'receiveChat',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
              ),
            ),
            FFRoute(
              name: 'HerramientasPromocion',
              path: 'herramientasPromocion',
              builder: (context, params) => const HerramientasPromocionWidget(),
            ),
            FFRoute(
              name: 'paginaProvisional',
              path: 'paginaProvisional',
              builder: (context, params) => const PaginaProvisionalWidget(),
            ),
            FFRoute(
              name: 'suscripcionactivada',
              path: 'suscripcionactivada',
              builder: (context, params) => SuscripcionactivadaWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'suscripcionFallida',
              path: 'suscripcionFallida',
              builder: (context, params) => SuscripcionFallidaWidget(
                id: params.getParam(
                  'id',
                  ParamType.int,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'PaginaEnContruccion',
              path: 'paginaEnContruccion',
              builder: (context, params) => const PaginaEnContruccionWidget(),
            ),
            FFRoute(
              name: 'mapaAmigos',
              path: 'mapaAmigos',
              builder: (context, params) => const MapaAmigosWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/inicio';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
