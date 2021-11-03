

declare @SponsorCategory table (
color nvarchar(5) null,
[default] bit default 0,
description nvarchar(20) null,
isActive nvarchar(5) null,
label nvarchar(255) null,
urls nvarchar(5) null,
valueName nvarchar(255) null
)

insert @SponsorCategory(label,valueName)
select distinct SponsorCategory,SponsorCategory
from Aptify.vwCompanies where SponsorCategory is not null

select * from @SponsorCategory
for json path;

