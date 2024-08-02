import 'package:core_bloc/bloc.dart';
import 'package:core_flutter_bloc/src/Internal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocBuilder<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocBuilder<BlocT, IFlowState<DataT>> {
  const FlowBlocBuilder({
    required BlocWidgetBuilder<IFlowState<DataT>> builder,
    super.key,
    super.bloc,
    BlocBuilderCondition<IFlowState<DataT>>? buildWhen,
  }) : super(builder: builder, buildWhen: buildWhen);

  factory FlowBlocBuilder.when({
    Key? key,
    BlocT? bloc,
    BlocWidgetBuilder<IdleState<DataT>>? idle,
    BlocWidgetBuilder<LoadingState<DataT>>? loading,
    BlocWidgetBuilder<LoadMoreState<DataT>>? loadMore,
    BlocWidgetBuilder<EmptyState<DataT>>? empty,
    BlocWidgetBuilder<DataState<DataT>>? data,
    BlocWidgetBuilder<ErrorState<DataT>>? error,
    BlocWidgetBuilder<IFlowState<DataT>>? orElse,
    BlocBuilderCondition<IFlowState<DataT>>? buildWhen,
  }) {
    return FlowBlocBuilder<BlocT, DataT>(
      key: key,
      bloc: bloc,
      builder: InternalFlowBuilder.when(
        idle: idle,
        loading: loading,
        loadMore: loadMore,
        empty: empty,
        data: data,
        error: error,
        orElse: orElse,
      ),
      buildWhen: buildWhen,
    );
  }
}
