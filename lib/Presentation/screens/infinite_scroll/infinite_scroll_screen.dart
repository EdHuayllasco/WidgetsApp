import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollControler = ScrollController();
  List<int> idImages = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    scrollControler.addListener(() {
      if ((scrollControler.position.pixels + 500) >=
          scrollControler.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveToScrollBottom();
  }

  @override
  void dispose() {
    scrollControler.dispose();
    isMounted = false;
    super.dispose();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    isLoading = false;
    final int lastimage = idImages.last;
    idImages.clear();
    idImages.add(lastimage + 1);
    addImages();
    setState(() {});
  }

  void moveToScrollBottom() {
    if ((scrollControler.position.pixels + 100) <=
        scrollControler.position.maxScrollExtent) return;
    scrollControler.animateTo(scrollControler.position.pixels + 120,
        duration: const Duration(microseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addImages() {
    final int lastimage = idImages.last;
    idImages.addAll([1, 2, 3, 4, 5].map((e) => lastimage + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: onRefresh,
        edgeOffset: 10,
        strokeWidth: 2,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
            controller: scrollControler,
            itemCount: idImages.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${idImages[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        // child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
