//
//  AGFWineryTableViewController.m
//  Bodega
//
//  Created by CLAG on 17/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWineryTableViewController.h"
#import "AGFWineViewController.h"

@interface AGFWineryTableViewController ()

@end

@implementation AGFWineryTableViewController


-(id) initWithModel:(AGFWineryModel *) aModel
             style:(UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _model = aModel;
        self.title = @"Bodega";
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated   {
    [super viewWillAppear:animated];
    
    // Cambiamos el color de la barra navigation controller
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    if (section == RED_WINE_SECTION) {
        return @"Red wines";
    }else if (section == WHITE_WINE_SECTION){
        return @"White wines";
    }else{
        return @"Other wines";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    if (section == RED_WINE_SECTION){
        return self.model.redWineCount;}
    else if (section == WHITE_WINE_SECTION){
        return self.model.whiteWineCount;
    } else{
        return self.model.otherWineCount;
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Tenemos que crearla a mano
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Averiguar de que modelo (vino) nos están hablando
    AGFWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else  if (indexPath.section == OTHER_WINE_SECTION){
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // Sincronizar celda (vista) y modelo (vino)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Suponemos que estamos en un navigation controller
    
    // Averiguamos de que vino se trata
    AGFWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else if (indexPath.section == OTHER_WINE_SECTION){
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    [self.delegate wineryTableViewController:self didSelecteWine:wine];
    
}


@end
