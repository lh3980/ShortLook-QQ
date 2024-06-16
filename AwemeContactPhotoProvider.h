#import "ShortLook-API.h"

@interface AwemeContactPhotoProvider : NSObject <DDNotificationContactPhotoProviding>

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification;
@end
