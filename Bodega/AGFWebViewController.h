//
//  AGFWebViewController.h
//  Bodega
//
//  Created by CLAG on 12/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGFWineModel.h"

@interface AGFWebViewController : UIViewController <UIWebViewDelegate>

// Propiedades
@property (strong, nonatomic) AGFWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *webWine;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityWebWine;


-(id) initWithModel:(AGFWineModel *) aModel;

@end
