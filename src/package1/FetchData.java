package package1;


public class FetchData {

	public FetchData()
	{
		
		
	}
	
	
	
	public int[] getItemList(String s)
	{
		int[] a={};
		if(s.equals("Technology"))
		{
			int b[]={01,02,03};
			
			a=b;
		}
		
		return a;
	}
	public static void main(String[] a)
	{
		int[] aa=(new FetchData()).getItemList("Electronics");
		System.out.println(aa[0]+"hh"+aa[1]);
		
	}
	
	
}
