//
//  AGFWineViewController.m
//  Bodega
//
//  Created by CLAG on 11/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWineViewController.h"
#import "AGFWebViewController.h"

#define kCustomFontHeader           [UIFont fontWithName:@"Valentina-Regular" size:17]
#define kCustomFontSubheader        [UIFont fontWithName:@"Valentina-Regular" size:15]
#define kCustomFontRegular          [UIFont fontWithName:@"Valentina-Regular" size:12]

@implementation AGFWineViewController

- (id) initWithModel: (AGFWineModel *) aModel{
    
    // Cargar un xib u otro según el dispositivo
    // la macro IS_IPHONE la hemos definido en el fichero de precompilado *.pch para tenerla disponible en todo el proyecto
    NSString *nibName = nil;
    if (IS_IPHONE) { 
        nibName = @"AGFWineViewControlleriPhone";
    }
    
    if (self = [super initWithNibName:nibName bundle:nil]) {
        _model = aModel;
        self.title = _model.name;
    }
    return self;

}

- (void)viewDidLoad
{
    // como la fuente es custom, tenemos que decirselo por código
    self.nameLabel.font = kCustomFontHeader;
    self.wineryNameLabel.font = kCustomFontSubheader;
    self.typeLabel.font = kCustomFontSubheader;
    self.originLabel.font = kCustomFontSubheader;
    self.grapesLabel.font = kCustomFontSubheader;
    self.notesLabel.font = kCustomFontRegular;
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


    // si estamos en landscape, añadimos la vista que tenemos para landscape
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
        [self addPortraitViewWithProperFrame];
    }

}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (UIInterfaceOrientationIsLandscape(fromInterfaceOrientation)) {
        // estamos en portrait
        [self.portraitView removeFromSuperview];
    }
    else {
        // estamos en landscape
        [self addPortraitViewWithProperFrame];
    }
}

- (void)addPortraitViewWithProperFrame
{
    // asignamos el frame a la vista en portrait para que se redimensione
    // si la añadimos directamente como view, al no estar dentro de un VC, no se va a redimensionar
    CGRect iPhoneScreen = [[UIScreen mainScreen] bounds];
    CGRect portraitRect = CGRectMake(0, 0, iPhoneScreen.size.height, iPhoneScreen.size.width);
    self.portraitView.frame = portraitRect;
    [self.view addSubview:self.portraitView];
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
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    self.notesLabel.text = self.model.notes;
    
    // portrait
    self.nameLabelPortrait.text = self.model.name;
    self.typeLabelPortrait.text = self.model.type;
    self.originLabelPortrait.text = self.model.origin;
    self.wineryNameLabelPortrait.text = self.model.wineCompanyName;
    self.notesLabelPortrait.text = self.model.notes;
    self.photoViewPortrait.image = self.model.photo;
    self.grapesLabelPortrait.text = [self arrayToString:self.model.grapes];
    
    [self displayRating:self.model.rating];

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
        [[self.ratingViewsPortrait objectAtIndex:i] setImage:glass];
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
