import 'package:bookly_app/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 12),
      child: TextField(
        cursorColor: Colors.white,
        onChanged: (value) => textController.text = value,
        onSubmitted: (value) {
          if (textController.text.isNotEmpty) {
            BlocProvider.of<SearchCubit>(context).bookSearch(bookName: value);
          }
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                BlocProvider.of<SearchCubit>(
                  context,
                ).bookSearch(bookName: textController.text);
              }
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
          ),
          hintText: '  Enter The Book Name',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
