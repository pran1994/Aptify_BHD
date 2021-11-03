select count(*) as [Number Company Records In Aptify] from Aptify.vwCompanies

select count(*) as [Number Company Records Migrated]
from CRMAptify.Account a
inner join Import_SF_ID s on
	a.RecordTypeId = s.id
	and s.name <> 'Family Group'
where a.Id is not null

select count(*) as [Number Company Records Not Migrated]
from CRMAptify.Account a
inner join Import_SF_ID s on
	a.RecordTypeId = s.id
	and s.name <> 'Family Group'
where a.id is null

select * from CRMAptify.Return_Results_AccountError

select *
from CRMAptify.Note_Account


select count(*) as [Number Person Records In Aptify]
from Aptify.vwPersons


select count(*) as [Number Person Records Migrated]
from CRMAptify.Contact
where id is not null


select count(*) as [Number Person Records Not Migrated]
from CRMAptify.Contact c where c.Id is null

select *
from CRMAptify.Return_Results_ContactError
where Aptify_Id__c not in (
	select Aptify_Id__c from CRMAptify.Return_Results_Contact 
)

--fixed in-flight
select * from CRMAptify.Note_Contact

select count(*) as [Number Order Records In Aptify] from Aptify.vwOrders

select count(*) as [Number Order Records Migrated]
from CRMAptify.ChargentOrders__ChargentOrder__c
where id is not null

select count(*) as [Number Order Records Not Migrated]
from CRMAptify.ChargentOrders__ChargentOrder__c
where id is  null


select count(*) from CRMAptify.Return_Results_ChargentOrderError
select * from CRMAptify.Note_ChargentOrder


select count(*) as [Number Order Detail Records Migrated] 
from CRMAptify.OpportunityLineItem
where id is not null

select count(*) as [Number Order Detail Records in Aptify]
from Aptify.vwOrderDetails

select count(*) as [Number Order Detail Records not Migrated] 
from CRMAptify.OpportunityLineItem
where id is null

select * from CRMAptify.Return_Results_OpportunityLineItemError

select count(*) as [Number Committees Migrated]from CRMAptify.Membership_Group__c
where id is not null
select count(*) as [Number Committees Not Migrated]from CRMAptify.Membership_Group__c
where id is null
select count(*) as [Number Committees in Aptify] from Aptify.vwCommittees

select count(*) as [Number Committee Members Migrated] from CRMAptify.Membership__c
where id is not null

select count(*) as [Number Committee Members in Aptify] from Aptify.vwCommitteeTermMembers

select count(*) as [Number Committee Members Not Migrated] from CRMAptify.Membership__c
where id is null

select count(*) as [Number Aptify Products Migrated] from CRMAptify.Product2
where id is not null

select count(*) as [Number Products in Aptify] from Aptify.vwProducts

select count(*) as [Number Aptify Products Not Migrated] from CRMAptify.Product2
where id is null