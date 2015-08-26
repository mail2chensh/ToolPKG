//
//  XSearchViewController.m
//  startWild
//
//  Created by dev on 15/8/7.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XSearchViewController.h"
#import "XToolsMacro.h"
#import "UIViewExt.h"

@interface XSearchViewController ()  <UITableViewDataSource, UITableViewDelegate>


@end

static NSString *cellId = @"searchCell";

@implementation XSearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];

    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, HEIGHT_OF_X_NAVIGATION_VIEW, self.view.width, HEIGHT_OF_SEARCH_BAR)];
    
    _displayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _displayController.searchResultsDataSource = self;
    _displayController.searchResultsDelegate = self;
    
    [self.view addSubview:_searchBar];
    self.tableView.frame = CGRectMake(0, HEIGHT_OF_X_NAVIGATION_VIEW + HEIGHT_OF_SEARCH_BAR, ScreenWidth, ScreenHeight - HEIGHT_OF_SEARCH_BAR - HEIGHT_OF_X_NAVIGATION_VIEW);
    
//    self.tableView.tableHeaderView = _searchBar;
//    self.tableView.frame = CGRectMake(0, HEIGHT_OF_X_NAVIGATION_VIEW, self.view.width, self.view.height - HEIGHT_OF_X_NAVIGATION_VIEW);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 子类重写方法

// 用于返回cell，iOS7 和iOS8 共用
// filter: 表示是否过滤
- (UITableViewCell *)tableView:(UITableView *)tableView cellFoRowAtIndexPath:(NSIndexPath *)indexPath needFilter:(BOOL)filter
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSMutableArray *tempArray = filter ? self.filterArray : self.dataArray;
    cell.textLabel.text = tempArray[indexPath.row];
    return cell;
}

// cell 被点击
// filter: 表示是否过滤
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath filter:(BOOL)filter
{
    
}


// 设置谓词条件
// 每次数据不一样，所以谓词条件不一样，此方法提供给子类重写
- (NSPredicate *)setPredicateCondition
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@", [self searchBarTextContent]];
    return predicate;
}

#pragma mark - public Method
// 返回搜索栏的文字
- (NSString *)searchBarTextContent
{
//    if (self.searchController.active) {
//        return self.searchController.searchBar.text;
//    } else {
        return self.displayController.searchBar.text;
//    }
}

// 重置过滤数组的结果
- (void)resetFilterArray
{
    NSPredicate *predicate = [self setPredicateCondition];
    if (self.filterArray != nil) {
        [self.filterArray removeAllObjects];
    }
    self.filterArray = [[NSMutableArray alloc] initWithArray:[self.dataArray filteredArrayUsingPredicate:predicate]];
}

// 返回当前所使用的数据源
- (NSMutableArray *)currentArray
{
    if (_displayController.isActive) {
        return self.filterArray;
    } else {
        return self.dataArray;
    }
}


#pragma mark - search delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellFoRowAtIndexPath:indexPath needFilter:![tableView isEqual:self.tableView]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.tableView]) {
        return self.dataArray.count;
    } else {
        [self resetFilterArray];
        return self.filterArray.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didSelectRowAtIndexPath:indexPath filter:![tableView isEqual:self.tableView]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

@end
