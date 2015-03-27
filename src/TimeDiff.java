import java.text.SimpleDateFormat;
import java.util.Date;
 
public class TimeDiff {
	long diffSeconds;
	long diffMinutes;
	long diffHours;
	long diffDays;
	public TimeDiff(Date d1,Date d2)
	{
		try {
			
			//in milliseconds
			long diff = d2.getTime() - d1.getTime();
 
			 diffSeconds = diff / 1000 % 60;
			 diffMinutes = diff / (60 * 1000) % 60;
			 diffHours = diff / (60 * 60 * 1000) % 24;
			 diffDays = diff / (24 * 60 * 60 * 1000);
 
			System.out.print(diffDays + " days, ");
			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");
 
		} catch (Exception e) {
			e.printStackTrace();
		}
 
		
	}
	public long[] getValues()
	{
		long[] data=new long[4];
		data[0]= diffSeconds;
		data[1]= diffMinutes;
		data[2]=diffHours;
		data[3]=diffDays;
		return data;
	}
	
 
}