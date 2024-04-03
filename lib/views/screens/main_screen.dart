import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/category_screen.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/order_screen.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/product_screen.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/upload_banner.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:ms_multi_web_admin/views/screens/side_bar_screens/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   Widget _selectedItem =  const DashboardScreen();

  screenSelector(item){
    switch (item.route){
      case DashboardScreen.routeName : 
            setState(() {
              _selectedItem = const DashboardScreen();
            });
            break;
      case VendorsScreen.routeName : 
            setState(() {
              _selectedItem = const VendorsScreen();
            });
            break;
      case WithdrawalScreen.routeName : 
            setState(() {
              _selectedItem = const WithdrawalScreen();
            });
            break;
      case OrderScreen.routeName : 
            setState(() {
              _selectedItem = const OrderScreen();
            });
            break;
      case CategoryScreen.routeName : 
            setState(() {
              _selectedItem = const CategoryScreen();
            });
            break;
      case ProductScreen.routeName : 
            setState(() {
              _selectedItem = const ProductScreen();
            });
            break;
      case UploadBannerScreen.routeName : 
            setState(() {
              _selectedItem = const UploadBannerScreen();
            });
            break;
      default : setState(() {
              _selectedItem = const DashboardScreen();
            });      
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: const Text('Management System',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      sideBar: SideBar(
        items:const  [ 
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,),
            AdminMenuItem(
            title: 'Vendors',
            icon: CupertinoIcons.person_3,
            route: VendorsScreen.routeName,),
            AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
            route: WithdrawalScreen.routeName,),
            AdminMenuItem(
            title: 'Orders',
            icon: CupertinoIcons.shopping_cart,
            route: OrderScreen.routeName,),
            AdminMenuItem(
            title: 'Categories',
            icon: Icons.category,
            route: CategoryScreen.routeName,),
            AdminMenuItem(
            title: 'Products',
            icon: Icons.shop,
            route: ProductScreen.routeName,),
            AdminMenuItem(
            title: 'Upload Banners',
            icon: CupertinoIcons.add,
            route: UploadBannerScreen.routeName,),


        ],
        selectedRoute: '',
        onSelected: (item){
          screenSelector(item);
        }

      ),
      body: _selectedItem,
    );
  }
}