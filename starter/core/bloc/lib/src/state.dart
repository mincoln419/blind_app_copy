import 'package:equatable/equatable.dart';

abstract class IFlowState<DataT> extends Equatable {
  const IFlowState({DataT? data}) : _data = data;

  final DataT? _data;

  DataT? get data => _data;

  bool get hasData => data != null;

  @override
  List<Object?> get props => [data];
}

final class IdleState<DataT> extends IFlowState<DataT> {
  const IdleState({super.data});
}

final class LoadingState<DataT> extends IFlowState<DataT> {
  const LoadingState({super.data});
}

final class LoadMoreState<DataT> extends IFlowState<DataT> {
  const LoadMoreState({super.data});
}

final class EmptyState<DataT> extends IFlowState<DataT> {
  const EmptyState({super.data});
}

final class DataState<DataT> extends IFlowState<DataT> {
  const DataState({super.data, this.updatedAt});

  @override
  DataT? get data => super.data!;

  final DateTime? updatedAt;

  @override
  List<Object?> get props =>
      [data, if (updatedAt != null) updatedAt!.millisecondsSinceEpoch];
}

final class ErrorState<DataT> extends IFlowState<DataT> {
  const ErrorState({
    super.data,
    this.error,
    this.stackTrace,
  });

  final dynamic error;
  final StackTrace? stackTrace;

  @override
  bool get hasError => error != [...super.props, error, stackTrace];
}
