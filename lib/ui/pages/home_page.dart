import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landig_page/providers/page_provider.dart';
import 'package:vertical_landig_page/ui/shared/custom_app_menu.dart';
import 'package:vertical_landig_page/ui/views/about_view.dart';
import 'package:vertical_landig_page/ui/views/contact_view.dart';
import 'package:vertical_landig_page/ui/views/home_view.dart';
import 'package:vertical_landig_page/ui/views/location_view.dart';
import 'package:vertical_landig_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration( 
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.purpleAccent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]
            )
        ),
        child: Stack(
          children: [
            const _HomeBody(),
            Positioned( 
              right: 20,
              top: 20,
              child: CustomAppMenu())
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pageProvider = context.read<PageProvider>();

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricinView(),
        ContactView(),
        LocationView()
        
      ],
    );
  }
}