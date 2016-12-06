//
//  NSDate+SQExtentsion.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "NSDate+SQExtentsion.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)

#else
#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)


#endif

#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (SQExtentsion)

+ (NSCalendar *)sq_currentCalendar {
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark Relative Dates
+ (NSDate *)sq_dateWithDaysFromNow: (NSInteger) days {
    // Thanks, Jim Morrison
    return [[NSDate date] sq_dateByAddingDays:days];
}

+ (NSDate *)sq_dateWithDaysBeforeNow: (NSInteger) days {
    // Thanks, Jim Morrison
    return [[NSDate date] sq_dateBySubtractingDays:days];
}

+ (NSDate *)sq_dateTomorrow {
    return [NSDate sq_dateWithDaysFromNow:1];
}

+ (NSDate *)sq_dateYesterday {
    return [NSDate sq_dateWithDaysBeforeNow:1];
}

+ (NSDate *)sq_dateWithHoursFromNow: (NSInteger) dHours {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SQ_SEC_PER_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)sq_dateWithHoursBeforeNow: (NSInteger) dHours {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SQ_SEC_PER_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)sq_dateWithMinutesFromNow: (NSInteger) dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SQ_SEC_PER_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)sq_dateWithMinutesBeforeNow: (NSInteger) dMinutes {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SQ_SEC_PER_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties

- (NSString *)sq_stringWithFormat: (NSString *) format {
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)sq_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *)sq_shortString {
    return [self sq_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)sq_shortTimeString {
    return [self sq_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)sq_shortDateString {
    return [self sq_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)sq_mediumString {
    return [self sq_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)sq_mediumTimeString {
    return [self sq_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)sq_mediumDateString {
    return [self sq_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)sq_longString {
    return [self sq_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)sq_longTimeString {
    return [self sq_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)sq_longDateString {
    return [self sq_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}


#pragma mark Comparing Dates
- (BOOL)sq_isEqualToDateIgnoringTime: (NSDate *) aDate {
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)sq_isToday {
    return [self sq_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)sq_isTomorrow {
    return[self sq_isEqualToDateIgnoringTime:[NSDate sq_dateTomorrow]];
}

- (BOOL)sq_isYesterday {
    return [self sq_isEqualToDateIgnoringTime:[NSDate sq_dateYesterday]];
}

// This hsq_ard codes the assumption that a week is 7 days
- (BOOL)sq_isSameWeekAsDate: (NSDate *) aDate {
    NSDateComponents *components1 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate];
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear) return NO;
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < SQ_SEC_PER_WEEK);
}

- (BOOL)sq_isThisWeek {
    return [self sq_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)sq_isNextWeek {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SQ_SEC_PER_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self sq_isSameWeekAsDate:newDate];
}

- (BOOL)sq_isLastWeek {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - SQ_SEC_PER_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self sq_isSameWeekAsDate:newDate];
}
// Thanks, mspasov
- (BOOL)sq_isSameMonthAsDate: (NSDate *) aDate {
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
#else
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL)sq_isThisMonth {
    return [self sq_isSameMonthAsDate:[NSDate date]];
}

- (BOOL)sq_isLastMonth {
    return [self sq_isSameMonthAsDate:[[NSDate date] sq_dateBySubtractingMonths:1]];
}

- (BOOL)sq_isNextMonth {
    return [self sq_isSameMonthAsDate:[[NSDate date] sq_dateByAddingMonths:1]];
}

- (BOOL)sq_isSameYearAsDate: (NSDate *) aDate {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:aDate];
#else 
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:aDate];

#endif
    return (components1.year == components2.year);
}

- (BOOL)sq_isThisYear {
    // Thanks, baspellis
    return [self sq_isSameYearAsDate:[NSDate date]];
}

- (BOOL)sq_isNextYear {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
#else
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year + 1));
}

- (BOOL)sq_isLastYear {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSCalendarUnitYear fromDate:[NSDate date]];
#else
    NSDateComponents *components1 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [CURRENT_CALENDAR components:NSYearCalendarUnit fromDate:[NSDate date]];

#endif
    return (components1.year == (components2.year - 1));
}

- (BOOL)sq_isEarlierThanDate: (NSDate *) aDate {
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)sq_isLaterThanDate: (NSDate *) aDate {
    return ([self compare:aDate] == NSOrderedDescending);
}
// Thanks, markrickert
- (BOOL)sq_isInFuture {
    return ([self sq_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL)sq_isInPast {
    return ([self sq_isEarlierThanDate:[NSDate date]]);
}

#pragma mark Roles
- (BOOL)sq_isTypicallyWeekend {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitWeekday fromDate:self];
#else
    NSDateComponents *components = [CURRENT_CALENDAR components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL)sq_isTypicallyWorkday {
    return ![self sq_isTypicallyWeekend];
}

#pragma mark Adjusting Dates

- (NSDate *)sq_dateByAddingYears: (NSInteger) dYears {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)sq_dateBySubtractingYears: (NSInteger) dYears {
    return [self sq_dateByAddingYears:-dYears];
}

- (NSDate *)sq_dateByAddingMonths: (NSInteger) dMonths {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)sq_dateBySubtractingMonths: (NSInteger) dMonths {
    return [self sq_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *)sq_dateByAddingDays:(NSInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

- (NSDate *)sq_dateBySubtractingDays: (NSInteger) dDays {
    return [self sq_dateByAddingDays: (dDays * -1)];
}

- (NSDate *)sq_dateByAddingHours: (NSInteger) dHours {
    NSTimeInterval aTimeInterval = SQ_SEC_PER_DAY * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:aTimeInterval];
    return newDate;
}

- (NSDate *)sq_dateBySubtractingHours: (NSInteger) dHours {
    return [self sq_dateByAddingHours: (dHours * -1)];
}

- (NSDate *)sq_dateByAddingMinutes: (NSInteger) dMinutes {
    NSTimeInterval aTimeInterval = SQ_SEC_PER_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:aTimeInterval];
    return newDate;
}

- (NSDate *)sq_dateBySubtractingMinutes: (NSInteger) dMinutes {
    return [self sq_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *)sq_componentsWithOffsetFromDate: (NSDate *) aDate {
    NSDateComponents *dTime = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark Retrieving Intervals
- (NSInteger)sq_minutesAfterDate: (NSDate *) aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SQ_SEC_PER_MINUTE);
}

- (NSInteger)sq_minutesBeforeDate: (NSDate *) aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SQ_SEC_PER_MINUTE);
}

- (NSInteger)sq_hoursAfterDate: (NSDate *) aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SQ_SEC_PER_HOUR);
}

- (NSInteger)sq_hoursBeforeDate: (NSDate *) aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SQ_SEC_PER_HOUR);
}

- (NSInteger)sq_daysAfterDate: (NSDate *) aDate {
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / SQ_SEC_PER_DAY);
}

- (NSInteger)sq_daysBeforeDate: (NSDate *) aDate {
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / SQ_SEC_PER_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)sq_distanceDaysToDate:(NSDate *)anotherDate {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
#else
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#endif
    return components.day;
}

- (NSInteger)sq_distanceMonthsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
#else
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#endif
    return components.month;
}

- (NSInteger)sq_distanceYearsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
#else
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#endif
    return components.year;
}

#pragma mark Decomposing Dates
- (NSInteger)sq_nearestHour {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + SQ_SEC_PER_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [CURRENT_CALENDAR components:NSCalendarUnitHour fromDate:newDate];
#else
    NSDateComponents *components = [CURRENT_CALENDAR components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}

- (NSInteger)sq_hour {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.hour;
}

- (NSInteger)sq_minute {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.minute;
}

- (NSInteger)sq_seconds {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.second;
}

- (NSInteger)sq_day {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.day;
}

- (NSInteger)sq_month {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.month;
}

- (NSInteger)sq_week {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekOfYear;
}
- (NSInteger)sq_weekday {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekday;
}

- (NSInteger)sq_nthWeekday {// e.g. 2nd Tuesday of the month is 2
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)sq_year {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components.year;
}

- (NSUInteger)sq_daysInYear {
    return [NSDate sq_daysInYear:self];
}

+ (NSUInteger)sq_daysInYear:(NSDate *)date {
    return [self sq_isLeapYear:date] ? 366 : 365;
}

- (BOOL)sq_isLeapYear {
    return [NSDate sq_isLeapYear:self];
}

+ (BOOL)sq_isLeapYear:(NSDate *)date {
    NSUInteger year = [date sq_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)sq_formatYMD {
    return [NSDate sq_formatYMD:self];
}

+ (NSString *)sq_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%zd-%02zd-%02zd",[date sq_year],[date sq_month], [date sq_day]];
}

- (NSUInteger)sq_weeksOfMonth {
    return [NSDate sq_weeksOfMonth:self];
}

+ (NSUInteger)sq_weeksOfMonth:(NSDate *)date {
    return [[date sq_lastdayOfMonth] sq_weekOfYear] - [[date sq_begindayOfMonth] sq_weekOfYear] + 1;
}

- (NSUInteger)sq_weekOfYear {
    return [NSDate sq_weekOfYear:self];
}

+ (NSUInteger)sq_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date sq_year];
    
    NSDate *lastdate = [date sq_lastdayOfMonth];
    
    for (i = 1;[[lastdate sq_dateAfterDay:-7 * i] sq_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)sq_dateAfterDay:(NSUInteger)day {
    return [NSDate sq_dateAfterDate:self day:day];
}

+ (NSDate *)sq_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)sq_dateAfterMonth:(NSUInteger)month {
    return [NSDate sq_dateAfterDate:self month:month];
}

+ (NSDate *)sq_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)sq_begindayOfMonth {
    return [NSDate sq_begindayOfMonth:self];
}

+ (NSDate *)sq_begindayOfMonth:(NSDate *)date {
    return [self sq_dateAfterDate:date day:-[date sq_day] + 1];
}

- (NSDate *)sq_lastdayOfMonth {
    return [NSDate sq_lastdayOfMonth:self];
}

+ (NSDate *)sq_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self sq_begindayOfMonth:date];
    return [[lastDate sq_dateAfterMonth:1] sq_dateAfterDay:-1];
}


+ (NSInteger)sq_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)sq_dayFromWeekday {
    return [NSDate sq_dayFromWeekday:self];
}

+ (NSString *)sq_dayFromWeekday:(NSDate *)date {
    switch([date sq_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)sq_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)sq_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)sq_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date sq_stringWithFormat:format];
}

+ (NSDate *)sq_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)sq_daysInMonth:(NSUInteger)month {
    return [NSDate sq_daysInMonth:self month:month];
}

+ (NSUInteger)sq_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date sq_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)sq_daysInMonth {
    return [NSDate sq_daysInMonth:self];
}

+ (NSUInteger)sq_daysInMonth:(NSDate *)date {
    return [self sq_daysInMonth:date month:[date sq_month]];
}

- (NSString *)sq_timeInfo {
    return [NSDate sq_timeInfoWithDate:self];
}

+ (NSString *)sq_timeInfoWithDate:(NSDate *)date {
    return [self sq_timeInfoWithDateString:[self sq_stringWithDate:date format:[self sq_ymdHmsFormat]]];
}

+ (NSString *)sq_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self sq_dateWithString:dateString format:[self sq_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate sq_month] - [date sq_month]);
    int year = (int)([curDate sq_year] - [date sq_year]);
    int day = (int)([curDate sq_day] - [date sq_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate sq_month] == 1 && [date sq_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self sq_daysInMonth:date month:[date sq_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate sq_day] + (totalDays - (int)[date sq_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate sq_month];
            int preMonth = (int)[date sq_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)sq_ymdFormat {
    return [NSDate sq_ymdFormat];
}

- (NSString *)sq_hmsFormat {
    return [NSDate sq_hmsFormat];
}

- (NSString *)sq_ymdHmsFormat {
    return [NSDate sq_ymdHmsFormat];
}

+ (NSString *)sq_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)sq_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)sq_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self sq_ymdFormat], [self sq_hmsFormat]];
}

- (NSDate *)sq_offsetYears:(int)numYears {
    return [NSDate sq_offsetYears:numYears fromDate:self];
}

+ (NSDate *)sq_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}
@end
