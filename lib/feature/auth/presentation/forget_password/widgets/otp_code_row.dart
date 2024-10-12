import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpCodeRow extends StatefulWidget {
  final int otpLength = 6;
  const OtpCodeRow({super.key});

  @override
  State<OtpCodeRow> createState() => _OtpCodeRowState();
}

class _OtpCodeRowState extends State<OtpCodeRow> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers = List.generate(widget.otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(widget.otpLength, (_) => FocusNode());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
  }

  void _onOtpChanged(int index, String value) {
    if(value.length == 1 && index < widget.otpLength - 1){
       _focusNodes[index + 1].requestFocus();
    }
    if(value.isEmpty && index > 0){
      _focusNodes[index - 1].requestFocus();
    }
    if(_controllers.every((controller)=>controller.text.length == 1)){
      final otp = _controllers.map((controller)=> controller.text).join();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.otpLength, (index) {
          return  SizedBox(
              width: 50,
              child: TextFormField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                maxLength: 1,
                  style: Theme.of(context).textTheme.labelMedium,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value)=> _onOtpChanged(index,value),
                decoration: InputDecoration(
                  counterText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
          );
        })
    );
  }
}
