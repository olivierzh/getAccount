# getAccount
Get AppleID on jailbreak iPhone with private api

1.Set up Xcode's SDKSetting.plist and Info.plist.

2.Set up project's build setting (Signing and Team) and Run Script in build phrase.

3.Use private api to get AppleID which is logining on the jailbreak iphone.

4.Build the project and get the getAccount.app in products.

5.Use scp command to send the getAccount.app to iPhone 's"/Applications" (Jailbreak iPhone must have OpenSSH).

6.Login in the iPhone by using ssh root@ip_address (Default password is Alpine).

7.Go to /Applications and use "uicache", then the app is on your device.
