public class TechnicalWeekUtil {
    private static Map<String,Integer> dayNameToDayNumberMap;
    
    public static Date getTechnicalWeekStartDate(Date currentDate){
        dayNameToDayNumberMap = new Map<String,Integer>();
        dayNameToDayNumberMap.put('Monday',1);
        dayNameToDayNumberMap.put('Tuesday',2);
        dayNameToDayNumberMap.put('Wednesday',3);
        dayNameToDayNumberMap.put('Thursday',4);
        dayNameToDayNumberMap.put('Friday',5);
        dayNameToDayNumberMap.put('Saturday',6);
        dayNameToDayNumberMap.put('Sunday',7);

        DateTime currentDateTime = currentDate;
        DateTime techWeekStartDate = currentDateTime;

        System.debug('@@@@ currentDate ---> ' + currentDate);
        System.debug('@@@@ currentDateTime before adding hour---> ' + currentDateTime);
        System.debug('@@@@ currentDateTimeDay before adding hour---> ' + currentDateTime.format('EEEE'));

        currentDateTime = currentDateTime.addHours(1);
        String currentDateTimeDay = currentDateTime.format('EEEE');

        System.debug('@@@@ currentDateTime after adding hour---> ' + currentDateTime);
        System.debug('@@@@ currentDateTimeDay after adding hour---> ' + currentDateTimeDay);

        Integer dayNumber = dayNameToDayNumberMap.get(currentDateTimeDay);

        System.debug('@@@@ dayNumber ---> ' + dayNumber);
        System.debug('@@@@ techWeekStartDate before checking for day ---> ' + techWeekStartDate);
        System.debug('@@@@ techWeekStartDay before checking for day ---> ' + techWeekStartDate.format('EEEE'));

        if(dayNumber != 1){
            System.debug('@@@@ techWeekStartDate was not a monday hence inside if');
            techWeekStartDate = currentDateTime.addDays(-1 * (dayNumber-1));

            System.debug('@@@@ techWeekStartDate after substracing to monday ---> ' + techWeekStartDate);
            System.debug('@@@@ techWeekStartDay after substracing to monday ---> ' + techWeekStartDate.format('EEEE'));

            if(techWeekStartDate.month() != currentDateTime.month()){
                System.debug('@@@ Monday falls in previous month.');

                techWeekStartDate = currentDate.toStartOfMonth();

                System.debug('@@@@ techWeekStartDate after setting new week of month ---> ' + techWeekStartDate);
                System.debug('@@@@ techWeekStartDay  after setting new week of month ---> ' + techWeekStartDate.format('EEEE'));
            }
        }

        return Date.valueOf(techWeekStartDate);
    }

    public static Date getTechnicalWeekEndDate(Date currentDate){
        dayNameToDayNumberMap = new Map<String,Integer>();
        dayNameToDayNumberMap.put('Monday',1);
        dayNameToDayNumberMap.put('Tuesday',2);
        dayNameToDayNumberMap.put('Wednesday',3);
        dayNameToDayNumberMap.put('Thursday',4);
        dayNameToDayNumberMap.put('Friday',5);
        dayNameToDayNumberMap.put('Saturday',6);
        dayNameToDayNumberMap.put('Sunday',7);

        DateTime currentDateTime = currentDate;
        DateTime techWeekEndDate = currentDateTime;

        System.debug('@@@@ currentDate ---> ' + currentDate);
        System.debug('@@@@ currentDateTime before adding hour---> ' + currentDateTime);
        System.debug('@@@@ currentDateTimeDay before adding hour---> ' + currentDateTime.format('EEEE'));

        currentDateTime = currentDateTime.addHours(1);
        String currentDateTimeDay = currentDateTime.format('EEEE');

        System.debug('@@@@ currentDateTime after adding hour---> ' + currentDateTime);
        System.debug('@@@@ currentDateTimeDay after adding hour---> ' + currentDateTimeDay);

        Integer dayNumber = dayNameToDayNumberMap.get(currentDateTimeDay);

        System.debug('@@@@ dayNumber ---> ' + dayNumber);
        System.debug('@@@@ techWeekEndDate before checking for day ---> ' + techWeekEndDate);
        System.debug('@@@@ techWeekEndDay before checking for day ---> ' + techWeekEndDate.format('EEEE'));

        if(dayNumber != 7){
            System.debug('@@@@ techWeekEndDate was not a sunday hence inside if');
            techWeekEndDate = currentDateTime.addDays(7 - dayNumber);

            System.debug('@@@@ techWeekEndDate after substracing to sunday ---> ' + techWeekEndDate);
            System.debug('@@@@ techWeekEndDay after substracing to sunday ---> ' + techWeekEndDate.format('EEEE'));

            if(techWeekEndDate.month() != currentDateTime.month()){
                System.debug('@@@ Sunday falls in next month.');

                //techWeekEndDate = Date.valueOf(currentDateTime).toStartOfMonth();
                Integer daysInCurrentMonth = Date.daysInMonth(currentDate.year(),currentDate.month());
                Date startDateOfCurrentMonth = Date.valueOf(currentDateTime).toStartOfMonth();
                //Last day of Current month
                techWeekEndDate = Date.newInstance(currentDate.year(), currentDate.month(), daysInCurrentMonth);

                System.debug('@@@@ techWeekEndDate after setting new week of month ---> ' + techWeekEndDate);
                System.debug('@@@@ techWeekStartDay  after setting new weekEndonth ---> ' + techWeekEndDate.format('EEEE'));
            }
        }

        return Date.valueOf(techWeekEndDate);
    }
}