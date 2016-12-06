//
//  NSDate+SQExtentsion.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SQ_SEC_PER_MINUTE	(60)
#define SQ_SEC_PER_HOUR     (3600)
#define SQ_SEC_PER_DAY      (86400)
#define SQ_SEC_PER_WEEK     (604800)
#define SQ_SEC_PER_YEAR     (31556926)

@interface NSDate (SQExtentsion)

+ (NSCalendar *)sq_currentCalendar; // avoid bottlenecks
#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger sq_nearestHour;
@property (readonly) NSInteger sq_hour;
@property (readonly) NSInteger sq_minute;
@property (readonly) NSInteger sq_seconds;
@property (readonly) NSInteger sq_day;
@property (readonly) NSInteger sq_month;
@property (readonly) NSInteger sq_week;
@property (readonly) NSInteger sq_weekday;
@property (readonly) NSInteger sq_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger sq_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *sq_shortString;
@property (nonatomic, readonly) NSString *sq_shortDateString;
@property (nonatomic, readonly) NSString *sq_shortTimeString;
@property (nonatomic, readonly) NSString *sq_mediumString;
@property (nonatomic, readonly) NSString *sq_mediumDateString;
@property (nonatomic, readonly) NSString *sq_mediumTimeString;
@property (nonatomic, readonly) NSString *sq_longString;
@property (nonatomic, readonly) NSString *sq_longDateString;
@property (nonatomic, readonly) NSString *sq_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)sq_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)sq_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)sq_dateTomorrow;
///昨天
+ (NSDate *)sq_dateYesterday;
///今天后几天
+ (NSDate *)sq_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)sq_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)sq_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)sq_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)sq_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)sq_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)sq_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)sq_isToday;
///是否是明天
- (BOOL)sq_isTomorrow;
///是否是昨天
- (BOOL)sq_isYesterday;

///是否是同一周
- (BOOL)sq_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)sq_isThisWeek;
///是否是本周的下周
- (BOOL)sq_isNextWeek;
///是否是本周的上周
- (BOOL)sq_isLastWeek;

///是否是同一月
- (BOOL)sq_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)sq_isThisMonth;
///是否是本月的下月
- (BOOL)sq_isNextMonth;
///是否是本月的上月
- (BOOL)sq_isLastMonth;

///是否是同一年
- (BOOL)sq_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)sq_isThisYear;
///是否是今年的下一年
- (BOOL)sq_isNextYear;
///是否是今年的上一年
- (BOOL)sq_isLastYear;

///是否提前aDate
- (BOOL)sq_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)sq_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)sq_isInFuture;
///是否晚是过去
- (BOOL)sq_isInPast;


///是否是工作日
- (BOOL)sq_isTypicallyWorkday;
///是否是周末
- (BOOL)sq_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)sq_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)sq_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)sq_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)sq_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)sq_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)sq_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)sq_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)sq_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)sq_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)sq_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)sq_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)sq_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)sq_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)sq_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)sq_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)sq_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)sq_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)sq_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)sq_distanceYearsToDate:(NSDate *)anotherDate;


/**
 * 获取一年中的总天数
 */
- (NSUInteger)sq_daysInYear;
+ (NSUInteger)sq_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)sq_isLeapYear;
+ (BOOL)sq_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)sq_weekOfYear;
+ (NSUInteger)sq_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)sq_formatYMD;
+ (NSString *)sq_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)sq_weeksOfMonth;
+ (NSUInteger)sq_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)sq_begindayOfMonth;
+ (NSDate *)sq_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)sq_lastdayOfMonth;
+ (NSDate *)sq_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)sq_dateAfterDay:(NSUInteger)day;
+ (NSDate *)sq_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)sq_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)sq_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)sq_offsetYears:(int)numYears;
+ (NSDate *)sq_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;


/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)sq_weekday;
+ (NSInteger)sq_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)sq_dayFromWeekday;
+ (NSString *)sq_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 */
- (BOOL)sq_isSameDay:(NSDate *)anotherDate;

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
+ (NSString *)sq_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)sq_stringWithDate:(NSDate *)date format:(NSString *)format;
+ (NSDate *)sq_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)sq_daysInMonth:(NSUInteger)month;
+ (NSUInteger)sq_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)sq_daysInMonth;
+ (NSUInteger)sq_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)sq_timeInfo;
+ (NSString *)sq_timeInfoWithDate:(NSDate *)date;
+ (NSString *)sq_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
+ (NSString *)sq_ymdFormat;
+ (NSString *)sq_hmsFormat;
+ (NSString *)sq_ymdHmsFormat;

@end
