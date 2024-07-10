import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final tabY38cfb8b = GlobalKey();
final tabS43zaii5 = GlobalKey();

/// mis favoritos
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: tabY38cfb8b,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'selecciona aquí para ver una vista más específica  de los post',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: tabS43zaii5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'ahora selecciona en este apartado para tener una vista global de tus post favoritos ',
            ),
          ),
        ],
      ),
    ];
