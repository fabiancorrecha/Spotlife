import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final textFieldHerk2tg9 = GlobalKey();
final containerKn6ra4ch = GlobalKey();

/// Olvidar Contrasena
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldHerk2tg9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'ingresa aqui el email con el que te registraste en nuestra aplicacion',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerKn6ra4ch,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'presiona el siguiente boton y recibiras un enlace a el correo ingresado anteriormente ',
            ),
          ),
        ],
      ),
    ];
