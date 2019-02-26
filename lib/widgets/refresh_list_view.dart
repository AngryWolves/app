import 'package:flutter/material.dart';

///
/// [D] type of list data
///
abstract class RefreshListView<T extends StatefulWidget, D> extends State<T> {
  List<D> _data;

  int _curPage = 1;

  bool _isLoading = false;

  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    if (_data == null) {
      print('list is didChangeDependencies');
      // autoRefresh when first enter
      Future.delayed(Duration(seconds: 0), () {
        _refreshKey.currentState.show();
        return true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('list is end');
        _handleRefresh(page: _curPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _handleRefresh,
      child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: _getListCount(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (_dataIsEmpty()) {
              return buildEmptyView();
            }
            return buildItem(_data[index]);
          }),
    );
  }

  @protected
  Widget buildItem(D data);

  @protected
  Future<List<D>> requestData(int page);

  Widget buildEmptyView() => Container();

  int _getListCount() {
    if (_dataIsEmpty()) {
      return 1;
    }
    return _data.length;
  }

  bool _dataIsEmpty() => _data == null || _data.isEmpty;

  Future<Null> _handleRefresh({int page = 1}) async {
    if (_isLoading) {
      return null;
    }
    _isLoading = true;

    var data = await requestData(page);
    if (data != null && data.isNotEmpty && mounted) {
      setState(() {
        if (page == 1) {
          _data = data;
        } else {
          _data.addAll(data);
        }
      });
    }
    _isLoading = false;
    return null;
  }
}