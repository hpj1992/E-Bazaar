import java.util.*; 

class GenerateRandomNo
{
public static void main(String[] st)
{  
GenerateRandomNo grn=new GenerateRandomNo();
String g=grn.generateRandomNumber();
System.out.println("VALUE"+g);
}

String generateRandomNumber()
{
String c1="";
String c2="";
String c="";
while(true)
{
if(c1.length()==8 && c2.length()==2)
{
c=c1+c2;
c1="";
c2="";
break;
}
else
{
double d1=Math.random();
d1=d1*100000000;
long i1=(long)d1;
c1=Long.toString(i1);
double d2=Math.random();
d2=d2*100;
long i2=(long)d2;
c2=Long.toString(i2);
}
}
return c;
}
}