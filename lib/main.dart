import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/app.dart.dart';
import 'core/api/meal_api.dart';
import 'features/recipe_list/bloc/recipe_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RecipeListBloc(MealApi()),
        child: const MobileConstrainedWrapper(
          child: App(), // Initial screen
        ));
  }
}

// SE UP A CONSTRAINT BOX TO ALLOW DISPLAY FOR THE MOBILE-WEB VERSION IN CASE THE USER HAS NO ANDROID
class MobileConstrainedWrapper extends StatelessWidget {
  final Widget child;

  const MobileConstrainedWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double containerWidth =
        screenWidth < 600 ? screenWidth : screenWidth * 0.5;

    return Container(
      color: Colors.grey.shade300,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: containerWidth,
          ),
          child: Container(
            color: Colors.white,
            child: child,
          ),
        ),
      ),
    );
  }
}



// class MobileConstrainedWrapper extends StatelessWidget {
//   final Widget child;

//   const MobileConstrainedWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     const double mobileWidth = 450.0;

//     return Container(
//       color: Colors.grey.shade300, // Background color outside the mobile frame
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(
//             maxWidth: mobileWidth,
//           ),
//           child: Container(
//             color: Colors.white, // Color inside the mobile frame
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }


// class MobileConstrainedWrapper extends StatelessWidget {
//   final Widget child;

//   const MobileConstrainedWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     // Define mobile width (optional: height can be flexible)
//     const double mobileWidth = 390.0;

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Align(
//           alignment: Alignment.topCenter, // Align at top
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(
//               maxWidth: mobileWidth,
//             ),
//             child: child,
//           ),
//         );
//       },
//     );
//   }
// }


// class MobileConstrainedWrapper extends StatelessWidget {
//   final Widget child;

//   const MobileConstrainedWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     // Define mobile dimensions
//     const double mobileWidth = 390.0; // e.g., iPhone 14 width
//     const double mobileHeight = 844.0; // e.g., iPhone 14 height

//     return MediaQuery(
//       // Override MediaQuery to simulate mobile screen size
//       data: MediaQueryData.fromWindow(WidgetsBinding.instance.window).copyWith(
//         size: const Size(mobileWidth, mobileHeight),
//         devicePixelRatio: 2.0, // Adjust for high-density displays
//       ),
//       child: Center(
//         // Center the constrained box on the screen
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(
//             maxWidth: mobileWidth,
//             maxHeight: mobileHeight,
//           ),
//           child: Container(
//             // Optional: Add a border or shadow to visualize the mobile frame
//             decoration: BoxDecoration(
//               // border: Border.all(color: Colors.black, width: 0),
//               // boxShadow: const [
//               //   BoxShadow(
//               //     color: Colors.black26,
//               //     blurRadius: 10,
//               //     offset: Offset(0, 2),
//               //   ),
//               // ],
//               color: Colors.white, // Background color for the mobile area
//             ),
//             child: child, // Render the screen content
//           ),
//         ),
//       ),
//     );
//   }
// }
