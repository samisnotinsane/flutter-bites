import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'search_bar.dart';
import 'styles.dart';

// The search tab is a stateful widget because, as the user performs searches, the list of results changes.
class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

// Here, we keep state specific to searching. 
// In this implementation we store what the search terms are, 
// and we hook into the AppStateModel to fulfill the search capability. 
// In the case where we implement an API back end, here is a good place to do network access for Search.
class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ProductRowItem(
                  index: index,
                  product: results[index],
                  lastItem: index == results.length - 1,
                ),
                itemCount: results.length,
              ),
            ),
          ],
        ),
      ),
    );

    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Search'),
        )
      ],
    );
  }
}
