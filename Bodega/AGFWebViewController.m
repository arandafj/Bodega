//
//  AGFWebViewController.m
//  Bodega
//
//  Created by CLAG on 12/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWebViewController.h"

@interface AGFWebViewController ()

@end

@implementation AGFWebViewController

-(id) initWithModel:(AGFWineModel *) aModel{
    
    if (self =[super initWithNibName:nil bundle:nil]){
        _model = aModel;
        
        self.title = @"Web"; // titulo para combinador de MVC
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self syncViewToModel];
}


#pragma mark -  Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityWebWine setHidden:NO];
    [self.activityWebWine startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityWebWine stopAnimating];
    [self.activityWebWine setHidden:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.activityWebWine stopAnimating];
    [self.activityWebWine setHidden:YES];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                             message:[error localizedDescription]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Aceptar"
                                                 style:UIAlertActionStyleDefault
                                               handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


#pragma mark - Utils

- (void)syncViewToModel
{
    // self.title = self.model.wineCompanyName;
    self.webWine.delegate = self;
    [self.webWine loadRequest:[NSURLRequest requestWithURL:self.model.wineCompanyWeb]];
    
  
}



@end
