import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'image_user_model.dart';
export 'image_user_model.dart';

class ImageUserWidget extends StatefulWidget {
  const ImageUserWidget({
    super.key,
    this.radioImagen,
  });

  final int? radioImagen;

  @override
  State<ImageUserWidget> createState() => _ImageUserWidgetState();
}

class _ImageUserWidgetState extends State<ImageUserWidget> {
  late ImageUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: AuthUserStreamWidget(
        builder: (context) => Container(
          width: widget.radioImagen?.toDouble(),
          height: widget.radioImagen?.toDouble(),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            valueOrDefault<String>(
              currentUserPhoto,
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/spolifeapp-15z0hb/assets/m2l2qjmyfq9y/avatar_perfil_redondo.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
