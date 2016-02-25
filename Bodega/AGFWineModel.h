//
//  AGFWineModel.h
//  Bodega
//
//  Created by CLAG on 10/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

#define NO_RATING -1

@interface AGFWineModel : NSObject

@property (copy, nonatomic) NSString *type;
@property (strong, nonatomic, readonly) UIImage *photo;
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (copy, nonatomic) NSString *notes;
@property (copy, nonatomic) NSString *origin;
@property (nonatomic) int rating; // 0 - 5
@property (strong, nonatomic) NSArray *grapes;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *wineCompanyName;

// Metodos de clase
+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photoURL:(NSURL *)aPhotoURL;

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;


// Designado
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photoURL:(NSURL *)aPhotoURL;

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin;

// Inicializador a partir de diccionario JSON
-(id) initWithDictionary:(NSDictionary *)aDict;


@end
