import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final videoPlayerLhmi3cxm = GlobalKey();
final textFieldWxqpt3ez = GlobalKey();
final placePickerQ7demwmw = GlobalKey();
final textA4wqjt8j = GlobalKey();
final row1b6e79tc = GlobalKey();
final buttonHxyj0gn7 = GlobalKey();

/// CrearPost
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: videoPlayerLhmi3cxm,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Selecciona la imagen o el video que deseas publicar',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textFieldWxqpt3ez,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Escribe una descripcion  a cerca de tu post',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: placePickerQ7demwmw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Presiona aqui para seleccionar la ubicacion de tu post',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: textA4wqjt8j,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TextoWidget(
              texto:
                  'Selecciona el tipo de privacidad de tu post (privado o publico)',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: row1b6e79tc,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TextoWidget(
              texto:
                  'Presiona aqui para crear una coleccion donde vas a poder guardar todos tus post ',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: buttonHxyj0gn7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Presiona aqui para publicar tu post',
            ),
          ),
        ],
      ),
    ];
