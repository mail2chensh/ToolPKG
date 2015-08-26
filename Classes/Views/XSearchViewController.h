//
//  XSearchViewController.h
//  startWild
//
//  Created by dev on 15/8/7.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XTableViewController.h"

@interface XSearchViewController : XTableViewController

@property (nonatomic, strong) NSMutableArray *filterArray; // 用于装载过滤结果

@property (nonatomic, strong) UISearchDisplayController *displayController; // iOS7 搜索结果控制

@property (nonatomic, strong) UISearchBar *searchBar; // iOS7 搜索栏


#pragma mark - 子类重写方法

// 用于返回cell，iOS7 和iOS8 共用
// filter: 表示是否过滤
- (UITableViewCell *)tableView:(UITableView *)tableView cellFoRowAtIndexPath:(NSIndexPath *)indexPath needFilter:(BOOL)filter;

// cell 被点击
// filter: 表示是否过滤
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath filter:(BOOL)filter;

// 设置谓词条件
// 每次数据不一样，所以谓词条件不一样，此方法提供给子类重写
- (NSPredicate *)setPredicateCondition;


#pragma mark - public Method

// 返回搜索栏的文字
- (NSString *)searchBarTextContent;

// 重置过滤数组的结果
- (void)resetFilterArray;

// 返回当前所使用的数据源
- (NSMutableArray *)currentArray;


@end
