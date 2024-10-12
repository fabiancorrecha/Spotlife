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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedWithShadow extends StatefulWidget {
  const RoundedWithShadow({
    super.key,
    this.width,
    this.height,
    required this.codigoPin, // Agrega el parámetro requerido
  });

  final double? width;
  final double? height;
  final Function(String) codigoPin; // Tipo de acción que espera el código

  @override
  _RoundedWithShadowState createState() => _RoundedWithShadowState();

  @override
  String toStringShort() => 'Rounded With Shadow';
}

class _RoundedWithShadowState extends State<RoundedWithShadow> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String? valorDelCodigo; // Aquí guardaremos el valor del código

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 54,
      textStyle: GoogleFonts.poppins(
        fontSize: 20,
        color: Color(0xFFF4F176),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 32, 31, 31),
        borderRadius: BorderRadius.circular(18),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 16),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 34, 34),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(15, 32, 32, 32),
              offset: Offset(0, 3),
              blurRadius: 16,
            ),
          ],
        ),
      ),
      onChanged: (value) {
        valorDelCodigo = value; // Guarda el valor introducido
        widget.codigoPin(value); // Ejecuta la acción pasando el valor
      },
      showCursor: true,
      cursor: cursor,
    );
  }
}
