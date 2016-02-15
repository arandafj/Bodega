//
//  AGFWineModel.m
//  Bodega
//
//  Created by CLAG on 10/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFWineModel.h"

@implementation AGFWineModel

#pragma mark - Class methods

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    
    return [[self alloc] initWithName: (NSString *) aName
                      wineCompanyName: (NSString *) aWineCompanyName
                                 type: (NSString *) aType
                               origin: (NSString *) anOrigin
                               grapes: (NSArray *) arrayOfGrapes
                       wineCompanyWeb: (NSURL *) aURL
                                notes: (NSString *) aNotes
                               rating: (int) aRating
                                photo: (UIImage *) aPhoto ];
}

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
    return[[self alloc]initWithName: (NSString *) aName
                    wineCompanyName: (NSString *) aWineCompanyName
                               type: (NSString *) aType
                             origin: (NSString *) anOrigin];
}


#pragma mark - Init

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto{
    
    if (self = [super init]){
        // Asignamos los parametros a la variable de instancia
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
    }
    
    return  self;
}

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) anOrigin{
    
      return [self initWithName: aName
         wineCompanyName: aWineCompanyName
                    type: aType
                  origin: anOrigin
                  grapes: nil
          wineCompanyWeb: nil
                   notes: nil
                  rating: NO_RATING
                   photo: nil];
    
}

@end
