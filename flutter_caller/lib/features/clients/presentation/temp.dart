  // @override
  // Widget build(BuildContext context) {
  //   final theme = Theme.of(context);
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: [
  //         SliverAppBar(
  //           pinned: true,
  //           snap: true,
  //           floating: true,
  //           // backgroundColor: theme.primaryColor,
  //           title: Text('Clients'),
  //           centerTitle: true,
  //           bottom: PreferredSize(
  //             preferredSize: const Size.fromHeight(70),
  //             child: SearchField(),
  //           ),
  //         ),
  //         const SliverToBoxAdapter(child: SizedBox(height: 16)),
  //         SliverList.builder(itemBuilder: (context, index) => ListCard()),
  //       ],
  //     ),
  //   );
  // }

  // class ListCard extends StatelessWidget {
//   const ListCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       width: double.infinity,
//       height: 40,
//       decoration: BoxDecoration(
//         color: theme.hintColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Text('Client', style: theme.textTheme.bodyLarge),
//     );
//   }
// }