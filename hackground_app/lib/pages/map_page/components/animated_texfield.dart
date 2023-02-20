import 'package:flutter/material.dart';

class AnimatedSearchTextField extends StatefulWidget {
  const AnimatedSearchTextField({Key? key}) : super(key: key);

  @override
  _AnimatedSearchTextFieldState createState() => _AnimatedSearchTextFieldState();
}

class _AnimatedSearchTextFieldState extends State<AnimatedSearchTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isExpanded = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: _isExpanded ? 60 : 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
