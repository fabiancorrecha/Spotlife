import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final container0ipjj8zo = GlobalKey();
final containerOyq3wxpk = GlobalKey();

/// Fecha de nacimiento
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container0ipjj8zo,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto: 'Selecciona el siguiente recuadro para ingresar tu edad ',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerOyq3wxpk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const TextoWidget(
              texto:
                  'Después de seleccionar tu fecha de nacimiento presiona el botón de continuar',
            ),
          ),
        ],
      ),
    ];
