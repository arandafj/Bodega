//
//  AGFWineViewController.m
//  Bodega
//
//  Created by CLAG on 11/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWineViewController.h"
#import "AGFWebViewController.h"


@implementation AGFWineViewController

- (id) initWithModel: (AGFWineModel *) aModel{
  
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = aModel;
        
        self.title = _model.name; // título para combinador de MVC
    }
    
    return self;
}


#pragma mark - View lifecycle

// sincroniza el modelo y la vista
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self syncViewToModel];
    
    // Cambiamos el color de la barra navigation controller
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
}


#pragma mark -  Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)displayWeb:(id)sender{
    
    // Crear un webVC
    AGFWebViewController *webVC = [[AGFWebViewController alloc] initWithModel:self.model];
    
    // Hacemos un push
    [self.navigationController pushViewController:webVC
                                         animated:YES];
    
}


#pragma mark - Utils
-(void) syncViewToModel{
    
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.nameLabel.text = self.model.name;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    
    [self displayRating: self.model.rating];
    
    [self.notesLabel setNumberOfLines:0];
    
}

-(void) clearRatings{
    
    for (UIImageView *imgView in self.ratingViews) {
        imgView.image = nil;
    }
}

-(void) displayRating: (int) aRating{
    
    [self clearRatings];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i < aRating; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
    
}


-(NSString *) arrayToString: (NSArray *) anArray{
    
    NSString *repr = nil;
    
    if ([anArray count] == 1) {
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }else{
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    
    return repr;
}


#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc{
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - WineryTableViewControllerDelegate

-(void) wineryTableViewController: (AGFWineryTableViewController *) wineryVC
                   didSelecteWine: (AGFWineModel *) aWine{
    
    self.model = aWine;
    
    self.title = aWine.name;
    
    [self syncViewToModel];
}


@end
