import 'package:core_bloc/bloc.dart';
import 'package:core_flutter_bloc/src/Internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocListener<BlocT extends BlocBase<IFlowState<DataT>>, DataT>
    extends BlocListener<BlocT, IFlowState<DataT>> {
  FlowBlocListener({
    required BlocWidgetListener<IFlowState<DataT>> listener,
    super.key,
    super.bloc,
    BlocListenerCondition<IFlowState<DataT>>? listenWhen,
    super.child,
  }) : super(
          listener: listener,
          listenWhen: listenWhen,
        );

  factory FlowBlocListener.when({
    Key? key,
    BlocT? bloc,
    BlocWidgetListener<IdleState<DataT>>? onIdle,
    BlocWidgetListener<LoadingState<DataT>>? onLoading,
    BlocWidgetListener<LoadMoreState<DataT>>? onLoadMore,
    BlocWidgetListener<EmptyState<DataT>>? onEmpty,
    BlocWidgetListener<DataState<DataT>>? onData,
    BlocWidgetListener<ErrorState<DataT>>? onError,
    BlocWidgetListener<IFlowState<DataT>>? onOrElse,
    BlocListenerCondition<IFlowState<DataT>>? listenWhen,
  }) {
    return FlowBlocListener<BlocT, DataT>(
      key: key,
      bloc: bloc,
      listener: InternalFlowListener.when(
        onIdle: onIdle,
        onLoading: onLoading,
        onLoadMore: onLoadMore,
        onEmpty: onEmpty,
        onData: onData,
        onError: onError,
      ),
      listenWhen: listenWhen,
    );
  }
}
