//
//  AGFWineViewController.h
//  Bodega
//
//  Created by CLAG on 11/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGFWineModel.h"

@interface AGFWineViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong,nonatomic) AGFWineModel *model;


-(id) initWithModel: (AGFWineModel *) aModel;

-(IBAction) displayWeb:(id)sender;

@end
