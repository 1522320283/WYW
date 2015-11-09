/*!
 * BROptionsButton - a great button for your tabBar customized with amazing dynamic animations
 * Current verstion is: 1.2
 * Whats new: 
 1) iOS 8 support 
 2) change the index dunamically with animation 
 3) change animation dynamics properties on the go
 
 * More to come in.
 */

#import <UIKit/UIKit.h>
#import "BROptionItem.h"


typedef enum {
    BROptionsButtonStateOpened,  // after clicking the button, will be in open state
    BROptionsButtonStateClosed,
    BROptionsButtonStateNormal   // it is undefined state usually closed
}BROptionsButtonState;


@protocol BROptionButtonDelegate;
@interface BROptionsButton : UIButton

/*!
 * the TabBar currently installed on
 */
@property (nonatomic, weak, readonly) UITabBar *tabBar;

/*! 
 * The location where the BROptionsButton is installed
 * Should not be less than 0
 * Should be less then UITabBar.items.count
 */
@property (nonatomic, assign, readonly) NSUInteger locationIndexInTabBar;
@property (nonatomic, weak)   id<BROptionButtonDelegate> delegate;
@property (nonatomic, readonly) BROptionsButtonState currentState;

/*!
 * @Desicription
 * - Move the button to a different location.
 */
- (void)setLocationIndexInTabBar:(NSUInteger)newIndex animated:(BOOL)animated;

/*!
 * customize the animation dynamic behaviour.
 * Dont change it if you dont know what the heck is this
 */
@property (nonatomic, assign) CGFloat damping;
@property (nonatomic, assign) CGFloat frequecny;


/*!
 *!parameters: tabBar     - pass the tabBar to be attached to
 *             itemIndex - the item position that will be changed with the button
 *             delgate   - the delegate must be setted
 */
- (instancetype)initWithTabBar:(UITabBar*)tabBar
                 forItemIndex:(NSUInteger)itemIndex
                     delegate:(id<BROptionButtonDelegate>)delegate;
/*! 
 * Set the image for the open state (X in the demo)
 * and for the close state (Apple logo in the demo)
 */
- (void)setImage:(UIImage *)image forBROptionsButtonState:(BROptionsButtonState)state;
@end


//------------------------------------------- Protocol
@protocol BROptionButtonDelegate <NSObject>

//根据item的index属性，切换视图（index 倒序）
- (void)brOptionsButton:(BROptionsButton*)brOptionsButton
          didSelectItem:(BROptionItem*)item;
//设置item的个数
- (NSInteger)brOptionsButtonNumberOfItems:(BROptionsButton*)brOptionsButton;

/*! informal protocol */
@optional
/*! just like UITableViewDelegate cusomize the button before displaying 
 */
- (void)brOptionsButton:(BROptionsButton*)optionsButton
  willDisplayButtonItem:(BROptionItem*)button;
//根据index设置item的标题
- (NSString*)brOptionsButton:(BROptionsButton*)brOptionsButton
         titleForItemAtIndex:(NSInteger)index;
//根据index设置item的图片
- (UIImage*)brOptionsButton:(BROptionsButton*)brOptionsButton
        imageForItemAtIndex:(NSInteger)index;
@end

