set @date = date(now());
insert into days (date, dayName, weekNumber, dayNumber, isWorkDay)
select 
	date(date_add(@date, interval seq day)) as date, 
	dayname(date_add(@date, interval seq day)) as dayname, 
	week(date_add(@date, interval seq day)) as weeknum, 
	mod(dayofweek(date_add(@date, interval seq day))+5, 7) dayofweek, 
	case when mod(dayofweek(date_add(@date, interval seq day))+5, 7) < 5 then 1 else 0 end workday
from seq_0_to_21
