use APTIFY_GWS
go
set nocount on
set concat_null_yields_null off
declare @strSQL varchar(max)
declare @executeStr varchar(max)
declare @dbName nvarchar(20)
select @dbName = DB_NAME()
declare @viewname nvarchar(50) 
declare @targetdb nvarchar(50)

set @targetdb = 'GWS_Migration'

declare @rowcnt int=1
while @rowcnt <= (select max(id) from [crmstg01\SQL2019].bhd.dbo.AptifyMigrationObjects)
begin

	select @viewname = Name from [crmstg01\SQL2019].bhd.dbo.AptifyMigrationObjects where id = @rowcnt and (appliestoclub='All' or appliestoclub = @dbName)

	select distinct @strSQL = stuff((
	select ',[' +  COLUMN_NAME + '] ' + DATA_TYPE + '(' + case when DATA_TYPE = 'Decimal' then cast(NUMERIC_PRECISION as varchar(10)) + ',' + cast(NUMERIC_SCALE as varchar(10)) else 
cast(CHARACTER_MAXIMUM_LENGTH as nvarchar(10)) end + ') NULL'
	from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = @viewname
	order by ORDINAL_POSITION asc
	for xml path('')
	),1,1,'')
	from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = @viewname


	select @strSQL = REPLACE(@strSQL,'()','')
	select @strSQL = REPLACE(@strSQL,'(-1)','(max)')

	select @executeStr = 'use ' + @targetdb + '; drop table if exists Aptify.' + @viewname + ';' + ' create table Aptify.' + @viewname + ' ('+ @strSQL + ')'
	print cast(@executeStr as ntext)
	--exec (@executeStr)
	select @executeStr = 'use ' + @targetdb + '; insert Aptify.' + @viewname + ' select * from [' + @@SERVERNAME + '].' + @dbName + '.dbo.' + @viewname
	--exec (@executeStr)
	print @executeStr

	select @rowcnt += 1
end


