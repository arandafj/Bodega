//
//  AGFWineryModel.m
//  Bodega
//
//  Created by CLAG on 16/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWineryModel.h"

@interface AGFWineryModel()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation AGFWineryModel

#pragma mark  - Properties

-(int) redWineCount{
    
    return [self.redWines count];
}

-(int) whiteWineCount{
    
    return [self.whiteWines count];
}

-(int) otherWineCount{
    
    return [self.otherWines count];
}

-(id) init {
    
    if (self = [super init]) {
        AGFWineModel *tintorro = [AGFWineModel wineWithName:@"Bembibre"
                                            wineCompanyName:@"Dominio de Tares"
                                                       type:@"Tinto"
                                                     origin:@"El Bierzo"
                                                     grapes:@[@"Mencía"]
                                             wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com"]
                                                      notes:@"Vendiamiado a mano racimo a racimo, fermentado con su propia levadura natural y criado durante 16 meses en barricas de roble francés y americano con 24 meses extra en botella. Vino de intenso color granate, nariz de frutos rojos y negros confitados, recuerdos de ciruela pasa y frutos secos tostados. Boca densa, pulida y cálida. Para compartir platos de sabor potente, como cocidos hechos a fuego lento, carnes de caza o cordero al horno. Se recomienda abrirlo y decantarlo 30 minutos antes de servir y disfrutarlo a una temperatura de unos 16°C. Nunca muy fresco ni demasiado caliente."
                                                     rating:5
                                                      photo:[UIImage imageNamed:@"bembibre.jpg"]];
        
        AGFWineModel *albarinno = [AGFWineModel wineWithName:@"Zárate"
                                             wineCompanyName:@"Zárate"
                                                        type:@"white"
                                                      origin:@"Rias Bajas"
                                                      grapes:@[@"Albariño"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                       notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                      rating:4
                                                       photo:[UIImage imageNamed:@"zarate.gif"]];
        
        AGFWineModel *champagne = [AGFWineModel wineWithName:@"Comtes de Champagne"
                                             wineCompanyName:@"Champagne Taittinger"
                                                        type:@"other"
                                                      origin:@"Champagne"
                                                      grapes:@[@"Chardonnay"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                       notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                      rating:5
                                                       photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
    }
 
    return self;
    
}


-(AGFWineModel *) redWineAtIndex: (int) index{
    
    return [self.redWines objectAtIndex:index];

}

-(AGFWineModel *) whiteWineAtIndex: (int) index{
    
    return [self.whiteWines objectAtIndex:index];
}

-(AGFWineModel *) otherWineAtIndex: (int) index{
    
    return [self.otherWines objectAtIndex:index];
}

@end
