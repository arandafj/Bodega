//
//  AGFWineViewController.h
//  Bodega
//
//  Created by CLAG on 11/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGFWineModel.h"
#import "AGFWineryTableViewController.h"


@interface AGFWineViewController : UIViewController <UISplitViewControllerDelegate, WineryTableViewControllerDelegate>

// Propiedades
@property (strong,nonatomic) AGFWineModel *model;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UITextView *notesLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

// portrait
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelPortrait;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabelPortrait;
@property (weak, nonatomic) IBOutlet UILabel *typeLabelPortrait;
@property (weak, nonatomic) IBOutlet UILabel *originLabelPortrait;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabelPortrait;
@property (weak, nonatomic) IBOutlet UITextView *notesLabelPortrait;
@property (weak, nonatomic) IBOutlet UIImageView *photoViewPortrait;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViewsPortrait;

-(id) initWithModel: (AGFWineModel *) aModel;

-(IBAction) displayWeb:(id)sender;

@end
