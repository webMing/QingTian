//
//  QTRegisterVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTRegisterVC.h"

#import "QTTextFieldDelegate.h"
#import "QTConfigurationHelper.h"
#import "NSString+Helper.h"
#import "QTNetWork.h"

static NSInteger const kCountdown = 60;

@interface QTRegisterVC ()

@property (weak, nonatomic) IBOutlet UITextField *imageCodeTF;

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *paswdTF;
@property (weak, nonatomic) IBOutlet UITextField *identifyTF;

@property (strong, nonatomic) QTTextFieldDelegate*  imageCodeDelegate;
@property (strong, nonatomic) QTTextFieldDelegate*  phoneDelegate;
@property (strong, nonatomic) QTTextFieldDelegate*  passwdDelegate;
@property (strong, nonatomic) QTTextFieldDelegate*  identifyDelegate;

@property (weak, nonatomic) IBOutlet UIButton *codeImgBtn;
@property (weak, nonatomic) IBOutlet UILabel *countDownLB;
@property (weak, nonatomic) IBOutlet UIButton *confirmBTN;

@property (weak, nonatomic) IBOutlet UIImageView *servierItemsIV;

@property (assign, nonatomic) NSInteger  countDownNum;

@property (assign, nonatomic) BOOL isAcceptServiceTerms;

@end

@implementation QTRegisterVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

#pragma mark- SetUpView
- (void)setUpViews {
    
    [self addLeftBtnItem];
    self.countDownLB.superview.hidden = YES;
    self.countDownNum = kCountdown;

    if (_useType == UseAsPasswordRetake) {
        self.title = @"重置密码";
        [self.confirmBTN setTitle:@"提交" forState:UIControlStateNormal];
    }else if(_useType == UseAsRegisterCounter) {
        self.title = @"新用户注册";
        [self.confirmBTN setTitle:@"注册并登陆" forState:UIControlStateNormal];
    }
    @weakify(self)
    
    QTTextFieldDelegate* imageCodeDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {

    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    }];
    imageCodeDelegate.verityCodeLentch = 6;
    imageCodeDelegate.checkMode = CheckVerificationCodeMode;
    self.imageCodeTF.delegate = imageCodeDelegate;
    self.imageCodeDelegate = imageCodeDelegate;
    
    QTTextFieldDelegate* phoneDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {
    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    }];
    phoneDelegate.checkMode = CheckPhoneNumberCodeMode;
    self.phoneTF.delegate = phoneDelegate;
    self.phoneDelegate = phoneDelegate;

    QTTextFieldDelegate* identifyDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {

    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    }];
    identifyDelegate.verityCodeLentch = 6;
    identifyDelegate.checkMode = CheckVerificationCodeMode;
    self.identifyTF.delegate = identifyDelegate;
    self.identifyDelegate = identifyDelegate;
  
   QTTextFieldDelegate* passwdDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {
        
    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            @strongify(self)
            [self.view showHUDWithTitle:message dismissAfter:1.5];
        }
    }];
    passwdDelegate.checkMode = CheckPasswordMode;
    self.paswdTF.delegate = passwdDelegate;
    self.passwdDelegate = passwdDelegate;
    
    NSMutableDictionary* para  = @{}.mutableCopy;
    NSString* UUID = [QTConfigurationHelper getStringValueForConfigurationKey:QTAPPLANTCHUUIDKEY];
    [para ste_setNonNilObj:UUID forKey:@"uuid"];
    [para ste_setNonNilObj:@"iOS" forKey:@"user_client"];
    [QTNetWork postRequest:para url:@"/api/v1/imgCheckCode" ssBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
       NSString* code = [responseObject objectForKey:@"code"];
       NSString* msg  = [responseObject objectForKey:@"msg"];
       if (code.integerValue == 0) {
           NSString* img = [responseObject objectForKey:@"img"];
           NSString* num = [responseObject objectForKey:@"num"];
           QTLog(@"%@ %@",img,num);
       }else{
           [self.view showHUDWithTitle:msg dismissAfter:2];
       }
    } ftBlock:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self.view showHUDWithTitle:@"无法获取图片验证码" dismissAfter:2];
    }];

}

#pragma mark- EventRespone
- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

// 刷新图片验证码
- (IBAction)refreshImageCode:(UIButton *)sender {
    
}

//注册或者找回密码
- (IBAction)confirm:(id)sender {
    
    NSString *message =[self.phoneDelegate checkTF:self.phoneTF];
    if (message) {
        [self.view showHUDWithTitle:message dismissAfter:1.5];
        return;
    }
    message = [self.identifyDelegate checkTF:self.identifyTF];
    if (message) {
        [self.view showHUDWithTitle:message dismissAfter:1.5];
        return;
    }
    message = [self.passwdDelegate checkTF:self.paswdTF];
    if (message) {
        [self.view showHUDWithTitle:message dismissAfter:1.5];
        return;
    }
    if (!self.isAcceptServiceTerms) {
        [self.view showHUDWithTitle:@"选中我是小晴天哦, 嘻嘻" dismissAfter:1.5];
        return;
    }
    if (self.useType == UseAsPasswordRetake) {
        [self resetingPasswd];
    }else if (self.useType == UseAsRegisterCounter){
        [self registerCounter];
    }

}

// 注册新用户
- (void)registerCounter{
    
    [self.view showHUDWithTitle:@"注册中" dismissAfter:0];
    NSDictionary* memberDict =
                            @{
                                     @"phone_num":self.phoneTF.text,
                                     @"passwd":self.paswdTF.text,
                                     @"user_client":@"iOS",
                                 };
    [QTNetWork postRequest:memberDict url:@"/api/v1/register" ssBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSString* msg = [responseObject objectForKey:@"msg"];
        [self.view showHUDWithTitle:msg dismissAfter:1.5];
        NSString* code = [responseObject objectForKey:@"code"];
        if (code.integerValue == 0) {
            //注册成功
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //TBSUserSingleton* user = [TBSUserSingleton shareUser];
                
            });
        }
        
    } ftBlock:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.view showHUDWithTitle:@"注册失败" dismissAfter:1.5];
    }];
}

// 重置密码
- (void)resetingPasswd{
    
    //[self.tabBarController.tabBar ];
    NSDictionary* dict = @{
                           @"phone_no":self.phoneTF.text,
                           //@"valicode":self.identifyTF.text,
                           @"app_type":@"ios",
                           @"password":self.paswdTF.text,
                           };
    
    
//    [NetWorkRequsetTool postRequestWithParameter:dict successBlock:^(NSDictionary* successData ) {
//
//
//        if ([successData[@"error_code"] isEqualToString:@"0"]) {
//
//            TBSUserSingleton* user = [TBSUserSingleton shareUser];
//
//            user.hasLogion = YES;
//
//            user.name = self.phoneTextFiled.text;
//
//            [user saveUserInfoCounter: self.phoneTextFiled.text passwd:self.paswdTextFiled.text];
//
//            [self autoGoBack];
//
//        }
//        [self.view addHUDWithType:OnlyMessage lableTitle:successData[@"error_msg"] yOffSet:-100.f hideAfterDelay:1.5];
//
//    } failureBlock:^(NSString *errorNum) {
//
//        [self.view addHUDWithType:OnlyMessage lableTitle:@"网络无法访问" yOffSet:-100.f hideAfterDelay:1.5];
//
//    }];
    
    
}


- (IBAction)applyIdentifyCode:(UIButton *)sender {
    
    if (self.imageCodeTF.text.length != 6) {
        [self.view showHUDWithTitle:@"图片验证码输入有误" dismissAfter:1.5f];
        return;
    }
    if (self.phoneTF.text.length != 11) {
        [self.view showHUDWithTitle:@"手机号位数不对" dismissAfter:1.5f];
        return;
    }
    if (![NSString isMobileNumber:self.phoneTF.text]) {
        [self.view showHUDWithTitle:@"手机号码无效" dismissAfter:1.5f];
        return;
    }
    
    sender.hidden = YES;
    [sender setTitle:@"重新发送" forState:UIControlStateNormal];
    self.countDownLB.superview.hidden = NO;
    [self identifyCode];
    
    @weakify(self)
    [NSTimer scheduledTimerWithTimeInterval:1.0 block:^(NSTimer * _Nonnull timer) {
        @strongify(self)
        self.countDownNum--;
        if (self.countDownNum == 0)
        {
            [timer  invalidate];
            timer = nil;
            self.countDownNum = kCountdown;
            self.countDownLB.superview.hidden = YES;
            sender.hidden = NO;
        }
         self.countDownLB.text = [NSString stringWithFormat:@"%ld",(long)self.countDownNum];
    } repeats:YES];
    
}

//获取验证码
-(void)identifyCode{
    
    NSString* operType = @"other";
    if (self.useType == UseAsPasswordRetake) {
        // 忘记密码
        operType = @"findPass";
    }else if(self.useType == UseAsRegisterCounter){
        // 注册
        operType = @"register";
    }
    
    NSMutableDictionary* para  = @{}.mutableCopy;
    [para ste_setNonNilObj:self.phoneTF.text forKey:@"phone_num"];
    
    [QTNetWork postRequest:para url:@"/api/v1/verifyCode" ssBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSString* code = [responseObject objectForKey:@"code"];
        NSString* msg  = [responseObject objectForKey:@"msg"];
        if (code.integerValue == 0) {
            [self.view showHUDWithTitle:@"已获取验证码请注意查收" dismissAfter:2];
        }else{
            [self.view showHUDWithTitle:msg dismissAfter:2];
        }
    } ftBlock:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          [self.view showHUDWithTitle:@"获取验证码失败" dismissAfter:2];
    }];

}

// 同意服务条款
- (IBAction)chooseServiceItems:(id)sender {
    self.isAcceptServiceTerms = !self.isAcceptServiceTerms;
    self.servierItemsIV.highlighted = self.isAcceptServiceTerms;
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

DellocCheck

@end
