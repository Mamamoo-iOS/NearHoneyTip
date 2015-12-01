//
//  NHTMainTableViewController.m
//  NearHoneyTip
//
//  Created by Kate KyuWon on 11/18/15.
//  Copyright © 2015 Mamamoo. All rights reserved.
//

#import "NHTMainTableViewController.h"
#import "NHTDetailViewController.h"
#import "NHTTipManager.h"
#import "NHTMainTableCell.h"

@interface NHTMainTableViewController ()

@end

@implementation NHTMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Q1 = [[NHTTipManager alloc]init];
    [self.Q1 tipsDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"the number of cell : %ld", (long)[self.Q1 countOfTipCollection] );
    return [self.Q1 countOfTipCollection];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    NHTMainTableCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath:indexPath];
    NSLog(@"FOR CELL%@",[self.Q1 objectAtIndex:indexPath.row]);
    //if([[[self.Q1 objectAtIndex:indexPath.row] class] isKindOfClass: [NSDictionary class]]){
        NSDictionary *tip = [self.Q1 objectAtIndex:indexPath.row];
   
    [cell setCellWithTip:tip];
    //};
    UITapGestureRecognizer *tapCellForTipDetail = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(didTapCell:)];
    
    cell.gestureRecognizers = [[NSArray alloc] initWithObjects:tapCellForTipDetail, nil];
   
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"#####3-1%@", sender);
    if([segue.identifier isEqual:@"showTipDetail"]){
        
        NSLog(@"#####3-2%@", sender);
        NSLog(@"####sender target? %@",[sender view]);
       NHTMainTableCell *tipCell = [sender view];
        
        /*
        if([self.playlistImageViews containsObject:playlistImageView]){
            NSUInteger index = [self.playlistImageViews indexOfObject:playlistImageView];
            
        playlistDetailController.playlist = [[Playlist alloc] initWithIndex:index];
        }
         */
        
        if(tipCell){
        NHTDetailViewController *tipDetailController = (NHTDetailViewController *)segue.destinationViewController;
            if(tipCell.tip){
                
                NSLog(@"this is tip %@", tipCell.tip);
        tipDetailController.selectedTip = tipCell.tip;
            }
        }
    }
}

- (void) didTapCell:(UITapGestureRecognizer *) recognizer{
    NSLog(@"#####1%@", recognizer);
    [self showTipDetail:recognizer];
}
- (IBAction)showTipDetail:(id)sender {
    NSLog(@"#####2%@", sender);
    [self performSegueWithIdentifier:@"showTipDetail" sender:sender];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
