declare @MemberType table (
color nvarchar(5) null,
[default] bit default 0,
description nvarchar(20) null,
isActive nvarchar(5) null,
label nvarchar(255) null,
urls nvarchar(5) null,
valueName nvarchar(255) null
)


insert @MemberType(label,valueName)
select distinct MemberType,MemberType
from aptify.vwCompanies where MemberType is not null
union
select distinct MemberType,MemberType
from Aptify.vwPersons where MemberType is not null

select * from @MemberType
for json path;