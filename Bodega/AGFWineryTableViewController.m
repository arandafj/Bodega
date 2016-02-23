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

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setDefaults];
    
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
    
    // Escogemos el vino seleccionado
    AGFWineModel *wine = [self wineForIndexPath:indexPath];
    
    // Avisar al delegado
    [self.delegate wineryTableViewController:self didSelecteWine:wine];
    
    // Enviar notificación
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION
                                                      object:self
                                                    userInfo:@{KEY_WINE:wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    // Guardar el último vino seleccionado
    [self savelastSelectedWineAtSection:indexPath.section row:indexPath.row];
    
}

#pragma mark - NSUserDefalults

- (NSDictionary *)setDefaults{
    
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    
    // Por defecto, mostraremos el primero de los tintos
    NSDictionary *defaulWineCoords = @{SELECTION_KEY:@(RED_WINE_SECTION), ROW_KEY:@0};
    
    // lo asignamos
    [defaults setObject:defaulWineCoords
                 forKey:LAST_WINE_KEY];
    
    //guardamos
    [defaults synchronize];
    
    return defaulWineCoords;
    
}

-(void)savelastSelectedWineAtSection:(NSUInteger)section row:(NSUInteger)row{
    
    NSUserDefaults *defautls = [NSUserDefaults standardUserDefaults];
    [defautls setObject:@{SELECTION_KEY:@(section), ROW_KEY:@(row)}
                 forKey:LAST_WINE_KEY];
    
    [defautls synchronize]; // Por si acaso, guardamos
}

-(AGFWineModel *)lastSelectdWine{
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    
    if (coords == nil) {
        // No hay nada bajo la clave LAST_WINE_KEY.
        // Esto quiere decir que es la primera vez que se llama a la App.
        // Ponemos un valor por defecto: el primero de los tintos.
        coords = [self setDefaults];
    } else {
        // ya hay algo, es decir, en algún momento se guardó.
        // No hay nada en especial que haceer.
    }
    
    // Transformamos esas coordenadas en un indexpath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey:SELECTION_KEY] integerValue]];
    
    // devolvemos el vino en cuestion
    return [self wineForIndexPath:indexPath];
    
}

#pragma mark - Utils

-(AGFWineModel *)wineForIndexPath:(NSIndexPath *) indexPath{

    // Averiguamos de que vino se trata
    AGFWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else if (indexPath.section == OTHER_WINE_SECTION){
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}

@end
