#import "AwemeContactPhotoProvider.h"

@implementation AwemeContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
	NSString *attachmentString = [notification.applicationUserInfo valueForKeyPath:@"attachment"];
    if (!attachmentString) return nil;
    NSURL *attachmentURL = [NSURL URLWithString:attachmentString];
    if (!attachmentURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:attachmentString fromURL:attachmentURL];
}

@end
