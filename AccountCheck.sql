select distinct OwnerId
from CRMAptify.Account

select distinct CreatedById
from CRMAptify.Account

select distinct LastModifiedById
from CRMAptify.Account


--Numbers checks

select s.Name,count(*) Frequency
from CRMAptify.Account a
inner join Import_SF_ID s on 
	a.RecordTypeId = s.id
where s.name <> 'Family group'
group by s.name


select count(*) from Aptify.vwCompanies