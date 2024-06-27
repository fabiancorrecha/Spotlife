import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/texto_widget.dart';

// Focus widget keys for this walkthrough
final textFieldIhvh44c9 = GlobalKey();
final imageP2pxjmem = GlobalKey();
final textField477ul6ox = GlobalKey();
final textBwi1xhqn = GlobalKey();
final placePickerL72i2r1d = GlobalKey();
final container1oz0keva = GlobalKey();

/// Crear Coleccion
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textFieldIhvh44c9,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Escribe el titulo de tu coleccion',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: imageP2pxjmem,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto:
                  'Presiona aquí si deseas cambiar la imagen de portada de tu coleccion',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: textField477ul6ox,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto:
                  'Escribe en esta seccion una descripcion para tu coleccion',
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: textBwi1xhqn,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TextoWidget(
              texto:
                  'Selecciona la privacidad que deseas darle a tu coleccion entre las diferentes opciones',
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: placePickerL72i2r1d,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => TextoWidget(
              texto: 'Ahora presione aqui para indicar la ubicacion de tu post',
            ),
          ),
        ],
      ),

      /// Step 6
      TargetFocus(
        keyTarget: container1oz0keva,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => TextoWidget(
              texto: 'Presiona aqui para crear tu coleccion',
            ),
          ),
        ],
      ),
    ];
