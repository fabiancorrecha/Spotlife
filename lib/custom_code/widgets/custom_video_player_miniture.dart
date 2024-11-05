// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// lib/animation_player.dart

import 'package:visibility_detector/visibility_detector.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerMiniture extends StatefulWidget {
  const CustomVideoPlayerMiniture({
    super.key,
    this.width,
    this.height,
    required this.videoPath,
    required this.soundOn,
    required this.soundOff,
    required this.fullscreen,
    required this.closeScreem,
    this.buttonSize = 30, // Añadir parámetro para el tamaño de los botones
  });

  final double? width;
  final double? height;
  final String videoPath;
  final Widget soundOn; // Cambiar de Icon a Widget
  final Widget soundOff; // Cambiar de Icon a Widget
  final Widget fullscreen; // Cambiar de Icon a Widget
  final Widget closeScreem; // Cambiar de Icon a Widget
  final double buttonSize; // Tamaño configurable de los botones

  @override
  _CustomVideoPlayerMinitureState createState() =>
      _CustomVideoPlayerMinitureState();
}

class _CustomVideoPlayerMinitureState extends State<CustomVideoPlayerMiniture> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.videoPath),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:
          9 / 16, // Para mantener los videos siempre en formato vertical
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControls: FlickVideoWithControls(
          controls: CustomFlickControls(
            flickManager: flickManager,
            soundOn: widget.soundOn,
            soundOff: widget.soundOff,
            fullscreen: widget.fullscreen,
            closeScreem: widget.closeScreem,
            buttonSize: widget.buttonSize, // Pasar el tamaño de los botones
          ),
        ),
      ),
    );
  }
}

class CustomFlickControls extends StatefulWidget {
  final FlickManager flickManager;
  final Widget soundOn; // Cambiar de Icon a Widget
  final Widget soundOff; // Cambiar de Icon a Widget
  final Widget fullscreen; // Cambiar de Icon a Widget
  final Widget closeScreem; // Cambiar de Icon a Widget
  final double buttonSize; // Tamaño configurable de los botones

  const CustomFlickControls({
    Key? key,
    required this.flickManager,
    required this.soundOn,
    required this.soundOff,
    required this.fullscreen,
    required this.closeScreem,
    required this.buttonSize,
  }) : super(key: key);

  @override
  _CustomFlickControlsState createState() => _CustomFlickControlsState();
}

class _CustomFlickControlsState extends State<CustomFlickControls> {
  bool isMuted = false; // Estado inicial del sonido
  bool isFullscreen = false; // Estado inicial de pantalla completa

  @override
  void initState() {
    super.initState();
    // Inicializar el estado del sonido y pantalla completa basado en el controlador
    isMuted = widget.flickManager.flickControlManager!.isMute;
    isFullscreen = widget.flickManager.flickControlManager!.isFullscreen;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Añadimos FlickTogglePlayAction para alternar entre play/pause al tocar la pantalla
        FlickTogglePlayAction(
          child: GestureDetector(
            onTap: () {
              widget.flickManager.flickControlManager!.togglePlay();
            },
          ),
        ),
        // Duración del video con la nueva estética usando FlickLeftDuration
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.6), // Fondo oscuro semitransparente
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
            child: FlickLeftDuration(
              fontSize: 10,
              color: Colors.white, // Texto blanco
            ),
          ),
        ),
        // Controles de sonido y pantalla completa en la parte inferior derecha
        // Positioned(
        // bottom:
        //   60, // Movemos los controles más arriba para dar espacio a la barra de progreso
        //right: 20,
        //child: Column(
        //mainAxisSize: MainAxisSize.min,
        //children: [
        // Botón de sonido (mute/unmute) con iconos personalizados
        //Container(
        //decoration: BoxDecoration(
        //shape: BoxShape.circle,
        //color:
        //  Colors.black.withOpacity(0.6), // Fondo semitransparente
        //boxShadow: [
        //BoxShadow(
        //color: Colors.black.withOpacity(0.3), // Sombra ligera
        //blurRadius: 6,
        //spreadRadius: 2,
        //),
        //],
        //),
        //child: IconButton(
        //icon: isMuted
        //  ? widget.soundOff
        //: widget.soundOn, // Alterna los iconos según el estado
        //iconSize: widget.buttonSize -
        //  10, // Reducir el tamaño del icono en 10px
        //onPressed: () {
        //setState(() {
        // Alternar el estado de mute y actualizar el estado
        //isMuted = !isMuted;
        //widget.flickManager.flickControlManager!.toggleMute();
        //});
        //},
        //),
        //),
        //SizedBox(height: 15), // Espacio entre los botones
        // Botón de pantalla completa con la lógica de toggle entre fullscreen y closeScreem
        //Container(
        //decoration: BoxDecoration(
        //shape: BoxShape.circle,
        //color:
        //  Colors.black.withOpacity(0.6), // Fondo semitransparente
        //boxShadow: [
        //BoxShadow(
        //color: Colors.black.withOpacity(0.3), // Sombra ligera
        //blurRadius: 6,
        //spreadRadius: 2,
        //),
        //],
        //),
        //child: IconButton(
        //icon: isFullscreen
        //  ? widget.closeScreem
        //: widget
        //  .fullscreen, // Alterna los iconos según el estado de pantalla completa
        //iconSize: widget.buttonSize -
        //  10, // Reducir el tamaño del icono en 10px
        //onPressed: () {
        //setState(() {
        // Alternar el estado de pantalla completa
        //isFullscreen = !isFullscreen;
        //widget.flickManager.flickControlManager!
        ///  .toggleFullscreen();
        //});
        //},
        //),
        //),
        // ],
        //),
        //),
        // Barra de progreso ubicada en la parte inferior con padding en todos los lados
        //Positioned(
        //bottom: 0, // Ubicamos la barra de progreso en la parte inferior
        //left: 0,
        //right: 0,
        //child: Padding(
        //padding: const EdgeInsets.fromLTRB(
        //  30, 0, 30, 30), // Añadir padding izquierdo, derecho y inferior
        //child: FlickShowControlsAction(
        //child: FlickVideoProgressBar(
        //  flickProgressBarSettings: FlickProgressBarSettings(
        //  height: 5,
        //handleRadius: 5,
        //handleColor: Colors.white,
        //backgroundColor: Colors.grey.withOpacity(0.5),
        //bufferedColor: Colors.white.withOpacity(0.7),
        //playedColor: Color(0xFFF4F176),
        //),
        //),
        //),
        //  //),
        //),
      ],
    );
  }
}
