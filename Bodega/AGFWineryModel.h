//
//  AGFWineryModel.h
//  Bodega
//
//  Created by CLAG on 16/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGFWineModel.h"

#define RED_WINE_KEY    @"Tinto"
#define WHITE_WINE_KEY  @"Blanco"
#define OTHER_WINE_KEY  @"Rosado"

@interface AGFWineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (readonly, nonatomic) NSUInteger otherWineCount;


-(AGFWineModel *) redWineAtIndex: (NSUInteger) index;
-(AGFWineModel *) whiteWineAtIndex: (NSUInteger) index;
-(AGFWineModel *) otherWineAtIndex: (NSUInteger) index;

@end
