# SSNTextFieldManager

It's a simple **UITextFieldDelegate** formatter for [Social Security Number](http://www.ssa.gov/ssnumber/) with  **XXX-XX-XXXX** format.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SSNTextFieldDelegate into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/serg94/SSNTextFieldDelegate'
platform :ios, '8.0'
use_frameworks!

pod 'SSNTextFieldDelegate'
```

Then, run the following command:

```bash
$ pod install
```

## How to use

Set the [SSNTextFieldDelegate]() to your textfield and drink a beer.

##Define the Rules

1. All SSN's are exactly 9 digits long, and are in the format "xxx-xx-xxxx" or "xxxxxxxxx", where "x" is a numeric digit (0 through 9). In either form the first three digits are referred to as the "Area Number", the middle two digits are the "Group Code" and the final four digits are the "Serial Number".

2. The first three digits ("Area Number") indicate the geographic location.
a. The Area Number "666" (for obvious reasons) will never be used.
b. The Area Number "000" will never be assigned.
c. All numbers between "900" and "999" will not be assigned. Various government agencies have used Area Numbers "900" through "999" for internal management purposes; but for our purposes, these are considered invalid.

3. The middle two digits ("Group Code") are dependent on the Area Number. This number indicates the highest group of numbers assigned to an area. The assignment of these numbers, however, is strange (see below). The "High" Group Codes are updated monthly and can be viewed here.

Group Codes are assigned according to the following pattern:

a. For each Area Number, odd numbered Group Codes between 01 and 09 are assigned first.
b. Next, even numbers between 10 and 98 are assigned.
c. When the 98 Group is used up, we drop back and use up the even numbers between 02 and 08.
d. Finally, we use up all the odd numbers between 11 and 99.

As an example, for Area Number "277" (an Ohio code), the High Group Code is currently "08". This means that all odd numbers between 01 and 09, all even numbers between 10 and 98, and all even numbers between 02 and 06 are used up. New SSN's assigned from this area will have the format: 277-08-xxxx.

4. The last four digits ("Serial Number") of a SSN will never be "0000". It will always be a number between "0001" and "9999". Serial Numbers are assigned in sequential order from "0001" to "9999".

5. There are some complete SSN's that will never be issued by the SSA. Some of these SSN's were used in media campaigns or otherwise misused. One example is the number "078-05-1120" which was used by the E.H. Ferree Company in an advertising campaign, circa 1938. Over 40,000 people have claimed this number as their own since then so the SSA invalidated it.

[For more information](http://www.codeproject.com/KB/validation/ssnvalidator.aspx?msg=1542941)

## LICENSE

* ------------------------------------------------------------------------------------
* "THE BEER-WARE LICENSE":
* <sergeysahakyan94@gmail.com> wrote this file.  As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return.
* ------------------------------------------------------------------------------------
