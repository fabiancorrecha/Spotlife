import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // inicio
  {
    'oqd0m6s8': {
      'es': 'Explora, comparte y vive el mundo con Spotlife',
      'en': 'Explore, share and experience the world with Spotlife',
    },
    'bfbks61z': {
      'es':
          'Descubre lugares, personas y experiencias en cualquier parte del mundo',
      'en': 'Discover places, people and experiences anywhere in the world',
    },
    'm60vu3mn': {
      'es': 'Entrar',
      'en': 'Get in',
    },
    'djay2sms': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    'dgdq9luc': {
      'es': 'Crea tu cuenta',
      'en': 'creat your account',
    },
    'rr9d5msr': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresaConTelefono
  {
    '17b7cy81': {
      'es': 'País/región',
      'en': 'Country/region',
    },
    '05c16ecq': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    'zfukzzfl': {
      'es': 'Tu teléfono',
      'en': 'Your telephone',
    },
    '7mq767a1': {
      'es': 'Te enviaremos un mensaje para confirmar tu teléfono.',
      'en': 'We will send you a message to confirm your phone number.',
    },
    '1e1gb1vl': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    '39w2rao6': {
      'es': 'Crea tu cuenta',
      'en': 'creat your account',
    },
    'iigcsccl': {
      'es': 'Login',
      'en': 'Login',
    },
    'wkrjy0lh': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresaTelefonoValidacion
  {
    'e4uhnopv': {
      'es': '¿No recibiste un SMS?',
      'en': '',
    },
    'lzx8zydb': {
      'es': 'Enviar de nuevo',
      'en': '',
    },
    'j8pde26o': {
      'es': 'Más opciones',
      'en': 'More options',
    },
    '1v15ehuq': {
      'es': 'Continuar',
      'en': 'Continue',
    },
    '9tnvqvfm': {
      'es': 'Login',
      'en': 'Login',
    },
    'ikbo601w': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresaConUsernameValidacion
  {
    '2n4b6i3w': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'nrflqrtx': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'a471qswz': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresaConCorreo
  {
    's68kbjdw': {
      'es': 'Correo electrónico / Nombre de usuario',
      'en': 'Email / Username',
    },
    'qq4gfvi9': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'o08l28bs': {
      'es': '¿Deseas recordar tu contraseña? ',
      'en': '',
    },
    '1jz61bip': {
      'es': '¿Se te olvidó tu contraseña?',
      'en': '',
    },
    'gz2yu9wi': {
      'es': 'Continuar',
      'en': 'Continue',
    },
    'tfco2jvi': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'qqqwpm74': {
      'es': 'Introduce un correo electrónico válido',
      'en': 'Please enter a valid email',
    },
    '2no2y8co': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'c4qaxj91': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    's1ospdd1': {
      'es': 'Mínimo 6 caracteres en contraseña',
      'en': 'Minimum 6 characters in password',
    },
    'u1ma3e6t': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dzq2j35c': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    'nock1tmi': {
      'es': 'Crea tu cuenta',
      'en': 'creat your account',
    },
    'yqz6w9oo': {
      'es': 'Login',
      'en': 'Login',
    },
    'tdixlrvr': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // restauraContrasena
  {
    'r2472g26': {
      'es':
          'Podemos recordar tu contraseña para que tu acceso sea más sencillo.',
      'en': 'We can remember your password to make your access easier.',
    },
    '8ue78a60': {
      'es': 'Nueva contraseña',
      'en': 'New Password',
    },
    '64v4f2vg': {
      'es': 'Confirma tu nueva contraseña',
      'en': 'Confirm your new password',
    },
    '6qavzof5': {
      'es': 'Siguiente',
      'en': 'Following',
    },
    'ytantq1a': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    '97b32egf': {
      'es': 'Crea tu cuenta',
      'en': 'creat your account',
    },
    'w5kgwqq6': {
      'es': 'Restaura tu contraseña',
      'en': 'Reset your password',
    },
    'euuxw7t1': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresoOlvidoContrasena
  {
    'pwmxrurr': {
      'es': 'Correo electrónico',
      'en': 'Email',
    },
    'vl4iinlo': {
      'es':
          'Te enviaremos un correo electrónico con un link para restaurar tu contraseña.',
      'en': 'We will send you an email with a link to reset your password.',
    },
    '2bygbncj': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    '852wc2kk': {
      'es': 'Corrije el campo de correo electrónico',
      'en': 'Correct the email field',
    },
    'ruddch19': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fp2ceqxm': {
      'es': 'Restaura tu contraseña',
      'en': 'Reset your password',
    },
    'ofmliaz7': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ingresaContrasenaListo
  {
    'kh8qaa6b': {
      'es': 'Tu contraseña ha sido restaurada.',
      'en': 'Your password has been reset.',
    },
    'iggbpx3l': {
      'es': 'Ir a feed',
      'en': 'Go to feed',
    },
    'a2gndg68': {
      'es': '¡Listo!',
      'en': 'Ready!',
    },
    'ewgvyqz0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // creaCuentaUserName-telefono
  {
    'ghv8hayk': {
      'es': 'Nombre de usuario',
      'en': 'Username',
    },
    'jl33u6ha': {
      'es': 'Elije un nombre de usuario para tu nueva cuenta. Debe ser unico',
      'en': 'Choose a username for your new account. Must be unique',
    },
    '913r1t4g': {
      'es': 'Para usar esta app debes aceptar los Terminos de servicio',
      'en': 'To use this app you must accept the Terms of Service',
    },
    'qim1eg6s': {
      'es': 'Rellena este campo',
      'en': 'Fill in this field',
    },
    '4r8aobuz': {
      'es': 'Debes usar al menos 3 caracteres',
      'en': 'You must use at least 6 characters',
    },
    '2sz1hnou': {
      'es': 'Debe iniciar con una letra y solo contener letras',
      'en': 'Must start with a letter and only contain letters',
    },
    'nijpge2c': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'yy33robh': {
      'es': 'Continuar',
      'en': 'Continue',
    },
    '02ku12gt': {
      'es': '¿Ya tienes cuenta?',
      'en': 'Do you already have an account?',
    },
    'qldv2rnz': {
      'es': 'Log in',
      'en': 'Login',
    },
    '0sldny5a': {
      'es': 'Crear cuenta con teléfono',
      'en': 'Create account with phone',
    },
    '7kyov8e1': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // creaCuentaUserName-Correo
  {
    'd0qvlbbh': {
      'es': 'Nombre de usuario',
      'en': 'Username',
    },
    'ymdd821f': {
      'es': 'Jorge Sahagún',
      'en': 'Jorge Sahagun',
    },
    'dpkif3a0': {
      'es': 'Rellena este campo',
      'en': 'Fill in this field',
    },
    'g2sutke7': {
      'es': 'Debes usar al menos 6 caracteres',
      'en': 'You must use at least 6 characters',
    },
    '4pm48z9n': {
      'es': 'Debe iniciar con una letra y solo contener letras',
      'en': 'Must start with a letter and only contain letters',
    },
    'kxv3n69y': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'r9ti038n': {
      'es': 'Elije un nombre de usuario para tu nueva cuenta. Debe ser unico',
      'en': 'Choose a username for your new account. Must be unique',
    },
    'eure08sz': {
      'es': '¿Ya tienes cuenta?',
      'en': 'Do you already have an account?',
    },
    'zs55j9uj': {
      'es': 'Log in',
      'en': 'Login',
    },
    'bdy3roor': {
      'es': 'Crear cuenta con correo',
      'en': 'Create account with email',
    },
    'g8txaws6': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // creaCuentaCorreo
  {
    'dpvha1cb': {
      'es': 'Tu correo',
      'en': 'Your email',
    },
    'ch9im0x1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'nebzh6sl': {
      'es': ' ',
      'en': '',
    },
    'gnzfkfgn': {
      'es': ' ',
      'en': '',
    },
    '5sika88s': {
      'es': 'Crea una cuenta',
      'en': 'Create an account',
    },
    'kx9sxos5': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // creaCuentaCelular
  {
    'ute5ep75': {
      'es': 'País/región',
      'en': 'Country/region',
    },
    'hebfu067': {
      'es': 'Option 1',
      'en': 'Option 1',
    },
    '8bfl709o': {
      'es': 'Tu teléfono',
      'en': 'Your telephone',
    },
    '0p38gfo6': {
      'es': 'Te enviaremos un SMS para confirmar tu \ncelular.',
      'en': 'We will send you an SMS to confirm your\ncell phone.',
    },
    'vxvsf68e': {
      'es': 'Añade tu teléfono',
      'en': 'Add your phone',
    },
    'l389ziu5': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // crearCuentaTelefonoValidacion
  {
    'x2ytelhm': {
      'es': '¿No recibiste un SMS?',
      'en': 'Didn\'t you receive an SMS?',
    },
    'sv27xsus': {
      'es': 'Enviar de nuevo',
      'en': 'Send again',
    },
    '7iao7kz6': {
      'es': 'Más opciones',
      'en': 'More options',
    },
    'exdvfadm': {
      'es': 'Crear Cuenta',
      'en': 'Create Account',
    },
    'srn4mshd': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // creaCuentaContrasenha
  {
    'bchiqytj': {
      'es':
          'Podemos recordar tu contraseña para que tu acceso sea más sencillo.',
      'en': 'We can remember your password to make your access easier.',
    },
    '2kinw5bn': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'lqfqbtan': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'yy93uejf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'l7ho1yat': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    'awalvua3': {
      'es': 'Crea tu cuenta',
      'en': 'creat your account',
    },
    '9m6xcd1u': {
      'es': 'Crear contraseña',
      'en': 'Create a password',
    },
    'vcy14w0x': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Intereses
  {
    'lm4kqwit': {
      'es': 'Intereses',
      'en': '',
    },
    'k52awe9z': {
      'es':
          'Elige los temas que te interesan y Spotlife te mostrará lugares y personas para conectar y explorar.',
      'en': '',
    },
    'so8oqhe7': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // primerosSeguidos
  {
    'rufwm9s5': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Bienvenida
  {
    'hatexuf5': {
      'es': 'Nos alegra verte por aquí.',
      'en': 'We are glad to see you here.',
    },
    'n289fra2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Feed
  {
    '0h32jrss': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // gridPostFiltradosUbicacion
  {
    '93nn5jjv': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // listaPostFiltradosUbicacion
  {
    '4irpgcx7': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // mapa_ir_lugar
  {
    '140c348x': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // seguidoresYSeguidos
  {
    'f28uqetd': {
      'es': 'Seguidos',
      'en': 'followed',
    },
    'pdl9i1w2': {
      'es': 'Seguidores',
      'en': 'Followers',
    },
    'ukqq11k2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miperfilDetalleColeccion
  {
    '39ckloid': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miperfilMapaPin2
  {
    '6g7z26ea': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // perfilPropio
  {
    'ut3nex3h': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    'vzln35jl': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miperfilMapa
  {
    'vd84pxuh': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miperfilColeciones
  {
    'w0vrhxbj': {
      'es': 'Buscar',
      'en': '',
    },
    'lvl94sf4': {
      'es': 'Option 1',
      'en': '',
    },
    '12001ugh': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miPerfilMapaPin3
  {
    '9qchboqy': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // miPerfilEditarPerfil
  {
    'an50omuq': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ajustes_Favoritos
  {
    'mqty1e43': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CrearColeccionConPost
  {
    'cmu6wjnm': {
      'es': 'Título de la colección...',
      'en': 'Collection title...',
    },
    'lsddpjoi': {
      'es': 'Descripción de la colección...\n',
      'en': 'Collection description...',
    },
    '1w8tghe0': {
      'es': 'Privacidad de colección',
      'en': 'Collection Privacy',
    },
    'vw30nknp': {
      'es': 'Público',
      'en': 'Public',
    },
    'g80j6eyc': {
      'es': 'Amigos',
      'en': 'Friends',
    },
    'br1f053s': {
      'es': 'Privado',
      'en': 'Private',
    },
    'nzfca8yy': {
      'es': 'Lugar',
      'en': 'Place',
    },
    'v3munns3': {
      'es': 'Elige un lugar en el mapa',
      'en': 'Choose a place on the map',
    },
    'cu6fj7ae': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // AjusteMejoresAmigos
  {
    'g9alw0ux': {
      'es': 'Mejores amigos',
      'en': 'Best friends',
    },
    'r2zd2yea': {
      'es': 'Todos',
      'en': 'All',
    },
    'shxzi9x5': {
      'es': 'Visitados',
      'en': 'Visited',
    },
    '8gxj0skj': {
      'es': 'Por visitar',
      'en': 'To visit',
    },
    'ztknj98y': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // otroPerfil
  {
    'in53itya': {
      'es': 'Bloqueaste este usuario',
      'en': 'You blocked this user',
    },
    't3mj9plw': {
      'es': 'Enviar mensaje',
      'en': '',
    },
    'tszhui7f': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // AjustesPedidosPagos
  {
    'efpew29h': {
      'es': 'Pedidos y pagos',
      'en': 'Orders and payments',
    },
    '4x5oii93': {
      'es': 'Metodos de pago',
      'en': 'Payment methods',
    },
    'znepuly3': {
      'es': 'Información de contacto',
      'en': 'Contact information',
    },
    'q2mlw5ug': {
      'es': 'Seguridad',
      'en': 'Security',
    },
    'xnbl9w0g': {
      'es': 'Historial transacciones',
      'en': 'Transaction history',
    },
    'ojs07cc1': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // otroPerfilMapa
  {
    'soca7s95': {
      'es': 'Seguir',
      'en': 'Continue',
    },
    '951vu24q': {
      'es': 'Siguiendo',
      'en': 'Following',
    },
    'eqcg9rl7': {
      'es': 'Enviar mensaje',
      'en': '',
    },
    'fik63qen': {
      'es': 'seguidores',
      'en': 'home',
    },
  },
  // otroPerfilColecciones
  {
    '272nhnnn': {
      'es': 'Buscar',
      'en': '',
    },
    'clua705j': {
      'es': 'Option 1',
      'en': '',
    },
    'kyet1e4o': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // otroPerfilMapaPin
  {
    'qca74s6q': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // mapaPosrRecomendados
  {
    '9q12tfgv': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // notificaciones
  {
    'jt5buyxo': {
      'es': 'Hoy',
      'en': 'Today',
    },
    'fzk0kagy': {
      'es': 'Ayer',
      'en': 'Yesterday',
    },
    'fd2a6df5': {
      'es': 'Esta semana',
      'en': 'This week',
    },
    '9hnwefie': {
      'es': 'Este mes',
      'en': 'This month',
    },
    'g48oc7t5': {
      'es': 'Mas de un mes',
      'en': 'More than a month',
    },
    '2xvf144w': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // mapaPrincipal
  {
    'b1wy4gba': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // mapaPost
  {
    'uwi4f8ys': {
      'es': 'Dj Techno',
      'en': 'DJ Techno',
    },
    '2ub46emz': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // mapaFiltrarSpots
  {
    'yusmb4nb': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // buscarSpots
  {
    '6leulu8q': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    '2a74di3l': {
      'es': 'Playa',
      'en': '',
    },
    '6uax31vq': {
      'es': 'Option 2',
      'en': '',
    },
    'l5mg0sas': {
      'es': 'Option 3',
      'en': '',
    },
    'e1prln4b': {
      'es': 'Lugares Recomendados ',
      'en': '',
    },
    'c1ucnvay': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // buscarPerfil
  {
    'yhmm11f3': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    'hyxwxrjf': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // buscarLugares
  {
    '22q8tumg': {
      'es': 'Buscar',
      'en': 'Look for',
    },
    'cufz4kus': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CrearPost
  {
    'kt6uqv7e': {
      'es': 'Nuevo spot',
      'en': 'New spot',
    },
    'ovs993vm': {
      'es': 'Titulo',
      'en': '',
    },
    't0u2tkzd': {
      'es': 'Titulo',
      'en': '',
    },
    '4hfio31z': {
      'es': 'Descripción',
      'en': '',
    },
    'fdffw9r5': {
      'es': 'Descripción',
      'en': '',
    },
    '4kuobmxt': {
      'es': 'Etiquetar Personas',
      'en': '',
    },
    'wlyzvf4s': {
      'es': 'Ubicación',
      'en': '',
    },
    '1vy8nyqw': {
      'es': 'Etiqueta la ubicación',
      'en': '',
    },
    'xp7b5zpc': {
      'es': 'Privacidad del spot',
      'en': '',
    },
    'fulc8zhi': {
      'es': 'Público',
      'en': '',
    },
    'smfw16wj': {
      'es': 'Mejores amigos',
      'en': '',
    },
    'gc772dze': {
      'es': 'Spot secreto (solo yo)',
      'en': '',
    },
    '38yeg5jl': {
      'es': 'Colección',
      'en': 'My collections in Bio',
    },
    'bboy6pnx': {
      'es': 'Crear una nueva colección',
      'en': '',
    },
    'd5xk8jtj': {
      'es': 'Facebook',
      'en': 'Facebook',
    },
    'rxehug9g': {
      'es': 'Instagram',
      'en': 'instagram',
    },
    '6z087o5l': {
      'es': 'Twitter',
      'en': 'Twitter',
    },
    'ky3lljfy': {
      'es': 'Facebook',
      'en': '',
    },
    '9awmcbbl': {
      'es': 'Instagram',
      'en': '',
    },
    'a8wxnvnf': {
      'es': 'Twitter',
      'en': '',
    },
    'yxsxn8rn': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    'd5a9q2ac': {
      'es': 'Tu titulo debe tener minimo',
      'en': '',
    },
    'tcedau2g': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'z08cz2sz': {
      'es': 'Field is required',
      'en': '',
    },
    'x9sjw6es': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9tfvfuh7': {
      'es': 'Publicar',
      'en': '',
    },
    's891481e': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // paginaTOS
  {
    '8fd8ykjj': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    '8c957a3l': {
      'es': 'Corrije el campo de correo electrónico',
      'en': 'Correct the email field',
    },
    '05wdj7vd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'm9a5290w': {
      'es': 'Términos y condiciones',
      'en': 'Terms and Conditions',
    },
    'mfteid6p': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // detallePost
  {
    'l9btdihp': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // EditarPost
  {
    'ypyzkwh0': {
      'es': 'Editar Post',
      'en': '',
    },
    'smvocg4s': {
      'es': 'Titulo',
      'en': '',
    },
    'mf1wpjwf': {
      'es': 'Titulo',
      'en': '',
    },
    'bgraccv5': {
      'es': 'Descripción',
      'en': '',
    },
    'c7uptc1z': {
      'es': 'Descripción',
      'en': '',
    },
    'e0wl6wr2': {
      'es': 'Ubicación',
      'en': '',
    },
    'h5nste0h': {
      'es': 'Etiqueta la ubicación',
      'en': '',
    },
    '85u22a8t': {
      'es': 'Privacidad del spot',
      'en': '',
    },
    's5z0ydrg': {
      'es': 'Público',
      'en': '',
    },
    '9qxxmxx4': {
      'es': 'Mejores amigos',
      'en': '',
    },
    'lnwp5zng': {
      'es': 'Spot secreto (solo yo)',
      'en': '',
    },
    '8vsagv44': {
      'es': 'Colección',
      'en': '',
    },
    'wstfwl3i': {
      'es': 'Crear una nueva colección',
      'en': '',
    },
    'gyvhisu2': {
      'es': 'Facebook',
      'en': '',
    },
    'kdwh7qd6': {
      'es': 'Instagram',
      'en': '',
    },
    'p3xducn7': {
      'es': 'Twitter',
      'en': '',
    },
    '7dvmzr5r': {
      'es': 'Publicar',
      'en': '',
    },
    'nextta34': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CrearColeccionSinPost
  {
    'z42hb0dw': {
      'es': 'Título de la colección...',
      'en': 'Collection title...',
    },
    'zyu9lox8': {
      'es': 'Descripción de la colección...\n',
      'en': 'Collection description...',
    },
    'q7a3qhxf': {
      'es': 'Privacidad de colección',
      'en': 'Collection Privacy',
    },
    'kl2476pa': {
      'es': 'Público',
      'en': 'Public',
    },
    'xi7bjnlo': {
      'es': 'Amigos',
      'en': 'Friends',
    },
    'zf272lzg': {
      'es': 'Privado',
      'en': 'Private',
    },
    '7b7wusy5': {
      'es': 'Lugar',
      'en': 'Place',
    },
    '8vioq8gd': {
      'es': 'Elige un lugar en el mapa',
      'en': 'Choose a place on the map',
    },
    'f7n1wri5': {
      'es': 'Tipo de colección',
      'en': 'Collection type',
    },
    'ac79gekk': {
      'es':
          'Al activar esta opcion esta coleccion sera solo visible en la sección favoritos',
      'en':
          'By activating this option this collection will only be visible in the favorites section',
    },
    '52njp5zb': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // editarColeccion
  {
    'zp6uri06': {
      'es': 'Editar colección',
      'en': 'Edit collection',
    },
    'wnkh58hr': {
      'es': 'Título de la colección...',
      'en': 'Collection title...',
    },
    'mkwsx15g': {
      'es': 'Descripción de la colección...\n',
      'en': 'Collection description...',
    },
    '8gphoshi': {
      'es': 'Privacidad de colección',
      'en': 'Collection Privacy',
    },
    '561zo286': {
      'es': 'Público',
      'en': 'Public',
    },
    'bfj1zlk8': {
      'es': 'Amigos',
      'en': 'Friends',
    },
    'c8ndpvnn': {
      'es': 'Privado',
      'en': 'Private',
    },
    '1fbuxs4x': {
      'es': 'Lugar',
      'en': 'Place',
    },
    'oyviut30': {
      'es': 'Elige un lugar en el mapa',
      'en': 'Choose a place on the map',
    },
    'kdls04iy': {
      'es': 'Tipo de colección',
      'en': 'Collection type',
    },
    'ex1sne8q': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // usuariosMeGusta
  {
    'umzi2k2d': {
      'es': 'Usuarios a los que les gustó',
      'en': 'Users who liked it',
    },
    '7uetzir4': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // metodo_de_pago
  {
    'g9t7c240': {
      'es': 'Metodos de pago',
      'en': 'Payment methods',
    },
    'vnkc8xch': {
      'es': 'Añadir metodo de pago',
      'en': 'Add payment method',
    },
    '6eujagw5': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // informacin_contacto
  {
    '671bt6ny': {
      'es': 'Información contacto',
      'en': 'Contact information',
    },
    'nzo2wh6s': {
      'es': 'Nombre completo',
      'en': 'Full name',
    },
    'xe3zjdc9': {
      'es': 'Dirección facturación',
      'en': 'Billing address',
    },
    'gl0y9rij': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '1vha0bf0': {
      'es': 'Número de teléfono',
      'en': 'Phone number',
    },
    'zouj3ey8': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // configuracion_pagina
  {
    'g9degh4s': {
      'es': 'Configuración',
      'en': 'Setting',
    },
    '3fvvwy0r': {
      'es': 'Invitar a amigos',
      'en': 'Invite friends',
    },
    'ey0klspn': {
      'es': 'Privacidad',
      'en': 'Privacy',
    },
    'errekog4': {
      'es': 'Seguridad',
      'en': 'Security',
    },
    'wiaylq3u': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'emnvhxew': {
      'es': 'Ayuda',
      'en': 'Aid',
    },
    'k3vkvpuk': {
      'es': 'Información',
      'en': 'Information',
    },
    '4coedzin': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // invitar_amigos_pagina
  {
    'h14cy7xi': {
      'es': 'Invitar a amigos',
      'en': 'Invite friends',
    },
    '4ovqiul6': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    'kj3teqfz': {
      'es': 'Compartir enlace',
      'en': 'Share via whatsapp',
    },
    'puuy3f9r': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // notificaciones_pagina
  {
    'h06kmanl': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    '6vhh8drf': {
      'es': 'Notificaciones sociales',
      'en': 'Social notifications',
    },
    'bmeaq35g': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    't100x62k': {
      'es': 'Compartir via whatsapp',
      'en': 'Share via whatsapp',
    },
    'daqy9oi5': {
      'es': 'Compartir via instagram',
      'en': 'Share via Instagram',
    },
    'vwklgbyr': {
      'es': 'Notificaciones sociales',
      'en': 'Social notifications',
    },
    '9nf40o4k': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    '1jx16lia': {
      'es': 'Compartir via whatsapp',
      'en': 'Share via whatsapp',
    },
    '3vp7sm0b': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // privacidad_cuenta
  {
    '6lb7kr0n': {
      'es': 'Privacidad',
      'en': 'Privacy',
    },
    'jakfw2n2': {
      'es': 'Privacidad cuenta',
      'en': 'Privacy account',
    },
    'l3wjec69': {
      'es': 'Cuenta privada',
      'en': 'Private account',
    },
    'bhy2b27n': {
      'es': 'Privacidad Colecciones',
      'en': 'Privacy Collections',
    },
    '21ymigci': {
      'es': 'Privacidad Spots',
      'en': 'Privacy Spots',
    },
    'epc9midk': {
      'es': 'Conexiones',
      'en': 'Connections',
    },
    'sc6f29o3': {
      'es': 'Usuarios bloqueados',
      'en': 'Blocked users',
    },
    'a59b82em': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // seguridad_pagina
  {
    'ix21v9lh': {
      'es': 'Seguridad',
      'en': 'Security',
    },
    'dy67a68v': {
      'es': 'Seguridad inicio sesión',
      'en': 'Login security',
    },
    'nfprqha5': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'gztgmupb': {
      'es': 'información inicio sesión guardada',
      'en': 'saved login information',
    },
    'pfnv5d4k': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // cuenta_ajuste_pagina
  {
    'uvo383mu': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'xuel7xhu': {
      'es': 'Información usuario',
      'en': 'User information',
    },
    'p0dybf9s': {
      'es': 'Informacion personal',
      'en': 'Personal information',
    },
    'x9679505': {
      'es': 'Guardar fotos originales',
      'en': 'Save original photos',
    },
    'mpvymhzi': {
      'es': 'Herramientas cuenta profesional ',
      'en': '',
    },
    'j415er89': {
      'es': 'Herramientas promoción',
      'en': '',
    },
    'djmcpi98': {
      'es': 'Solicitar verificación',
      'en': '',
    },
    'rha6ba9z': {
      'es': 'Cambiar a cuenta Pro/Empresa',
      'en': '',
    },
    'gp0ejsaa': {
      'es': 'Idioma',
      'en': '',
    },
    '82zxx3mi': {
      'es': 'Cancelar Suscripcion',
      'en': '',
    },
    '3j1828s1': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ayuda_pagina
  {
    '8s5xzl9u': {
      'es': 'Ayuda',
      'en': 'Aid',
    },
    'aiwzp817': {
      'es': 'Preguntas frecuentes',
      'en': 'Frequent questions',
    },
    '1qv57r43': {
      'es': 'Ayuda online',
      'en': 'Online help',
    },
    'lzk19zdo': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // informacion_ajuste_pagina
  {
    '4zraujwk': {
      'es': 'Información',
      'en': 'Information',
    },
    'gyk6tdi9': {
      'es': 'Condiciones de uso',
      'en': 'Terms of use',
    },
    'ygotn5ym': {
      'es': 'Reglamento UE ',
      'en': 'EU Regulation',
    },
    '2j9ln3yv': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // busquedas_recientes_pagina
  {
    '3hc1cy46': {
      'es': 'Busquedas recientes',
      'en': 'Recent searches',
    },
    '9zzqsdm5': {
      'es': 'Aqui se mostraran las busquedas realizadas en el menu de explorar',
      'en': 'Here the searches carried out in the explore menu will be shown',
    },
    'iss08cq0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // idioma_ajuste
  {
    '4nycnk82': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'buomonyc': {
      'es': 'Puedes cambiar el idioma seleccionandolo desde aqui',
      'en': 'You can change the language by selecting it from here',
    },
    'n64dwc71': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // cuenta_ajuste_paginaCopy
  {
    'd8hdg61r': {
      'es': 'Cuenta',
      'en': '',
    },
    'e5j78qir': {
      'es': 'Información usuario',
      'en': '',
    },
    '15yxjtlv': {
      'es': 'Informacion personal',
      'en': '',
    },
    'zajjlkyw': {
      'es': 'Guardar fotos originales',
      'en': '',
    },
    '7gbx1oom': {
      'es': 'Herramientas cuenta profesional ',
      'en': '',
    },
    'jlrmz5rm': {
      'es': 'Herramientas promoción',
      'en': '',
    },
    '2hln9euu': {
      'es': 'Solicitar verificación',
      'en': '',
    },
    '1u55e3k3': {
      'es': 'Cambiar a cuenta empresa',
      'en': '',
    },
    '93rqmt2h': {
      'es': 'Idioma',
      'en': '',
    },
    '61ebiy95': {
      'es': 'Home',
      'en': '',
    },
  },
  // FechadeNacimiento
  {
    'x19zraw3': {
      'es': ' ',
      'en': '',
    },
    'xuvxn9lp': {
      'es':
          'Indica tu fecha de nacimiento, aunque esta cuenta sea para una empresa, mascota, una persona imaginaria... Nadie la vera a menos que tu decidas compartirla.',
      'en': '',
    },
    '2swtd20b': {
      'es': '¿Cuando naciste?',
      'en': '',
    },
    'z5kzbph9': {
      'es': 'Home',
      'en': '',
    },
  },
  // mapaPrincipalCopy
  {
    'muxn7ir1': {
      'es': 'Buscar',
      'en': '',
    },
    'zevz43os': {
      'es': 'Home',
      'en': '',
    },
  },
  // TodosLosChats
  {
    'dal2szjr': {
      'es': 'Mensajes',
      'en': '',
    },
    'tca843vy': {
      'es': 'Home',
      'en': '',
    },
  },
  // ChatPage
  {
    '6wbuhkp3': {
      'es': 'Escribe aqui tu mensaje...',
      'en': '',
    },
    'hedkr3d1': {
      'es': 'Enviar',
      'en': '',
    },
    'sgqps3c2': {
      'es': 'Home',
      'en': '',
    },
  },
  // HerramientasPromocion
  {
    'ftvqagho': {
      'es': 'Herramientas\nPromocion',
      'en': '',
    },
    '2t49hy0q': {
      'es': 'Lista Herramientas',
      'en': '',
    },
    '4huaujyh': {
      'es': 'Promocion Spot',
      'en': '',
    },
    '660zsyws': {
      'es': 'Evento 24h-48h en vivo',
      'en': '',
    },
    'clr5fsyx': {
      'es': 'Reto-Gymkana',
      'en': '',
    },
    'xl35jx67': {
      'es': 'Analisis demografico usuarios',
      'en': '',
    },
    '7jr2trll': {
      'es': 'Medallas PoAp',
      'en': '',
    },
    'kw3p2a38': {
      'es': ' (prueba de asistencia)',
      'en': '',
    },
    'qe3fu7w9': {
      'es': 'Crear Medalla POAP',
      'en': '',
    },
    'anenfxgi': {
      'es': 'Medallas Activas',
      'en': '',
    },
    'fthrtj3q': {
      'es': 'Home',
      'en': '',
    },
  },
  // paginaProvisional
  {
    'sl5hc3vg': {
      'es': 'Home',
      'en': '',
    },
  },
  // suscripcionactivada
  {
    '4aplwqmc': {
      'es': 'Tu suscripcion fue activada correctamente ',
      'en': '',
    },
    'xbv7erwi': {
      'es': 'Ir al Home',
      'en': '',
    },
    '82y2m63v': {
      'es': 'Home',
      'en': '',
    },
  },
  // suscripcionFallida
  {
    'myu6zxol': {
      'es': 'Hemos detectado un fallo para activar tu suscripcion',
      'en': '',
    },
    's3e3hahx': {
      'es': 'Ir al Home',
      'en': '',
    },
    'chcory1w': {
      'es': 'Home',
      'en': '',
    },
  },
  // PaginaEnContruccion
  {
    '060szt8h': {
      'es': 'Esta sección de',
      'en': '',
    },
    'xlqovagm': {
      'es': ' - Spotlife ',
      'en': '',
    },
    'k8ttq89x': {
      'es': 'aun se encuentra en desarrollo',
      'en': '',
    },
    'c83ug2am': {
      'es': 'Home',
      'en': '',
    },
  },
  // mapaAmigos
  {
    'c44awpho': {
      'es': 'Buscar',
      'en': '',
    },
    'p98sxtr2': {
      'es': 'Home',
      'en': '',
    },
  },
  // resetPass
  {
    'unue6ecr': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    'tmvtybsh': {
      'es':
          'Ingresa los datos de tu nueva contraseña para poder reestablecer tu acceso a ',
      'en': '',
    },
    'wdlvh6it': {
      'es': 'Spotlife',
      'en': '',
    },
    'ey57iy3c': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    'httamdec': {
      'es': 'Confirma tu nueva contraseña',
      'en': '',
    },
    'a7lkqjha': {
      'es': 'Siguiente',
      'en': '',
    },
    'eemc8m4n': {
      'es': 'Home',
      'en': '',
    },
  },
  // mapaPrincipaRespaldo
  {
    'zded45m2': {
      'es': 'Home',
      'en': '',
    },
  },
  // VistaPostlist
  {
    'fj1744c1': {
      'es': ' likes',
      'en': '',
    },
    'kaaia5vd': {
      'es': ' likes',
      'en': '',
    },
    't4vjpy1r': {
      'es': 'Mas',
      'en': '',
    },
    'yu7dg2s6': {
      'es': 'Añade un comentario...',
      'en': '',
    },
    '510ljajz': {
      'es': ' Likes',
      'en': '',
    },
    'zlo0i1ma': {
      'es': ' Likes',
      'en': '',
    },
    'go4t0xcu': {
      'es': 'Home',
      'en': '',
    },
  },
  // testNewVideo
  {
    'axqhf19c': {
      'es': 'Home',
      'en': '',
    },
  },
  // crearCuentaOptions
  {
    'x52yy6hl': {
      'es': 'Continúa con Correo      ',
      'en': 'Continue with Email',
    },
    '95d0f406': {
      'es': 'Continúa con Teléfono   ',
      'en': 'Continue with Telephone',
    },
    'd8p1tu7k': {
      'es': 'Continúa con Apple        ',
      'en': 'Continue with Apple',
    },
    'j8kwu2qj': {
      'es': 'Continúa con Google     ',
      'en': 'Continue with Google',
    },
  },
  // masOpciones
  {
    'tsgxcnq4': {
      'es': 'Ingresa a tu cuenta',
      'en': 'Log in to your account',
    },
  },
  // loginOptions
  {
    'bicc7jyh': {
      'es': 'Continúa con Correo      ',
      'en': 'Continue with Email',
    },
    '08rvkvb8': {
      'es': 'Continúa con Teléfono   ',
      'en': 'Continue with Telephone',
    },
    '4gtrpgqc': {
      'es': 'Continúa con Apple        ',
      'en': 'Continue with Apple',
    },
    'mosgym45': {
      'es': 'Continúa con Google     ',
      'en': 'Continue with Google',
    },
  },
  // postImagen
  {
    'm899btjr': {
      'es': 'Sam Calderón',
      'en': 'Sam Calderon',
    },
    'odytq49y': {
      'es': 'Noruega',
      'en': 'Norway',
    },
    'i4bikvi8': {
      'es': '210',
      'en': '210',
    },
    'jlvebznr': {
      'es': 'likes',
      'en': 'likes',
    },
    '1t5w5e1p': {
      'es':
          'Aquí va la descripción del post o video, hay que ver cuántos caracteres son buenos máximo...más',
      'en':
          'Here is the description of the post or video, you have to see how many characters are good maximum... more',
    },
    'csubh8ug': {
      'es': 'Añade un comentario...',
      'en': 'Add a comment...',
    },
    'mb6skwmv': {
      'es': 'Hace 10 minutos',
      'en': '10 minutes ago',
    },
  },
  // favoritoAColeccion
  {
    'pvzklx2d': {
      'es': 'Añadir favorito a colección',
      'en': 'Add favorite to collection',
    },
    'm970bwtb': {
      'es': 'Crear una nueva colección',
      'en': 'Create a new collection',
    },
  },
  // verComentarios
  {
    '23jwp3ki': {
      'es': 'Comentarios',
      'en': 'Comments',
    },
    'io827hmk': {
      'es': ' Likes',
      'en': 'Likes',
    },
    'kqo18cr2': {
      'es': 'Enviar comentario...',
      'en': 'Send comment...',
    },
    'bg4ft6gr': {
      'es': 'Enviar',
      'en': 'Send',
    },
  },
  // menuPostAjeno
  {
    'd0ebyn63': {
      'es': 'Compartir',
      'en': 'Share',
    },
    'hiixsb80': {
      'es': 'Link',
      'en': 'Link',
    },
    'no2rf96f': {
      'es': 'Reportar',
      'en': 'report',
    },
    '38js2rx4': {
      'es': 'Ocultar este post',
      'en': 'Hide this post',
    },
    'zuu7ey3d': {
      'es': 'Dejar de seguir',
      'en': 'Stop following',
    },
  },
  // menuReportar
  {
    'g5zguejb': {
      'es': 'Reportar',
      'en': 'report',
    },
    'hdukpqoe': {
      'es': '¿Por qué estás reportando este post?',
      'en': 'Why are you reporting this post?',
    },
    'o4l1ocvk': {
      'es':
          'Tu reporte será anónimo, excepto si estás reportando por propiedad intelectual. Si alguien está en peligro, llama a las autoridades locales enseguida.',
      'en':
          'Your report will be anonymous, except if you are reporting for intellectual property. If someone is in danger, call local authorities right away.',
    },
    '0tiikwvx': {
      'es': 'Es spam',
      'en': 'It\'s spam',
    },
    'm5gzyax0': {
      'es': 'Desnudos o actividad sexual',
      'en': 'Nudity or sexual activity',
    },
    'wximtg8h': {
      'es': 'Bullying o acoso',
      'en': 'Bullying or harassment',
    },
    'mrmm7hbf': {
      'es': 'Información falsa',
      'en': 'False information',
    },
    'qzvakjdd': {
      'es': 'Otro motivo',
      'en': 'Another reason',
    },
  },
  // menuReportar2
  {
    'ymgv4jnn': {
      'es': 'Reportar',
      'en': 'report',
    },
    'n1wsn1cr': {
      'es': '¿Por qué estás reportando este post?',
      'en': 'Why are you reporting this post?',
    },
    '3plfax1z': {
      'es':
          'Tu reporte será anónimo, excepto si estás reportando por propiedad intelectual. Si alguien está en peligro, llama a las autoridades locales enseguida.',
      'en':
          'Your report will be anonymous, except if you are reporting for intellectual property. If someone is in danger, call local authorities right away.',
    },
    'zpq0okg1': {
      'es': 'Escribe aquí...',
      'en': 'Write here...',
    },
    '067odh7m': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    '416z92np': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // tarjetaMiPerfil
  {
    'yfhnpjhs': {
      'es': ' Spots',
      'en': 'Spots',
    },
    '6tk4hj49': {
      'es': 'Seguidos y \nseguidores',
      'en': 'followed and\nfollowers',
    },
  },
  // tarjetaMiPerfilEditar
  {
    'cz0m9vrd': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    '3ctvj8yb': {
      'es': 'Listo',
      'en': 'Ready',
    },
    'hz20652y': {
      'es': 'Cambia tu foto de perfil',
      'en': 'Change your profile picture',
    },
    'vxc56h4i': {
      'es': 'Nombre de usuario',
      'en': 'Username',
    },
    'iy2zk87y': {
      'es': 'Correo',
      'en': 'Mail',
    },
    'kch8k2f5': {
      'es': 'Actualmente no puedes editar tu email',
      'en': '',
    },
    'pxh7kou3': {
      'es': 'Celular',
      'en': 'Cell phone',
    },
    'xs68b662': {
      'es': 'Descripcion',
      'en': 'Description',
    },
    '06uy5etf': {
      'es': 'Url',
      'en': 'url',
    },
    'd9gextza': {
      'es': 'Fecha de nacimiento',
      'en': '',
    },
    'w9z7r2bq': {
      'es': 'Genero',
      'en': '',
    },
    'aifi2xvk': {
      'es': 'Este campo es requerido',
      'en': 'This field is required',
    },
    'ok9zwr48': {
      'es': 'Error en el formato del campo',
      'en': 'Error in field format',
    },
    '38jg1xou': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '7qqysy58': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'h91abhb0': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'bmo42dqd': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'dbs3iijn': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'nn11w6si': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'd34k61qf': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'olq21yzf': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // ajustes_usuario_principal
  {
    's3zzy7y2': {
      'es': 'Ajustes',
      'en': 'Settings',
    },
    'zaqmd7y3': {
      'es': 'Configuración',
      'en': 'Setting',
    },
    '8fzq9a4r': {
      'es': 'Mis favoritos',
      'en': 'My favourites',
    },
    'j97vszvu': {
      'es': 'Mis mejores amigos',
      'en': 'My best friends',
    },
    'b93gtt27': {
      'es': 'Feedback',
      'en': 'Feedback',
    },
    'svuonvzz': {
      'es': 'Añadir cuenta',
      'en': 'Add Account',
    },
    'kttvk2k7': {
      'es': 'Salir de Cuenta',
      'en': 'Log out of Account',
    },
  },
  // configuracion_old
  {
    'xrd67z4v': {
      'es': 'Configuración',
      'en': 'Setting',
    },
  },
  // botonQuinto
  {
    '4g8rjzpp': {
      'es': '        ',
      'en': '',
    },
  },
  // cabecera
  {
    'zpm2qs23': {
      'es': 'Mis favoritos',
      'en': 'My favourites',
    },
  },
  // buscadorColecciones
  {
    'od3q50x8': {
      'es': 'Buscar',
      'en': 'Look for',
    },
  },
  // filtroFavoritos
  {
    'cp3qsx2y': {
      'es': 'Filtros favoritos',
      'en': 'Favorite filters',
    },
    'mjqh4tix': {
      'es': 'Año de publicación',
      'en': 'Year of publication',
    },
    'ttwfbqeb': {
      'es': '2024',
      'en': '2024',
    },
    'chxzoxnu': {
      'es': '2023',
      'en': '2023',
    },
    '4iv8zkol': {
      'es': '2022',
      'en': '2022',
    },
    '4qwc4jl6': {
      'es': 'Lugar',
      'en': 'Place',
    },
    'j05rs3n7': {
      'es': 'México',
      'en': 'Mexico',
    },
    '0wr30vyp': {
      'es': 'Italia',
      'en': 'Italy',
    },
    '2mr87c90': {
      'es': 'Irlanda',
      'en': 'Ireland',
    },
    'wvvy115v': {
      'es': 'Ibiza',
      'en': 'Ibiza',
    },
    'jymm2y94': {
      'es': 'Privacidad de colección',
      'en': 'Collection Privacy',
    },
    '4koqa4ds': {
      'es': 'Público',
      'en': 'Public',
    },
    'wwhyokng': {
      'es': 'Mejores amigos',
      'en': 'Best friends',
    },
    'eppdu8t2': {
      'es': 'Spot secreto (solo yo)',
      'en': 'Secret spot (just me)',
    },
  },
  // boton3
  {
    'kxsatwwn': {
      'es': '        ',
      'en': '',
    },
  },
  // tarjetaOtroPerfil
  {
    'h1dpym1e': {
      'es': ' Spots',
      'en': 'Spots',
    },
    'enpxvzz6': {
      'es': 'Seguidores',
      'en': 'Followers',
    },
    'j4j0qz28': {
      'es': 'Seguidos',
      'en': 'followed',
    },
  },
  // appBar2
  {
    'nskod62h': {
      'es': '[Nombre Usario]',
      'en': '[User Name]',
    },
    'mw810mb3': {
      'es': '[Ubicacion]',
      'en': '[Location]',
    },
  },
  // appBar6
  {
    'a0vrgz3c': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
  },
  // notificacionPost
  {
    'rtuluwef': {
      'es': 'Seguir',
      'en': 'Continue',
    },
  },
  // appBar8
  {
    '8kuubnwk': {
      'es': 'Experiencias para ti',
      'en': 'Experiences for you',
    },
  },
  // buscador01
  {
    'ygfqv3hm': {
      'es': 'Buscar',
      'en': 'Look for',
    },
  },
  // menu02
  {
    '07cg8q15': {
      'es': 'Lugares',
      'en': '',
    },
    'fombtlvv': {
      'es': 'Personas',
      'en': '',
    },
  },
  // contentList02
  {
    's058ecbj': {
      'es': 'Noruega',
      'en': 'Norway',
    },
  },
  // menuPostPropio
  {
    'va772b0m': {
      'es': 'Compartir',
      'en': 'Share',
    },
    'bocvi98t': {
      'es': 'Link',
      'en': 'Link',
    },
    's9v3jt8u': {
      'es': 'Reportar',
      'en': 'report',
    },
    'auci19vx': {
      'es': 'Editar este post',
      'en': 'Edit this post',
    },
    '5c6cj9od': {
      'es': 'Eliminar este post',
      'en': 'Delete this post',
    },
    'p0uji3e2': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // menuOtroPerfil
  {
    '1vkq4vte': {
      'es': 'Compartir',
      'en': 'Share',
    },
    '4ao8fyuh': {
      'es': 'Link',
      'en': 'Link',
    },
    '7gsarsmz': {
      'es': 'Desbloquear usuario',
      'en': 'Unlock user',
    },
    's1z4tfqm': {
      'es': 'Bloquear usuario',
      'en': 'Block user',
    },
    'uayag73c': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // cuenta_old
  {
    '4diegsa8': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'pjttl1qk': {
      'es': 'Información usuario',
      'en': 'User information',
    },
    'jpfd7qil': {
      'es': 'Informacion personal',
      'en': 'Personal information',
    },
    'e9vqby5k': {
      'es': 'Idioma',
      'en': 'Language',
    },
    'pqw2xtu8': {
      'es': 'Guardar fotos originales',
      'en': 'Save original photos',
    },
    'qs0dbtfg': {
      'es': 'Herramientas cuenta profesional ',
      'en': 'Professional account tools',
    },
    's6i1on4c': {
      'es': 'Herramientas promoción',
      'en': 'Promotion tools',
    },
    'k451ictb': {
      'es': 'Solicitar verificación',
      'en': 'Request verification',
    },
    'dngpr9ek': {
      'es': 'Cambiar a cuenta empresa',
      'en': 'Switch to company account',
    },
  },
  // boton5
  {
    'ot8urs9x': {
      'es': '        ',
      'en': '',
    },
    'yk2mtjyy': {
      'es': 'Eliminar mi cuenta',
      'en': 'Delete my account',
    },
  },
  // privacidad_old
  {
    'gunw8ts6': {
      'es': 'Privacidad',
      'en': 'Privacy',
    },
    'ctlxpn5c': {
      'es': 'Privacidad cuenta',
      'en': 'Privacy account',
    },
    'liefqzm1': {
      'es': 'Cuenta privada',
      'en': '',
    },
    'skf4b9bj': {
      'es': 'Privacidad Colecciones',
      'en': 'Privacy Collections',
    },
    'tvtdh1md': {
      'es': 'Privacidad Spots',
      'en': 'Privacy Spots',
    },
    'yoq9487e': {
      'es': 'Conexiones',
      'en': 'Connections',
    },
    'h2f223ry': {
      'es': 'Usuarios bloqueados',
      'en': 'Blocked users',
    },
  },
  // componenteVacio
  {
    '5fokfn3p': {
      'es': 'Nada que ver por aqui',
      'en': 'Nothing to see here',
    },
  },
  // usuariosRecomendados
  {
    'vbg51sfp': {
      'es': 'Personas  recomendadas',
      'en': 'Recommended profiles',
    },
  },
  // menuComentario
  {
    'd09ug8fy': {
      'es': '¿Por qué estás reportando este post?',
      'en': 'Why are you reporting this post?',
    },
    'xa0yy4rc': {
      'es':
          'Tu reporte será anónimo, excepto si estás reportando por propiedad intelectual. Si alguien está en peligro, llama a las autoridades locales enseguida.',
      'en':
          'Your report will be anonymous, except if you are reporting for intellectual property. If someone is in danger, call local authorities right away.',
    },
    '4v0a51nh': {
      'es': 'Editar comentario',
      'en': 'Edit comment',
    },
    '3p4ar58d': {
      'es': 'Eliminar comentario',
      'en': 'Delete comment',
    },
  },
  // boton7
  {
    '95zwhlhw': {
      'es': 'Eliminar comentario',
      'en': 'Delete comment',
    },
  },
  // postImagenV2
  {
    'an86ht95': {
      'es': ' likes',
      'en': 'likes',
    },
    't8vi189h': {
      'es': ' likes',
      'en': 'likes',
    },
    'v45t4ek4': {
      'es': 'Mas',
      'en': '',
    },
    '15i1ftxt': {
      'es': 'Añade un comentario...',
      'en': 'Add a comment...',
    },
    'n1bsaw0g': {
      'es': ' Likes',
      'en': 'Likes',
    },
    'rihj4zru': {
      'es': ' Likes',
      'en': 'Likes',
    },
  },
  // menuReportar3
  {
    'budvyh1p': {
      'es': 'Reportar',
      'en': 'report',
    },
    'xjka2trs': {
      'es': 'Tu reporte se ha enviado.',
      'en': 'Your report has been sent.',
    },
    '3kjmj9dy': {
      'es': 'Revisaremos tu reporte sobre este post.',
      'en': 'We will review your report on this post.',
    },
    'frrf9nlx': {
      'es': 'Field is required',
      'en': 'Field is required',
    },
    'i469zu8c': {
      'es': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // usuariosRecomendadosV2
  {
    'kzp8v116': {
      'es': 'Perfiles recomendados',
      'en': 'Recommended profiles',
    },
  },
  // FiltrarSpots
  {
    'v9vn0pol': {
      'es': 'Ajustes de busqueda',
      'en': 'Search settings',
    },
    'smbentht': {
      'es': 'Mapa',
      'en': 'Map',
    },
    'ldb4fmyg': {
      'es': 'Spots',
      'en': 'Spots',
    },
    'w2lnyvsw': {
      'es': 'Solo Amigos',
      'en': 'Just friends',
    },
    'pfvt1hhr': {
      'es': 'Global',
      'en': 'Global',
    },
  },
  // seccionCambiarFoto
  {
    'l00nq7d7': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'vud5jpxc': {
      'es': 'Listo',
      'en': 'Ready',
    },
    'miuiod9z': {
      'es': 'Subir una foto de perfil',
      'en': 'Upload a profile photo',
    },
  },
  // detallesDeColeccion
  {
    'hrjwc1id': {
      'es': 'Editar colección',
      'en': 'Edit collection',
    },
    '566wpoaz': {
      'es': 'Borrar colección',
      'en': 'Delete collection',
    },
    'j019cuti': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // tipoDePost
  {
    '9bd5zs5f': {
      'es': 'Que vas a subir?',
      'en': 'What are you going to upload?',
    },
    'bob6imh5': {
      'es': 'Imagen',
      'en': 'Image',
    },
    'hyw6vukw': {
      'es': 'Video',
      'en': 'Video',
    },
    'thxsw1vr': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
  },
  // sinComentarios
  {
    'oz8p0cc4': {
      'es': 'Todavía no hay comentarios.',
      'en': 'There are no comments yet.',
    },
  },
  // verComentariosDesdeDetalle
  {
    '231ald43': {
      'es': 'Comentarios',
      'en': 'Comments',
    },
    '9rf204c4': {
      'es': ' Likes',
      'en': 'Likes',
    },
    'yoq8mhi1': {
      'es': 'Enviar comentario...',
      'en': 'Send comment...',
    },
    'v81srtsj': {
      'es': 'Enviar',
      'en': 'Send',
    },
  },
  // invitarAmigos_old
  {
    '80gvgnws': {
      'es': 'Invitar a amigos',
      'en': 'Invite friends',
    },
    '7vhgdbm7': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    '3w91cz9f': {
      'es': 'Compartir via whatsapp',
      'en': 'Share via whatsapp',
    },
    '3oyqfslo': {
      'es': 'Compartir via instagram',
      'en': 'Share via Instagram',
    },
    'pk0dv6rk': {
      'es': 'Compartir via tiktok',
      'en': 'Share via tiktok',
    },
    'qvyny7ue': {
      'es': 'Compartir otros',
      'en': 'Share others',
    },
  },
  // notificacionesAjustes
  {
    'viuxomyv': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    'pegb7wat': {
      'es': 'Notificaciones sociales',
      'en': 'Social notifications',
    },
    'miep204a': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    '9rmxvw1p': {
      'es': 'Compartir via whatsapp',
      'en': 'Share via whatsapp',
    },
    '3q1vqkpu': {
      'es': 'Compartir via instagram',
      'en': 'Share via Instagram',
    },
    'wsppmory': {
      'es': 'Notificaciones sociales',
      'en': 'Social notifications',
    },
    '7zkjglw1': {
      'es': 'Enlace invitación',
      'en': 'Invitation link',
    },
    'mvcoqt25': {
      'es': 'Compartir via whatsapp',
      'en': 'Share via whatsapp',
    },
  },
  // seguridad_old
  {
    'iny9rlh9': {
      'es': 'Seguridad',
      'en': 'Security',
    },
    '5sybfmyo': {
      'es': 'Contraseña y seguridad',
      'en': 'Login security',
    },
    'so4lffx3': {
      'es': 'Modificar contraseña',
      'en': 'Password',
    },
    'l0aecvj6': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    'kcf7u6oo': {
      'es': 'información inicio sesión guardada',
      'en': 'saved login information',
    },
  },
  // ayuda_old
  {
    'guigqk52': {
      'es': 'Ayuda',
      'en': 'Aid',
    },
    'zzpa27d1': {
      'es': 'Preguntas frecuentes',
      'en': 'Frequent questions',
    },
    '06h8a03q': {
      'es': 'Ayuda online',
      'en': 'Online help',
    },
  },
  // informacion_old
  {
    '3fv67g23': {
      'es': 'Información',
      'en': 'Information',
    },
    'hyzdko9r': {
      'es': 'Politica de datos',
      'en': 'Data policy',
    },
    'p6ngq3ov': {
      'es': 'Condiciones de uso',
      'en': 'Terms of use',
    },
    'hfrc1s8f': {
      'es': 'Reglamento UE ',
      'en': 'EU Regulation',
    },
  },
  // actividad_old
  {
    'hkitjja7': {
      'es': 'Actividad',
      'en': 'Activity',
    },
  },
  // interacciones_old
  {
    'oxiedyhj': {
      'es': 'Interacciones',
      'en': 'Interactions',
    },
    'f2n6paom': {
      'es': 'Favoritos',
      'en': 'Favorites',
    },
    't7c9azc2': {
      'es': 'Likes',
      'en': 'Likes',
    },
    '2cbbr8ad': {
      'es': 'Sitios visitados',
      'en': 'Sites visited',
    },
  },
  // busquedasRecientes
  {
    'exmcogdw': {
      'es': 'Busquedas recientes',
      'en': 'Recent searches',
    },
    'gk1t1vtq': {
      'es': 'Aqui se mostraran las busquedas realizadas en el menu de explorar',
      'en': 'Here the searches carried out in the explore menu will be shown',
    },
  },
  // anadir_metodo_pago
  {
    'p9oie00f': {
      'es': 'Añadir metodo de pago',
      'en': 'Add payment method',
    },
    'qboqoxgo': {
      'es': 'Tarjeta de credito o debito',
      'en': 'Credit or debit card',
    },
  },
  // ajustes_usuario_principalCopy
  {
    'jslugmnh': {
      'es': 'Ajustes',
      'en': '',
    },
    'zlkdepbg': {
      'es': 'Configuración',
      'en': '',
    },
    'fdtnomtq': {
      'es': 'Actividad',
      'en': '',
    },
    'itx2v87z': {
      'es': 'Mis favoritos',
      'en': '',
    },
    'iv6bnvyc': {
      'es': 'Mis mejores amigos',
      'en': '',
    },
    'u08qk50w': {
      'es': 'Pedidos y pagos',
      'en': '',
    },
    'oz6twse4': {
      'es': 'Feedback',
      'en': '',
    },
    'txyrveh4': {
      'es': 'Añadir cuenta',
      'en': '',
    },
    'nuv3xh98': {
      'es': 'Salir de Cuenta',
      'en': '',
    },
  },
  // cambioContrasena
  {
    'psk7o6e6': {
      'es': 'Seguridad',
      'en': '',
    },
    'h1i7g2co': {
      'es': 'Modificar contraseña',
      'en': '',
    },
    'xuxsj7ga': {
      'es': 'Contraseña Actual',
      'en': '',
    },
    'jpt371ql': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    'cxche67a': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    '99qh01yl': {
      'es': 'Cambiar contraseña',
      'en': '',
    },
    'qpfawxrw': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    '7iteqtb4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'roj5q1d4': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    'yf2aa83y': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ciu31af6': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    'k4csk4z6': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // RecuperarContrasena
  {
    'ibb7nfds': {
      'es': 'Seguridad',
      'en': '',
    },
    '6fty4hdm': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    '56z9lj2t': {
      'es': 'Ingresa tu cuenta de correo',
      'en': '',
    },
    'u3tys0zt': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    '40v5r11f': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    '76bnyjd1': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'rfyfqpgu': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    'uvrzu1c2': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v4ssuqwc': {
      'es': 'Este campo es obligatorio',
      'en': '',
    },
    'ika99ofz': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Datos
  {
    'p306zv8s': {
      'es': 'Informacion',
      'en': '',
    },
  },
  // PoliticasDePrivacidad
  {
    '4bbz1mah': {
      'es': 'Politicas de Privacidad',
      'en': '',
    },
    'pjiv7cdq': {
      'es': 'Política de Privacidad',
      'en': '',
    },
    'oh7ka39e': {
      'es': 'Actualizado el 2024-02-18',
      'en': '',
    },
    '8g3yb3g3': {
      'es':
          'Spotlife (\"nosotros\", \"nuestro\" o \"nos\") se compromete a proteger su privacidad. Esta Política de privacidad explica cómo Spotlife recopila, usa y divulga su información personal.\n\nEsta Política de privacidad se aplica a nuestro sitio web,  y sus subdominios asociados (colectivamente, nuestro \"Servicio\") junto con nuestra aplicación, Spotlife. Al acceder o utilizar nuestro Servicio, usted indica que ha leído, comprendido y aceptado nuestra recopilación, almacenamiento, uso y divulgación de su información personal como se describe en esta Política de privacidad y en nuestros Términos de servicio.\n\nDefiniciones y Términos Clave\n\nPara ayudar a explicar las cosas de la manera más clara posible en esta Política de privacidad, cada vez que se hace referencia a cualquiera de estos términos, se definen estrictamente como:\n\n  -Cookie: pequeña cantidad de datos generados por un sitio web y guardados por su navegador web. Se utiliza para identificar su navegador, proporcionar análisis, recordar información sobre usted, como su preferencia de idioma o información de inicio de sesión.\n  -Compañía: cuando esta política menciona \"Compañía\", \"nosotros\", \"nos\" o \"nuestro\", se refiere a SPOT2NF SL (Calle Manuel Muiño Arroyo 3, 3B Madrid, España), que es responsable de su información en virtud de esta Política de privacidad.\n  -Plataforma: sitio web de Internet, aplicación web o aplicación digital de cara al público de Spotlife.\n  -País: donde se encuentra Spotlife o los propietarios / fundadores de Spotlife, en este caso es España\n  -Cliente: se refiere a la empresa, organización o persona que se registra para utilizar el Servicio Spotlife para gestionar las relaciones con sus consumidores o usuarios del servicio.\n  -Dispositivo: cualquier dispositivo conectado a Internet, como un teléfono, tablet, computadora o cualquier otro dispositivo que se pueda usar para visitar Spotlife y usar los servicios.\n  -Dirección IP: a cada dispositivo conectado a Internet se le asigna un número conocido como dirección de protocolo de Internet (IP). Estos números generalmente se asignan en bloques geográficos. A menudo, se puede utilizar una dirección IP para identificar la ubicación desde la que un dispositivo se conecta a Internet.\n  -Personal: se refiere a aquellas personas que son empleadas por Spotlife o están bajo contrato para realizar un servicio en nombre de una de las partes.\n  -Datos personales: cualquier información que directa, indirectamente o en conexión con otra información, incluido un número de identificación personal, permita la identificación de una persona física.\n  -Servicio: se refiere al servicio brindado por Spotlife como se describe en los términos relativos (si están disponibles) y en esta plataforma.\n  -Terceros: se refiere a anunciantes, patrocinadores de concursos, socios promocionales y de marketing, y otros que brindan nuestro contenido o cuyos productos o servicios que creemos que pueden interesarle.\n  -Sitio web: el sitio de Spotlife, al que se puede acceder a través de esta URL: \n  -Usted: una persona o entidad que está registrada con Spotlife para utilizar los Servicios.\n  \n\n¿Qué información recopilamos?\n\nRecopilamos información suya cuando visita nuestra plataforma, se registra en nuestro sitio, realiza un pedido, se suscribe a nuestro boletín, responde a una encuesta o completa un formulario.\n\n  -Nombre / nombre de usuario\n -Correos electrónicos\n  -Edad\n  \n\nTambién recopilamos información de dispositivos móviles para una mejor experiencia de usuario, aunque estas funciones son completamente opcionales:\n\n   -Ubicación (GPS): los datos de ubicación ayudan a crear una representación precisa de sus intereses, y esto se puede utilizar para llevar anuncios más específicos y relevantes a los clientes potenciales.\n\n  -Agenda telefónica (lista de contactos): su lista de contactos permite que la plataforma sea mucho más fácil de usar por parte del usuario, ya que acceder a sus contactos desde la aplicación le permite ahorrar toneladas de tiempo.\n\n  -Cámara (imágenes): otorgar permiso a la cámara le permite al usuario cargar cualquier imagen directamente desde la plataforma, puede denegar de manera segura los permisos de la cámara para esta plataforma.\n\n  -Galería de fotos (imágenes): Otorgar acceso a la galería de fotos permite al usuario cargar cualquier imagen de su galería de fotos. Puede denegar el acceso a la galería de fotos de manera segura para esta plataforma.\n  \n\n¿Cómo usamos la información que recopilamos?\n\nCualquiera de la información que recopilamos de usted puede usarse de una de las siguientes maneras:\n\n  -Para personalizar su experiencia (su información nos ayuda a responder mejor a sus necesidades individuales)\n  -Para mejorar nuestra plataforma (nos esforzamos continuamente por mejorar lo que ofrece nuestra plataforma en función de la información y los comentarios que recibimos de usted)\n  -Para mejorar el servicio al cliente (su información nos ayuda a responder de manera más efectiva a sus solicitudes de servicio al cliente y necesidades de soporte)\n  -Para procesar transacciones\n  -Para administrar un concurso, promoción, encuesta u otra característica del sitio\n  -Para enviar correos electrónicos periódicos\n\n\n¿Cuándo usa Spotlife la información del usuario final de terceros?\n\nSpotlife recopilará los datos del usuario final necesarios para proporcionar los servicios de Spotlife a nuestros clientes.\n\nLos usuarios finales pueden proporcionarnos voluntariamente la información que han puesto a disposición en los sitios web de las redes sociales. Si nos proporciona dicha información, podemos recopilar información disponible públicamente de los sitios web de redes sociales que ha indicado. Puede controlar la cantidad de información que los sitios web de redes sociales hacen pública visitando estos sitios web y cambiando su configuración de privacidad.\n\n\n¿Cuándo usa Spotlife la información del cliente de terceros?\n\nRecibimos información de terceros cuando se comunica con nosotros. Por ejemplo, cuando nos envía su dirección de correo electrónico para mostrar interés en convertirse en cliente de Spotlife, recibimos información de un tercero que brinda servicios automáticos de detección de fraude a Spotlife. Ocasionalmente, también recopilamos información que se pone a disposición del público en los sitios web de redes sociales. Puede controlar la cantidad de información que los sitios web de redes sociales hacen pública visitando estos sitios web y cambiando su configuración de privacidad.\n\n\n¿Compartimos la información que recopilamos con terceros? \n\nPodemos compartir la información que recopilamos, tanto personal como no personal, con terceros como anunciantes, patrocinadores de concursos, socios promocionales y de marketing, y otros que proporcionan nuestro contenido o cuyos productos o servicios creemos que pueden interesarle. También podemos compartirlo con nuestras compañías afiliadas y socios comerciales actuales y futuros, y si estamos involucrados en una fusión, venta de activos u otra reorganización comercial, también podemos compartir o transferir su información personal y no personal a nuestros sucesores en interés.\n\nPodemos contratar proveedores de servicios de terceros de confianza para que realicen funciones y nos brinden servicios, como el alojamiento y el mantenimiento de nuestros servidores y la plataforma, almacenamiento y administración de bases de datos, administración de correo electrónico, marketing de almacenamiento, procesamiento de tarjetas de crédito, servicio y cumplimiento de pedidos de productos y servicios que puede comprar a través de la plataforma. Es probable que compartamos su información personal, y posiblemente alguna información no personal, con estos terceros para permitirles realizar estos servicios para nosotros y para usted. \n\nPodemos compartir partes de los datos de nuestro archivo de registro, incluidas las direcciones IP, con fines analíticos con terceros, como socios de análisis web, desarrolladores de aplicaciones y redes publicitarias. Si se comparte su dirección IP, se puede utilizar para estimar la ubicación general y otros datos tecnológicos, como la velocidad de conexión, si ha visitado la plataforma en una ubicación compartida y el tipo de dispositivo utilizado para visitar la plataforma. Pueden agregar información sobre nuestra publicidad y lo que ve en la plataforma y luego proporcionar auditorías, investigaciones e informes para nosotros y nuestros anunciantes. \n\nTambién podemos divulgar información personal y no personal sobre usted al gobierno, a funcionarios encargados de hacer cumplir la ley o a terceros privados, según consideremos, a nuestro exclusivo criterio, necesario o apropiado para responder a reclamos, procesos legales (incluidas citaciones), para proteger nuestra derechos e intereses o los de un tercero, la seguridad del público o de cualquier persona, para prevenir o detener cualquier actividad ilegal, poco ética o legalmente procesable, o para cumplir con las órdenes judiciales, leyes, reglas y regulaciones aplicables. \n\n\n¿Dónde y cuándo se recopila la información de los clientes y usuarios finales?\n\nSpotlife recopilará la información personal que nos envíe. También podemos recibir información personal sobre usted de terceros como se describe anteriormente.\n\n\n¿Cómo utilizamos su dirección de correo electrónico?\n\nAl enviar su dirección de correo electrónico en esta plataforma, acepta recibir nuestros correos electrónicos. Puede cancelar su participación en cualquiera de estas listas de correo electrónico en cualquier momento haciendo clic en el enlace de exclusión voluntaria u otra opción para cancelar la suscripción que se incluye en el correo electrónico respectivo. Solo enviamos correos electrónicos a personas que nos han autorizado a contactarlos, ya sea directamente o a través de un tercero. No enviamos correos electrónicos comerciales no solicitados, porque odiamos el spam tanto como usted. Al enviar su dirección de correo electrónico, también acepta permitirnos usar su dirección de correo electrónico para la orientación de la audiencia del cliente en sitios como Facebook, donde mostramos publicidad personalizada a personas específicas que han optado por recibir nuestras comunicaciones. Las direcciones de correo electrónico enviadas solo a través de la página de procesamiento de pedidos se utilizarán con el único propósito de enviarle información y actualizaciones relacionadas con su pedido. Sin embargo, si nos ha proporcionado el mismo correo electrónico a través de otro método, podemos usarlo para cualquiera de los fines establecidos en esta Política. Nota: Si en algún momento desea cancelar la suscripción para no recibir correos electrónicos futuros, incluimos instrucciones detalladas para cancelar la suscripción en la parte inferior de cada correo electrónico.\n\n\n¿Cuánto tiempo conservamos su información?\n\nConservamos su información solo mientras la necesitemos para proporcionarle Spotlife y cumplir con los propósitos descritos en esta política. Este también es el caso de cualquier persona con la que compartamos su información y que lleve a cabo servicios en nuestro nombre. Cuando ya no necesitemos usar su información y no sea necesario que la conservemos para cumplir con nuestras obligaciones legales o reglamentarias, la eliminaremos de nuestros sistemas o la despersonalizaremos para que no podamos identificarlo.\n\n\n¿Cómo protegemos su información?\n\nImplementamos una variedad de medidas de seguridad para mantener la seguridad de su información personal cuando realiza un pedido, ingresa, envía o accede a su información personal. Ofrecemos el uso de un servidor seguro. Toda la información confidencial / crediticia suministrada se transmite a través de la tecnología Secure Socket Layer (SSL) y luego se encripta en nuestra base de datos de proveedores de pasarela de pago solo para que sea accesible por aquellos autorizados con derechos especiales de acceso a dichos sistemas, y deben mantener la información confidencial. Después de una transacción, su información privada (tarjetas de crédito, números de seguro social, finanzas, etc.) nunca se archiva. Sin embargo, no podemos garantizar la seguridad absoluta de la información que transmita a Spotlife ni garantizar que su información en el servicio no sea accedida, divulgada, alterada o destruida por una infracción de cualquiera de nuestras condiciones físicas, salvaguardias técnicas o de gestión.\n\n\n¿Podría transferirse mi información a otros países?\n\nSpotlife está incorporada en {{country}}. La información recopilada a través de nuestro sitio web, a través de interacciones directas con usted o del uso de nuestros servicios de ayuda puede transferirse de vez en cuando a nuestras oficinas o personal, o a terceros, ubicados en todo el mundo, y puede verse y alojarse en cualquier lugar de el mundo, incluidos los países que pueden no tener leyes de aplicación general que regulen el uso y la transferencia de dichos datos. En la mayor medida permitida por la ley aplicable, al utilizar cualquiera de los anteriores, usted acepta voluntariamente la transferencia transfronteriza y el alojamiento de dicha información.\n\n\n¿La información recopilada a través del Servicio Spotlife es segura?\n\nTomamos precauciones para proteger la seguridad de su información. Contamos con procedimientos físicos, electrónicos y administrativos para ayudar a salvaguardar, prevenir el acceso no autorizado, mantener la seguridad de los datos y usar correctamente su información. Sin embargo, ni las personas ni los sistemas de seguridad son infalibles, incluidos los sistemas de cifrado. Además, las personas pueden cometer delitos intencionales, cometer errores o no seguir las políticas. Por lo tanto, aunque hacemos todos los esfuerzos razonables para proteger su información personal, no podemos garantizar su seguridad absoluta. Si la ley aplicable impone algún deber irrenunciable de proteger su información personal, usted acepta que la mala conducta intencional serán los estándares utilizados para medir nuestro cumplimiento con ese deber.\n\n\n¿Puedo actualizar o corregir mi información?\n\nLos derechos que tienes para solicitar actualizaciones o correcciones de la información que recopila Spotlife dependen de tu relación con Spotlife. El personal puede actualizar o corregir su información según se detalla en nuestras políticas de empleo internas de la empresa.\n\nLos clientes tienen derecho a solicitar la restricción de ciertos usos y divulgaciones de información de identificación personal de la siguiente manera. Puede comunicarse con nosotros para (1) actualizar o corregir su información de identificación personal, (2) cambiar sus preferencias con respecto a las comunicaciones y otra información que recibe de nosotros, o (3) eliminar la información de identificación personal que se mantiene sobre usted en nuestro sistema (sujeto al siguiente párrafo), cancelando su cuenta. Dichas actualizaciones, correcciones, cambios y eliminaciones no tendrán ningún efecto sobre otra información que mantenemos o información que hayamos proporcionado a terceros de acuerdo con esta Política de privacidad antes de dicha actualización, corrección, cambio o eliminación. Para proteger su privacidad y seguridad, podemos tomar medidas razonables (como solicitar una contraseña única) para verificar su identidad antes de otorgarle acceso a su perfil o hacer correcciones. Usted es responsable de mantener en secreto su contraseña única y la información de su cuenta en todo momento.\n\nDebe tener en cuenta que tecnológicamente no es posible eliminar todos y cada uno de los registros de la información que nos ha proporcionado de nuestro sistema. La necesidad de realizar copias de seguridad de nuestros sistemas para proteger la información de pérdidas involuntarias significa que puede existir una copia de su información en una forma que no se pueda borrar y que será difícil o imposible de localizar para nosotros. Inmediatamente después de recibir su solicitud, toda la información personal almacenada en las bases de datos que usamos activamente y otros medios fácilmente buscables se actualizará, corregirá, cambiará o eliminará, según corresponda, tan pronto como y en la medida en que sea razonable y técnicamente posible.\n\nSi es un usuario final y desea actualizar, eliminar o recibir cualquier información que tengamos sobre usted, puede hacerlo poniéndose en contacto con la organización de la que es cliente.\n\n\nPersonal\n\nSi es un trabajador o solicitante de Spotlife, recopilamos la información que nos proporciona voluntariamente. Usamos la información recopilada con fines de recursos humanos para administrar los beneficios a los trabajadores y seleccionar a los solicitantes.\n\nPuede comunicarse con nosotros para (1) actualizar o corregir su información, (2) cambiar sus preferencias con respecto a las comunicaciones y otra información que reciba de nosotros, o (3) recibir un registro de la información que tenemos relacionada con usted. Dichas actualizaciones, correcciones, cambios y eliminaciones no tendrán ningún efecto sobre otra información que mantenemos o información que hayamos proporcionado a terceros de acuerdo con esta Política de privacidad antes de dicha actualización, corrección, cambio o eliminación.\n\n\nVenta de Negocio\n\nNos reservamos el derecho de transferir información a un tercero en el caso de una venta, fusión u otra transferencia de todos o sustancialmente todos los activos de Spotlife o cualquiera de sus afiliadas corporativas (como se define en este documento), o la porción de Spotlife o cualquiera de sus Afiliadas corporativas con las que se relaciona el Servicio, o en el caso de que discontinuemos nuestro negocio o presentemos una petición o hayamos presentado una petición contra nosotros en caso de quiebra, reorganización o procedimiento similar, siempre que el el tercero acepte adherirse a los términos de esta Política de privacidad.\n\n\nAfiliados\n\nPodemos divulgar información (incluida la información personal) sobre usted a nuestros afiliados corporativos. Para los propósitos de esta Política de Privacidad, \"Afiliado Corporativo\" significa cualquier persona o entidad que directa o indirectamente controla, está controlada por o está bajo control común con Spotlife, ya sea por propiedad o de otra manera. Cualquier información relacionada con usted que proporcionemos a nuestros afiliados corporativos será tratada por dichos afiliados corporativos de acuerdo con los términos de esta política de privacidad.\n\n\nLey que Rige\n\nEsta Política de privacidad se rige por las leyes de España sin tener en cuenta su disposición sobre conflicto de leyes. Usted acepta la jurisdicción exclusiva de los tribunales en relación con cualquier acción o disputa que surja entre las partes en virtud de esta Política de privacidad o en relación con ella, excepto aquellas personas que puedan tener derecho a presentar reclamaciones en virtud del Escudo de privacidad o el marco suizo-estadounidense.\n\nLas leyes de España, excluyendo sus conflictos de leyes, regirán este Acuerdo y su uso de la plataforma. Su uso de la plataforma también puede estar sujeto a otras leyes locales, estatales, nacionales o internacionales.\n\nAl usar Spotlife o comunicarse con nosotros directamente, significa que acepta esta Política de privacidad. Si no está de acuerdo con esta Política de privacidad, no debe interactuar con nuestro sitio web ni utilizar nuestros servicios. El uso continuo del sitio web, la interacción directa con nosotros o después de la publicación de cambios en esta Política de privacidad que no afecten significativamente el uso o divulgación de su información personal significará que acepta esos cambios.\n\n\nTu consentimiento\n\nHemos actualizado nuestra Política de privacidad para brindarle total transparencia sobre lo que se establece cuando visita nuestro sitio y cómo se utiliza. Al utilizar nuestra plataforma, registrar una cuenta o realizar una compra, por la presente acepta nuestra Política de privacidad y acepta sus términos.\n\n\nEnlaces a otros Sitios Web\n\nEsta Política de privacidad se aplica solo a los Servicios. Los Servicios pueden contener enlaces a otros sitios web que Spotlife no opera ni controla. No somos responsables por el contenido, la precisión o las opiniones expresadas en dichos sitios web, y dichos sitios web no son investigados, monitoreados o verificados por nuestra precisión o integridad. Recuerde que cuando utiliza un enlace para ir desde los Servicios a otro sitio web, nuestra Política de privacidad deja de estar en vigor. Su navegación e interacción en cualquier otro sitio web, incluidos aquellos que tienen un enlace en nuestra plataforma, están sujetos a las propias reglas y políticas de ese sitio web. Dichos terceros pueden utilizar sus propias cookies u otros métodos para recopilar información sobre usted.\n\n\nPublicidad\n\nEsta plataforma puede contener anuncios de terceros y enlaces a sitios de terceros. Spotlife no hace ninguna representación en cuanto a la exactitud o idoneidad de la información contenida en esos anuncios o sitios y no acepta ninguna responsabilidad u obligación por la conducta o el contenido de esos anuncios y sitios y las ofertas realizadas por los terceros.\n\nLa publicidad mantiene a Spotlife y muchos de los sitios web y servicios que usted utiliza de forma gratuita. Trabajamos arduamente para asegurarnos de que los anuncios sean seguros, discretos y lo más relevantes posible.\n\nLos anuncios de terceros y los enlaces a otros sitios donde se anuncian bienes o servicios no son respaldos ni recomendaciones de Spotlife de los sitios, bienes o servicios de terceros. Spotlife no asume ninguna responsabilidad por el contenido de los anuncios, las promesas hechas o la calidad / confiabilidad de los productos o servicios ofrecidos en todos los anuncios.\n\n\nCookies para Publicidad\n\nEstas cookies recopilan información a lo largo del tiempo sobre su actividad en línea en la plataforma y otros servicios en línea para hacer que los anuncios en línea sean más relevantes y efectivos para usted. Esto se conoce como publicidad basada en intereses. También realizan funciones como evitar que el mismo anuncio vuelva a aparecer continuamente y garantizar que los anuncios se muestren correctamente a los anunciantes. Sin cookies, es muy difícil para un anunciante llegar a su audiencia o saber cuántos anuncios se mostraron y cuántos clics recibieron.\n\n\nCookies\n\nSpotlife utiliza \"cookies\" para identificar las áreas de nuestro sitio web que ha visitado. Una cookie es una pequeña porción de datos que su navegador web almacena en su computadora o dispositivo móvil. Usamos cookies para mejorar el rendimiento y la funcionalidad de nuestra plataforma, pero no son esenciales para su uso. Sin embargo, sin estas cookies, es posible que ciertas funciones, como los videos, no estén disponibles o se le solicitará que ingrese sus datos de inicio de sesión cada vez que visite la plataforma, ya que no podríamos recordar que había iniciado sesión anteriormente. La mayoría de los navegadores web se pueden configurar para desactivar el uso de cookies. Sin embargo, si desactiva las cookies, es posible que no pueda acceder a la funcionalidad de nuestro sitio web correctamente o en absoluto. Nunca colocamos información de identificación personal en cookies.\n\n\nBloquear y deshabilitar Cookies y tecnologías similares\n\nDonde sea que se encuentre, también puede configurar su navegador para bloquear cookies y tecnologías similares, pero esta acción puede bloquear nuestras cookies esenciales e impedir que nuestro sitio web funcione correctamente, y es posible que no pueda utilizar todas sus funciones y servicios por completo. También debe tener en cuenta que también puede perder información guardada (por ejemplo, detalles de inicio de sesión guardados, preferencias del sitio) si bloquea las cookies en su navegador. Los distintos navegadores ponen a su disposición distintos controles. Deshabilitar una cookie o una categoría de cookie no elimina la cookie de su navegador, deberá hacerlo usted mismo desde su navegador, debe visitar el menú de ayuda de su navegador para obtener más información.\n\n\nServicios de Remarketing\n\nUsamos servicios de remarketing. ¿Qué es el remarketing? En marketing digital, el remarketing (o retargeting) es la práctica de publicar anuncios en Internet a personas que ya han visitado su sitio web. Permite que su empresa parezca que está \"siguiendo\" a las personas en Internet mediante la publicación de anuncios en los sitios web y las plataformas que más utilizan.\n\n\nDetalles del Pago\n\nCon respecto a cualquier tarjeta de crédito u otros detalles de procesamiento de pagos que nos haya proporcionado, nos comprometemos a que esta información confidencial se almacene de la manera más segura posible.\n\n\nPrivacidad de los Niños\n\nRecopilamos información de niños menores de 13 años solo para mejorar nuestros servicios. Si usted es padre o tutor y sabe que su hijo nos ha proporcionado datos personales sin su permiso, comuníquese con nosotros. Si nos damos cuenta de que hemos recopilado datos personales de cualquier persona menor de 13 años sin la verificación del consentimiento de los padres, tomamos medidas para eliminar esa información de nuestros servidores.\n\n\nCambios en nuestra Política de Privacidad\n\nPodemos cambiar nuestro Servicio y nuestras políticas, y es posible que debamos realizar cambios en esta Política de privacidad para que reflejen con precisión nuestro Servicio y nuestras políticas. A menos que la ley exija lo contrario, le notificaremos (por ejemplo, a través de nuestro Servicio) antes de realizar cambios en esta Política de privacidad y le daremos la oportunidad de revisarlos antes de que entren en vigencia. Luego, si continúa utilizando el Servicio, estará sujeto a la Política de privacidad actualizada. Si no desea aceptar esta o cualquier Política de privacidad actualizada, puede eliminar su cuenta.\n\n\nServicios de terceros\n\nPodemos mostrar, incluir o poner a disposición contenido de terceros (incluidos datos, información, aplicaciones y otros servicios de productos) o proporcionar enlaces a sitios web o servicios de terceros (\"Servicios de terceros\").\nUsted reconoce y acepta que Spotlife no será responsable de ningún Servicio de terceros, incluida su precisión, integridad, puntualidad, validez, cumplimiento de los derechos de autor, legalidad, decencia, calidad o cualquier otro aspecto de los mismos. Spotlife no asume ni tendrá ninguna obligación o responsabilidad ante usted o cualquier otra persona o entidad por los Servicios de terceros.\nLos Servicios de terceros y los enlaces a los mismos se brindan únicamente para su conveniencia y usted accede a ellos y los usa completamente bajo su propio riesgo y sujeto a los términos y condiciones de dichos terceros.\n\n\nFacebook Pixel\n\nFacebook pixel es una herramienta de análisis que le permite medir la efectividad de su publicidad al comprender las acciones que las personas realizan en su sitio web. Puede utilizar el píxel para: Asegurarse de que sus anuncios se muestren a las personas adecuadas. Facebook pixel puede recopilar información de su dispositivo cuando utiliza el servicio. Facebook pixel recopila información que se guarda de acuerdo con su Política de privacidad.\n\n\nTecnologías de Seguimiento\n\n  -API de Google Maps\n\n  La API de Google Maps es una herramienta sólida que se puede utilizar para crear un mapa personalizado, un mapa de búsqueda, funciones de registro, mostrar la sincronización de datos en vivo con la ubicación, planificar rutas o crear un mashup, solo por nombrar algunos.\n  La API de Google Maps puede recopilar información suya y de su dispositivo por motivos de seguridad.\n  La API de Google Maps recopila información que se mantiene de acuerdo con su Política de privacidad.\n\n  -Cookies\n\n  Usamos Cookies para mejorar el rendimiento y la funcionalidad de nuestra plataforma, pero no son esenciales para su uso. Sin embargo, sin estas cookies, es posible que ciertas funciones, como los videos, no estén disponibles o se le solicitará que ingrese sus datos de inicio de sesión cada vez que visite la plataforma, ya que no podríamos recordar que había iniciado sesión anteriormente.\n\n  -Sesiones\n\n  Spotlife utiliza \"Sesiones\" para identificar las áreas de nuestro sitio web que ha visitado. Una sesión es un pequeño fragmento de datos que su navegador web almacena en su computadora o dispositivo móvil.\n\n\nInformación sobre el Reglamento general de protección de datos (RGPD)\n\nEs posible que recopilemos y utilicemos información suya si pertenece al Espacio Económico Europeo (EEE), y en esta sección de nuestra Política de privacidad vamos a explicar exactamente cómo y por qué se recopilan estos datos, y cómo los mantenemos bajo protección contra la replicación o el uso incorrecto.\n\n\n¿Qué es RGPD?\n\nRGPD es una ley de privacidad y protección de datos en toda la UE que regula cómo las empresas protegen los datos de los residentes de la UE y mejora el control que los residentes de la UE tienen sobre sus datos personales.\n\nEl RGPD es relevante para cualquier empresa que opere a nivel mundial y no solo para las empresas con sede en la UE y los residentes de la UE. Los datos de nuestros clientes son importantes independientemente de dónde se encuentren, por lo que hemos implementado controles RGPD como nuestro estándar de referencia para todas nuestras operaciones en todo el mundo.\n\n\n¿Qué son los Datos Personales?\n\nCualquier dato que se relacione con un individuo identificable o identificable. El RGPD cubre un amplio espectro de información que podría usarse por sí sola o en combinación con otras piezas de información para identificar a una persona. Los datos personales van más allá del nombre o la dirección de correo electrónico de una persona. Algunos ejemplos incluyen información financiera, opiniones políticas, datos genéticos, datos biométricos, direcciones IP, dirección física, orientación sexual y origen étnico.\n\n\nLos principios de protección de datos incluyen requisitos tales como:\n\n  -Los datos personales recopilados deben procesarse de manera justa, legal y transparente y solo deben usarse de la manera que una persona esperaría razonablemente.\n  -Los datos personales solo deben recopilarse para cumplir con un propósito específico y solo deben usarse para ese propósito. Las organizaciones deben especificar por qué necesitan los datos personales cuando los recopilan.\n  -Los datos personales no deben conservarse más tiempo del necesario para cumplir con su propósito.\n  -Las personas cubiertas por el RGPD tienen derecho a acceder a sus propios datos personales. También pueden solicitar una copia de sus datos y que sus datos se actualicen, eliminen, restrinjan o muevan a otra organización.\n\n\n¿Por qué es importante el RGPD?\n\nRGPD agrega algunos requisitos nuevos con respecto a cómo las empresas deben proteger los datos personales de las personas que recopilan y procesan. También aumenta las apuestas para el cumplimiento al aumentar la aplicación e imponer mayores multas por incumplimiento. Más allá de estos hechos, es simplemente lo correcto. En Spotlife creemos firmemente que la privacidad de sus datos es muy importante y ya contamos con prácticas sólidas de seguridad y privacidad que van más allá de los requisitos de esta nueva regulación.\n\n\nDerechos individuales del interesado: acceso, portabilidad y eliminación de datos\n\nEstamos comprometidos a ayudar a nuestros clientes a cumplir con los requisitos de derechos de los sujetos de datos de RGPD. Spotlife procesa o almacena todos los datos personales en proveedores que cumplen con DPA y han sido examinados por completo. Almacenamos todas las conversaciones y los datos personales durante un máximo de 6 años, a menos que se elimine su cuenta. En cuyo caso, eliminamos todos los datos de acuerdo con nuestros Términos de servicio y Política de privacidad, pero no los conservaremos por más de 60 días.\n\nSomos conscientes de que si trabaja con clientes de la UE, debe poder brindarles la capacidad de acceder, actualizar, recuperar y eliminar datos personales. Hemos sido configurados como autoservicio desde el principio y siempre le hemos dado acceso a sus datos y a los datos de sus clientes. Nuestro equipo de atención al cliente está aquí para que responda cualquier pregunta que pueda tener sobre cómo trabajar con la API.\n\n\nResidentes de California\n\nLa Ley de Privacidad del Consumidor de California (CCPA) requiere que divulguemos las categorías de Información personal que recopilamos y cómo la usamos, las categorías de fuentes de las que recopilamos Información personal y los terceros con quienes la compartimos, que hemos explicado anteriormente.\n\nTambién estamos obligados a comunicar información sobre los derechos que tienen los residentes de California según la ley de California. Puede ejercer los siguientes derechos:\n\n  -Derecho a conocer y acceder. Puede enviar una solicitud verificable de información con respecto a: (1) categorías de Información personal que recopilamos, usamos o compartimos; (2) fines para los que recopilamos o utilizamos categorías de información personal; (3) categorías de fuentes de las que recopilamos información personal; y (4) piezas específicas de información personal que hemos recopilado sobre usted.\n  -Derecho a la igualdad de servicio. No lo discriminaremos si ejerce sus derechos de privacidad.\n  -Derecho a eliminar. Puede enviar una solicitud verificable para cerrar su cuenta y eliminaremos la Información personal sobre usted que hayamos recopilado.\n  -Solicite que una empresa que vende los datos personales de un consumidor, no venda los datos personales del consumidor.\n\nSi realiza una solicitud, tenemos un mes para responderle. Si desea ejercer alguno de estos derechos, comuníquese con nosotros.\n\nNo vendemos la información personal de nuestros usuarios.\n\nPara obtener más información sobre estos derechos, comuníquese con nosotros.\n\n\nLey de protección de la privacidad en línea de California (CalOPPA)\n\nCalOPPA requiere que divulguemos las categorías de información personal que recopilamos y cómo la usamos, las categorías de fuentes de las que recopilamos la información personal y los terceros con quienes la compartimos, lo cual explicamos anteriormente.\n\nLos usuarios de CalOPPA tienen los siguientes derechos:\n\n  -Derecho a conocer y acceder. Puede enviar una solicitud verificable de información con respecto a: (1) categorías de Información personal que recopilamos, usamos o compartimos; (2) fines para los que recopilamos o utilizamos categorías de información personal; (3) categorías de fuentes de las que recopilamos información personal; y (4) piezas específicas de información personal que hemos recopilado sobre usted.\n  -Derecho a la igualdad de servicio. No lo discriminaremos si ejerce sus derechos de privacidad.\n  -Derecho a eliminar. Puede enviar una solicitud verificable para cerrar su cuenta y eliminaremos la Información personal sobre usted que hayamos recopilado.\n  -Derecho a solicitar que una empresa que vende los datos personales de un consumidor, no venda los datos personales del consumidor.\n\nSi realiza una solicitud, tenemos un mes para responderle. Si desea ejercer alguno de estos derechos, comuníquese con nosotros.\n\nNo vendemos la información personal de nuestros usuarios.\n\nPara obtener más información sobre estos derechos, comuníquese con nosotros.\n\n\nContáctenos\n\nNo dude en contactarnos si tiene alguna pregunta.\n\n -A través de correo electrónico:  spotlifesocialapp@gmail.com\n\n\n',
      'en': '',
    },
  },
  // CondicionesDeUso
  {
    'ae1w57px': {
      'es': 'Condiciones de Uso',
      'en': '',
    },
    'niia3qv6': {
      'es': 'AVISO LEGAL Y CONDICIONES                   ',
      'en':
          'LEGAL NOTICE AND GENERAL CONDITIONS OF USE\nSpotlife App\nI. GENERAL INFORMATION\nIn compliance with the duty of information provided in Law 34/2002 on Information Society Services and Electronic Commerce (LSSI-CE) of July 11, the following general information data for this App is provided below:\nThe ownership of this app, Spotlife, (hereinafter, app) is held by: , provided with NIF: B72730989 and registered in: Commercial Registry of Madrid with the following registration data: Volume: 44386, Book: 0, Folio: 60, Section : 8, Page: M782254, Registration: 1, Pre Year: 2022, whose representative is: Nahuel Casares Martin, and whose contact information is:\nAddress: Calle Manuel Muiño Arroyo 3\nTelephone contact: -\nContact email: spotlifesocialapp@gmail.com\nII. GENERAL TERMS AND CONDITIONS OF USE\nThe object of the conditions: Spotlife app\nThe purpose of these General Conditions of Use (hereinafter, Conditions) is to regulate access and use of the Spotlife app. For the purposes of these Conditions, an app will be understood as: the external appearance of the screen interfaces, both statically and dynamically, that is, the navigation tree; and all the elements integrated in both the screen interfaces and the navigation tree (hereinafter, Contents) and all those online services or resources that it offers to Users (hereinafter, Services).\nSpot2NF SL reserves the right to modify, at any time, and without prior notice, the presentation and configuration of the Website and the Contents and Services that may be incorporated therein. The User acknowledges and accepts that at any time Spot2NF SL may interrupt, deactivate and/or cancel any of these elements that are integrated into the app or access to them.\nAccess to the app by the User is free and, as a general rule, is free without the User having to provide any compensation to be able to enjoy it, except in relation to the cost of connection through the telecommunications network provided. by the access provider that the User has contracted.\nThe use of any of the Content or Services of the Website may be done through the User\'s prior subscription or registration.\nThe user\nAccess, navigation and use of the app confers the status of User, therefore, from the moment navigation through the app begins, all the Conditions established here, as well as their subsequent modifications, are accepted, without prejudice to the application. of the corresponding mandatory legal regulations as the case may be. Given the relevance of the above, the User is recommended to read them every time they visit the Website.\nThe app provides a wide variety of information, services and data. The User assumes responsibility for correct use of the app. This responsibility will extend to:\nA use of the information, Content and/or Services and data offered by the app without it being contrary to the provisions of these Conditions, the Law, morality or public order, or that in any other way may result in injury to the rights of third parties or the operation of the app itself\nThe veracity and legality of the information provided by the User in the forms issued by SPOT2NF SL for access to certain Content or Services offered in the app. In any case, the User will immediately notify SPOT2NF SL about any fact that allows the improper use of the information registered in said forms, such as, but not only, theft, loss, or unauthorized access to identifiers and /or passwords, in order to proceed to their immediate cancellation.\nMere access to the app does not imply establishing any type of commercial relationship between SPOT2NF SL and the User.\nAlways in compliance with current legislation, the app is aimed at all people, regardless of age, who can access and/or navigate the pages of the Website.\nIII. ACCESS AND NAVIGATION ON THE WEBSITE: EXCLUSION OF WARRANTIES AND LIABILITY\nSPOT2NF SL does not guarantee the continuity, availability and usefulness of the app, nor the Contents or Services. SPOT2NF SL will do everything possible to ensure the proper functioning of the app, however, it is not responsible or guarantees that access to this app will not be uninterrupted or that it will be error-free.\nNor is it responsible or guarantee that the content or software that can be accessed through the app is free of error or causes damage to the User\'s computer system (software and hardware). In no case will SPOT2NF SL be responsible for losses, damages or losses of any kind arising from access, navigation and use of the app, including, but not limited to, those caused to computer systems or those caused by the introduction of viruses.\nSPOT2NF SL is also not responsible for any damage that may be caused to users due to improper use of the app. In particular, it is not responsible in any way for any telecommunications drops, interruptions, lack or defect that may occur.\nIV. LINK POLICY\nSPOT2NF SL does not offer or market, by itself or through third parties, the products and/or services available on said linked sites.\nThe User or third party who makes a hyperlink from a web page of another, different, app site:\nReproduction – in whole or in part – of any of the Contents and/or Services of the app is not permitted without the express consent of spotlifeapp.\nAny false, inaccurate or incorrect statement about the app, or its Content and/or Services, is also not permitted.\nWith the exception of the hyperlink, the website on which said hyperlink is established will not contain any element of esteta app, protected as intellectual property by the Spanish legal system, unless expressly authorized by SPOT2NF SL.\nThe establishment of the hyperlink will not imply the existence of relations between SPOT2NF SL and the owner of the website from which it is made, nor the knowledge and acceptance of SPOT2NF SL of the contents, services and/or activities offered on said website, and vice versa. .\nV. INTELLECTUAL AND INDUSTRIAL PROPERTY\nSPOT2NF SL, by itself or as an assignee, is the owner of all the intellectual and industrial property rights of the app, as well as the elements contained therein (by way of example and not exhaustive, images, sound, audio, video, software or texts, brands or logos, color combinations, structure and design, selection of materials used, computer programs necessary for its operation, access and use, etc.). They will, therefore, be works protected as intellectual property by the Spanish legal system, with both Spanish and Community regulations in this field, as well as international treaties related to the matter and signed by Spain, being applicable to them.\nAll rights reserved. By virtue of the provisions of the Intellectual Property Law, the reproduction, distribution and public communication, including the method of making available, of all or part of the contents of this app, for commercial purposes, are expressly prohibited. any support and by any technical means, without the authorization of SPOT2NF SL.\nThe User agrees to respect the intellectual and industrial property rights of SPOT2NF SL. You can view the elements of the app or even print, copy and store them on your computer\'s hard drive or on any other physical medium as long as it is exclusively for your personal use. The User, however, may not delete, alter, or manipulate any protection device or security system that was installed in the app.\nIn the event that the User or third party considers that any of the Contents of the app constitutes a violation of the intellectual property protection rights, they must immediately notify spotlifeapp through the contact information in the GENERAL INFORMATION section of this Notice. Legal and General Conditions of Use.\nSAW. LEGAL ACTIONS, APPLICABLE LAW AND JURISDICTION\nSPOT2NF SL reserves the right to file civil or criminal actions that it deems necessary for improper use of the app and Content, or for non-compliance with these Conditions.\nThe relationship between the User and SPOT2NF SL will be governed by the regulations in force and applicable in Spanish territory. If any controversy arises in relation to the interpretation and/or application of these Conditions, the parties will submit their conflicts to ordinary jurisdiction, submitting to the corresponding judges and courts in accordance with the law.\nThis Legal Notice and General Conditions of Use document for the website has been created using the online legal notice and conditions of use template generator on 07/16/2021.',
    },
    't1f2m9hu': {
      'es': 'GENERALES DE USO                              ',
      'en': '',
    },
    'hc5t7np9': {
      'es': 'App Spotlife',
      'en': '',
    },
    '4vbsadsk': {
      'es':
          'I. INFORMACIÓN GENERAL\nEn cumplimiento con el deber de información dispuesto en la Ley 34/2002 de Servicios de la Sociedad de la Información y el Comercio Electrónico (LSSI-CE) de 11 de julio, se facilitan a continuación los siguientes datos de información general de esta App:\nLa titularidad de esta app, Spotlife, (en adelante, app) la ostenta: , provista de NIF: B72730989 e inscrita en: Registro Mercantil de Madrid con los siguientes datos registrales: Tomo: 44386, Libro:0, Folio:60, Sección: 8, Hoja: M782254, Inscripción: 1, Año Pre: 2022, cuyo representante es: Nahuel Casares Martin, y cuyos datos de contacto son:\nDirección: Calle Manuel Muiño Arroyo 3\nTeléfono de contacto: -\nEmail de contacto: spotlifesocialapp@gmail.com\nII. TÉRMINOS Y CONDICIONES GENERALES DE USO\nEl objeto de las condiciones: app Spotlife\nEl objeto de las presentes Condiciones Generales de Uso (en adelante, Condiciones) es regular el acceso y la utilización de la app Spotlife. A los efectos de las presentes Condiciones se entenderá como app: la apariencia externa de los interfaces de pantalla, tanto de forma estática como de forma dinámica, es decir, el árbol de navegación; y todos los elementos integrados tanto en los interfaces de pantalla como en el árbol de navegación (en adelante, Contenidos) y todos aquellos servicios o recursos en línea que en su caso ofrezca a los Usuarios (en adelante, Servicios).\nSpot2NF SL se reserva la facultad de modificar, en cualquier momento, y sin aviso previo, la presentación y configuración del Sitio Web y de los Contenidos y Servicios que en él pudieran estar incorporados. El Usuario reconoce y acepta que en cualquier momento Spot2NF SL pueda interrumpir, desactivar y/o cancelar cualquiera de estos elementos que se integran en la app o el acceso a los mismos.\nEl acceso a la app por el Usuario tiene carácter libre y, por regla general, es gratuito sin que el Usuario tenga que proporcionar una contraprestación para poder disfrutar de ello, salvo en lo relativo al coste de conexión a través de la red de telecomunicaciones suministrada por el proveedor de acceso que hubiere contratado el Usuario.\nLa utilización de alguno de los Contenidos o Servicios del Sitio Web podrá hacerse mediante la suscripción o registro previo del Usuario.\nEl Usuario\nEl acceso, la navegación y uso de la app, confiere la condición de Usuario, por lo que se aceptan, desde que se inicia la navegación por la app, todas las Condiciones aquí establecidas, así como sus ulteriores modificaciones, sin perjuicio de la aplicación de la correspondiente normativa legal de obligado cumplimiento según el caso. Dada la relevancia de lo anterior, se recomienda al Usuario leerlas cada vez que visite el Sitio Web.\nla app proporciona gran diversidad de información, servicios y datos. El Usuario asume su responsabilidad para realizar un uso correcto de la app. Esta responsabilidad se extenderá a:\nUn uso de la información, Contenidos y/o Servicios y datos ofrecidos por la app sin que sea contrario a lo dispuesto por las presentes Condiciones, la Ley, la moral o el orden público, o que de cualquier otro modo puedan suponer lesión de los derechos de terceros o del mismo funcionamiento de la app\nLa veracidad y licitud de las informaciones aportadas por el Usuario en los formularios extendidos por SPOT2NF SL para el acceso a ciertos Contenidos o Servicios ofrecidos en la app. En todo caso, el Usuario notificará de forma inmediata a SPOT2NF SL acerca de cualquier hecho que permita el uso indebido de la información registrada en dichos formularios, tales como, pero no sólo, el robo, extravío, o el acceso no autorizado a identificadores y/o contraseñas, con el fin de proceder a su inmediata cancelación.\nEl mero acceso a la app no supone entablar ningún tipo de relación de carácter comercial entre SPOT2NF SL y el Usuario.\nSiempre en el respeto de la legislación vigente, la app se dirige a todas las personas, sin importar su edad, que puedan acceder y/o navegar por las páginas del Sitio Web.\nIII. ACCESO Y NAVEGACIÓN EN EL SITIO WEB: EXCLUSIÓN DE GARANTÍAS Y RESPONSABILIDAD\nSPOT2NF SL no garantiza la continuidad, disponibilidad y utilidad de la app, ni de los Contenidos o Servicios. SPOT2NF SL hará todo lo posible por el buen funcionamiento de la app, sin embargo, no se responsabiliza ni garantiza que el acceso a esta app no vaya a ser ininterrumpido o que esté libre de error.\nTampoco se responsabiliza o garantiza que el contenido o software al que pueda accederse a través de la app, esté libre de error o cause un daño al sistema informático (software y hardware) del Usuario. En ningún caso SPOT2NF SL será responsable por las pérdidas, daños o perjuicios de cualquier tipo que surjan por el acceso, navegación y el uso de la app, incluyéndose, pero no limitándose, a los ocasionados a los sistemas informáticos o los provocados por la introducción de virus.\nSPOT2NF SL tampoco se hace responsable de los daños que pudiesen ocasionarse a los usuarios por un uso inadecuado de la app. En particular, no se hace responsable en modo alguno de las caídas, interrupciones, falta o defecto de las telecomunicaciones que pudieran ocurrir.\nIV. POLÍTICA DE ENLACES\nSPOT2NF SL no ofrece ni comercializa por sí ni por medio de terceros los productos y/o servicios disponibles en dichos sitios enlazados.\nEl Usuario o tercero que realice un hipervínculo desde una página web de otro, distinto, sitio de la app:\nNo se permite la reproducción —total o parcialmente— de ninguno de los Contenidos y/o Servicios de la app sin consentimiento expreso de spotlifeapp.\nNo se permite tampoco ninguna manifestación falsa, inexacta o incorrecta sobre la app, ni sobre los Contenidos y/o Servicios del mismo.\nA excepción del hipervínculo, el sitio web en el que se establezca dicho hiperenlace no contendrá ningún elemento, de esteta app, protegido como propiedad intelectual por el ordenamiento jurídico español, salvo autorización expresa de SPOT2NF SL.\nEl establecimiento del hipervínculo no implicará la existencia de relaciones entre SPOT2NF SL y el titular del sitio web desde el cual se realice, ni el conocimiento y aceptación de SPOT2NF SL de los contenidos, servicios y/o actividades ofrecidos en dicho sitio web, y viceversa.\nV. PROPIEDAD INTELECTUAL E INDUSTRIAL\nSPOT2NF SL por sí o como parte cesionaria, es titular de todos los derechos de propiedad intelectual e industrial de la app, así como de los elementos contenidos en el mismo (a título enunciativo y no exhaustivo, imágenes, sonido, audio, vídeo, software o textos, marcas o logotipos, combinaciones de colores, estructura y diseño, selección de materiales usados, programas de ordenador necesarios para su funcionamiento, acceso y uso, etc.). Serán, por consiguiente, obras protegidas como propiedad intelectual por el ordenamiento jurídico español, siéndoles aplicables tanto la normativa española y comunitaria en este campo, como los tratados internacionales relativos a la materia y suscritos por España.\nTodos los derechos reservados. En virtud de lo dispuesto en la Ley de Propiedad Intelectual, quedan expresamente prohibidas la reproducción, la distribución y la comunicación pública, incluida su modalidad de puesta a disposición, de la totalidad o parte de los contenidos de esta app, con fines comerciales, en cualquier soporte y por cualquier medio técnico, sin la autorización de SPOT2NF SL.\nEl Usuario se compromete a respetar los derechos de propiedad intelectual e industrial de SPOT2NF SL. Podrá visualizar los elementos de la app o incluso imprimirlos, copiarlos y almacenarlos en el disco duro de su ordenador o en cualquier otro soporte físico siempre y cuando sea, exclusivamente, para su uso personal. El Usuario, sin embargo, no podrá suprimir, alterar, o manipular cualquier dispositivo de protección o sistema de seguridad que estuviera instalado en la app.\nEn caso de que el Usuario o tercero considere que cualquiera de los Contenidos de la app suponga una violación de los derechos de protección de la propiedad intelectual, deberá comunicarlo inmediatamente a spotlifeapp a través de los datos de contacto del apartado de INFORMACIÓN GENERAL de este Aviso Legal y Condiciones Generales de Uso.\nVI. ACCIONES LEGALES, LEGISLACIÓN APLICABLE Y JURISDICCIÓN\nSPOT2NF SL se reserva la facultad de presentar las acciones civiles o penales que considere necesarias por la utilización indebida de la app y Contenidos, o por el incumplimiento de las presentes Condiciones.\nLa relación entre el Usuario y SPOT2NF SL se regirá por la normativa vigente y de aplicación en el territorio español. De surgir cualquier controversia en relación con la interpretación y/o a la aplicación de estas Condiciones las partes someterán sus conflictos a la jurisdicción ordinaria sometiéndose a los jueces y tribunales que correspondan conforme a derecho.\nEste documento de Aviso Legal y Condiciones Generales de uso del sitio web ha sido creado mediante el generador de plantilla de aviso legal y condiciones de uso online el día 16/07/2021.',
      'en': '',
    },
  },
  // DarFeedback
  {
    'wjbydoou': {
      'es': 'Feedback',
      'en': '',
    },
    'hsrvjj62': {
      'es':
          'Por que tu opinion nos importa deja aqui tu  puntuacion y comentario para seguir mejorando para ti!',
      'en': '',
    },
    '92icv3lm': {
      'es': 'Dejar una puntuacion a Spotlife',
      'en': '',
    },
    'xpjlk5zi': {
      'es': 'Escribe aquí...',
      'en': '',
    },
  },
  // componentePerfilPrivado
  {
    '5zq086n2': {
      'es': 'Esta cuenta es privada',
      'en': '',
    },
  },
  // SolicitudDePermisoUbicacion
  {
    'xynjzjwa': {
      'es': '¡Bienvenido a Spotlife!',
      'en': '',
    },
    'prolh5sw': {
      'es':
          'Para conectarte con lugares, personas y experiencias cerca de ti, necesitamos acceder a tu ubicación. Esto nos permitirá personalizar recomendaciones basadas en tus intereses y localización.',
      'en': '',
    },
    '56sz47r2': {
      'es':
          'Por favor, otorga permiso para acceder a tu ubicación para que puedas disfrutar de la mejor experiencia posible en Spotlife. Puedes cambiar esta configuración en cualquier momento en la sección de ajustes de la aplicación.\n\n¡Gracias por elegir Spotlife para explorar y descubrir el mundo que te rodea!',
      'en': '',
    },
    '4iqi0jza': {
      'es': 'Dar permiso',
      'en': '',
    },
    'emlyuk4m': {
      'es': 'Omitir',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntro
  {
    'crlx7wqy': {
      'es': 'Cambia a una cuenta profesional',
      'en': '',
    },
    'guwcfq8h': {
      'es':
          'Con tu cuenta Pro/Empresa en Spotlife te daras a conocer a una audiencia segmentada de una forma real, visual y sencilla.',
      'en': '',
    },
    'c9mxpefe': {
      'es': 'Continuar',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntro2
  {
    '8y1iuke1': {
      'es': 'Obten herramientas exclusivas para promocionarte',
      'en': '',
    },
    '3wy79mct': {
      'es':
          'Tendras acceso a herramientas de promocion exclusivas, que te permiten interactuar con tu publico objetivo de forma facil y real ',
      'en': '',
    },
    'no6l5933': {
      'es': 'Continuar',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntro3
  {
    'hncwftot': {
      'es': 'Llega a mas personas',
      'en': '',
    },
    'kh22gl2q': {
      'es':
          'Crea promociones en Spotlife, para llegar a tu publico de forma natural a traves de los spots favoritos de tu publico objetivo.',
      'en': '',
    },
    'wm66d621': {
      'es': 'Continuar',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntro4
  {
    'c9pj9bpa': {
      'es': 'Obten informacion e interactua con tu comunidad',
      'en': '',
    },
    'uogz1f16': {
      'es':
          'Tu lugar se convertira en un spot oficial, donde los demas usuarios odran ver todos los usuarios que lo visitan.\n\nAdemas tendras canales para comunicarte con esta comunidad de forma divertida y efectiva.',
      'en': '',
    },
    'mbwqg7c7': {
      'es': 'Continuar',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntroCobro
  {
    'tqcruyxq': {
      'es': 'Spotlife Hero',
      'en': '',
    },
    'stfsr3i7': {
      'es': 'Se te cobrara 22,99€ al mes en esta cuenta',
      'en': '',
    },
    'y85dtt9g': {
      'es':
          'La suscripción se renovara mensualmente.\n\nTu suscripción a Spotlife se renovará automáticamente cada mes, asegurando que tu empresa continúe beneficiándose de todas las ventajas y herramientas que ofrecemos sin interrupciones. Este modelo de suscripción mensual te proporciona flexibilidad y permite que tu negocio siempre esté al día con las últimas novedades y mejoras de nuestra plataforma.\n\nCancelación en Cualquier Momento.\n\nEntendemos que las necesidades de tu negocio pueden cambiar. Por eso, te ofrecemos la opción de cancelar tu suscripción en cualquier momento. No hay compromisos a largo plazo ni penalizaciones por cancelar. Si decides que Spotlife ya no es la mejor opción para tu empresa, puedes gestionar y cancelar tu suscripción fácilmente a través de la configuración de tu cuenta.',
      'en': '',
    },
    'ihy6bs18': {
      'es': 'Listo',
      'en': '',
    },
  },
  // CambiaraUnacuentaProfesionalIntroCobroRol
  {
    'qbpa36em': {
      'es': 'Spotlife Hero',
      'en': '',
    },
    'wdc41f77': {
      'es': '¿Eres Creador o Empresa?',
      'en': '',
    },
    'a27b3li2': {
      'es': 'Creador',
      'en': '',
    },
    'qroxn5xk': {
      'es':
          'La mejor opción para personajes publicos, productores de contenido, artistas y personas influyentes',
      'en': '',
    },
    'ayzbg8r9': {
      'es': 'Empresa',
      'en': '',
    },
    'edv2uscy': {
      'es':
          'La mejor opcion para comercios locales, hosteleria, marcas, organizaciones y proveedores de servicios.',
      'en': '',
    },
    'emzgi0lf': {
      'es': 'Finalizar',
      'en': '',
    },
  },
  // ConfiguracionCuenta
  {
    '6a1kk7a4': {
      'es': 'Muestra que tu perfil esta verificado',
      'en': '',
    },
    '2hqssc3d': {
      'es': 'Spotlife Hero',
      'en': '',
    },
    'ehhh02dg': {
      'es':
          'Verificar tu perfil en Spotlife te brinda múltiples beneficios:\n\nAcceso a Comunidad y Eventos:Obtendras beneficios, invitaciones a eventos y viajes organizados por Spotlife.\n\nCredibilidad y Confianza: Un perfil verificado indica a los demás usuarios que tu contenido es auténtico y confiable.\n\nInteracciones Reales: Conecta con una comunidad genuina que valora la autenticidad y el contenido de calidad.\n\nReconocimiento: Destaca en la plataforma como un usuario de referencia, atrayendo más seguidores interesados en tus spots.',
      'en': '',
    },
    'r3iv2el5': {
      'es': 'Continuar',
      'en': '',
    },
  },
  // ConfiguracionCuentaCobro
  {
    '3zxqkt6k': {
      'es': 'Spotlife Hero',
      'en': '',
    },
    'gbsg7iow': {
      'es': 'Spotlife Hero, se te cobrara 3,99€ en esta cuenta.',
      'en': '',
    },
    '7290vu1q': {
      'es': 'Continuar',
      'en': '',
    },
    'fmw8ed3u': {
      'es':
          'Tras el pago confirmaremos tu identidad en un plazo de hasta 48h despues de que envies tu informacion para que se verifique',
      'en': '',
    },
  },
  // ConfiguracionCuentaCobroFinalizacion
  {
    '24w1ubx7': {
      'es': 'Spotlife Hero',
      'en': '',
    },
    'peryihpr': {
      'es': 'Verificacion en marcha!\nGracias por formar parte de Spotlife',
      'en': '',
    },
    '2jsel16p': {
      'es': 'Finalizar',
      'en': '',
    },
  },
  // filtrarDistancia
  {
    'hdlql4lx': {
      'es': 'Filtrar spots por distancia',
      'en': '',
    },
    '7q5uuaim': {
      'es': 'Desliza para filtar por la distancia ',
      'en': '',
    },
  },
  // postImagenV2Copy
  {
    'oriqhn7v': {
      'es': ' likes',
      'en': '',
    },
    '9rqvem5w': {
      'es': ' likes',
      'en': '',
    },
    '5swmtbhn': {
      'es': 'Mas',
      'en': '',
    },
    'g8thixl7': {
      'es': 'Añade un comentario...',
      'en': '',
    },
    'h4el2xwu': {
      'es': ' Likes',
      'en': '',
    },
    'wiun52sc': {
      'es': ' Likes',
      'en': '',
    },
  },
  // AlertaDeImagenesYVideosVacios
  {
    'lylid1dz': {
      'es': '¡Recordatorio!',
      'en': '',
    },
    'lm5va1z4': {
      'es': 'Recuerda subir una imagen o un video antes de etiquetar ',
      'en': '',
    },
    'sav2mwly': {
      'es': 'Cerrar',
      'en': '',
    },
  },
  // AlertaDeUbicacion
  {
    '7aoom88b': {
      'es': '¡Recordatorio!',
      'en': '',
    },
    'hjx0bq2t': {
      'es': 'Recuerda seleccionar una ubicacion ',
      'en': '',
    },
    'c4gf8d07': {
      'es': 'Cerrar',
      'en': '',
    },
  },
  // EtiquetarUsuarios
  {
    '3a82wqdh': {
      'es': 'Etiquetar Personas',
      'en': '',
    },
    'hv6h9kpo': {
      'es': 'Siguiente',
      'en': '',
    },
    'eds92nm3': {
      'es': 'Etiquetas',
      'en': '',
    },
    'asarl4zo': {
      'es': 'Buscar...',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'v09u9unq': {
      'es':
          'La aplicacion necesita acceso a su microfono para poder capturar imagenes que ud desee publicar',
      'en':
          'The application needs access to your microphone to capture images that you want to publish',
    },
    'rxgydwgj': {
      'es':
          'La aplicacion necesita acceso a su microfono para poder grabar videos que ud desee publicar',
      'en':
          'The application needs access to your microphone to be able to record videos that you want to publish',
    },
    'eacrwz6x': {
      'es':
          'La aplicacion necesita acceso a la galeria de fotos  para poder publicar imagenes y videos que ud desee publicar',
      'en':
          'The application needs access to the photo gallery to be able to publish images and videos that you want to publish',
    },
    'mx8mwzq0': {
      'es':
          'La aplicación requiere acceso a su ubicación para poder mostrarle puntos de interés basados en su ubicación actual.',
      'en':
          'The app requires access to your location in order to show you points of interest based on your current location.',
    },
    '4r3qje32': {
      'es':
          'In order to locate ubications this app requires permission to access the location',
      'en':
          'In order to locate locations this app requires permission to access the location',
    },
    'cwtz8hoj': {
      'es':
          'La aplicación solicita acceso a la información de ubicación del usuario mientras la aplicación se ejecuta en primer plano para mostrarle contenido generado en base a su uvicacion actual',
      'en':
          'The app requests access to the user\'s location information while the app is running in the foreground to show them content generated based on their current location.',
    },
    'r7x3tggc': {
      'es':
          'Nuestra aplicación necesita acceso a su ubicación para brindarle servicios y notificaciones basados en la ubicación, incluso cuando la aplicación se ejecuta en segundo plano.',
      'en':
          'Our app needs access to your location to provide you with location-based services and notifications, even when the app is running in the background.',
    },
    '87xwaoed': {
      'es': '',
      'en': '',
    },
    '2hetizi1': {
      'es': '',
      'en': '',
    },
    'a8o0m0it': {
      'es': '',
      'en': '',
    },
    'b8pa32by': {
      'es': '',
      'en': '',
    },
    'r92zcq97': {
      'es': '',
      'en': '',
    },
    '91vt7hmh': {
      'es': '',
      'en': '',
    },
    'uzn7czjp': {
      'es': '',
      'en': '',
    },
    'ah1g87pr': {
      'es': '',
      'en': '',
    },
    'p9eb0co3': {
      'es': '',
      'en': '',
    },
    'n1f6b75k': {
      'es': '',
      'en': '',
    },
    'cfroy6p8': {
      'es': '',
      'en': '',
    },
    'gisv36ca': {
      'es': '',
      'en': '',
    },
    '36pc9uwv': {
      'es': '',
      'en': '',
    },
    'h5nj2qjm': {
      'es': '',
      'en': '',
    },
    'x0jtktiu': {
      'es': '',
      'en': '',
    },
    'vo280rs9': {
      'es': '',
      'en': '',
    },
    '1fh9sarf': {
      'es': '',
      'en': '',
    },
    'b1l93llv': {
      'es': '',
      'en': '',
    },
    'plod26bt': {
      'es': '',
      'en': '',
    },
    '39vu1bbp': {
      'es': '',
      'en': '',
    },
    '8wsuv0t4': {
      'es': '',
      'en': '',
    },
    '3b4m8j93': {
      'es': '',
      'en': '',
    },
    '4b6ydp3r': {
      'es': '',
      'en': '',
    },
    'fji0dq4k': {
      'es': '',
      'en': '',
    },
    'nr3g9n4w': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
