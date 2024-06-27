import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final container8rt78f08 = GlobalKey();
final cardS54sydg0 = GlobalKey();
final cardB8pdfuzz = GlobalKey();

/// Mapa Principal
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container8rt78f08,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Escribe aqui tu busqueda',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: cardS54sydg0,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto:
                  'Selecciona el siguiente boton para cambiar entre vistas y privacidad de post',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: cardB8pdfuzz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Selecciona el siguiente boton para crear un nuevo post',
            ),
          ),
        ],
      ),
    ];
