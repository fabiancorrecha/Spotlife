import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final buttonUnunxjml = GlobalKey();
final containerYcmylxk5 = GlobalKey();

/// intereses
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: buttonUnunxjml,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: const Color(0x830F1316),
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => const TextoWidget(
              texto: '',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerYcmylxk5,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const TextoWidget(
              texto: 'Presiona continuar para seguir adelante con el proceso',
            ),
          ),
        ],
      ),
    ];
