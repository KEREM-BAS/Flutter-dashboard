import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orhunproje/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(
          flex: 2,
        ),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color: Colors.white10),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Image.asset(
            "man.png",
            height: 38,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Dr. name"),
          ),
          const Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10),
              color: primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SvgPicture.asset(
              "magnifier.svg",
              height: 38,
            ),
          ),
        ),
      ),
    );
  }
}
