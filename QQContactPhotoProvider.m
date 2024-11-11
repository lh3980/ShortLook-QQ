#import "AwemeContactPhotoProvider.h"

@implementation AwemeContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NSString *userInfo = notification.applicationUserInfo[@"r"];
    if (!userInfo) return nil;
    NSArray *infos = [userInfo componentsSeparatedByString:@"|"];
    NSString *profileURLStr;
    if (infos.count < 2) return nil;
    if ([infos.firstObject isEqualToString:@"c"] && [infos[1] length] > 0) {
        profileURLStr = [NSString stringWithFormat:@"https://p26.douyinpic.com/aweme/100x100/aweme-avatar/tos-cn-avt-0015_%@.jpeg?", infos[1]];
    } else if ([infos.firstObject isEqualToString:@"g"]) {
        return nil;
    }
    if (!profileURLStr) return nil;
    NSURL *profileURL = [NSURL URLWithString:profileURLStr];
    if (!profileURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}

@end
