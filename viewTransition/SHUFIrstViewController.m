//
//  SHUFIrstViewController.m
//  viewTransition
//
//  Created by 酒井 秀平 on 2013/05/19.
//  Copyright (c) 2013年 shuketa. All rights reserved.
//

#import "SHUFIrstViewController.h"
#import "SHUSecondViewController.h"

@interface SHUFIrstViewController ()

@end

@implementation SHUFIrstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"タイトル%d",indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [UIView beginAnimations:nil context:NULL];
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:3.5]; // 0.5秒かけて
        [UIView setAnimationCurve:UIViewAnimationCurveLinear]; // 一定速度で
        self.tableView.frame = CGRectMake(-320 , 0, 320, self.view.frame.size.height);
        [UIView commitAnimations]; // アニメーションコミット
        

        // 遷移先UIViewを画面外に生成（SecondView: UIVIewを継承）
        UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(320 + 1, 0, 320, self.view.frame.size.height)];
        secondView.backgroundColor = [UIColor redColor];
        
        // アニメーション開始
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:3.5]; // 0.5秒かけて
        [UIView setAnimationCurve:UIViewAnimationCurveLinear]; // 一定速度で
        [self.view addSubview:secondView]; // addSubviewする
        
        secondView.frame = CGRectMake(0, 0, 320, self.view.frame.size.height); // 画面内へ動かす
        
        
        [UIView commitAnimations]; // アニメーションコミット

        

    }
    [UIView commitAnimations];
    
    
    /*
    // 次画面定義
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width + 1, 0, self.view.frame.size.width, self.view.frame.size.height)];
    secondView.backgroundColor = [UIColor redColor];
    secondView.backgroundColor = [UIColor redColor];
    
    // Animation定義開始
    [UIView  beginAnimations:nil context:NULL];
    // Animationの速度設定：徐々に加速
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // Animation実行時間：0.75秒
    [UIView setAnimationDuration:0.75];
    // 次画面遷移
//    [self.navigationController pushViewController:nextViewController animated:NO];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:NO];
    // Animation開始
    [UIView commitAnimations];
     */
    
}

@end
