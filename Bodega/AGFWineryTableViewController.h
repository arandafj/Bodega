//
//  AGFWineryTableViewController.h
//  Bodega
//
//  Created by CLAG on 17/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGFWineryModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

#define NEW_WINE_NOTIFICATION @"new_Wine"
#define KEY_WINE @"wine"

@class AGFWineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController: (AGFWineryTableViewController *) wineryVC
                 didSelecteWine: (AGFWineModel *) aWine;

@end



@interface AGFWineryTableViewController : UITableViewController

@property (nonatomic, strong) AGFWineryModel *model;
@property (nonatomic, weak)  id <WineryTableViewControllerDelegate> delegate;

-(id) initWithModel:(AGFWineryModel *) aModel
             style:(UITableViewStyle) aStyle;


@end
