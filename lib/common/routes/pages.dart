import 'package:get/get.dart';
import 'package:restaurant_admin/pages/Reservations/index.dart';
import 'package:restaurant_admin/pages/add_food/index.dart';
import 'package:restaurant_admin/pages/customers/index.dart';
import 'package:restaurant_admin/pages/dashboard/index.dart';
import 'package:restaurant_admin/pages/food_details/index.dart';
import 'package:restaurant_admin/pages/home/index.dart';
import 'package:restaurant_admin/pages/menu/index.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';

import 'routes.dart';

class AppPages{


  static String getInitial() => AppRoutes.Home;

  static List<GetPage> routes = [
    /*GetPage(
        name: AppRoutes.Sign_In,
        page: () => const SignInPage(),
        binding: SignInBinding(),
    ),*/
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn
      /*middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],*/
    ),
    GetPage(
      name: AppRoutes.Dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: AppRoutes.OrderList,
      page: () => const OrderListPage(),
      binding: OrderListBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: AppRoutes.Reservations,
      page: () => const ReservationsPage(),
      binding: ReservationsBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
      name: AppRoutes.MenuList,
      page: () => const MenuListPage(),
      binding: MenuListBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.AddFood,
        page: () => const AddFoodPage(),
        binding: AddFoodBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: AppRoutes.FoodDetails,
        page: () => const FoodDetailsPage(),
        binding: FoodDetailsBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
      name: AppRoutes.Customers,
      page: () => const CustomersPage(),
      binding: CustomersBinding(),
      transition: Transition.fadeIn
    ),
  ];
}