import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:latlong/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:Laukita/shared/shared.dart';
import 'package:Laukita/ui/widgets/widgets.dart';
import 'package:Laukita/models/models.dart';
import 'package:Laukita/data/dummy_data.dart';
import 'package:Laukita/bloc/blocs.dart';
import 'package:Laukita/repositories/repositories.dart';

part 'main_page.dart';
part 'home_page.dart';
part 'nearby_page.dart';
part 'product_detail_page.dart';
part 'scan_page.dart';
part 'order_payment_page.dart';
part 'user_profile_page.dart';
part 'my_orders_page.dart';
part 'distribution_portal_page.dart';
part 'registration_page.dart';
part 'email_verification_page.dart';
part 'upgrade_account_page.dart';
part 'shipment_form_page.dart';
part 'login_page.dart';
part 'user_profile_page/buyer_account_page.dart';
part 'user_profile_page/referral_account_page.dart';
part 'shopping_cart_page.dart';
part 'transactions_page.dart';
part 'transaction_page/transaction_complaints_page.dart';
part 'transaction_page/transaction_orders_page.dart';
part 'transaction_page/transaction_supply_page.dart';
part 'splash_screen.dart';
part 'onboarding_page.dart';