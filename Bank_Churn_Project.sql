create database bank_churn_db;
use bank_churn_db;
select * from bank_churn;

/* ********* Bank Churn Based on Tenure ************************************ */
select Exited,Tenure,count(CustomerId) as Total_Customer, 
case 
when CreditScore between 800 and 850 then "Excellent" 
when CreditScore between 740 and 799 then "Very Good"
when CreditScore between 630 and 739 then "Good"
when CreditScore between 740 and 799 then "fair"
else "Poor"
end as Title
from bank_churn
group by Exited,Title,Tenure;

/* Those are customer bank client 3,4,5,6 and 7 year and thay credit score poor so they leave bank */


/* ***************** Bank churn Based on Credit Card ****************** */
select count(Hascreditcard) as Hascreditcard,Exited from bank_churn
group by Hascreditcard,Exited;

/* Those are customer has credit card but they exited bank */


/* ***************** Bank churn Based on Active or Inactive customer ***************** */
select count(CustomerId), Isactivemember,Exited from bank_churn
group by Isactivemember,Exited;

/* customer has In Active in bank so this reason thay leave bank */


/* ***************** Bank churn Based on Customer Geography ***************** */
select count(CustomerId),Geography,Exited from bank_churn
group by Geography,Exited;

/* customer geography location and bank location between many difference so customer leave the bank  */ 


/* ***************** Bank churn Based on customer bank balance ***************** */
select 
    case
        when Balance Between 0 and 100 then "E"
        when Balance Between 101 and 1000 then "D"
        when Balance between 1001 and 50000 then "C"
		when Balance between 50001 and 150000 then "B"
		when Balance between 150001 and 260000 then "A"
    end as Balance_Grade, count(CustomerId) as Customer,Exited
from bank_churn group by Balance_Grade,Exited;

/* Those customer maximum leave to bank their balance grade "A and B" because her bank balance is high but bank limit 
is not high so this reason and another reason */


/* ***************** Bank churn Based on customer salary ***************** */
select 
    case
        when Estimatedsalary Between 0 and 1000 then "E"
        when Estimatedsalary Between 1001 and 50000 then "D"
        when Estimatedsalary between 50001 and 100000 then "C"
		when Estimatedsalary between 100001 and 150000 then "B"
		when Estimatedsalary between 150001 and 200000 then "A"
    end as Salary_Grade, count(CustomerId) as Customer,Exited
from bank_churn group by Salary_Grade,Exited;

/* In bank, bank rule customer maintained her balance monthey or yearly but coustomer not maintained her balance
so bank give her penalty so this reason minimum customer leave the bank. */


