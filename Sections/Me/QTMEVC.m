//
//  QTMEVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTMEVC.h"
#import <PhotosUI/PhotosUI.h>

@interface QTMEVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@end

@implementation QTMEVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCustomViews];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark- SetUpView
- (void)setUpCustomViews{
    QTNeverAutoAjustScrollViewContentInset(self,self.scrollView);
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    self.headImgView.clipsToBounds = YES;
    self.headImgView.layer.borderColor = UIColor.lightTextColor.CGColor;
    self.headImgView.layer.borderWidth = 2;
    self.headImgView.layer.cornerRadius = 40.0f;
}

#pragma mark- EventRespone
// 文章列表
- (IBAction)articles:(UIControl *)sender {
    
}
// 更改头像
- (IBAction)changeHeader:(id)sender{
    UIAlertController* alterVC = [UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* phtos = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhos];
    }];
    [alterVC addAction:phtos];
    UIAlertAction* librs = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
           imagePickerController.delegate = self;
           imagePickerController.allowsEditing = NO;
           imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
           if (@available(iOS 11, *)) {
               UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
           }
           [self presentViewController:imagePickerController animated:YES completion:nil];
    }];
    [alterVC addAction:librs];
   
    UIAlertAction* cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alterVC addAction:cancle];
    
    [self presentViewController:alterVC animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    UIImage* img = [info  objectForKey:UIImagePickerControllerOriginalImage];
    UIImage* res = [img imageByResizeToSize:CGSizeMake(200,200) contentMode:UIViewContentModeScaleAspectFill];
    self.headImgView.image = res;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)takePhos{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
       if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请在设备的\"设置-隐私-相机\"中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"前往设置", nil];
           alertView.delegate = self;
           [alertView show];
       }else {
           if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear|UIImagePickerControllerCameraDeviceFront]) {
               UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
               imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
               imagePickerController.delegate = self;
               [self presentViewController:imagePickerController animated:YES completion:nil];
               
           } else {
               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"摄像头不可用" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
               [alertView show];
               return ;
           }
       }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //        NSURL *url = [NSURL URLWithString:@"prefs:root=Photos"];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
}
//imageByResizeToSize
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

DellocCheck

@end
