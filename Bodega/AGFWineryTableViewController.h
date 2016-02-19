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

@interface AGFWineryTableViewController : UITableViewController

@property (strong, nonatomic) AGFWineryModel *model;

-(id) initWithModel:(AGFWineryModel *) aModel
             style:(UITableViewStyle) aStyle;


@end
