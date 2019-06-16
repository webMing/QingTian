//
//  QTRegisterVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTRegisterVC.h"

#import "QTTextFieldDelegate.h"
#import "NSString+Helper.h"
#import "NSTimer+invoke.h"
#import "QTNetWork.h"

static NSInteger const kCountdown = 60;

@interface QTRegisterVC ()

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *paswdTF;
@property (weak, nonatomic) IBOutlet UITextField *identifyTF;

@property (weak, nonatomic) IBOutlet UILabel *countDownLB;
@property (weak, nonatomic) IBOutlet UIButton *confirmBTN;

@property (weak, nonatomic) IBOutlet UIImageView *servierItemsIV;

@property (assign, nonatomic) NSInteger  countDownNum;

@property (assign, nonatomic) BOOL isAcceptServiceTerms;

@property (strong, nonatomic) NSTimer* timer;

@end

@implementation QTRegisterVC
#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.timer invalidate];
    self.timer = nil;
}
#pragma mark- SetUpView
- (void)setUpViews {
    
    self.countDownLB.superview.hidden = YES;
    self.countDownNum = kCountdown;

    if (_useType == UseAsPasswordRetake) {
        self.title = @"重置密码";
        [self.confirmBTN setTitle:@"提交" forState:UIControlStateNormal];
    }else if(_useType == UseAsRegisterCounter) {
        self.title = @"新用户注册";
        [self.confirmBTN setTitle:@"注册并登陆" forState:UIControlStateNormal];
    }
    
    QTTextFieldDelegate* phoneDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {
    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    }];
    phoneDelegate.checkMode = CheckPhoneNumberCodeMode;
    self.phoneTF.delegate = phoneDelegate;

    QTTextFieldDelegate* identifyDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {

    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
        //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    }];
    identifyDelegate.verityCodeLentch = 6;
    identifyDelegate.checkMode = CheckVerificationCodeMode;
    self.identifyTF.delegate = identifyDelegate;
  
   
   QTTextFieldDelegate* passwdDelegate = [[QTTextFieldDelegate alloc]initWithBeginEditingBlock:^(UITextField *textFiled) {
        
    } textDidChangeBlock:^(UITextField *textFiled, NSString *message) {
        if (message) {
            //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    } endEditingBlock:^(UITextField *textFiled, NSString *message, BOOL isVerytifySuccess) {
        if (!isVerytifySuccess) {
            //[weakSelf.view addHUDWithType:OnlyMessage lableTitle:message yOffSet:-100.0f hideAfterDelay:1.5f];
        }
    }];
    passwdDelegate.checkMode = CheckPasswordMode;
    self.paswdTF.delegate = passwdDelegate;

}

#pragma mark- EventRespone
//注册或者找回密码
- (IBAction)confirm:(id)sender {
    if (self.phoneTF.text.length != 11) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"手机号位数不对" yOffSet:-100.0f hideAfterDelay:1.5f];
        return;
    }
    if (![NSString isMobileNumber:self.phoneTF.text]) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"手机号码无效" yOffSet:-100.0f hideAfterDelay:0.5];
        return;
    }
    if (self.identifyTF.text.length < 4) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"验证码位数不对" yOffSet:-100.0f hideAfterDelay:1.5f];
        return;
    }
    if (self.paswdTF.text.length < 6 ||self.paswdTF.text.length >16 ) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"密码位数不对" yOffSet:-100.0f hideAfterDelay:1.5f];
        return;
    }
    if (!self.isAcceptServiceTerms) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"请同意淘巴士服务条款" yOffSet:-100.0f hideAfterDelay:1.5f];
        return;
    }
    
    if (self.useType == UseAsPasswordRetake) {
        [self resetingPasswd];
    }else if (self.useType == UseAsRegisterCounter){
        [self registerCounter];
    }
}

- (void)registerCounter{
    
    
    //[self.view addHUDWithType:OnlyMessage lableTitle:@"注册中..." yOffSet:-100.f hideAfterDelay:0];
    NSDictionary* memberDict = @{
                                 @"mobile":self.phoneTF.text,
                                 @"uname":self.phoneTF.text,
                                 @"name":self.phoneTF.text,
                                 @"password":self.paswdTF.text,
                                 @"col3":@"ios",
                                 @"col2":self.identifyTF.text, //验证码
                                 };
    [QTNetWork postRequest:memberDict ssBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // [self.view addHUDWithType:OnlyMessage lableTitle:@"注册成功" yOffSet:-100.f hideAfterDelay:1.5];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 登录
            TBSUserSingleton* user = [TBSUserSingleton shareUser];
            
            NSDictionary* dict = @{}.mutableCopy ;
            [dict setValue:self.phoneTF.text forKey: @"userName"];
            [dict setValue:self.phoneTF.text forKey: @"mobile"];
            [dict setValue:self.paswdTF.text forKey: @"pwd"];
            
            //[self.view addHUDWithType:OnlyMessage lableTitle:@"登录中" yOffSet:-100.f hideAfterDelay:0];
        
        });
    } ftBlock:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // [self.view addHUDWithType:OnlyMessage lableTitle:@"网络无法访问" yOffSet:-100.f hideAfterDelay:1.5];
    }];
}

- (void)resetingPasswd{
    
    NSDictionary* dict = @{
                           @"phone_no":self.phoneTF.text,
                           @"valicode":self.identifyTF.text,
                           @"app_type":@"ios",
                           @"password":self.paswdTF.text,
                           };
    
    
    [NetWorkRequsetTool postRequestWithParameter:dict successBlock:^(NSDictionary* successData ) {
        
        
        if ([successData[@"error_code"] isEqualToString:@"0"]) {
            
            TBSUserSingleton* user = [TBSUserSingleton shareUser];
            
            user.hasLogion = YES;
            
            user.name = self.phoneTextFiled.text;
            
            [user saveUserInfoCounter: self.phoneTextFiled.text passwd:self.paswdTextFiled.text];
            
            [self autoGoBack];
            
        }
        
        
        [self.view addHUDWithType:OnlyMessage lableTitle:successData[@"error_msg"] yOffSet:-100.f hideAfterDelay:1.5];
        
        
    } failureBlock:^(NSString *errorNum) {
        
        [self.view addHUDWithType:OnlyMessage lableTitle:@"网络无法访问" yOffSet:-100.f hideAfterDelay:1.5];
        
    }];
    
    
}


- (IBAction)applyIdentifyCode:(UIButton *)sender {
    
    if (self.phoneTF.text.length != 11) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"手机号位数不对" yOffSet:-100.0f hideAfterDelay:0.5];
        return;
    }
    if (![NSString isMobileNumber:self.phoneTF.text]) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"手机号码无效" yOffSet:-100.0f hideAfterDelay:0.5];
        return;
    }
    self.countDownLB.superview.hidden = NO;
    [self identifyCode];
    [sender setTitle:@"重新发送" forState:UIControlStateNormal];
    
    sender.hidden = YES;
    
    __weak typeof(self) weakSelf = self;
    __weak typeof (sender) weakSender = sender;
    
    if (!self.timer) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f block:^{
            
            weakSelf.countDownNum--;
            
            if (weakSelf.secondCouter == 0)
            {
                [weakSelf.timer  invalidate] ;
                weakSelf.timer = nil;
                self.secondCouter = Seconds;
                self.minusCounterLabel.superview.hidden = YES;
                weakSender.hidden = NO;
                
            }
            
            weakSelf.minusCounterLabel.text = [NSString stringWithFormat:@"%d",self.secondCouter];
            
        } userInfo:nil repeats:YES];
        
    }
    
    
}



-(void)identifyCode{
    
    NSString* operType = @"other";
    
    if (self.useType == UseAsPasswordRetake) {
        // 忘记密码
        operType = @"findPass";
        
    }else if(self.useType == UseAsRegisterCounter){
        // 注册
        operType = @"register";
    }
    
    NSDictionary* dict = @{
                           
                           @"appType":@"ios",
                           @"mobile":self.phoneTextFiled.text,
                           @"method":@"zte.memberService.member.getsmscode",
                           @"operType":operType,
                           
                           };
    
    
    [NetWorkRequsetTool postRequestWithParameter:dict successBlock:^(NSDictionary* successData ) {
        
        if ([successData[@"error_code"] isEqualToString:@"0"]) {
        
        }
        
        NSString* ssionId = [successData objectForKey:@"userSessionId"];
        
        if ([ssionId isKindOfClass:[NSNull class]] || ssionId.length == 0 || !ssionId ) {
        
        }else{
            
            //保存
          
            
        }
        
        
    } failureBlock:^(NSString *errorNum) {
        //[self.view addHUDWithType:OnlyMessage lableTitle:@"网络无法访问" yOffSet:-100.f hideAfterDelay:1.5];
        
    }];
    
    
    
}

- (IBAction)chooseServiceItems:(id)sender {
    self.isAcceptServiceTerms = !self.isAcceptServiceTerms;
//    self.servierItemsIV
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
-(void)dealloc
{
#ifdef DEBUG
    NSLog(@"Dealloc ViewControllerName:%@",[[self class]description]);
    
#endif
}


@end
