import 'package:flutter/material.dart';
import 'package:shop_task/view/authentication_screen/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pages = [
      {
        'image': './assets/images/on_board1.png',
        'title': 'SHOP ONLINE',
        'description': 'Shop Now!'
      },
      {
        'image': './assets/images/on_board2.png',
        'title': 'TRACK YOUR ORDER',
        'description': 'order become easy!'
      },
      {
        'image': './assets/images/on_board3.png',
        'title': 'GET YOUR ORDER',
        'description': 'Let\'s start!'
      },
    ];

    final PageController myPageController = PageController();
    int trackThePageLimits = 1;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(children: [
              const Spacer(),
              TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())), child: const Text('Skip')),
              const SizedBox(width: 5,)
            ],),
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: myPageController,
                  itemBuilder: (context, index){
                  return Column(
                    children: [

                      const Spacer(),
                      myPageWidget(image: pages[index]['image']!, title: pages[index]['title']!, description: pages[index]['description']!,),
                    ],
                  );
                  },
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 65,),
                SmoothPageIndicator(
                  controller: myPageController,
                  count: pages.length,
                effect: const ExpandingDotsEffect(dotWidth: 10,dotHeight: 10),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    trackThePageLimits++;
                    (trackThePageLimits>3)?
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()))
                        :myPageController.nextPage(duration: const Duration(milliseconds: 630), curve: Curves.ease);

                  },
                  backgroundColor: Colors.indigo,
                  child:
                  const Icon(Icons.navigate_next,
                    color: Colors.white, size: 24,),
                ),
                const SizedBox(width: 25,)
              ],
            ),
            const SizedBox(height: 40,)
          ],
        )
      ),
    );
  }

  Widget myPageWidget({required String image, required String title, required String description}){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 300,),
        const SizedBox(height: 80,),
        Text(title, style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 5,),
        Text(description, style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.normal
        ),),
        const SizedBox(height: 15,),
      ],
    );
  }

}
