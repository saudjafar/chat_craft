import 'package:flutter/material.dart';

class DescriptionField extends StatefulWidget {
  final bool _isGenerating;
  final void Function(String prompt) _onSubmitted;
  const DescriptionField(
      {super.key,
      required bool isGenerating,
      required Function(String value) onSubmitted})
      : _isGenerating = isGenerating,
        _onSubmitted = onSubmitted;

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _descController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _descController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _descController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              hintText: 'Input a description',
            ),
          ),
        ),
        const SizedBox(
          width: 06,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onSecondary,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            onPressed: widget._isGenerating
                ? null
                : () {
                    _focusNode.unfocus();
                    final desc = _descController.text;
                    _descController.clear();
                    widget._onSubmitted(desc);
                  },
            child: const Icon(Icons.send))
      ],
    );
  }
}
