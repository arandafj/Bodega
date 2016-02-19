//
//  AGFWineryModel.h
//  Bodega
//
//  Created by CLAG on 16/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGFWineModel.h"

@interface AGFWineryModel : NSObject

@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;


-(AGFWineModel *) redWineAtIndex: (int) index;
-(AGFWineModel *) whiteWineAtIndex: (int) index;
-(AGFWineModel *) otherWineAtIndex: (int) index;

@end
