// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
// import 'package:movies_app/ui/components/body/movies_covers.dart';
// import 'package:movies_app/ui/style/app_style.dart';

// class MovieCard extends StatelessWidget {
//   const MovieCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MoviesBloc, MoviesState>(
//       builder: (context, state) {
//         final List<String> pics = [
//           'https://cdn.marvel.com/content/1x/snh_online_6072x9000_posed_01.jpg',
//         ];
//         final List<String> names = [
//           'Spiderman',
//         ];
//         // final List<String> ratings = [
//         //   '9.5',
//         // ];
//         // final List<String> genres = [
//         //   'Action',
//         // ];
//         // final List<String> years = [
//         //   '2019',
//         // ];
//         // final List<String> times = [
//         //   '139 minutes',
//         // ];
//         return Row(
//           children: [
//             MoviesCover(
//               image: pics[0],
//               movieId: '',
//             ),
//             SizedBox(width: 12.w),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   names[0],
//                   style: AppStyle.fontStyle.copyWith(
//                     fontSize: 16.w,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 14.h),
//                 // TextMovieCard(icon: Icons.star, text: ratings[0]),
//                 // TextMovieCard(icon: Icons.ticket, text: genres[0]),
//                 // TextMovieCard(icon: Icons.calendar, text: years[0]),
//                 // TextMovieCard(icon: Icons.watch_later_outlined, text: times[0]),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
