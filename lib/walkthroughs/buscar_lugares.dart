import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final textFieldVo7chw27 = GlobalKey();
final container9ncdwzx1 = GlobalKey();

/// Buscar Lugares
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldVo7chw27,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto: 'escribe en este apartado lo que deseas buscar ',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: container9ncdwzx1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'Navega entre las dos vistas de la pagina para filtrar por post o por usuario ',
            ),
          ),
        ],
      ),
    ];
