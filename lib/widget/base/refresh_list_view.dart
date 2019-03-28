import 'package:flutter/material.dart';

///
/// [D] type of list data
///
abstract class RefreshListView<T extends StatefulWidget, D> extends State<T> {

  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  final ScrollController _scrollController = ScrollController();

  List<D> _data;

  int _curPage = 1;

  bool _isLoading = false;

  Widget _head;

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
        _handleRefresh(page: ++_curPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _head = buildHead();
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _handleRefresh,
      child: ListView.builder(
              shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: _getListCount(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            var curIndex = index;
            if (_head != null) {
              curIndex -= 1;
              if (index == 0) {
                return _head;
              }
            }
            if (_dataIsEmpty()) {
              return buildEmptyView();
            }
            return buildItem(_data[curIndex]);
          }),
    );
  }

  @protected
  Widget buildItem(D data);

  @protected
  Future<List<D>> requestData(int page);

  @protected
  Widget buildHead() => null;

  Widget buildEmptyView() => Container();

  int _getListCount() {
    var multiCount = 0;
    if (_head != null) {
      multiCount = 1;
    }
    if (_dataIsEmpty()) {
      return 1 + multiCount;
    }
    return _data.length + multiCount;
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
          _curPage = 1;
        } else {
          _data.addAll(data);
        }
      });
    }
    _isLoading = false;
    return null;
  }
}