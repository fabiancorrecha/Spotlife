import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final container3u8d5bpi = GlobalKey();

/// bienvenida
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container3u8d5bpi,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const TextoWidget(
              texto: 'Selecciona continuar para pasar al home',
            ),
          ),
        ],
      ),
    ];
