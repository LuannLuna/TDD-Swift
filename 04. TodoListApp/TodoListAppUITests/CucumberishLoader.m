//
//  CucumberishLoader.m
//  TodoListAppUITests
//
//  Created by Luann Luna on 10/05/22.
//

#import <Foundation/Foundation.h>
#import "TodoListAppUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit() {
    [CucumberishInitializer setupCucumberish];
}
