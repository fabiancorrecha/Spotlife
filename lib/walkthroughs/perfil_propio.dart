import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final containerT7zd4lzn = GlobalKey();
final containerBe24rl6p = GlobalKey();
final containerJ0ammthe = GlobalKey();

/// PerfilPropio
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerT7zd4lzn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'Aqui podras visualizar la cantidad de Spots, Seguidores y Editar tu Perfil, entre otras funcionalidades que podras disfrutar',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerBe24rl6p,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const TextoWidget(
              texto:
                  'Interactua con la barra de navegacion de tu perfil para tener las diferentes vistas de tus publicaciones',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerJ0ammthe,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const TextoWidget(
              texto:
                  'Desplazate por diferentes secciones de nuestra aplicacion utilizando la barra de navegacion que tienes la parte inferior de la pantalla',
            ),
          ),
        ],
      ),
    ];
