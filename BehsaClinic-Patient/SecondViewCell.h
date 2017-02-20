////
//  Created by Arash on 15/12/5.
//  Copyright © 2015Arash Z. Jahangiri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SeconViewDataEntity;
@class SecondViewCell;

@protocol CustomCellDelegate <NSObject>
- (void)customCell:(SecondViewCell *)cell switchExpandedStateWithIndexPath:(NSIndexPath *)index;
@end

@interface SecondViewCell : UITableViewCell
@property (weak, nonatomic) id <CustomCellDelegate> delegate;

- (void)setEntity:(SeconViewDataEntity *)entity indexPath:(NSIndexPath *)indexPath;
@end
