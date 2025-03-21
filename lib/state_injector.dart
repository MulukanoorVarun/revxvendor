import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/VendorRemoteDataSource.dart';
import 'logic/cubit/diognostic_categories/diognostic_get_categories_cubit.dart';
import 'logic/cubit/diognostic_categories/diognostic_get_category_repository.dart';
import 'logic/cubit/diognostic_get_tests/diognostic_getTests_cubit.dart';
import 'logic/cubit/diognostic_get_tests/diognostic_getTests_repository.dart';
import 'logic/cubit/diognostic_register/register_cubit.dart';
import 'logic/cubit/diognostic_register/register_repository.dart';
import 'logic/cubit/login/LoginRepository.dart';
import 'logic/cubit/login/login_cubit.dart';

class StateInjector {
  static final repositoryProviders = <RepositoryProvider>[
    RepositoryProvider<VendorRemoteDataSource>(
      create: (context) => VendorRemoteDataSourceImpl(),
    ),
    RepositoryProvider<LoginRepository>(
      create: (context) => LoginImpl(remoteDataSource: context.read()),
    ),
    RepositoryProvider<VendorRegisterRepository>(
      create: (context) => VendorRegisterImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<DiagnosticTestsRepository>(
      create:
          (context) =>
              DiagnosticTestsImp(vendorRemoteDataSource: context.read()),
    ),

    RepositoryProvider<VendorRegisterRepository>(
      create: (context) => VendorRegisterImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<DiognosticGetCategoryRepository>(
      create:
          (context) =>
              DiognosticGetCategoryImpl(vendorRemoteDataSource: context.read()),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(context.read<LoginRepository>()),
    ),

    BlocProvider<VendorRegisterCubit>(
      create:
          (context) =>
              VendorRegisterCubit(context.read<VendorRegisterRepository>()),
    ),

    BlocProvider<DiagnosticTestsCubit>(
      create:
          (context) =>
              DiagnosticTestsCubit(context.read<DiagnosticTestsRepository>()),
    ),

    BlocProvider<DiognosticCategoryCubit>(
      create:
          (context) => DiognosticCategoryCubit(
            diognosticRepo: context.read<DiognosticGetCategoryRepository>(),
          ),
    ),
  ];
}
