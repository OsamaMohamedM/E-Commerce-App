import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/search_cubit.dart';
import '../../cubits/cubit/search_state.dart';
class RecentSearches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchCubit = context.read<SearchCubit>();

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (searchCubit.recentSearches.isEmpty) {
          return Center(child: Text("لا توجد عمليات بحث سابقة"));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("عمليات البحث الأخيرة", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: searchCubit.recentSearches.length,
              itemBuilder: (context, index) {
                String query = searchCubit.recentSearches[index];
                return ListTile(
                  title: Text(query),
                  trailing: IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () => searchCubit.removeRecentSearch(query),
                  ),
                  onTap: () => searchCubit.search(query),
                );
              },
            ),
            TextButton(
              onPressed: () => searchCubit.clearRecentSearches(),
              child: Text("حذف الكل", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
