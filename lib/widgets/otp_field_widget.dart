import 'package:flutter/material.dart';
import 'package:otp_field/widgets/text_field_widget.dart';

class OtpFieldWidget extends StatefulWidget {
  const OtpFieldWidget({Key? key}) : super(key: key);

  @override
  OtpFieldWidgetState createState() => OtpFieldWidgetState();
}

class OtpFieldWidgetState extends State<OtpFieldWidget> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (value) {
        if (value.logicalKey.keyId == 0x100000008) {
          FocusScope.of(context).previousFocus();
        }
      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller1),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller2),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller3),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller4),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller5),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextFieldWidget(controller: _controller6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
