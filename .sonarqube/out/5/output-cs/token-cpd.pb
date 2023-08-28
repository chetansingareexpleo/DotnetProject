∞
ÑC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\Repositories\Common\ListResponseModel.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
.G H
RepositoriesH T
.T U
CommonU [
;[ \
public 
class 
ListResponseModel 
< 
TDto #
># $
:% &
IListResponseModel' 9
<9 :
TDto: >
>> ?
{ 
public 

int 
	PageIndex 
{ 
get 
; 
private  '
set( +
;+ ,
}- .
public 

int 
PageSize 
{ 
get 
; 
private &
set' *
;* +
}, -
public

 

int

 
	PageCount

 
{

 
get

 
;

 
private

  '
set

( +
;

+ ,
}

- .
public 

int 
RowCount 
{ 
get 
; 
private &
set' *
;* +
}, -
public 

string 
? 
ActiveFilter 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 

string 
? 
ActiveOrderBy  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 

int 
FirstRowOnPage 
=>  
RowCount! )
<=* ,
$num- .
?/ 0
$num1 2
:3 4
(5 6
(6 7
	PageIndex7 @
-A B
$numC D
)D E
*F G
PageSizeH P
)P Q
+R S
$numT U
;U V
public 

int 
LastRowOnPage 
=> 
Math  $
.$ %
Min% (
(( )
	PageIndex) 2
*3 4
PageSize5 =
,= >
RowCount? G
)G H
;H I
public 

IEnumerable 
< 
TDto 
> 
Results $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
new5 8
List9 =
<= >
TDto> B
>B C
(C D
)D E
;E F
public 

ListResponseModel 
( 
ListQueryModel +
<+ ,
TDto, 0
>0 1

queryModel2 <
,< =
int> A
rowCountB J
,J K
IEnumerableL W
<W X
TDtoX \
>\ ]
results^ e
)e f
{ 
Results 
= 
results 
; 
	PageIndex 
= 

queryModel 
. 
	PageIndex (
;( )
PageSize 
= 

queryModel 
. 
PageSize &
;& '
ActiveOrderBy 
= 

queryModel "
." #
OrderBy# *
;* +
ActiveFilter 
= 

queryModel !
.! "
Filter" (
;( )
RowCount 
= 
rowCount 
; 
	PageCount 
= 
( 
int 
) 
Math 
. 
Ceiling %
(% &
(& '
double' -
)- .
rowCount. 6
/7 8
PageSize9 A
)A B
;B C
} 
}   ©K
ÅC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\Repositories\Common\RepositoryBase.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
.G H
RepositoriesH T
.T U
CommonU [
;[ \
internal 
abstract	 
class 
RepositoryBaseEF (
<( )
TEntity) 0
>0 1
:2 3
IRepository4 ?
<? @
TEntity@ G
>G H
whereI N
TEntityO V
:W X
classY ^
,^ _
IEntity` g
{ 
	protected  
ApplicationDbContext "
_context# +
;+ ,
	protected 
DbSet 
< 
TEntity 
> 
_set !
;! "
private 
readonly 
IMapper 
_mapper $
;$ %
	protected 
abstract 

IQueryable !
<! "
TEntity" )
>) *
	BaseQuery+ 4
{5 6
get7 :
;: ;
}< =
public 

RepositoryBaseEF 
(  
ApplicationDbContext 0
context1 8
,8 9
IMapper: A
mapperB H
)H I
{ 
_context 
= 
context 
; 
_set 
= 
context 
. 
Set 
< 
TEntity "
>" #
(# $
)$ %
;% &
_mapper 
= 
mapper 
; 
} 
public   

virtual   
async   
Task   
<   
TEntity   %
?  % &
>  & '
GetByIdAsync  ( 4
(  4 5
int  5 8
id  9 ;
)  ; <
=>!! 

await!! 
	BaseQuery!! 
.!!  
SingleOrDefaultAsync!! /
(!!/ 0
e!!0 1
=>!!2 4
e!!5 6
.!!6 7
Id!!7 9
==!!: <
id!!= ?
)!!? @
;!!@ A
public## 

async## 
Task## 
<## 
IEnumerable## !
<##! "
TEntity##" )
>##) *
>##* +
GetFiltered##, 7
(##7 8

Expression##8 B
<##B C
Func##C G
<##G H
TEntity##H O
,##O P
bool##Q U
>##U V
>##V W
filter##X ^
,##^ _
bool##` d
readOnly##e m
=##n o
false##p u
)##u v
=>$$ 

await$$ 
($$ 
readOnly$$ 
?$$ 
	BaseQuery$$ &
.$$& '
AsNoTracking$$' 3
($$3 4
)$$4 5
:$$6 7
	BaseQuery$$8 A
)$$A B
.$$B C
Where$$C H
($$H I
filter$$I O
)$$O P
.$$P Q
ToListAsync$$Q \
($$\ ]
)$$] ^
;$$^ _
public&& 

virtual&& 
async&& 
Task&& 
<&& 
TDto&& "
?&&" #
>&&# $
GetProjectedAsync&&% 6
<&&6 7
TDto&&7 ;
>&&; <
(&&< =
int&&= @
id&&A C
,&&C D
bool&&E I
readOnly&&J R
=&&S T
false&&U Z
)&&Z [
where&&\ a
TDto&&b f
:&&g h
IMapFrom&&i q
<&&q r
TEntity&&r y
>&&y z
=>'' 

await'' 
('' 
readOnly'' 
?'' 
	BaseQuery'' &
.''& '
AsNoTracking''' 3
(''3 4
)''4 5
:''6 7
	BaseQuery''8 A
)''A B
.(( 
Where(( 
((( 
x(( 
=>(( 
x(( 
.(( 
Id(( 
==(( 
id((  "
)((" #
.)) 
	ProjectTo)) 
<)) 
TDto)) 
>)) 
()) 
_mapper)) $
.))$ %!
ConfigurationProvider))% :
))): ;
.**  
SingleOrDefaultAsync** !
(**! "
)**" #
;**# $
public,, 

virtual,, 
async,, 
Task,, 
<,, 
IListResponseModel,, 0
<,,0 1
TDto,,1 5
>,,5 6
>,,6 7!
GetProjectedListAsync,,8 M
<,,M N
TDto,,N R
>,,R S
(,,S T
ListQueryModel,,T b
<,,b c
TDto,,c g
>,,g h
model,,i n
,,,n o

Expression,,p z
<,,z {
Func,,{ 
<	,, Ä
TEntity
,,Ä á
,
,,á à
bool
,,â ç
>
,,ç é
>
,,é è
?
,,è ê
additionalFilter
,,ë °
=
,,¢ £
null
,,§ ®
,
,,® ©
bool
,,™ Æ
readOnly
,,Ø ∑
=
,,∏ π
false
,,∫ ø
)
,,ø ¿
where
,,¡ ∆
TDto
,,« À
:
,,Ã Õ
IMapFrom
,,Œ ÷
<
,,÷ ◊
TEntity
,,◊ ﬁ
>
,,ﬁ ﬂ
{-- 
var.. 
query.. 
=.. 
readOnly.. 
?.. 
	BaseQuery.. (
...( )
AsNoTracking..) 5
(..5 6
)..6 7
:..8 9
	BaseQuery..: C
;..C D
if00 

(00 
additionalFilter00 
!=00 
null00  $
)00$ %
{11 	
query22 
=22 
query22 
.22 
Where22 
(22  
additionalFilter22  0
)220 1
;221 2
}33 	

IQueryable55 
<55 
TDto55 
>55 
?55 
filteredDtoQuery55 *
=55+ ,
default55- 4
;554 5
try66 
{77 	
filteredDtoQuery88 
=88 
query88 $
.99 
	ProjectTo99 
<99 
TDto99 
>99  
(99  !
_mapper99! (
.99( )!
ConfigurationProvider99) >
)99> ?
.:: 
ApplyFilter:: 
(:: 
model:: "
.::" #
Filter::# )
)::) *
;::* +
};; 	
catch<< 
(<< 
FormatException<< 
fe<<  
)<<  !
{== 	
model>> 
.>> )
ThrowFilterIncorrectException>> /
(>>/ 0
fe>>0 2
.>>2 3
InnerException>>3 A
)>>A B
;>>B C
}?? 	
varAA 
totalRowCountAA 
=AA 
awaitAA !
filteredDtoQueryAA" 2
!AA2 3
.AA3 4

CountAsyncAA4 >
(AA> ?
)AA? @
;AA@ A
IEnumerableCC 
<CC 
TDtoCC 
>CC 
?CC 

resultPageCC %
=CC& '
defaultCC( /
;CC/ 0
tryDD 
{EE 	

resultPageFF 
=FF 
awaitFF 
filteredDtoQueryFF /
!FF/ 0
.GG 

ApplyOrderGG 
(GG 
modelGG !
.GG! "
OrderByGG" )
)GG) *
.HH 
ApplyPagingHH 
(HH 
modelHH "
.HH" #
PageSizeHH# +
,HH+ ,
modelHH- 2
.HH2 3
	PageIndexHH3 <
)HH< =
.II 
ToListAsyncII 
(II 
)II 
;II 
}JJ 	
catchKK 
(KK 
FormatExceptionKK 
feKK  
)KK  !
{LL 	
modelMM 
.MM *
ThrowOrderByIncorrectExceptionMM 0
(MM0 1
feMM1 3
.MM3 4
InnerExceptionMM4 B
)MMB C
;MMC D
}NN 	
returnPP 
newPP 
ListResponseModelPP $
<PP$ %
TDtoPP% )
>PP) *
(PP* +
modelPP+ 0
,PP0 1
totalRowCountPP2 ?
,PP? @

resultPagePPA K
!PPK L
)PPL M
;PPM N
}QQ 
publicSS 

virtualSS 
voidSS 
AddSS 
(SS 
TEntitySS #
entitySS$ *
)SS* +
=>TT 

_setTT 
.TT 
AddTT 
(TT 
entityTT 
)TT 
;TT 
publicVV 

virtualVV 
voidVV 
AddRangeVV  
(VV  !
IEnumerableVV! ,
<VV, -
TEntityVV- 4
>VV4 5
entitiesVV6 >
)VV> ?
=>WW 

_setWW 
.WW 
AddRangeWW 
(WW 
entitiesWW !
)WW! "
;WW" #
publicYY 

virtualYY 
voidYY 
StartTrackingYY %
(YY% &
TEntityYY& -
detachedEntityYY. <
)YY< =
=>ZZ 

_setZZ 
.ZZ 
UpdateZZ 
(ZZ 
detachedEntityZZ %
)ZZ% &
;ZZ& '
public__ 

abstract__ 
void__ 
Remove__ 
(__  
TEntity__  '
entityToDelete__( 6
)__6 7
;__7 8
publicdd 

abstractdd 
voiddd 
RemoveRangedd $
(dd$ %
IEnumerabledd% 0
<dd0 1
TEntitydd1 8
>dd8 9
entitiesToDeletedd: J
)ddJ K
;ddK L
}ee ©
C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\Repositories\PartnerRepositoryEF.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
.G H
RepositoriesH T
;T U
internal 
class	 
PartnerRepositoryEF "
:# $
RepositoryBaseEF% 5
<5 6
Partner6 =
>= >
,> ?
IPartnerRepository@ R
{		 
	protected

 
override

 

IQueryable

 !
<

! "
Partner

" )
>

) *
	BaseQuery

+ 4
=> 

_context 
. 
Partners 
; 
public 

PartnerRepositoryEF 
(  
ApplicationDbContext 3
context4 ;
,; <
IMapper= D
mapperE K
)K L
:M N
baseO S
(S T
contextT [
,[ \
mapper] c
)c d
{ 
} 
public 

override 
void 
Remove 
(  
Partner  '
entityToDelete( 6
)6 7
{ 
_context 
. 
Remove 
( 
entityToDelete &
)& '
;' (
} 
public 

override 
void 
RemoveRange $
($ %
IEnumerable% 0
<0 1
Partner1 8
>8 9
entitiesToDelete: J
)J K
{ 
foreach 
( 
var 
e 
in 
entitiesToDelete *
)* +
Remove 
( 
e 
) 
; 
} 
} ú
C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\Repositories\ProductRepositoryEF.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
.G H
RepositoriesH T
;T U
internal

 
class

	 
ProductRepositoryEF

 "
:

# $
RepositoryBaseEF

% 5
<

5 6
Product

6 =
>

= >
,

> ?
IProductRepository

@ R
{ 
	protected 
override 

IQueryable !
<! "
Product" )
>) *
	BaseQuery+ 4
=> 

_context 
. 
Products 
. 
Include $
($ %
x% &
=>' )
x* +
.+ ,
Mass, 0
)0 1
;1 2
public 

ProductRepositoryEF 
(  
ApplicationDbContext 3
context4 ;
,; <
IMapper= D
mapperE K
)K L
:M N
baseO S
(S T
contextT [
,[ \
mapper] c
)c d
{ 
} 
public 

Task 
< 
List 
< 
Product 
> 
> 
GetHeaviestProducts 2
(2 3
int3 6
numberOfProducts7 G
)G H
=> 

	BaseQuery 
. 
OrderByDescending 
( 
p  
=>! #
p$ %
.% &
Mass& *
)* +
. 
Take 
( 
numberOfProducts "
)" #
. 
ToListAsync 
( 
) 
; 
public 

Task 
< 
List 
< 
Product 
> 
> "
GetMostStockedProducts 5
(5 6
int6 9
numberOfProducts: J
)J K
=> 

	BaseQuery 
. 
OrderByDescending 
( 
p  
=>! #
p$ %
.% &
NumberInStock& 3
)3 4
. 
Take 
( 
numberOfProducts "
)" #
. 
ToListAsync 
( 
) 
; 
public 

override 
void 
Remove 
(  
Product  '
entityToDelete( 6
)6 7
{ 
_context   
.   
Remove   
(   
entityToDelete   &
)  & '
;  ' (
}!! 
public## 

override## 
void## 
RemoveRange## $
(##$ %
IEnumerable##% 0
<##0 1
Product##1 8
>##8 9
entitiesToDelete##: J
)##J K
{$$ 
foreach%% 
(%% 
var%% 
e%% 
in%% 
entitiesToDelete%% *
)%%* +
Remove&& 
(&& 
e&& 
)&& 
;&& 
}'' 
}(( ˘
ÉC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\Repositories\TransactionRepositoryEF.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
.G H
RepositoriesH T
;T U
internal		 
class			 #
TransactionRepositoryEF		 &
:		' (
RepositoryBaseEF		) 9
<		9 :
Transaction		: E
>		E F
,		F G"
ITransactionRepository		H ^
{

 
	protected 
override 

IQueryable !
<! "
Transaction" -
>- .
	BaseQuery/ 8
=> 

_context 
. 
Transactions  
.  !
Include! (
(( )
e) *
=>+ -
e. /
./ 0
TransactionLines0 @
)@ A
. 	
IgnoreQueryFilters	 
( 
) 
; 
public 
#
TransactionRepositoryEF "
(" # 
ApplicationDbContext# 7
context8 ?
,? @
IMapperA H
mapperI O
)O P
:Q R
baseS W
(W X
contextX _
,_ `
mappera g
)g h
{ 
} 
public 

override 
void 
Remove 
(  
Transaction  +
entityToDelete, :
): ;
=> 

_set 
. 
Remove 
( 
entityToDelete %
)% &
;& '
public 

override 
void 
RemoveRange $
($ %
IEnumerable% 0
<0 1
Transaction1 <
>< =
entitiesToDelete> N
)N O
=> 

_set 
. 
RemoveRange 
( 
entitiesToDelete ,
), -
;- .
public 

async 
Task 
< 
Transaction !
?! "
>" # 
GetEntireTransaction$ 8
(8 9
int9 <
id= ?
)? @
=> 

await 
	BaseQuery 
. 
Include 
( 
x 
=> 
x 
. 
Partner #
)# $
. 
Include 
( 
x 
=> 
x 
. 
TransactionLines ,
), -
.   
ThenInclude   
(   
x   
=>   !
x  " #
.  # $
Product  $ +
)  + ,
.!! 
FirstOrDefaultAsync!!  
(!!  !
x!!! "
=>!!# %
x!!& '
.!!' (
Id!!( *
==!!+ -
id!!. 0
)!!0 1
;!!1 2
}"" Ó'
iC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\DataAccess\UnitOfWork.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =

DataAccess= G
;G H
internal		 
class			 

UnitOfWork		 
:		 
IUnitOfWork		 '
{

 
private 
readonly  
ApplicationDbContext )

_dbContext* 4
;4 5
private !
IDbContextTransaction !
?! "
_currentTransaction# 6
;6 7
public 

IPartnerRepository 
Partners &
{' (
get) ,
;, -
}. /
public 

IProductRepository 
Products &
{' (
get) ,
;, -
}. /
public 
"
ITransactionRepository !
Transactions" .
{/ 0
get1 4
;4 5
}6 7
public 


UnitOfWork 
(  
ApplicationDbContext *
	dbContext+ 4
,4 5
IPartnerRepository6 H
partnersI Q
,Q R
IProductRepositoryS e
productsf n
,n o#
ITransactionRepository	p Ü
transactions
á ì
)
ì î
{ 

_dbContext 
= 
	dbContext 
; 
Partners 
= 
partners 
; 
Products 
= 
products 
; 
Transactions 
= 
transactions #
;# $
} 
public 

void 
Dispose 
( 
) 
=> 


_dbContext 
. 
Dispose 
( 
) 
;  
public"" 

Task"" 
SaveChanges"" 
("" 
)"" 
=>## 


_dbContext## 
.## 
SaveChangesAsync## &
(##& '
)##' (
;##( )
public%% 

bool%%  
HasActiveTransaction%% $
=>&& 

_currentTransaction&& 
is&& !
not&&" %
null&&& *
;&&* +
public(( 

async(( 
Task(( !
BeginTransactionAsync(( +
(((+ ,
)((, -
{)) 
if** 

(** 
_currentTransaction** 
is**  "
not**# &
null**' +
)**+ ,
{++ 	
throw,, 
new,, %
InvalidOperationException,, /
(,,/ 0
$str,,0 W
),,W X
;,,X Y
}-- 	
_currentTransaction// 
=// 
await// #

_dbContext//$ .
.//. /
Database/// 7
.//7 8!
BeginTransactionAsync//8 M
(//M N
IsolationLevel//N \
.//\ ]
RepeatableRead//] k
)//k l
;//l m
}00 
public22 

async22 
Task22 "
CommitTransactionAsync22 ,
(22, -
)22- .
{33 
try44 
{55 	
await66 

_dbContext66 
.66 
SaveChangesAsync66 -
(66- .
)66. /
;66/ 0
_currentTransaction88 
?88  
.88  !
Commit88! '
(88' (
)88( )
;88) *
}99 	
catch:: 
{;; 	
await<< $
RollbackTransactionAsync<< *
(<<* +
)<<+ ,
;<<, -
throw== 
;== 
}>> 	
finally?? 
{@@ 	
ifAA 
(AA 
_currentTransactionAA #
isAA$ &
notAA' *
nullAA+ /
)AA/ 0
{BB 
awaitCC 
_currentTransactionCC )
.CC) *
DisposeAsyncCC* 6
(CC6 7
)CC7 8
;CC8 9
_currentTransactionDD #
=DD$ %
nullDD& *
;DD* +
}EE 
}FF 	
}GG 
publicII 

asyncII 
TaskII $
RollbackTransactionAsyncII .
(II. /
)II/ 0
{JJ 
ifKK 

(KK 
_currentTransactionKK 
isKK  "
nullKK# '
)KK' (
{LL 	
throwMM 
newMM %
InvalidOperationExceptionMM /
(MM/ 0
$strMM0 h
)MMh i
;MMi j
}NN 	
tryPP 
{QQ 	
awaitRR 
_currentTransactionRR %
.RR% &
RollbackAsyncRR& 3
(RR3 4
)RR4 5
;RR5 6
}SS 	
finallyTT 
{UU 	
awaitVV 
_currentTransactionVV %
.VV% &
DisposeAsyncVV& 2
(VV2 3
)VV3 4
;VV4 5
_currentTransactionWW 
=WW  !
nullWW" &
;WW& '
}XX 	
}YY 
}ZZ √
lC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\Services\DateTimeService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =
Services= E
;E F
internal 
class	 
DateTimeService 
:  
	IDateTime! *
{ 
public 

DateTime 
Now 
=> 
DateTime #
.# $
Now$ '
;' (
} Ä8
sC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\Services\StockStatisticsService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
.< =
Services= E
;E F
class "
StockStatisticsService 
: #
IStockStatisticsService 6
{ 
private 
readonly  
ApplicationDbContext )

_dbContext* 4
;4 5
public 
"
StockStatisticsService !
(! " 
ApplicationDbContext" 6
	dbContext7 @
)@ A
=> 


_dbContext 
= 
	dbContext !
;! "
public 

async 
Task 
< 
( 
int 
ProductCount '
,' (
int) ,

TotalStock- 7
)7 8
>8 9!
GetProductStockCounts: O
(O P
)P Q
{ 
var 
res 
= 
await 

_dbContext "
." #
Products# +
. 
GroupBy 
( 
x 
=> 
$num 
) 
. 
Select 
( 
g 
=> 
new 
{ 
productCount 
= 
g  
.  !
Count! &
(& '
)' (
,( )

totalStock 
= 
g 
. 
Sum "
(" #
p# $
=>% '
p( )
.) *
NumberInStock* 7
)7 8
} 
) 
. 
SingleAsync 
( 
) 
; 
return 
( 
res 
. 
productCount  
,  !
res" %
.% &

totalStock& 0
)0 1
;1 2
} 
public 

async 
Task 
< 
Mass 
> $
GetProductStockTotalMass 4
(4 5
MassUnit5 =
unit> B
)B C
{   
var!! 
totalMassPerUnit!! 
=!! 
await!! $

_dbContext!!% /
.!!/ 0
Products!!0 8
."" 
GroupBy"" 
("" 
x"" 
=>"" 
x"" 
."" 
Mass""  
.""  !
Unit""! %
,""% &
p""' (
=>"") +
new"", /
{## 
p$$ 
.$$ 
Mass$$ 
,$$ 
p%% 
.%% 
NumberInStock%% 
}&& 
)&& 
.'' 
Select'' 
('' 
g'' 
=>'' 
new'' 
{(( 
MassUnit)) 
=)) 
g)) 
.)) 
Key))  
,))  !
	TotalMass** 
=** 
g** 
.** 
Sum** !
(**! "
x**" #
=>**$ &
x**' (
.**( )
Mass**) -
.**- .
Value**. 3
***4 5
x**6 7
.**7 8
NumberInStock**8 E
)**E F
}++ 
)++ 
.++ 
ToListAsync++ 
(++ 
)++ 
;++ 
var-- 
	totalMass-- 
=-- 
totalMassPerUnit-- (
... 
Select.. 
(.. 
x.. 
=>.. 
new.. 
Mass.. !
(..! "
x.." #
...# $
	TotalMass..$ -
,..- .
x../ 0
...0 1
MassUnit..1 9
)..9 :
)..: ;
.// 
Sum// 
(// 
mass// 
=>// 
mass// 
.// 
	ConvertTo// '
(//' (
unit//( ,
)//, -
.//- .
Value//. 3
)//3 4
;//4 5
return11 
new11 
Mass11 
(11 
	totalMass11 !
,11! "
unit11# '
)11' (
;11( )
}22 
public44 

async44 
Task44 
<44 
Money44 
>44 %
GetProductStockTotalValue44 6
(446 7
)447 8
{55 
var66 "
stockValuesPerCurrency66 "
=66# $
await66% *

_dbContext66+ 5
.665 6
Products666 >
.77 
GroupBy77 
(77 
x77 
=>77 
x77 
.77 
Price77 !
.77! "
Currency77" *
,77* +
p77, -
=>77. 0
new771 4
{88 
	UnitPrice99 
=99 
p99 
.99 
Price99 #
.99# $
Amount99$ *
,99* +
Currency:: 
=:: 
p:: 
.:: 
Price:: "
.::" #
Currency::# +
,::+ ,
NumberInStock;; 
=;; 
p;;  !
.;;! "
NumberInStock;;" /
}<< 
)<< 
.== 
Select== 
(== 
g== 
=>== 
new== 
{>> 
Currency?? 
=?? 
g?? 
.?? 
Key??  
,??  !

TotalValue@@ 
=@@ 
g@@ 
.@@ 
Sum@@ "
(@@" #
x@@# $
=>@@% '
x@@( )
.@@) *
	UnitPrice@@* 3
*@@4 5
x@@6 7
.@@7 8
NumberInStock@@8 E
)@@E F
}AA 
)AA 
.AA 
ToListAsyncAA 
(AA 
)AA 
;AA 
ifCC 

(CC "
stockValuesPerCurrencyCC "
.CC" #
CountCC# (
>CC) *
$numCC+ ,
)CC, -
throwDD 
newDD %
InvalidOperationExceptionDD /
(DD/ 0
$"EE 
$str	EE Ö
"
EEÖ Ü
+
EEá à
$"FF 
{FF 
stringFF 
.FF 
JoinFF 
(FF 
$strFF #
,FF# $"
stockValuesPerCurrencyFF% ;
.FF; <
SelectFF< B
(FFB C
xFFC D
=>FFE G
xFFH I
.FFI J
CurrencyFFJ R
.FFR S
CodeFFS W
)FFW X
)FFX Y
}FFY Z
$strFFZ [
"FF[ \
)FF\ ]
;FF] ^
varHH 

stockValueHH 
=HH "
stockValuesPerCurrencyHH /
.HH/ 0
FirstHH0 5
(HH5 6
)HH6 7
;HH7 8
returnII 
newII 
MoneyII 
(II 

stockValueII #
.II# $

TotalValueII$ .
,II. /
CurrencyII0 8
.II8 9
FromCodeII9 A
(IIA B

stockValueIIB L
.IIL M
CurrencyIIM U
.IIU V
CodeIIV Z
)IIZ [
)II[ \
;II\ ]
}JJ 
}KK æ
[C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\ApplicationDependencies\Startup.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %#
ApplicationDependencies% <
;< =
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
Startup 
{ 
public 

static 
void 
ConfigureServices (
(( )
this) -
IServiceCollection. @
servicesA I
,I J
IConfigurationK Y
_Z [
)[ \
{ 
services 
. 
	AddScoped 
< 
IProductRepository -
,- .
ProductRepositoryEF/ B
>B C
(C D
)D E
;E F
services 
. 
	AddScoped 
< 
IPartnerRepository -
,- .
PartnerRepositoryEF/ B
>B C
(C D
)D E
;E F
services 
. 
	AddScoped 
< "
ITransactionRepository 1
,1 2#
TransactionRepositoryEF3 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< 
IUnitOfWork &
,& '

UnitOfWork( 2
>2 3
(3 4
)4 5
;5 6
services 
. 
AddTransient 
< 
	IDateTime '
,' (
DateTimeService) 8
>8 9
(9 :
): ;
;; <
services 
. 
AddTransient 
< #
IStockStatisticsService 5
,5 6"
StockStatisticsService7 M
>M N
(N O
)O P
;P Q
} 
} õ
dC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Model\MySignInResult.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Model9 >
;> ?
public 
enum 
MySignInResult 
{ 
Failed 

,
 
Success 
, 
	LockedOut		 
,		 

NotAllowed

 
} ‚
`C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Model\SignInData.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Model9 >
;> ?
public 
record 

SignInData 
{ 
public 


TokenModel 
Token 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 

string 
Username 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 

string 
Email 
{ 
get 
; 
init #
;# $
}% &
=' (
null) -
!- .
;. /
public 

bool 
IsExternalLogin 
=>  "
!# $
string$ *
.* +
IsNullOrWhiteSpace+ =
(= >*
ExternalAuthenticationProvider> \
)\ ]
;] ^
public		 

string		 
?		 *
ExternalAuthenticationProvider		 1
{		2 3
get		4 7
;		7 8
init		9 =
;		= >
}		? @
}

 ˙
`C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Model\TokenModel.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Model9 >
;> ?
public 
record 

TokenModel 
{ 
public 

string 
	TokenType 
{ 
get !
;! "
}# $
public 

string 
AccessToken 
{ 
get  #
;# $
}% &
public 

DateTime 
	ExpiresAt 
{ 
get  #
;# $
}% &
public		 


TokenModel		 
(		 
string		 
	tokenType		 &
,		& '
string		( .
accessToken		/ :
,		: ;
DateTime		< D
	expiresAt		E N
)		N O
=>

 

(

 
	TokenType

 
,

 
AccessToken

 "
,

" #
	ExpiresAt

$ -
)

- .
=

/ 0
(

1 2
	tokenType

2 ;
,

; <
accessToken

= H
,

H I
	expiresAt

J S
)

S T
;

T U
public 

int '
GetRemainingLifetimeSeconds *
(* +
)+ ,
=> 

Math 
. 
Max 
( 
$num 
, 
( 
int 
) 
( 
	ExpiresAt &
-' (
DateTime) 1
.1 2
Now2 5
)5 6
.6 7
TotalSeconds7 C
)C D
;D E
} ã
fC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Services\ITokenService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Services9 A
;A B
public 
	interface 
ITokenService 
{ 

TokenModel %
CreateAuthenticationToken (
(( )
string) /
userId0 6
,6 7
string8 >

uniqueName? I
,I J
IEnumerableK V
<V W
(W X
stringX ^
	claimType_ h
,h i
stringj p

claimValueq {
){ |
>| }
?} ~
customClaims	 ã
=
å ç
null
é í
)
í ì
;
ì î
} á
eC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Services\IUserService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Services9 A
;A B
public 
	interface 
IUserService 
{ 
Task 
< 	
(	 

MySignInResult
 
result 
,  

SignInData! +
?+ ,
data- 1
)1 2
>2 3
SignIn4 :
(: ;
string; A
usernameB J
,J K
stringL R
passwordS [
)[ \
;\ ]
} ç$
hC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Services\JwtTokenService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Services9 A
;A B
public		 
class		 
JwtTokenService		 
:		 
ITokenService		 ,
{

 
private 
readonly "
AuthenticationSettings +
_authSettings, 9
;9 :
public 

JwtTokenService 
( "
AuthenticationSettings 1
authSettings2 >
)> ?
{ 
_authSettings 
= 
authSettings $
;$ %
} 
public 


TokenModel %
CreateAuthenticationToken /
(/ 0
string0 6
userId7 =
,= >
string? E

uniqueNameF P
,P Q
IEnumerable 
< 
( 
string 
	claimType %
,% &
string' -

claimValue. 8
)8 9
>9 :
?: ;
customClaims< H
=I J
nullK O
)O P
{ 
var 

expiration 
= 
DateTime !
.! "
UtcNow" (
.( )
AddDays) 0
(0 1
$num1 2
)2 3
;3 4
var 
tokenDescriptor 
= 
new !#
SecurityTokenDescriptor" 9
{ 	
Subject 
= 
new 
ClaimsIdentity (
(( )
new) ,
Claim- 2
[2 3
]3 4
{ 
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Iss2 5
,5 6
_authSettings7 D
.D E
	JwtIssuerE N
)N O
,O P
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Aud2 5
,5 6
_authSettings7 D
.D E
JwtAudienceE P
)P Q
,Q R
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2
Sub2 5
,5 6
userId7 =
)= >
,> ?
new 
Claim 
( #
JwtRegisteredClaimNames 1
.1 2

UniqueName2 <
,< =

uniqueName> H
)H I
} 
. 
Concat 
( 
customClaims 
? 
. 
Select $
($ %
x% &
=>' )
new* -
Claim. 3
(3 4
x4 5
.5 6
	claimType6 ?
,? @
xA B
.B C

claimValueC M
)M N
)N O
??P R

EnumerableS ]
.] ^
Empty^ c
<c d
Claimd i
>i j
(j k
)k l
)l m
)   
,   
Expires!! 
=!! 

expiration!!  
,!!  !
SigningCredentials"" 
=""  
new""! $
SigningCredentials""% 7
(""7 8
new""8 ; 
SymmetricSecurityKey""< P
(""P Q
_authSettings""Q ^
.""^ _
JwtSigningKey""_ l
)""l m
,""m n
SecurityAlgorithms	""o Å
.
""Å Ç!
HmacSha256Signature
""Ç ï
)
""ï ñ
}## 	
;##	 

var$$ 
tokenHandler$$ 
=$$ 
new$$ #
JwtSecurityTokenHandler$$ 6
($$6 7
)$$7 8
;$$8 9
var%% 
token%% 
=%% 
tokenHandler%%  
.%%  !
CreateToken%%! ,
(%%, -
tokenDescriptor%%- <
)%%< =
;%%= >
var&& 
tokenString&& 
=&& 
tokenHandler&& &
.&&& '

WriteToken&&' 1
(&&1 2
token&&2 7
)&&7 8
;&&8 9
return(( 
new(( 

TokenModel(( 
((( 
	tokenType)) 
:)) 
$str)) 
,))  
accessToken** 
:** 
tokenString** $
,**$ %
	expiresAt++ 
:++ 

expiration++ !
),, 	
;,,	 

}-- 
}.. ∏"
dC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Core\Services\UserService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Core4 8
.8 9
Services9 A
;A B
public 
class 
UserService 
: 
IUserService '
{ 
private		 
readonly		 
UserManager		  
<		  !
ApplicationUser		! 0
>		0 1
_userManager		2 >
;		> ?
private

 
readonly

 
SignInManager

 "
<

" #
ApplicationUser

# 2
>

2 3
_signInManager

4 B
;

B C
private 
readonly 
ITokenService "
_tokenService# 0
;0 1
public 

UserService 
( 
UserManager "
<" #
ApplicationUser# 2
>2 3
userManager4 ?
,? @
SignInManagerA N
<N O
ApplicationUserO ^
>^ _
signInManager` m
,m n
ITokenServiceo |
tokenService	} â
)
â ä
{ 
_userManager 
= 
userManager "
;" #
_signInManager 
= 
signInManager &
;& '
_tokenService 
= 
tokenService $
;$ %
} 
public 

async 
Task 
< 
( 
MySignInResult %
result& ,
,, -

SignInData. 8
?8 9
data: >
)> ?
>? @
SignInA G
(G H
stringH N
usernameO W
,W X
stringY _
password` h
)h i
{ 
var 
user 
= 
await 
_userManager %
.% &
FindByNameAsync& 5
(5 6
username6 >
)> ?
;? @
if 

( 
user 
== 
null 
) 
{ 	
return 
( 
MySignInResult "
." #
Failed# )
,) *
null+ /
)/ 0
;0 1
} 	
var 
result 
= 
await 
_signInManager )
.) *$
CheckPasswordSignInAsync* B
(B C
userC G
,G H
passwordI Q
,Q R
trueS W
)W X
;X Y
if!! 

(!! 
!!! 
result!! 
.!! 
	Succeeded!! 
)!! 
{"" 	
if## 
(## 
result## 
.## 
IsLockedOut## "
)##" #
return$$ 
($$ 
MySignInResult$$ &
.$$& '
	LockedOut$$' 0
,$$0 1
null$$2 6
)$$6 7
;$$7 8
if%% 
(%% 
result%% 
.%% 
IsNotAllowed%% #
)%%# $
return&& 
(&& 
MySignInResult&& &
.&&& '

NotAllowed&&' 1
,&&1 2
null&&3 7
)&&7 8
;&&8 9
throw'' 
new'' 
System'' 
.'' 
	Exception'' &
(''& '
$str''' C
)''C D
;''D E
}(( 	
var** 
token** 
=** 
_tokenService** !
.**! "%
CreateAuthenticationToken**" ;
(**; <
user**< @
.**@ A
Id**A C
,**C D
username**E M
)**M N
;**N O
return,, 
(,, 
MySignInResult-- 
.-- 
Success-- "
,--" #
data.. 
:.. 
new.. 

SignInData..  
(..  !
)..! "
{// 
Username00 
=00 
user00 
.00  
UserName00  (
,00( )
Email11 
=11 
user11 
.11 
Email11 "
,11" #
Token22 
=22 
token22 
}33 
)44 	
;44	 

}55 
}66 Æ
ÇC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Exceptions\ExternalAuthenticationInfoException.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =

Exceptions= G
;G H
public 
class /
#ExternalAuthenticationInfoException 0
:1 2
	Exception3 <
{ 
public 

readonly 
ExternalUserData $
?$ %
ReceivedData& 2
;2 3
public 

readonly 
IEnumerable 
<  
string  &
>& '
?' (
MissingFields) 6
;6 7
public

 
/
#ExternalAuthenticationInfoException

 .
(

. /
IEnumerable

/ :
<

: ;
string

; A
>

A B
?

B C
missingFields

D Q
=

R S
null

T X
,

X Y
ExternalUserData

Z j
?

j k
receivedData

l x
=

y z
null

{ 
)	

 Ä
: 	
base
 
( 
$str _
)_ `
{ 
ReceivedData 
= 
receivedData #
;# $
MissingFields 
= 
missingFields %
;% &
} 
} º
áC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Exceptions\ExternalAuthenticationPreventedException.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =

Exceptions= G
;G H
public 
class 4
(ExternalAuthenticationPreventedException 5
:6 7
	Exception8 A
{ 
public 
4
(ExternalAuthenticationPreventedException 3
(3 4
	Exception4 =
innerException> L
)L M
: 	
base
 
( 
$str	 è
,
è ê
innerException 
) 
{ 
} 
}		 ﬁ
ÉC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Exceptions\ExternalAuthenticationSetupException.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =

Exceptions= G
;G H
public 
class 0
$ExternalAuthenticationSetupException 1
:2 3
	Exception4 =
{ 
public 
0
$ExternalAuthenticationSetupException /
(/ 0
string0 6
provider7 ?
)? @
: 	
base
 
( 
$" 
$str $
{$ %
provider% -
}- .
$str. Z
"Z [
)[ \
{ 
} 
} “
xC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Model\ExternalAuthenticationProvider.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Model= B
;B C
public 
enum *
ExternalAuthenticationProvider *
{ 
Google 

} ≤
jC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Model\ExternalUserData.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Model= B
;B C
public 
record 
ExternalUserData 
{ 
public 

string 
Email 
{ 
get 
; 
init #
;# $
}% &
=' (
null) -
!- .
;. /
public 

bool 
EmailVerified 
{ 
get  #
;# $
init% )
;) *
}+ ,
public 

string 
FullName 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 

string 
	FirstName 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public		 

string		 
LastName		 
{		 
get		  
;		  !
init		" &
;		& '
}		( )
=		* +
null		, 0
!		0 1
;		1 2
}

 ä&
{C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Services\ExternalAuthenticationVerifier.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Services= E
;E F
public		 
class		 *
ExternalAuthenticationVerifier		 +
:		, -+
IExternalAuthenticationVerifier		. M
{

 
private 
readonly *
ExternalAuthenticationSettings 3!
_externalAuthSettings4 I
;I J
public 
*
ExternalAuthenticationVerifier )
() **
ExternalAuthenticationSettings* H
settingsI Q
)Q R
{ !
_externalAuthSettings 
= 
settings  (
;( )
} 
public 

Task 
< 
( 
bool 
success 
, 
ExternalUserData /
?/ 0
userData1 9
)9 :
>: ;
Verify< B
(B C*
ExternalAuthenticationProviderC a
providerb j
,j k
stringl r
idTokens z
)z {
=> 

provider 
switch 
{ 	*
ExternalAuthenticationProvider *
.* +
Google+ 1
=>2 4#
AuthenticateGoogleToken5 L
(L M
idTokenM T
)T U
,U V
_ 
=> 
throw 
new (
InvalidEnumArgumentException 7
(7 8
$"8 :
$str: P
{P Q
providerQ Y
}Y Z
$strZ o
"o p
)p q
} 	
;	 

private 
async 
Task 
< 
( 
bool 
success $
,$ %
ExternalUserData& 6
?6 7
userData8 @
)@ A
>A B#
AuthenticateGoogleTokenC Z
(Z [
string[ a
idTokenb i
)i j
{ 
if 

( 
string 
. 
IsNullOrWhiteSpace %
(% &!
_externalAuthSettings& ;
.; <
GoogleClientId< J
)J K
)K L
{ 	
throw 
new 0
$ExternalAuthenticationSetupException :
(: ;
provider; C
:C D
$strE M
)M N
;N O
} 	"
GoogleJsonWebSignature   
.   
Payload   &
data  ' +
;  + ,
try!! 
{"" 	
var## 
settings## 
=## 
new## "
GoogleJsonWebSignature## 5
.##5 6
ValidationSettings##6 H
(##H I
)##I J
{$$ 
Audience%% 
=%% 
new%% 
[%% 
]%%  
{%%! "!
_externalAuthSettings%%# 8
.%%8 9
GoogleClientId%%9 G
}%%H I
}&& 
;&& 
data'' 
='' 
await'' "
GoogleJsonWebSignature'' /
.''/ 0
ValidateAsync''0 =
(''= >
idToken''> E
,''E F
settings''G O
)''O P
;''P Q
}(( 	
catch)) 
()) 
	Exception)) 
ex)) 
))) 
{** 	
if++ 
(++ 
ex++ 
is++ 
InvalidJwtException++ )
)++) *
{,, 
return-- 
(-- 
false-- 
,-- 
null-- #
)--# $
;--$ %
}.. 
else// 
{00 
throw11 
new11 4
(ExternalAuthenticationPreventedException11 B
(11B C
ex11C E
)11E F
;11F G
}22 
}33 	
return55 
(55 
success66 
:66 
true66 
,66 
userData77 
:77 
new77 
ExternalUserData77 *
(77* +
)77+ ,
{88 
Email99 
=99 
data99 
.99 
Email99 "
,99" #
EmailVerified:: 
=:: 
data::  $
.::$ %
EmailVerified::% 2
,::2 3
FullName;; 
=;; 
data;; 
.;;  
Name;;  $
,;;$ %
LastName<< 
=<< 
data<< 
.<<  

FamilyName<<  *
,<<* +
	FirstName== 
=== 
data==  
.==  !
	GivenName==! *
}>> 
)?? 	
;??	 

}@@ 
}AA ∂)
rC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Services\ExternalSignInService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Services= E
;E F
public 
class !
ExternalSignInService "
:# $"
IExternalSignInService% ;
{		 
private

 
readonly

 +
IExternalAuthenticationVerifier

 4
	_verifier

5 >
;

> ?
private 
readonly 
ITokenService "
_tokenService# 0
;0 1
public 
!
ExternalSignInService  
(  !+
IExternalAuthenticationVerifier! @
verifierA I
,I J
ITokenServiceK X
tokenServiceY e
)e f
{ 
	_verifier 
= 
verifier 
; 
_tokenService 
= 
tokenService $
;$ %
} 
public 

async 
Task 
< 
( 
MySignInResult %
result& ,
,, -

SignInData. 8
?8 9
data: >
)> ?
>? @
SignInExternalA O
(O P*
ExternalAuthenticationProviderP n
providero w
,w x
stringy 
idToken
Ä á
)
á à
{ 
var 
( 
success 
, 
userData 
) 
=  !
await" '
	_verifier( 1
.1 2
Verify2 8
(8 9
provider9 A
,A B
idTokenC J
)J K
;K L
if 

( 
! 
success 
) 
{ 	
return 
( 
MySignInResult "
." #
Failed# )
,) *
null+ /
)/ 0
;0 1
} 	
if 

( 
string 
. 
IsNullOrWhiteSpace %
(% &
userData& .
!. /
./ 0
Email0 5
)5 6
||7 9
string: @
.@ A
IsNullOrWhiteSpaceA S
(S T
userDataT \
.\ ]
FullName] e
)e f
)f g
{ 	
var 
missingFields 
= 
new  #
List$ (
<( )
string) /
>/ 0
(0 1
)1 2
;2 3
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *
userData* 2
.2 3
Email3 8
)8 9
)9 :
missingFields; H
.H I
AddI L
(L M
nameofM S
(S T
ExternalUserDataT d
.d e
Emaile j
)j k
)k l
;l m
if   
(   
string   
.   
IsNullOrWhiteSpace   )
(  ) *
userData  * 2
.  2 3
FullName  3 ;
)  ; <
)  < =
missingFields  > K
.  K L
Add  L O
(  O P
nameof  P V
(  V W
ExternalUserData  W g
.  g h
FullName  h p
)  p q
)  q r
;  r s
throw"" 
new"" /
#ExternalAuthenticationInfoException"" 9
(""9 :
missingFields## 
:## 
missingFields## ,
,##, -
receivedData$$ 
:$$ 
userData$$ &
)%% 
;%% 
}&& 	
var,, 
token,, 
=,, 
_tokenService,, !
.,,! "%
CreateAuthenticationToken,," ;
(,,; <
userId-- 
:-- 
$"-- 
$str-- 
{-- 
provider-- #
}--# $
$str--$ %
{--% &
userData--& .
.--. /
Email--/ 4
}--4 5
"--5 6
,--6 7

uniqueName.. 
:.. 
$".. 
{.. 
userData.. #
...# $
FullName..$ ,
}.., -
$str..- /
{../ 0
provider..0 8
}..8 9
$str..9 :
"..: ;
)..; <
;..< =
return00 
(00 
result11 
:11 
MySignInResult11 "
.11" #
Success11# *
,11* +
data22 
:22 
new22 

SignInData22  
(22  !
)22! "
{33 *
ExternalAuthenticationProvider44 .
=44/ 0
provider441 9
.449 :
ToString44: B
(44B C
)44C D
,44D E
Username55 
=55 
userData55 #
.55# $
FullName55$ ,
,55, -
Email66 
=66 
userData66  
.66  !
Email66! &
,66& '
Token77 
=77 
token77 
}88 
)99 	
;99	 

}:: 
};; Õ
|C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Services\IExternalAuthenticationVerifier.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Services= E
;E F
public 
	interface +
IExternalAuthenticationVerifier 0
{ 
Task 
< 	
(	 

bool
 
success 
, 
ExternalUserData (
?( )
userData* 2
)2 3
>3 4
Verify5 ;
(; <*
ExternalAuthenticationProvider< Z
provider[ c
,c d
stringe k
idTokenl s
)s t
;t u
}		 ¬
sC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\External\Services\IExternalSignInService.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
External4 <
.< =
Services= E
;E F
public 
	interface "
IExternalSignInService '
{ 
Task 
< 	
(	 

MySignInResult
 
result 
,  

SignInData! +
?+ ,
data- 1
)1 2
>2 3
SignInExternal4 B
(B C*
ExternalAuthenticationProviderC a
providerb j
,j k
stringl r
idTokens z
)z {
;{ |
}		 æ
jC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Settings\AuthenticationSettings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Settings4 <
;< =
public 
class "
AuthenticationSettings #
{ 
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public 

string 
	JwtIssuer 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
default- 4
!4 5
;5 6
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public		 

string		 
JwtAudience		 
{		 
get		  #
;		# $
init		% )
;		) *
}		+ ,
=		- .
default		/ 6
!		6 7
;		7 8
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public 

string 
JwtSigningKeyBase64 %
{ 
get 
=>  
_jwtSigningKeyBase64 #
;# $
init 
{  
_jwtSigningKeyBase64 #
=$ %
value& +
;+ ,
JwtSigningKey- :
=; <
Convert= D
.D E
FromBase64StringE U
(U V
valueV [
)[ \
;\ ]
}^ _
} 
private 
string  
_jwtSigningKeyBase64 '
=( )
default* 1
!1 2
;2 3
public 

byte 
[ 
] 
JwtSigningKey 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
=6 7
default8 ?
!? @
;@ A
[ 
Range 

(
 
$num 
, 
int 
. 
MaxValue 
) 
] 
public 

int "
TokenExpirationSeconds %
{& '
get( +
;+ ,
init- 1
;1 2
}3 4
} …
rC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Settings\ExternalAuthenticationSettings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
.3 4
Settings4 <
;< =
public 
class *
ExternalAuthenticationSettings +
{ 
public 

string 
? 
GoogleClientId !
{" #
get$ '
;' (
init) -
;- .
}/ 0
} ô-
RC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authentication\Startup.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authentication% 3
;3 4
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
Startup 
{ 
public 

static 
void 
ConfigureServices (
(( )
this) -
IServiceCollection. @
servicesA I
,I J
IConfigurationK Y
configurationZ g
)g h
{ 
services 
. 
	AddScoped 
< 
IUserService '
,' (
UserService) 4
>4 5
(5 6
)6 7
;7 8
services 
. 
	AddScoped 
< 
ITokenService (
,( )
JwtTokenService* 9
>9 :
(: ;
); <
;< =
services 
. 
RegisterMyOptions "
<" #"
AuthenticationSettings# 9
>9 :
(: ;
); <
;< =+
ConfigureLocalJwtAuthentication '
(' (
services( 0
,0 1
configuration2 ?
.? @
GetMyOptions@ L
<L M"
AuthenticationSettingsM c
>c d
(d e
)e f
)f g
;g h
services 
. 
RegisterMyOptions "
<" #*
ExternalAuthenticationSettings# A
>A B
(B C
)C D
;D E
services 
. 
	AddScoped 
< +
IExternalAuthenticationVerifier :
,: ;*
ExternalAuthenticationVerifier< Z
>Z [
([ \
)\ ]
;] ^
services 
. 
	AddScoped 
< "
IExternalSignInService 1
,1 2!
ExternalSignInService3 H
>H I
(I J
)J K
;K L
} 
public 

static 
void 
	Configure  
(  !
IApplicationBuilder! 4
app5 8
)8 9
{   
app!! 
.!! 
UseAuthentication!! 
(!! 
)!! 
;!!  
app"" 
."" 
UseAuthorization"" 
("" 
)"" 
;"" 
}## 
private)) 
static)) 
void)) +
ConfigureLocalJwtAuthentication)) 7
())7 8
IServiceCollection))8 J
services))K S
,))S T"
AuthenticationSettings))U k
authSettings))l x
)))x y
{** #
JwtSecurityTokenHandler,, 
.,,  #
DefaultMapInboundClaims,,  7
=,,8 9
false,,: ?
;,,? @
services.. 
.// 
AddAuthentication// 
(// 
options// &
=>//' )
{00 
options11 
.11 %
DefaultAuthenticateScheme11 1
=112 3
JwtBearerDefaults114 E
.11E F 
AuthenticationScheme11F Z
;11Z [
options22 
.22 
DefaultScheme22 %
=22& '
JwtBearerDefaults22( 9
.229 : 
AuthenticationScheme22: N
;22N O
options33 
.33 "
DefaultChallengeScheme33 .
=33/ 0
JwtBearerDefaults331 B
.33B C 
AuthenticationScheme33C W
;33W X
}44 
)44 
.55 
AddJwtBearer55 
(55 
options55 !
=>55" $
{66 
options88 
.88 
Events88 
=88  
new88! $
JwtBearerEvents88% 4
(884 5
)885 6
{99 
OnMessageReceived:: %
=::& '
ctx::( +
=>::, .
{;; 
return== 
Task== #
.==# $

FromResult==$ .
(==. /
true==/ 3
)==3 4
;==4 5
}>> 
}?? 
;?? 
optionsBB 
.BB  
RequireHttpsMetadataBB ,
=BB- .
falseBB/ 4
;BB4 5
optionsCC 
.CC 
	SaveTokenCC !
=CC" #
trueCC$ (
;CC( )
optionsDD 
.DD %
TokenValidationParametersDD 1
=DD2 3
newDD4 7%
TokenValidationParametersDD8 Q
{EE 
ValidateIssuerFF "
=FF# $
trueFF% )
,FF) *
ValidIssuerGG 
=GG  !
authSettingsGG" .
.GG. /
	JwtIssuerGG/ 8
,GG8 9
ValidateAudienceII $
=II% &
trueII' +
,II+ ,
ValidAudienceJJ !
=JJ" #
authSettingsJJ$ 0
.JJ0 1
	JwtIssuerJJ1 :
,JJ: ;$
ValidateIssuerSigningKeyOO ,
=OO- .
trueOO/ 3
,OO3 4
IssuerSigningKeyPP $
=PP% &
newPP' * 
SymmetricSecurityKeyPP+ ?
(PP? @
authSettingsPP@ L
.PPL M
JwtSigningKeyPPM Z
)PPZ [
,PP[ \
	ClockSkewQQ 
=QQ 
TimeSpanQQ  (
.QQ( )
FromMinutesQQ) 4
(QQ4 5
$numQQ5 6
)QQ6 7
,QQ7 8!
RequireExpirationTimeSS )
=SS* +
trueSS, 0
,SS0 1
ValidateLifetimeTT $
=TT% &
trueTT' +
,TT+ ,
}UU 
;UU 
}VV 
)VV 
;VV 
}WW 
}XX §	
_C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authorization\Constants\KnownClaims.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authorization% 2
.2 3
	Constants3 <
;< =
public 
static 
class 
KnownClaims 
{ 
public 

static 
class 
ExampleClaim $
{ 
public 
static 
string 
Name !
=>" $
nameof% +
(+ ,
ExampleClaim, 8
)8 9
;9 :
public		 
static		 
class		 
Values		 "
{

 	
public 
static 
string  
ExampleValue1! .
=>/ 1
nameof2 8
(8 9
ExampleValue19 F
)F G
;G H
public 
static 
string  
ExampleValue2! .
=>/ 1
nameof2 8
(8 9
ExampleValue29 F
)F G
;G H
} 	
} 
} ä
_C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authorization\Constants\PolicyNames.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authorization% 2
.2 3
	Constants3 <
;< =
public 
static 
class 
PolicyNames 
{ 
public 

const 
string 
SamplePolicy $
=% &
$str' 5
;5 6
} ï
QC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Authorization\Startup.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Authorization% 2
;2 3
[ #
ExcludeFromCodeCoverage 
] 
internal		 
static			 
class		 
Startup		 
{

 
public 

static 
void 
ConfigureServices (
(( )
IServiceCollection) ;
services< D
,D E
IConfigurationF T
_U V
)V W
{ 
} 
} Â
hC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\AzureKeyVault\Settings\AzureKeyVaultSettings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
AzureKeyVault% 2
.2 3
Settings3 ;
;; <
internal 
class	 !
AzureKeyVaultSettings $
{ 
[ 

RequiredIf 
( 
nameof 
( 
AddToConfiguration )
)) *
,* +
true, 0
)0 1
]1 2
public		 

string		 
?		 

ServiceUrl		 
{		 
get		  #
;		# $
init		% )
;		) *
}		+ ,
[ 
MemberNotNullWhen 
( 
true 
, 
nameof #
(# $

ServiceUrl$ .
). /
)/ 0
]0 1
public 

bool 
AddToConfiguration "
{# $
get% (
;( )
init* .
;. /
}0 1
} è
QC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\AzureKeyVault\Startup.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
AzureKeyVault% 2
;2 3
[		 #
ExcludeFromCodeCoverage		 
]		 
internal

 
static

	 
class

 
Startup

 
{ 
public 

static 
void %
ConfigureAppConfiguration 0
(0 1
HostBuilderContext1 C
_D E
,E F!
IConfigurationBuilderG \
configBuilder] j
)j k
{ 
var 
settings 
= 
configBuilder $
.$ %
Build% *
(* +
)+ ,
., -
GetMyOptions- 9
<9 :!
AzureKeyVaultSettings: O
>O P
(P Q
)Q R
;R S
if 

( 
settings 
is 
not 
null  
&&! #
settings$ ,
., -
AddToConfiguration- ?
)? @
{ 	
configBuilder 
. 
AddAzureKeyVault *
(* +
new+ .
Uri/ 2
(2 3
settings3 ;
.; <

ServiceUrl< F
)F G
,G H
newI L"
DefaultAzureCredentialM c
(c d
)d e
)e f
;f g
} 	
} 
} Ÿ#
eC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Common\Extensions\ConfigurationExtensions.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
;$ %
public 
static 
class #
ConfigurationExtensions +
{ 
const		 	
string		
 %
ConfigMissingErrorMessage		 *
=		+ ,
$str			- ‡
;
		‡ ·
public 

static 
T 
GetMyOptions  
<  !
T! "
>" #
($ %
this% )
IConfiguration* 8
configuration9 F
,F G
boolH L*
requiredToExistInConfigurationM k
=l m
falsen s
)s t
whereu z
T{ |
:} ~
class	 Ñ
,
Ñ Ö
new
Ü â
(
â ä
)
ä ã
{ 
var 
bound 
= 
configuration !
.! "

GetSection" ,
(, -
typeof- 3
(3 4
T4 5
)5 6
.6 7
Name7 ;
); <
.< =
Get= @
<@ A
TA B
>B C
(C D
)D E
;E F
if 

( 
bound 
is 
null 
&& *
requiredToExistInConfiguration ;
); <
throw 
new %
InvalidOperationException /
(/ 0
string0 6
.6 7
Format7 =
(= >%
ConfigMissingErrorMessage> W
,W X
typeofY _
(_ `
T` a
)a b
.b c
Namec g
)g h
)h i
;i j
bound 
??= 
new 
T 
( 
) 
; 
	Validator 
. 
ValidateObject  
(  !
bound! &
,& '
new( +
ValidationContext, =
(= >
bound> C
)C D
,D E!
validateAllPropertiesF [
:[ \
true] a
)a b
;b c
return 
bound 
; 
} 
public)) 
static)) 
void)) 
RegisterMyOptions)) $
<))$ %
T))% &
>))& '
())' (
this))( ,
IServiceCollection))- ?
services))@ H
,))H I
bool))J N*
requiredToExistInConfiguration))O m
=))n o
true))p t
)))t u
where))v {
T))| }
:))~ 
class
))Ä Ö
{** 
var++ 
optionsBuilder++ 
=++ 
services++ !
.++! "

AddOptions++" ,
<++, -
T++- .
>++. /
(++/ 0
)++0 1
.,, 	
BindConfiguration,,	 
(,, 
typeof,, !
(,,! "
T,," #
),,# $
.,,$ %
Name,,% )
),,) *
.-- 	#
ValidateDataAnnotations--	  
(--  !
)--! "
... 	
ValidateOnStart..	 
(.. 
).. 
;.. 
if00 
(00 *
requiredToExistInConfiguration00 &
)00& '
optionsBuilder11 
.11 
Validate11 
<11  
IConfiguration11  .
>11. /
(11/ 0
(110 1
_111 2
,112 3
configuration114 A
)11A B
=>22 
configuration22 
.22 

GetSection22 '
(22' (
typeof22( .
(22. /
T22/ 0
)220 1
.221 2
Name222 6
)226 7
.227 8
Exists228 >
(22> ?
)22? @
,22@ A
string22B H
.22H I
Format22I O
(22O P%
ConfigMissingErrorMessage22P i
,22i j
typeof22k q
(22q r
T22r s
)22s t
.22t u
Name22u y
)22y z
)22z {
;22{ |
services44 
.44 
AddSingleton44 
(44 
resolver44 "
=>44# %
resolver44& .
.44. /
GetRequiredService44/ A
<44A B
IOptions44B J
<44J K
T44K L
>44L M
>44M N
(44N O
)44O P
.44P Q
Value44Q V
)44V W
;44W X
}55 
}66 ÜV
aC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Common\Extensions\QueryableExtensions.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
;$ %
internal 
static	 
class 
QueryableExtensions )
{ 
public 

static 

IQueryable 
< 
T 
> 
ApplyFilter  +
<+ ,
T, -
>- .
(. /
this/ 3

IQueryable4 >
<> ?
T? @
>@ A
queryB G
,G H
stringI O
?O P
oDataFilterStringQ b
)b c
{ 
try 
{ 	
return 
ApplyFilterInternal &
(& '
query' ,
,, -
oDataFilterString. ?
)? @
;@ A
} 	
catch 
( 
	Exception 
e 
) 
{ 	
throw 
new 
FormatException %
(% &
$"& (
$str( E
{E F
oDataFilterStringF W
}W X
$strX e
"e f
,f g
eh i
)i j
;j k
} 	
} 
public 

static 

IQueryable 
< 
T 
> 

ApplyOrder  *
<* +
T+ ,
>, -
(- .
this. 2

IQueryable3 =
<= >
T> ?
>? @
queryA F
,F G
stringH N
?N O
oDataOrderByStringP b
,b c
intd g#
maximumNumberOfOrderingh 
=
Ä Å
$num
Ç É
)
É Ñ
{ 
try 
{ 	
return   
ApplyOrderInternal   %
(  % &
query  & +
,  + ,
oDataOrderByString  - ?
,  ? @#
maximumNumberOfOrdering  A X
)  X Y
;  Y Z
}!! 	
catch"" 
("" 
	Exception"" 
e"" 
)"" 
{## 	
throw$$ 
new$$ 
FormatException$$ %
($$% &
$"$$& (
$str$$( F
{$$F G
oDataOrderByString$$G Y
}$$Y Z
$str$$Z g
"$$g h
,$$h i
e$$j k
)$$k l
;$$l m
}%% 	
}&& 
public++ 

static++ 

IQueryable++ 
<++ 
T++ 
>++ 
ApplyPaging++  +
<+++ ,
T++, -
>++- .
(++. /
this++/ 3

IQueryable++4 >
<++> ?
T++? @
>++@ A
query++B G
,++G H
int++I L
pageSize++M U
,++U V
int++W Z
	pageIndex++[ d
)++d e
=>,, 

query,, 
.-- 
Skip-- 
(-- 
(-- 
	pageIndex-- 
--- 
$num--  
)--  !
*--" #
pageSize--$ ,
)--, -
... 
Take.. 
(.. 
pageSize.. 
).. 
;.. 
private00 
static00 

IQueryable00 
<00 
T00 
>00  
ApplyFilterInternal00! 4
<004 5
T005 6
>006 7
(007 8

IQueryable008 B
<00B C
T00C D
>00D E
query00F K
,00K L
string00M S
?00S T
oDataFilterString00U f
)00f g
{11 
if22 

(22 
string22 
.22 
IsNullOrWhiteSpace22 %
(22% &
oDataFilterString22& 7
)227 8
)228 9
{33 	
return44 
query44 
;44 
}55 	
var77 
filterExpression77 
=77 
new77 "
ODataFilterLanguage77# 6
(776 7
)777 8
.778 9
Parse779 >
<77> ?
T77? @
>77@ A
(77A B
oDataFilterString77B S
)77S T
;77T U
return88 
query88 
.88 
Where88 
(88 
filterExpression88 +
)88+ ,
;88, -
}99 
private;; 
static;; 

IQueryable;; 
<;; 
T;; 
>;;  
ApplyOrderInternal;;! 3
<;;3 4
T;;4 5
>;;5 6
(;;6 7

IQueryable;;7 A
<;;A B
T;;B C
>;;C D
query;;E J
,;;J K
string;;L R
?;;R S
oDataOrderByString;;T f
,;;f g
int;;h k$
maximumNumberOfOrdering	;;l É
)
;;É Ñ
{<< 
if== 

(== 
string== 
.== 
IsNullOrWhiteSpace== %
(==% &
oDataOrderByString==& 8
)==8 9
)==9 :
{>> 	
return?? 
query?? 
;?? 
}@@ 	
boolBB 
firstOrderingBB 
=BB 
trueBB !
;BB! "
foreachCC 
(CC 
varCC 
(CC 
propertyNameCC "
,CC" #
orderCC$ )
)CC) *
inCC+ -
GetOrderEntriesCC. =
(CC= >
oDataOrderByStringCC> P
,CCP Q#
maximumNumberOfOrderingCCR i
)CCi j
)CCj k
{DD 	
queryEE 
=EE 
ApplyOrderingEE !
(EE! "
queryEE" '
,EE' (
propertyNameEE) 5
,EE5 6
orderEE7 <
,EE< =
firstOrderingEE> K
)EEK L
;EEL M
firstOrderingFF 
=FF 
falseFF !
;FF! "
}GG 	
returnJJ 
queryJJ 
;JJ 
staticLL 
IEnumerableLL 
<LL 
(LL 
stringLL "
propertyPathLL# /
,LL/ 0
	SortOrderLL1 :
orderLL; @
)LL@ A
>LLA B
GetOrderEntriesLLC R
(LLR S
stringLLS Y
orderByStringLLZ g
,LLg h
intLLi l
	maxOrdersLLm v
)LLv w
{MM 	
returnNN 
orderByStringNN  
.OO 
SplitOO 
(OO 
$charOO 
,OO 
countOO !
:OO! "
	maxOrdersOO# ,
,OO, -
StringSplitOptionsOO. @
.OO@ A
RemoveEmptyEntriesOOA S
|OOT U
StringSplitOptionsOOV h
.OOh i
TrimEntriesOOi t
)OOt u
.PP 
SelectPP 
(PP 
orderStrPP  
=>PP! #
{QQ 
varRR 
dividerRR 
=RR  !
orderStrRR" *
.RR* +
IndexOfRR+ 2
(RR2 3
$charRR3 6
)RR6 7
;RR7 8
ifSS 
(SS 
dividerSS 
<SS  !
$numSS" #
)SS# $
returnSS% +
(SS, -
propertyPathSS- 9
:SS9 :
orderStrSS; C
,SSC D
orderSSE J
:SSJ K
	SortOrderSSL U
.SSU V
AscSSV Y
)SSY Z
;SSZ [
elseTT 
returnTT 
(TT  !
propertyPathUU $
:UU$ %
orderStrUU& .
[UU. /
$numUU/ 0
..UU0 2
dividerUU2 9
]UU9 :
,UU: ;
orderVV 
:VV 
EnumVV #
.VV# $
ParseVV$ )
<VV) *
	SortOrderVV* 3
>VV3 4
(VV4 5
orderStrVV5 =
[VV= >
dividerVV> E
..VVE G
]VVG H
.VVH I
TrimVVI M
(VVM N
)VVN O
,VVO P

ignoreCaseVVQ [
:VV[ \
trueVV] a
)VVa b
)WW 
;WW 
}XX 
)XX 
;XX 
}YY 	
static[[ 

IQueryable[[ 
<[[ 
T[[ 
>[[ 
ApplyOrdering[[ *
([[* +

IQueryable[[+ 5
<[[5 6
T[[6 7
>[[7 8
query[[9 >
,[[> ?
string[[@ F
propertyPath[[G S
,[[S T
	SortOrder[[U ^
order[[_ d
,[[d e
bool[[f j
firstOrdering[[k x
)[[x y
{\\ 	
var]] 
param]] 
=]] 

Expression]] "
.]]" #
	Parameter]]# ,
(]], -
typeof]]- 3
(]]3 4
T]]4 5
)]]5 6
,]]6 7
$str]]8 ;
)]]; <
;]]< =
var^^ 
member^^ 
=^^ 
(^^ 
MemberExpression^^ *
)^^* +
propertyPath^^+ 7
.^^7 8
Split^^8 =
(^^= >
$char^^> A
)^^A B
.^^B C
	Aggregate^^C L
(^^L M
(^^M N

Expression^^N X
)^^X Y
param^^Y ^
,^^^ _

Expression^^` j
.^^j k
Property^^k s
)^^s t
;^^t u
var__ 
exp__ 
=__ 

Expression__  
.__  !
Lambda__! '
(__' (
member__( .
,__. /
param__0 5
)__5 6
;__6 7
string`` 

methodName`` 
=`` 
order``  %
switch``& ,
{aa 
	SortOrderbb 
.bb 
Ascbb 
=>bb  
firstOrderingbb! .
?bb/ 0
$strbb1 :
:bb; <
$strbb= E
,bbE F
	SortOrdercc 
.cc 
Desccc 
=>cc !
firstOrderingcc" /
?cc0 1
$strcc2 E
:ccF G
$strccH Z
}dd 
;dd 
Typeee 
[ee 
]ee 
typesee 
=ee 
newee 
Typeee #
[ee# $
]ee$ %
{ee& '
queryee( -
.ee- .
ElementTypeee. 9
,ee9 :
expee; >
.ee> ?
Bodyee? C
.eeC D
TypeeeD H
}eeI J
;eeJ K
varff 
orderByExpressionff !
=ff" #

Expressionff$ .
.ff. /
Callff/ 3
(ff3 4
typeofff4 :
(ff: ;
	Queryableff; D
)ffD E
,ffE F

methodNameffG Q
,ffQ R
typesffS X
,ffX Y
queryffZ _
.ff_ `

Expressionff` j
,ffj k
expffl o
)ffo p
;ffp q
returngg 
querygg 
.gg 
Providergg !
.gg! "
CreateQuerygg" -
<gg- .
Tgg. /
>gg/ 0
(gg0 1
orderByExpressiongg1 B
)ggB C
;ggC D
}hh 	
}ii 
privatekk 
enumkk 
	SortOrderkk 
{ll 
Ascmm 
,mm 
Descnn 
}oo 
}pp ÷
ZC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Common\Validation\IValidatable.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Common% +
.+ ,

Validation, 6
;6 7
internal 
	interface	 
IValidatable 
{ 
public 

void 
Validate 
( 
) 
; 
} ô
aC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Common\Validation\RequiredIfAttribute.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Common% +
.+ ,

Validation, 6
;6 7
[ 
AttributeUsage 
( 
AttributeTargets  
.  !
Property! )
)) *
]* +
public 
class 
RequiredIfAttribute  
:! "
RequiredAttribute# 4
{ 
private		 
readonly		 
string		 
_otherPropertyName		 .
;		. /
private

 
readonly

 
bool

 
_otherPropertyValue

 -
;

- .
public 

RequiredIfAttribute 
( 
string %
otherPropertyName& 7
,7 8
bool9 =
otherPropertyValue> P
)P Q
{ 
_otherPropertyName 
= 
otherPropertyName .
;. /
_otherPropertyValue 
= 
otherPropertyValue 0
;0 1
AllowEmptyStrings 
= 
false !
;! "
} 
	protected 
override 
ValidationResult '
?' (
IsValid) 0
(0 1
object1 7
?7 8
value9 >
,> ?
ValidationContext@ Q
contextR Y
)Y Z
{ 
if 

(  
IsValidationRequired  
(  !
context! (
)( )
)) *
return+ 1
base2 6
.6 7
IsValid7 >
(> ?
value? D
,D E
contextF M
)M N
;N O
return 
ValidationResult 
.  
Success  '
;' (
} 
private 
bool  
IsValidationRequired %
(% &
ValidationContext& 7
context8 ?
)? @
{ 
var 
otherProperty 
= 
context #
.# $
ObjectInstance$ 2
.2 3
GetType3 :
(: ;
); <
.< =
GetProperty= H
(H I
_otherPropertyNameI [
)[ \
;\ ]
if!! 

(!! 
otherProperty!! 
is!! 
null!! !
)!!! "
throw"" 
new"" 
ArgumentException"" '
(""' (
$"""( *
$str""* B
{""B C
_otherPropertyName""C U
}""U V
$str""V 
"	"" Ä
)
""Ä Å
;
""Å Ç
if$$ 

($$ 
otherProperty$$ 
.$$ 
PropertyType$$ &
!=$$' )
typeof$$* 0
($$0 1
bool$$1 5
)$$5 6
&&$$7 9
otherProperty$$: G
.$$G H
PropertyType$$H T
!=$$U W
typeof$$X ^
($$^ _
bool$$_ c
?$$c d
)$$d e
)$$e f
throw%% 
new%% 
ArgumentException%% '
(%%' (
$"%%( *
$str%%* B
{%%B C
_otherPropertyName%%C U
}%%U V
$str	%%V á
"
%%á à
)
%%à â
;
%%â ä
var''  
ifConditionSatisfied''  
=''! "
otherProperty''# 0
.''0 1
GetValue''1 9
(''9 :
context'': A
.''A B
ObjectInstance''B P
)''P Q
as''R T
bool''U Y
?''Y Z
==''[ ]
_otherPropertyValue''^ q
;''q r
return))  
ifConditionSatisfied)) #
;))# $
}** 
}++ J
HC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\GlobalUsings.csê
ZC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Identity\Model\ApplicationUser.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Identity% -
.- .
Model. 3
;3 4
public 
class 
ApplicationUser 
: 
IdentityUser +
{ 
} Á
LC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Identity\Startup.cs
	namespace		 	
MyWarehouse		
 
.		 
Infrastructure		 $
.		$ %
Identity		% -
;		- .
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
Startup 
{ 
public 

static 
void 
ConfigureServices (
(( )
IServiceCollection) ;
services< D
,D E
IConfigurationF T
_U V
)V W
{ 
services 
. 
AddIdentity 
< 
ApplicationUser ,
,, -
IdentityRole. :
>: ;
(; <
options< C
=>D F
{ 	
options 
. 
User 
. 
RequireUniqueEmail +
=, -
true. 2
;2 3
options 
. 
ClaimsIdentity "
." #
UserIdClaimType# 2
=3 4#
JwtRegisteredClaimNames5 L
.L M
SubM P
;P Q
} 	
)	 

. $
AddDefaultTokenProviders %
(% &
)& '
. $
AddEntityFrameworkStores %
<% & 
ApplicationDbContext& :
>: ;
(; <
)< =
;= >
} 
} Ì
QC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\InfrastructureStartup.cs
[		 
assembly		 	
:			 

InternalsVisibleTo		 
(		 
$str		 D
)		D E
]		E F
	namespace 	
MyWarehouse
 
. 
Infrastructure $
;$ %
[ #
ExcludeFromCodeCoverage 
] 
public 
static 
class !
InfrastructureStartup )
{ 
public 

static 
void ,
 AddMyInfrastructureConfiguration 7
(7 8
this8 <!
IConfigurationBuilder= R
configBuilderS `
,` a
HostBuilderContextb t
contextu |
)| }
{ 
AzureKeyVault 
. 
Startup 
. %
ConfigureAppConfiguration 7
(7 8
context8 ?
,? @
configBuilderA N
)N O
;O P
} 
public 

static 
void +
AddMyInfrastructureDependencies 6
(6 7
this7 ;
IServiceCollection< N
servicesO W
,W X
IConfigurationY g
configurationh u
,u v
IHostEnvironment	w á
env
à ã
)
ã å
{ 
Identity 
. 
Startup 
. 
ConfigureServices *
(* +
services+ 3
,3 4
configuration5 B
)B C
;C D
Authentication 
. 
Startup 
. 
ConfigureServices 0
(0 1
services1 9
,9 :
configuration; H
)H I
;I J
Persistence 
. 
Startup 
. 
ConfigureServices -
(- .
services. 6
,6 7
configuration8 E
,E F
envG J
)J K
;K L#
ApplicationDependencies 
.  
Startup  '
.' (
ConfigureServices( 9
(9 :
services: B
,B C
configurationD Q
)Q R
;R S
}   
public"" 

static"" 
void"" 
UseMyInfrastructure"" *
(""* +
this""+ /
IApplicationBuilder""0 C
app""D G
,""G H
IConfiguration""I W
configuration""X e
,""e f
IWebHostEnvironment""g z
env""{ ~
)""~ 
{## 
Authentication$$ 
.$$ 
Startup$$ 
.$$ 
	Configure$$ (
($$( )
app$$) ,
)$$, -
;$$- .
Persistence%% 
.%% 
Startup%% 
.%% 
	Configure%% %
(%%% &
app%%& )
,%%) *
configuration%%+ 8
)%%8 9
;%%9 :
}&& 
}'' Û`
dC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Context\ApplicationDbContext.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Context1 8
;8 9
public 
class  
ApplicationDbContext !
:" #
IdentityDbContext$ 5
<5 6
ApplicationUser6 E
>E F
{ 
public 

DbSet 
< 
Product 
> 
Products "
=># %
Set& )
<) *
Product* 1
>1 2
(2 3
)3 4
;4 5
public 

DbSet 
< 
Partner 
> 
Partners "
=># %
Set& )
<) *
Partner* 1
>1 2
(2 3
)3 4
;4 5
public 

DbSet 
< 
Transaction 
> 
Transactions *
=>+ -
Set. 1
<1 2
Transaction2 =
>= >
(> ?
)? @
;@ A
private 
readonly 
ICurrentUserService (
_currentUser) 5
;5 6
private 
readonly 
	IDateTime 
	_dateTime (
;( )
public   
 
ApplicationDbContext   
(    
DbContextOptions    0
<  0 1 
ApplicationDbContext  1 E
>  E F
options  G N
,  N O
ICurrentUserService  P c
currentUser  d o
,  o p
	IDateTime  q z
dateTime	  { É
)
  É Ñ
:
  Ö Ü
base
  á ã
(
  ã å
options
  å ì
)
  ì î
{!! 
_currentUser"" 
="" 
currentUser"" "
;""" #
	_dateTime## 
=## 
dateTime## 
;## 
ChangeTracker.. 
... 
CascadeDeleteTiming.. )
=..* +
CascadeTiming.., 9
...9 :
OnSaveChanges..: G
;..G H
}// 
public22 
 
ApplicationDbContext22 
(22  
DbContextOptions22  0
<220 1 
ApplicationDbContext221 E
>22E F
options22G N
)22N O
:22P Q
base22R V
(22V W
options22W ^
)22^ _
{33 
_currentUser44 
=44 
null44 
!44 
;44 
	_dateTime55 
=55 
null55 
!55 
;55 
}66 
public88 

override88 
int88 
SaveChanges88 #
(88# $
)88$ %
=>99 

SaveChanges99 
(99 %
acceptAllChangesOnSuccess99 0
:990 1
true992 6
)996 7
;997 8
public;; 

override;; 
int;; 
SaveChanges;; #
(;;# $
bool;;$ (%
acceptAllChangesOnSuccess;;) B
);;B C
{<< "
ApplyMyEntityOverrides== 
(== 
)==  
;==  !
return>> 
base>> 
.>> 
SaveChanges>> 
(>>  %
acceptAllChangesOnSuccess>>  9
)>>9 :
;>>: ;
}?? 
publicAA 

overrideAA 
TaskAA 
<AA 
intAA 
>AA 
SaveChangesAsyncAA .
(AA. /
CancellationTokenAA/ @
cancellationTokenAAA R
=AAS T
defaultAAU \
)AA\ ]
=>BB 

SaveChangesAsyncBB 
(BB %
acceptAllChangesOnSuccessBB 5
:BB5 6
trueBB7 ;
,BB; <
cancellationTokenBB= N
)BBN O
;BBO P
publicDD 

overrideDD 
TaskDD 
<DD 
intDD 
>DD 
SaveChangesAsyncDD .
(DD. /
boolDD/ 3%
acceptAllChangesOnSuccessDD4 M
,DDM N
CancellationTokenDDO `
cancellationTokenDDa r
=DDs t
defaultDDu |
)DD| }
{EE "
ApplyMyEntityOverridesFF 
(FF 
)FF  
;FF  !
returnGG 
baseGG 
.GG 
SaveChangesAsyncGG $
(GG$ %%
acceptAllChangesOnSuccessGG% >
,GG> ?
cancellationTokenGG@ Q
)GGQ R
;GGR S
}HH 
	protectedJJ 
overrideJJ 
voidJJ  
ConfigureConventionsJJ 0
(JJ0 1%
ModelConfigurationBuilderJJ1 J
configBuilderJJK X
)JJX Y
{KK 
configBuilderLL 
.LL 

PropertiesLL  
<LL  !
decimalLL! (
>LL( )
(LL) *
)LL* +
.MM 
HavePrecisionMM 
(MM 
	precisionMM $
:MM$ %
$numMM& (
,MM( )
scaleMM* /
:MM/ 0
$numMM1 2
)MM2 3
;MM3 4
configBuilderRR 
.RR 

PropertiesRR  
<RR  !
CurrencyRR! )
>RR) *
(RR* +
)RR+ ,
.SS 
HaveConversionSS 
<SS 
CurrencyConverterSS -
>SS- .
(SS. /
)SS/ 0
.TT 
HaveMaxLengthTT 
(TT 
$numTT 
)TT 
;TT 
configBuilderVV 
.VV 

PropertiesVV  
<VV  !
MassUnitVV! )
>VV) *
(VV* +
)VV+ ,
.WW 
HaveConversionWW 
<WW 
MassUnitConverterWW -
>WW- .
(WW. /
)WW/ 0
.XX 
HaveMaxLengthXX 
(XX 
$numXX 
)XX 
;XX 
}YY 
	protected[[ 
override[[ 
void[[ 
OnModelCreating[[ +
([[+ ,
ModelBuilder[[, 8
builder[[9 @
)[[@ A
{\\ 
builder^^ 
.^^ 
Owned^^ 
<^^ 
Money^^ 
>^^ 
(^^ 
)^^ 
;^^ 
builder__ 
.__ 
Owned__ 
<__ 
Address__ 
>__ 
(__ 
)__  
;__  !
builder`` 
.`` 
Owned`` 
<`` 
Mass`` 
>`` 
(`` 
)`` 
;`` %
ConfigureSoftDeleteFilterbb !
(bb! "
builderbb" )
)bb) *
;bb* +
basedd 
.dd 
OnModelCreatingdd 
(dd 
builderdd $
)dd$ %
;dd% &
}ee 
privatejj 
staticjj 
voidjj %
ConfigureSoftDeleteFilterjj 1
(jj1 2
ModelBuilderjj2 >
builderjj? F
)jjF G
{kk 
foreachll 
(ll 
varll $
softDeletableTypeBuilderll -
inll. 0
builderll1 8
.ll8 9
Modelll9 >
.ll> ?
GetEntityTypesll? M
(llM N
)llN O
.mm 
Wheremm 
(mm 
xmm 
=>mm 
typeofmm 
(mm 
ISoftDeletablemm -
)mm- .
.mm. /
IsAssignableFrommm/ ?
(mm? @
xmm@ A
.mmA B
ClrTypemmB I
)mmI J
)mmJ K
)mmK L
{nn 	
varoo 
	parameteroo 
=oo 

Expressionoo &
.oo& '
	Parameteroo' 0
(oo0 1$
softDeletableTypeBuilderoo1 I
.ooI J
ClrTypeooJ Q
,ooQ R
$strooS V
)ooV W
;ooW X$
softDeletableTypeBuilderqq $
.qq$ %
SetQueryFilterqq% 3
(qq3 4

Expressionrr 
.rr 
Lambdarr !
(rr! "

Expressionss 
.ss 
Equalss $
(ss$ %

Expressiontt "
.tt" #
Propertytt# +
(tt+ ,
	parametertt, 5
,tt5 6
nameoftt7 =
(tt= >
ISoftDeletablett> L
.ttL M
	DeletedAtttM V
)ttV W
)ttW X
,ttX Y

Expressionuu "
.uu" #
Constantuu# +
(uu+ ,
nulluu, 0
)uu0 1
)uu1 2
,uu2 3
	parametervv 
)vv 
)ww 
;ww 
}xx 	
}yy 
private~~ 
void~~ "
ApplyMyEntityOverrides~~ '
(~~' (
)~~( )
{ 
foreach
ÄÄ 
(
ÄÄ 
var
ÄÄ 
entry
ÄÄ 
in
ÄÄ 
ChangeTracker
ÄÄ +
.
ÄÄ+ ,
Entries
ÄÄ, 3
<
ÄÄ3 4
IAudited
ÄÄ4 <
>
ÄÄ< =
(
ÄÄ= >
)
ÄÄ> ?
)
ÄÄ? @
{
ÅÅ 	
switch
ÇÇ 
(
ÇÇ 
entry
ÇÇ 
.
ÇÇ 
State
ÇÇ 
)
ÇÇ  
{
ÉÉ 
case
ÑÑ 
EntityState
ÑÑ  
.
ÑÑ  !
Added
ÑÑ! &
:
ÑÑ& '
entry
ÖÖ 
.
ÖÖ 
Property
ÖÖ "
(
ÖÖ" #
nameof
ÖÖ# )
(
ÖÖ) *
IAudited
ÖÖ* 2
.
ÖÖ2 3
	CreatedBy
ÖÖ3 <
)
ÖÖ< =
)
ÖÖ= >
.
ÖÖ> ?
CurrentValue
ÖÖ? K
=
ÖÖL M
_currentUser
ÖÖN Z
.
ÖÖZ [
UserId
ÖÖ[ a
;
ÖÖa b
entry
ÜÜ 
.
ÜÜ 
Property
ÜÜ "
(
ÜÜ" #
nameof
ÜÜ# )
(
ÜÜ) *
IAudited
ÜÜ* 2
.
ÜÜ2 3
	CreatedAt
ÜÜ3 <
)
ÜÜ< =
)
ÜÜ= >
.
ÜÜ> ?
CurrentValue
ÜÜ? K
=
ÜÜL M
	_dateTime
ÜÜN W
.
ÜÜW X
Now
ÜÜX [
;
ÜÜ[ \
break
áá 
;
áá 
case
àà 
EntityState
àà  
.
àà  !
Modified
àà! )
:
àà) *
entry
ââ 
.
ââ 
Property
ââ "
(
ââ" #
nameof
ââ# )
(
ââ) *
IAudited
ââ* 2
.
ââ2 3
LastModifiedBy
ââ3 A
)
ââA B
)
ââB C
.
ââC D
CurrentValue
ââD P
=
ââQ R
_currentUser
ââS _
.
ââ_ `
UserId
ââ` f
;
ââf g
entry
ää 
.
ää 
Property
ää "
(
ää" #
nameof
ää# )
(
ää) *
IAudited
ää* 2
.
ää2 3
LastModifiedAt
ää3 A
)
ääA B
)
ääB C
.
ääC D
CurrentValue
ääD P
=
ääQ R
	_dateTime
ääS \
.
ää\ ]
Now
ää] `
;
ää` a
break
ãã 
;
ãã 
}
åå 
}
çç 	
foreach
èè 
(
èè 
var
èè 
entry
èè 
in
èè 
ChangeTracker
èè +
.
èè+ ,
Entries
èè, 3
<
èè3 4
ISoftDeletable
èè4 B
>
èèB C
(
èèC D
)
èèD E
)
èèE F
{
êê 	
switch
ëë 
(
ëë 
entry
ëë 
.
ëë 
State
ëë 
)
ëë  
{
íí 
case
ìì 
EntityState
ìì  
.
ìì  !
Deleted
ìì! (
:
ìì( )
entry
îî 
.
îî 
State
îî 
=
îî  !
EntityState
îî" -
.
îî- .
	Unchanged
îî. 7
;
îî7 8
entry
ïï 
.
ïï 
Property
ïï "
(
ïï" #
nameof
ïï# )
(
ïï) *
ISoftDeletable
ïï* 8
.
ïï8 9
	DeletedBy
ïï9 B
)
ïïB C
)
ïïC D
.
ïïD E
CurrentValue
ïïE Q
=
ïïR S
_currentUser
ïïT `
.
ïï` a
UserId
ïïa g
;
ïïg h
entry
ññ 
.
ññ 
Property
ññ "
(
ññ" #
nameof
ññ# )
(
ññ) *
ISoftDeletable
ññ* 8
.
ññ8 9
	DeletedAt
ññ9 B
)
ññB C
)
ññC D
.
ññD E
CurrentValue
ññE Q
=
ññR S
	_dateTime
ññT ]
.
ññ] ^
Now
ññ^ a
;
ñña b
break
óó 
;
óó 
}
òò 
}
ôô 	
}
öö 
}õõ Èı
sC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Context\Migrations\20210206205027_AddDomain.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %

Migrations% /
{ 
public 

partial 
class 
	AddDomain "
:# $
	Migration% .
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
truea e
)e f
,f g
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ O
,O P
	maxLengthQ Z
:Z [
$num\ _
,_ `
nullablea i
:i j
truek o
)o p
,p q
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
nullableS [
:[ \
true] a
)a b
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
UserName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
	maxLengthK T
:T U
$numV Y
,Y Z
nullable[ c
:c d
truee i
)i j
,j k
NormalizedUserName &
=' (
table) .
.. /
Column/ 5
<5 6
string6 <
>< =
(= >
type> B
:B C
$strD S
,S T
	maxLengthU ^
:^ _
$num` c
,c d
nullablee m
:m n
trueo s
)s t
,t u
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
	maxLengthH Q
:Q R
$numS V
,V W
nullableX `
:` a
trueb f
)f g
,g h
NormalizedEmail   #
=  $ %
table  & +
.  + ,
Column  , 2
<  2 3
string  3 9
>  9 :
(  : ;
type  ; ?
:  ? @
$str  A P
,  P Q
	maxLength  R [
:  [ \
$num  ] `
,  ` a
nullable  b j
:  j k
true  l p
)  p q
,  q r
EmailConfirmed!! "
=!!# $
table!!% *
.!!* +
Column!!+ 1
<!!1 2
bool!!2 6
>!!6 7
(!!7 8
type!!8 <
:!!< =
$str!!> C
,!!C D
nullable!!E M
:!!M N
false!!O T
)!!T U
,!!U V
PasswordHash""  
=""! "
table""# (
.""( )
Column"") /
<""/ 0
string""0 6
>""6 7
(""7 8
type""8 <
:""< =
$str""> M
,""M N
nullable""O W
:""W X
true""Y ]
)""] ^
,""^ _
SecurityStamp## !
=##" #
table##$ )
.##) *
Column##* 0
<##0 1
string##1 7
>##7 8
(##8 9
type##9 =
:##= >
$str##? N
,##N O
nullable##P X
:##X Y
true##Z ^
)##^ _
,##_ `
ConcurrencyStamp$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
type$$< @
:$$@ A
$str$$B Q
,$$Q R
nullable$$S [
:$$[ \
true$$] a
)$$a b
,$$b c
PhoneNumber%% 
=%%  !
table%%" '
.%%' (
Column%%( .
<%%. /
string%%/ 5
>%%5 6
(%%6 7
type%%7 ;
:%%; <
$str%%= L
,%%L M
nullable%%N V
:%%V W
true%%X \
)%%\ ]
,%%] ^ 
PhoneNumberConfirmed&& (
=&&) *
table&&+ 0
.&&0 1
Column&&1 7
<&&7 8
bool&&8 <
>&&< =
(&&= >
type&&> B
:&&B C
$str&&D I
,&&I J
nullable&&K S
:&&S T
false&&U Z
)&&Z [
,&&[ \
TwoFactorEnabled'' $
=''% &
table''' ,
.'', -
Column''- 3
<''3 4
bool''4 8
>''8 9
(''9 :
type'': >
:''> ?
$str''@ E
,''E F
nullable''G O
:''O P
false''Q V
)''V W
,''W X

LockoutEnd(( 
=((  
table((! &
.((& '
Column((' -
<((- .
DateTimeOffset((. <
>((< =
(((= >
type((> B
:((B C
$str((D T
,((T U
nullable((V ^
:((^ _
true((` d
)((d e
,((e f
LockoutEnabled)) "
=))# $
table))% *
.))* +
Column))+ 1
<))1 2
bool))2 6
>))6 7
())7 8
type))8 <
:))< =
$str))> C
,))C D
nullable))E M
:))M N
false))O T
)))T U
,))U V
AccessFailedCount** %
=**& '
table**( -
.**- .
Column**. 4
<**4 5
int**5 8
>**8 9
(**9 :
type**: >
:**> ?
$str**@ E
,**E F
nullable**G O
:**O P
false**Q V
)**V W
}++ 
,++ 
constraints,, 
:,, 
table,, "
=>,,# %
{-- 
table.. 
... 

PrimaryKey.. $
(..$ %
$str..% 5
,..5 6
x..7 8
=>..9 ;
x..< =
...= >
Id..> @
)..@ A
;..A B
}// 
)// 
;// 
migrationBuilder11 
.11 
CreateTable11 (
(11( )
name22 
:22 
$str22  
,22  !
columns33 
:33 
table33 
=>33 !
new33" %
{44 
Id55 
=55 
table55 
.55 
Column55 %
<55% &
int55& )
>55) *
(55* +
type55+ /
:55/ 0
$str551 6
,556 7
nullable558 @
:55@ A
false55B G
)55G H
.66 

Annotation66 #
(66# $
$str66$ 8
,668 9
$str66: @
)66@ A
,66A B
Name77 
=77 
table77  
.77  !
Column77! '
<77' (
string77( .
>77. /
(77/ 0
type770 4
:774 5
$str776 E
,77E F
	maxLength77G P
:77P Q
$num77R U
,77U V
nullable77W _
:77_ `
false77a f
)77f g
,77g h
Address_Street88 "
=88# $
table88% *
.88* +
Column88+ 1
<881 2
string882 8
>888 9
(889 :
type88: >
:88> ?
$str88@ O
,88O P
	maxLength88Q Z
:88Z [
$num88\ _
,88_ `
nullable88a i
:88i j
false88k p
)88p q
,88q r
Address_City99  
=99! "
table99# (
.99( )
Column99) /
<99/ 0
string990 6
>996 7
(997 8
type998 <
:99< =
$str99> M
,99M N
	maxLength99O X
:99X Y
$num99Z ]
,99] ^
nullable99_ g
:99g h
false99i n
)99n o
,99o p
Address_Country:: #
=::$ %
table::& +
.::+ ,
Column::, 2
<::2 3
string::3 9
>::9 :
(::: ;
type::; ?
:::? @
$str::A P
,::P Q
	maxLength::R [
:::[ \
$num::] `
,::` a
nullable::b j
:::j k
false::l q
)::q r
,::r s
Address_ZipCode;; #
=;;$ %
table;;& +
.;;+ ,
Column;;, 2
<;;2 3
string;;3 9
>;;9 :
(;;: ;
type;;; ?
:;;? @
$str;;A P
,;;P Q
	maxLength;;R [
:;;[ \
$num;;] `
,;;` a
nullable;;b j
:;;j k
false;;l q
);;q r
,;;r s
	CreatedBy<< 
=<< 
table<<  %
.<<% &
Column<<& ,
<<<, -
string<<- 3
><<3 4
(<<4 5
type<<5 9
:<<9 :
$str<<; J
,<<J K
nullable<<L T
:<<T U
true<<V Z
)<<Z [
,<<[ \
	CreatedAt== 
=== 
table==  %
.==% &
Column==& ,
<==, -
DateTime==- 5
>==5 6
(==6 7
type==7 ;
:==; <
$str=== H
,==H I
nullable==J R
:==R S
false==T Y
)==Y Z
,==Z [
LastModifiedBy>> "
=>># $
table>>% *
.>>* +
Column>>+ 1
<>>1 2
string>>2 8
>>>8 9
(>>9 :
type>>: >
:>>> ?
$str>>@ O
,>>O P
nullable>>Q Y
:>>Y Z
true>>[ _
)>>_ `
,>>` a
LastModifiedAt?? "
=??# $
table??% *
.??* +
Column??+ 1
<??1 2
DateTime??2 :
>??: ;
(??; <
type??< @
:??@ A
$str??B M
,??M N
nullable??O W
:??W X
true??Y ]
)??] ^
,??^ _
	DeletedBy@@ 
=@@ 
table@@  %
.@@% &
Column@@& ,
<@@, -
string@@- 3
>@@3 4
(@@4 5
type@@5 9
:@@9 :
$str@@; J
,@@J K
nullable@@L T
:@@T U
true@@V Z
)@@Z [
,@@[ \
	DeletedAtAA 
=AA 
tableAA  %
.AA% &
ColumnAA& ,
<AA, -
DateTimeAA- 5
>AA5 6
(AA6 7
typeAA7 ;
:AA; <
$strAA= H
,AAH I
nullableAAJ R
:AAR S
trueAAT X
)AAX Y
}BB 
,BB 
constraintsCC 
:CC 
tableCC "
=>CC# %
{DD 
tableEE 
.EE 

PrimaryKeyEE $
(EE$ %
$strEE% 2
,EE2 3
xEE4 5
=>EE6 8
xEE9 :
.EE: ;
IdEE; =
)EE= >
;EE> ?
}FF 
)FF 
;FF 
migrationBuilderHH 
.HH 
CreateTableHH (
(HH( )
nameII 
:II 
$strII  
,II  !
columnsJJ 
:JJ 
tableJJ 
=>JJ !
newJJ" %
{KK 
IdLL 
=LL 
tableLL 
.LL 
ColumnLL %
<LL% &
intLL& )
>LL) *
(LL* +
typeLL+ /
:LL/ 0
$strLL1 6
,LL6 7
nullableLL8 @
:LL@ A
falseLLB G
)LLG H
.MM 

AnnotationMM #
(MM# $
$strMM$ 8
,MM8 9
$strMM: @
)MM@ A
,MMA B
NameNN 
=NN 
tableNN  
.NN  !
ColumnNN! '
<NN' (
stringNN( .
>NN. /
(NN/ 0
typeNN0 4
:NN4 5
$strNN6 E
,NNE F
	maxLengthNNG P
:NNP Q
$numNNR U
,NNU V
nullableNNW _
:NN_ `
falseNNa f
)NNf g
,NNg h
DescriptionOO 
=OO  !
tableOO" '
.OO' (
ColumnOO( .
<OO. /
stringOO/ 5
>OO5 6
(OO6 7
typeOO7 ;
:OO; <
$strOO= M
,OOM N
	maxLengthOOO X
:OOX Y
$numOOZ ^
,OO^ _
nullableOO` h
:OOh i
falseOOj o
)OOo p
,OOp q
Price_AmountPP  
=PP! "
tablePP# (
.PP( )
ColumnPP) /
<PP/ 0
decimalPP0 7
>PP7 8
(PP8 9
typePP9 =
:PP= >
$strPP? N
,PPN O
	precisionPPP Y
:PPY Z
$numPP[ ]
,PP] ^
scalePP_ d
:PPd e
$numPPf g
,PPg h
nullablePPi q
:PPq r
falsePPs x
)PPx y
,PPy z
Price_CurrencyQQ "
=QQ# $
tableQQ% *
.QQ* +
ColumnQQ+ 1
<QQ1 2
stringQQ2 8
>QQ8 9
(QQ9 :
typeQQ: >
:QQ> ?
$strQQ@ M
,QQM N
	maxLengthQQO X
:QQX Y
$numQQZ [
,QQ[ \
nullableQQ] e
:QQe f
falseQQg l
)QQl m
,QQm n

Mass_ValueRR 
=RR  
tableRR! &
.RR& '
ColumnRR' -
<RR- .
floatRR. 3
>RR3 4
(RR4 5
typeRR5 9
:RR9 :
$strRR; A
,RRA B
nullableRRC K
:RRK L
falseRRM R
)RRR S
,RRS T
	Mass_UnitSS 
=SS 
tableSS  %
.SS% &
ColumnSS& ,
<SS, -
stringSS- 3
>SS3 4
(SS4 5
typeSS5 9
:SS9 :
$strSS; H
,SSH I
	maxLengthSSJ S
:SSS T
$numSSU V
,SSV W
nullableSSX `
:SS` a
falseSSb g
)SSg h
,SSh i
NumberInStockTT !
=TT" #
tableTT$ )
.TT) *
ColumnTT* 0
<TT0 1
intTT1 4
>TT4 5
(TT5 6
typeTT6 :
:TT: ;
$strTT< A
,TTA B
nullableTTC K
:TTK L
falseTTM R
)TTR S
,TTS T
	CreatedByUU 
=UU 
tableUU  %
.UU% &
ColumnUU& ,
<UU, -
stringUU- 3
>UU3 4
(UU4 5
typeUU5 9
:UU9 :
$strUU; J
,UUJ K
nullableUUL T
:UUT U
trueUUV Z
)UUZ [
,UU[ \
	CreatedAtVV 
=VV 
tableVV  %
.VV% &
ColumnVV& ,
<VV, -
DateTimeVV- 5
>VV5 6
(VV6 7
typeVV7 ;
:VV; <
$strVV= H
,VVH I
nullableVVJ R
:VVR S
falseVVT Y
)VVY Z
,VVZ [
LastModifiedByWW "
=WW# $
tableWW% *
.WW* +
ColumnWW+ 1
<WW1 2
stringWW2 8
>WW8 9
(WW9 :
typeWW: >
:WW> ?
$strWW@ O
,WWO P
nullableWWQ Y
:WWY Z
trueWW[ _
)WW_ `
,WW` a
LastModifiedAtXX "
=XX# $
tableXX% *
.XX* +
ColumnXX+ 1
<XX1 2
DateTimeXX2 :
>XX: ;
(XX; <
typeXX< @
:XX@ A
$strXXB M
,XXM N
nullableXXO W
:XXW X
trueXXY ]
)XX] ^
,XX^ _
	DeletedByYY 
=YY 
tableYY  %
.YY% &
ColumnYY& ,
<YY, -
stringYY- 3
>YY3 4
(YY4 5
typeYY5 9
:YY9 :
$strYY; J
,YYJ K
nullableYYL T
:YYT U
trueYYV Z
)YYZ [
,YY[ \
	DeletedAtZZ 
=ZZ 
tableZZ  %
.ZZ% &
ColumnZZ& ,
<ZZ, -
DateTimeZZ- 5
>ZZ5 6
(ZZ6 7
typeZZ7 ;
:ZZ; <
$strZZ= H
,ZZH I
nullableZZJ R
:ZZR S
trueZZT X
)ZZX Y
}[[ 
,[[ 
constraints\\ 
:\\ 
table\\ "
=>\\# %
{]] 
table^^ 
.^^ 

PrimaryKey^^ $
(^^$ %
$str^^% 2
,^^2 3
x^^4 5
=>^^6 8
x^^9 :
.^^: ;
Id^^; =
)^^= >
;^^> ?
}__ 
)__ 
;__ 
migrationBuilderaa 
.aa 
CreateTableaa (
(aa( )
namebb 
:bb 
$strbb (
,bb( )
columnscc 
:cc 
tablecc 
=>cc !
newcc" %
{dd 
Idee 
=ee 
tableee 
.ee 
Columnee %
<ee% &
intee& )
>ee) *
(ee* +
typeee+ /
:ee/ 0
$stree1 6
,ee6 7
nullableee8 @
:ee@ A
falseeeB G
)eeG H
.ff 

Annotationff #
(ff# $
$strff$ 8
,ff8 9
$strff: @
)ff@ A
,ffA B
RoleIdgg 
=gg 
tablegg "
.gg" #
Columngg# )
<gg) *
stringgg* 0
>gg0 1
(gg1 2
typegg2 6
:gg6 7
$strgg8 G
,ggG H
nullableggI Q
:ggQ R
falseggS X
)ggX Y
,ggY Z
	ClaimTypehh 
=hh 
tablehh  %
.hh% &
Columnhh& ,
<hh, -
stringhh- 3
>hh3 4
(hh4 5
typehh5 9
:hh9 :
$strhh; J
,hhJ K
nullablehhL T
:hhT U
truehhV Z
)hhZ [
,hh[ \

ClaimValueii 
=ii  
tableii! &
.ii& '
Columnii' -
<ii- .
stringii. 4
>ii4 5
(ii5 6
typeii6 :
:ii: ;
$strii< K
,iiK L
nullableiiM U
:iiU V
trueiiW [
)ii[ \
}jj 
,jj 
constraintskk 
:kk 
tablekk "
=>kk# %
{ll 
tablemm 
.mm 

PrimaryKeymm $
(mm$ %
$strmm% :
,mm: ;
xmm< =
=>mm> @
xmmA B
.mmB C
IdmmC E
)mmE F
;mmF G
tablenn 
.nn 

ForeignKeynn $
(nn$ %
nameoo 
:oo 
$stroo F
,ooF G
columnpp 
:pp 
xpp  !
=>pp" $
xpp% &
.pp& '
RoleIdpp' -
,pp- .
principalTableqq &
:qq& '
$strqq( 5
,qq5 6
principalColumnrr '
:rr' (
$strrr) -
,rr- .
onDeletess  
:ss  !
ReferentialActionss" 3
.ss3 4
Cascadess4 ;
)ss; <
;ss< =
}tt 
)tt 
;tt 
migrationBuildervv 
.vv 
CreateTablevv (
(vv( )
nameww 
:ww 
$strww (
,ww( )
columnsxx 
:xx 
tablexx 
=>xx !
newxx" %
{yy 
Idzz 
=zz 
tablezz 
.zz 
Columnzz %
<zz% &
intzz& )
>zz) *
(zz* +
typezz+ /
:zz/ 0
$strzz1 6
,zz6 7
nullablezz8 @
:zz@ A
falsezzB G
)zzG H
.{{ 

Annotation{{ #
({{# $
$str{{$ 8
,{{8 9
$str{{: @
){{@ A
,{{A B
UserId|| 
=|| 
table|| "
.||" #
Column||# )
<||) *
string||* 0
>||0 1
(||1 2
type||2 6
:||6 7
$str||8 G
,||G H
nullable||I Q
:||Q R
false||S X
)||X Y
,||Y Z
	ClaimType}} 
=}} 
table}}  %
.}}% &
Column}}& ,
<}}, -
string}}- 3
>}}3 4
(}}4 5
type}}5 9
:}}9 :
$str}}; J
,}}J K
nullable}}L T
:}}T U
true}}V Z
)}}Z [
,}}[ \

ClaimValue~~ 
=~~  
table~~! &
.~~& '
Column~~' -
<~~- .
string~~. 4
>~~4 5
(~~5 6
type~~6 :
:~~: ;
$str~~< K
,~~K L
nullable~~M U
:~~U V
true~~W [
)~~[ \
} 
, 
constraints
ÄÄ 
:
ÄÄ 
table
ÄÄ "
=>
ÄÄ# %
{
ÅÅ 
table
ÇÇ 
.
ÇÇ 

PrimaryKey
ÇÇ $
(
ÇÇ$ %
$str
ÇÇ% :
,
ÇÇ: ;
x
ÇÇ< =
=>
ÇÇ> @
x
ÇÇA B
.
ÇÇB C
Id
ÇÇC E
)
ÇÇE F
;
ÇÇF G
table
ÉÉ 
.
ÉÉ 

ForeignKey
ÉÉ $
(
ÉÉ$ %
name
ÑÑ 
:
ÑÑ 
$str
ÑÑ F
,
ÑÑF G
column
ÖÖ 
:
ÖÖ 
x
ÖÖ  !
=>
ÖÖ" $
x
ÖÖ% &
.
ÖÖ& '
UserId
ÖÖ' -
,
ÖÖ- .
principalTable
ÜÜ &
:
ÜÜ& '
$str
ÜÜ( 5
,
ÜÜ5 6
principalColumn
áá '
:
áá' (
$str
áá) -
,
áá- .
onDelete
àà  
:
àà  !
ReferentialAction
àà" 3
.
àà3 4
Cascade
àà4 ;
)
àà; <
;
àà< =
}
ââ 
)
ââ 
;
ââ 
migrationBuilder
ãã 
.
ãã 
CreateTable
ãã (
(
ãã( )
name
åå 
:
åå 
$str
åå (
,
åå( )
columns
çç 
:
çç 
table
çç 
=>
çç !
new
çç" %
{
éé 
LoginProvider
èè !
=
èè" #
table
èè$ )
.
èè) *
Column
èè* 0
<
èè0 1
string
èè1 7
>
èè7 8
(
èè8 9
type
èè9 =
:
èè= >
$str
èè? N
,
èèN O
nullable
èèP X
:
èèX Y
false
èèZ _
)
èè_ `
,
èè` a
ProviderKey
êê 
=
êê  !
table
êê" '
.
êê' (
Column
êê( .
<
êê. /
string
êê/ 5
>
êê5 6
(
êê6 7
type
êê7 ;
:
êê; <
$str
êê= L
,
êêL M
nullable
êêN V
:
êêV W
false
êêX ]
)
êê] ^
,
êê^ _!
ProviderDisplayName
ëë '
=
ëë( )
table
ëë* /
.
ëë/ 0
Column
ëë0 6
<
ëë6 7
string
ëë7 =
>
ëë= >
(
ëë> ?
type
ëë? C
:
ëëC D
$str
ëëE T
,
ëëT U
nullable
ëëV ^
:
ëë^ _
true
ëë` d
)
ëëd e
,
ëëe f
UserId
íí 
=
íí 
table
íí "
.
íí" #
Column
íí# )
<
íí) *
string
íí* 0
>
íí0 1
(
íí1 2
type
íí2 6
:
íí6 7
$str
íí8 G
,
ííG H
nullable
ííI Q
:
ííQ R
false
ííS X
)
ííX Y
}
ìì 
,
ìì 
constraints
îî 
:
îî 
table
îî "
=>
îî# %
{
ïï 
table
ññ 
.
ññ 

PrimaryKey
ññ $
(
ññ$ %
$str
ññ% :
,
ññ: ;
x
ññ< =
=>
ññ> @
new
ññA D
{
ññE F
x
ññG H
.
ññH I
LoginProvider
ññI V
,
ññV W
x
ññX Y
.
ññY Z
ProviderKey
ññZ e
}
ññf g
)
ññg h
;
ññh i
table
óó 
.
óó 

ForeignKey
óó $
(
óó$ %
name
òò 
:
òò 
$str
òò F
,
òòF G
column
ôô 
:
ôô 
x
ôô  !
=>
ôô" $
x
ôô% &
.
ôô& '
UserId
ôô' -
,
ôô- .
principalTable
öö &
:
öö& '
$str
öö( 5
,
öö5 6
principalColumn
õõ '
:
õõ' (
$str
õõ) -
,
õõ- .
onDelete
úú  
:
úú  !
ReferentialAction
úú" 3
.
úú3 4
Cascade
úú4 ;
)
úú; <
;
úú< =
}
ùù 
)
ùù 
;
ùù 
migrationBuilder
üü 
.
üü 
CreateTable
üü (
(
üü( )
name
†† 
:
†† 
$str
†† '
,
††' (
columns
°° 
:
°° 
table
°° 
=>
°° !
new
°°" %
{
¢¢ 
UserId
££ 
=
££ 
table
££ "
.
££" #
Column
££# )
<
££) *
string
££* 0
>
££0 1
(
££1 2
type
££2 6
:
££6 7
$str
££8 G
,
££G H
nullable
££I Q
:
££Q R
false
££S X
)
££X Y
,
££Y Z
RoleId
§§ 
=
§§ 
table
§§ "
.
§§" #
Column
§§# )
<
§§) *
string
§§* 0
>
§§0 1
(
§§1 2
type
§§2 6
:
§§6 7
$str
§§8 G
,
§§G H
nullable
§§I Q
:
§§Q R
false
§§S X
)
§§X Y
}
•• 
,
•• 
constraints
¶¶ 
:
¶¶ 
table
¶¶ "
=>
¶¶# %
{
ßß 
table
®® 
.
®® 

PrimaryKey
®® $
(
®®$ %
$str
®®% 9
,
®®9 :
x
®®; <
=>
®®= ?
new
®®@ C
{
®®D E
x
®®F G
.
®®G H
UserId
®®H N
,
®®N O
x
®®P Q
.
®®Q R
RoleId
®®R X
}
®®Y Z
)
®®Z [
;
®®[ \
table
©© 
.
©© 

ForeignKey
©© $
(
©©$ %
name
™™ 
:
™™ 
$str
™™ E
,
™™E F
column
´´ 
:
´´ 
x
´´  !
=>
´´" $
x
´´% &
.
´´& '
RoleId
´´' -
,
´´- .
principalTable
¨¨ &
:
¨¨& '
$str
¨¨( 5
,
¨¨5 6
principalColumn
≠≠ '
:
≠≠' (
$str
≠≠) -
,
≠≠- .
onDelete
ÆÆ  
:
ÆÆ  !
ReferentialAction
ÆÆ" 3
.
ÆÆ3 4
Cascade
ÆÆ4 ;
)
ÆÆ; <
;
ÆÆ< =
table
ØØ 
.
ØØ 

ForeignKey
ØØ $
(
ØØ$ %
name
∞∞ 
:
∞∞ 
$str
∞∞ E
,
∞∞E F
column
±± 
:
±± 
x
±±  !
=>
±±" $
x
±±% &
.
±±& '
UserId
±±' -
,
±±- .
principalTable
≤≤ &
:
≤≤& '
$str
≤≤( 5
,
≤≤5 6
principalColumn
≥≥ '
:
≥≥' (
$str
≥≥) -
,
≥≥- .
onDelete
¥¥  
:
¥¥  !
ReferentialAction
¥¥" 3
.
¥¥3 4
Cascade
¥¥4 ;
)
¥¥; <
;
¥¥< =
}
µµ 
)
µµ 
;
µµ 
migrationBuilder
∑∑ 
.
∑∑ 
CreateTable
∑∑ (
(
∑∑( )
name
∏∏ 
:
∏∏ 
$str
∏∏ (
,
∏∏( )
columns
ππ 
:
ππ 
table
ππ 
=>
ππ !
new
ππ" %
{
∫∫ 
UserId
ªª 
=
ªª 
table
ªª "
.
ªª" #
Column
ªª# )
<
ªª) *
string
ªª* 0
>
ªª0 1
(
ªª1 2
type
ªª2 6
:
ªª6 7
$str
ªª8 G
,
ªªG H
nullable
ªªI Q
:
ªªQ R
false
ªªS X
)
ªªX Y
,
ªªY Z
LoginProvider
ºº !
=
ºº" #
table
ºº$ )
.
ºº) *
Column
ºº* 0
<
ºº0 1
string
ºº1 7
>
ºº7 8
(
ºº8 9
type
ºº9 =
:
ºº= >
$str
ºº? N
,
ººN O
nullable
ººP X
:
ººX Y
false
ººZ _
)
ºº_ `
,
ºº` a
Name
ΩΩ 
=
ΩΩ 
table
ΩΩ  
.
ΩΩ  !
Column
ΩΩ! '
<
ΩΩ' (
string
ΩΩ( .
>
ΩΩ. /
(
ΩΩ/ 0
type
ΩΩ0 4
:
ΩΩ4 5
$str
ΩΩ6 E
,
ΩΩE F
nullable
ΩΩG O
:
ΩΩO P
false
ΩΩQ V
)
ΩΩV W
,
ΩΩW X
Value
ææ 
=
ææ 
table
ææ !
.
ææ! "
Column
ææ" (
<
ææ( )
string
ææ) /
>
ææ/ 0
(
ææ0 1
type
ææ1 5
:
ææ5 6
$str
ææ7 F
,
ææF G
nullable
ææH P
:
ææP Q
true
ææR V
)
ææV W
}
øø 
,
øø 
constraints
¿¿ 
:
¿¿ 
table
¿¿ "
=>
¿¿# %
{
¡¡ 
table
¬¬ 
.
¬¬ 

PrimaryKey
¬¬ $
(
¬¬$ %
$str
¬¬% :
,
¬¬: ;
x
¬¬< =
=>
¬¬> @
new
¬¬A D
{
¬¬E F
x
¬¬G H
.
¬¬H I
UserId
¬¬I O
,
¬¬O P
x
¬¬Q R
.
¬¬R S
LoginProvider
¬¬S `
,
¬¬` a
x
¬¬b c
.
¬¬c d
Name
¬¬d h
}
¬¬i j
)
¬¬j k
;
¬¬k l
table
√√ 
.
√√ 

ForeignKey
√√ $
(
√√$ %
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ F
,
ƒƒF G
column
≈≈ 
:
≈≈ 
x
≈≈  !
=>
≈≈" $
x
≈≈% &
.
≈≈& '
UserId
≈≈' -
,
≈≈- .
principalTable
∆∆ &
:
∆∆& '
$str
∆∆( 5
,
∆∆5 6
principalColumn
«« '
:
««' (
$str
««) -
,
««- .
onDelete
»»  
:
»»  !
ReferentialAction
»»" 3
.
»»3 4
Cascade
»»4 ;
)
»»; <
;
»»< =
}
…… 
)
…… 
;
…… 
migrationBuilder
ÀÀ 
.
ÀÀ 
CreateTable
ÀÀ (
(
ÀÀ( )
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ $
,
ÃÃ$ %
columns
ÕÕ 
:
ÕÕ 
table
ÕÕ 
=>
ÕÕ !
new
ÕÕ" %
{
ŒŒ 
Id
œœ 
=
œœ 
table
œœ 
.
œœ 
Column
œœ %
<
œœ% &
int
œœ& )
>
œœ) *
(
œœ* +
type
œœ+ /
:
œœ/ 0
$str
œœ1 6
,
œœ6 7
nullable
œœ8 @
:
œœ@ A
false
œœB G
)
œœG H
.
–– 

Annotation
–– #
(
––# $
$str
––$ 8
,
––8 9
$str
––: @
)
––@ A
,
––A B
TransactionType
—— #
=
——$ %
table
——& +
.
——+ ,
Column
——, 2
<
——2 3
int
——3 6
>
——6 7
(
——7 8
type
——8 <
:
——< =
$str
——> C
,
——C D
nullable
——E M
:
——M N
false
——O T
)
——T U
,
——U V
Total_Amount
““  
=
““! "
table
““# (
.
““( )
Column
““) /
<
““/ 0
decimal
““0 7
>
““7 8
(
““8 9
type
““9 =
:
““= >
$str
““? N
,
““N O
	precision
““P Y
:
““Y Z
$num
““[ ]
,
““] ^
scale
““_ d
:
““d e
$num
““f g
,
““g h
nullable
““i q
:
““q r
false
““s x
)
““x y
,
““y z
Total_Currency
”” "
=
””# $
table
””% *
.
””* +
Column
””+ 1
<
””1 2
string
””2 8
>
””8 9
(
””9 :
type
””: >
:
””> ?
$str
””@ M
,
””M N
	maxLength
””O X
:
””X Y
$num
””Z [
,
””[ \
nullable
””] e
:
””e f
false
””g l
)
””l m
,
””m n
	PartnerId
‘‘ 
=
‘‘ 
table
‘‘  %
.
‘‘% &
Column
‘‘& ,
<
‘‘, -
int
‘‘- 0
>
‘‘0 1
(
‘‘1 2
type
‘‘2 6
:
‘‘6 7
$str
‘‘8 =
,
‘‘= >
nullable
‘‘? G
:
‘‘G H
false
‘‘I N
)
‘‘N O
,
‘‘O P
	CreatedBy
’’ 
=
’’ 
table
’’  %
.
’’% &
Column
’’& ,
<
’’, -
string
’’- 3
>
’’3 4
(
’’4 5
type
’’5 9
:
’’9 :
$str
’’; J
,
’’J K
nullable
’’L T
:
’’T U
true
’’V Z
)
’’Z [
,
’’[ \
	CreatedAt
÷÷ 
=
÷÷ 
table
÷÷  %
.
÷÷% &
Column
÷÷& ,
<
÷÷, -
DateTime
÷÷- 5
>
÷÷5 6
(
÷÷6 7
type
÷÷7 ;
:
÷÷; <
$str
÷÷= H
,
÷÷H I
nullable
÷÷J R
:
÷÷R S
false
÷÷T Y
)
÷÷Y Z
,
÷÷Z [
LastModifiedBy
◊◊ "
=
◊◊# $
table
◊◊% *
.
◊◊* +
Column
◊◊+ 1
<
◊◊1 2
string
◊◊2 8
>
◊◊8 9
(
◊◊9 :
type
◊◊: >
:
◊◊> ?
$str
◊◊@ O
,
◊◊O P
nullable
◊◊Q Y
:
◊◊Y Z
true
◊◊[ _
)
◊◊_ `
,
◊◊` a
LastModifiedAt
ÿÿ "
=
ÿÿ# $
table
ÿÿ% *
.
ÿÿ* +
Column
ÿÿ+ 1
<
ÿÿ1 2
DateTime
ÿÿ2 :
>
ÿÿ: ;
(
ÿÿ; <
type
ÿÿ< @
:
ÿÿ@ A
$str
ÿÿB M
,
ÿÿM N
nullable
ÿÿO W
:
ÿÿW X
true
ÿÿY ]
)
ÿÿ] ^
,
ÿÿ^ _
	DeletedBy
ŸŸ 
=
ŸŸ 
table
ŸŸ  %
.
ŸŸ% &
Column
ŸŸ& ,
<
ŸŸ, -
string
ŸŸ- 3
>
ŸŸ3 4
(
ŸŸ4 5
type
ŸŸ5 9
:
ŸŸ9 :
$str
ŸŸ; J
,
ŸŸJ K
nullable
ŸŸL T
:
ŸŸT U
true
ŸŸV Z
)
ŸŸZ [
,
ŸŸ[ \
	DeletedAt
⁄⁄ 
=
⁄⁄ 
table
⁄⁄  %
.
⁄⁄% &
Column
⁄⁄& ,
<
⁄⁄, -
DateTime
⁄⁄- 5
>
⁄⁄5 6
(
⁄⁄6 7
type
⁄⁄7 ;
:
⁄⁄; <
$str
⁄⁄= H
,
⁄⁄H I
nullable
⁄⁄J R
:
⁄⁄R S
true
⁄⁄T X
)
⁄⁄X Y
}
€€ 
,
€€ 
constraints
‹‹ 
:
‹‹ 
table
‹‹ "
=>
‹‹# %
{
›› 
table
ﬁﬁ 
.
ﬁﬁ 

PrimaryKey
ﬁﬁ $
(
ﬁﬁ$ %
$str
ﬁﬁ% 6
,
ﬁﬁ6 7
x
ﬁﬁ8 9
=>
ﬁﬁ: <
x
ﬁﬁ= >
.
ﬁﬁ> ?
Id
ﬁﬁ? A
)
ﬁﬁA B
;
ﬁﬁB C
table
ﬂﬂ 
.
ﬂﬂ 

ForeignKey
ﬂﬂ $
(
ﬂﬂ$ %
name
‡‡ 
:
‡‡ 
$str
‡‡ B
,
‡‡B C
column
·· 
:
·· 
x
··  !
=>
··" $
x
··% &
.
··& '
	PartnerId
··' 0
,
··0 1
principalTable
‚‚ &
:
‚‚& '
$str
‚‚( 2
,
‚‚2 3
principalColumn
„„ '
:
„„' (
$str
„„) -
,
„„- .
onDelete
‰‰  
:
‰‰  !
ReferentialAction
‰‰" 3
.
‰‰3 4
Cascade
‰‰4 ;
)
‰‰; <
;
‰‰< =
}
ÂÂ 
)
ÂÂ 
;
ÂÂ 
migrationBuilder
ÁÁ 
.
ÁÁ 
CreateTable
ÁÁ (
(
ÁÁ( )
name
ËË 
:
ËË 
$str
ËË '
,
ËË' (
columns
ÈÈ 
:
ÈÈ 
table
ÈÈ 
=>
ÈÈ !
new
ÈÈ" %
{
ÍÍ 
Id
ÎÎ 
=
ÎÎ 
table
ÎÎ 
.
ÎÎ 
Column
ÎÎ %
<
ÎÎ% &
int
ÎÎ& )
>
ÎÎ) *
(
ÎÎ* +
type
ÎÎ+ /
:
ÎÎ/ 0
$str
ÎÎ1 6
,
ÎÎ6 7
nullable
ÎÎ8 @
:
ÎÎ@ A
false
ÎÎB G
)
ÎÎG H
.
ÏÏ 

Annotation
ÏÏ #
(
ÏÏ# $
$str
ÏÏ$ 8
,
ÏÏ8 9
$str
ÏÏ: @
)
ÏÏ@ A
,
ÏÏA B
	ProductId
ÌÌ 
=
ÌÌ 
table
ÌÌ  %
.
ÌÌ% &
Column
ÌÌ& ,
<
ÌÌ, -
int
ÌÌ- 0
>
ÌÌ0 1
(
ÌÌ1 2
type
ÌÌ2 6
:
ÌÌ6 7
$str
ÌÌ8 =
,
ÌÌ= >
nullable
ÌÌ? G
:
ÌÌG H
false
ÌÌI N
)
ÌÌN O
,
ÌÌO P
TransactionId
ÓÓ !
=
ÓÓ" #
table
ÓÓ$ )
.
ÓÓ) *
Column
ÓÓ* 0
<
ÓÓ0 1
int
ÓÓ1 4
>
ÓÓ4 5
(
ÓÓ5 6
type
ÓÓ6 :
:
ÓÓ: ;
$str
ÓÓ< A
,
ÓÓA B
nullable
ÓÓC K
:
ÓÓK L
false
ÓÓM R
)
ÓÓR S
,
ÓÓS T
Quantity
ÔÔ 
=
ÔÔ 
table
ÔÔ $
.
ÔÔ$ %
Column
ÔÔ% +
<
ÔÔ+ ,
int
ÔÔ, /
>
ÔÔ/ 0
(
ÔÔ0 1
type
ÔÔ1 5
:
ÔÔ5 6
$str
ÔÔ7 <
,
ÔÔ< =
nullable
ÔÔ> F
:
ÔÔF G
false
ÔÔH M
)
ÔÔM N
,
ÔÔN O
UnitPrice_Amount
 $
=
% &
table
' ,
.
, -
Column
- 3
<
3 4
decimal
4 ;
>
; <
(
< =
type
= A
:
A B
$str
C R
,
R S
	precision
T ]
:
] ^
$num
_ a
,
a b
scale
c h
:
h i
$num
j k
,
k l
nullable
m u
:
u v
false
w |
)
| }
,
} ~ 
UnitPrice_Currency
ÒÒ &
=
ÒÒ' (
table
ÒÒ) .
.
ÒÒ. /
Column
ÒÒ/ 5
<
ÒÒ5 6
string
ÒÒ6 <
>
ÒÒ< =
(
ÒÒ= >
type
ÒÒ> B
:
ÒÒB C
$str
ÒÒD Q
,
ÒÒQ R
	maxLength
ÒÒS \
:
ÒÒ\ ]
$num
ÒÒ^ _
,
ÒÒ_ `
nullable
ÒÒa i
:
ÒÒi j
false
ÒÒk p
)
ÒÒp q
}
ÚÚ 
,
ÚÚ 
constraints
ÛÛ 
:
ÛÛ 
table
ÛÛ "
=>
ÛÛ# %
{
ÙÙ 
table
ıı 
.
ıı 

PrimaryKey
ıı $
(
ıı$ %
$str
ıı% 9
,
ıı9 :
x
ıı; <
=>
ıı= ?
x
ıı@ A
.
ııA B
Id
ııB D
)
ııD E
;
ııE F
table
ˆˆ 
.
ˆˆ 

ForeignKey
ˆˆ $
(
ˆˆ$ %
name
˜˜ 
:
˜˜ 
$str
˜˜ E
,
˜˜E F
column
¯¯ 
:
¯¯ 
x
¯¯  !
=>
¯¯" $
x
¯¯% &
.
¯¯& '
	ProductId
¯¯' 0
,
¯¯0 1
principalTable
˘˘ &
:
˘˘& '
$str
˘˘( 2
,
˘˘2 3
principalColumn
˙˙ '
:
˙˙' (
$str
˙˙) -
,
˙˙- .
onDelete
˚˚  
:
˚˚  !
ReferentialAction
˚˚" 3
.
˚˚3 4
Cascade
˚˚4 ;
)
˚˚; <
;
˚˚< =
table
¸¸ 
.
¸¸ 

ForeignKey
¸¸ $
(
¸¸$ %
name
˝˝ 
:
˝˝ 
$str
˝˝ M
,
˝˝M N
column
˛˛ 
:
˛˛ 
x
˛˛  !
=>
˛˛" $
x
˛˛% &
.
˛˛& '
TransactionId
˛˛' 4
,
˛˛4 5
principalTable
ˇˇ &
:
ˇˇ& '
$str
ˇˇ( 6
,
ˇˇ6 7
principalColumn
ÄÄ '
:
ÄÄ' (
$str
ÄÄ) -
,
ÄÄ- .
onDelete
ÅÅ  
:
ÅÅ  !
ReferentialAction
ÅÅ" 3
.
ÅÅ3 4
Cascade
ÅÅ4 ;
)
ÅÅ; <
;
ÅÅ< =
}
ÇÇ 
)
ÇÇ 
;
ÇÇ 
migrationBuilder
ÑÑ 
.
ÑÑ 
CreateIndex
ÑÑ (
(
ÑÑ( )
name
ÖÖ 
:
ÖÖ 
$str
ÖÖ 2
,
ÖÖ2 3
table
ÜÜ 
:
ÜÜ 
$str
ÜÜ )
,
ÜÜ) *
column
áá 
:
áá 
$str
áá  
)
áá  !
;
áá! "
migrationBuilder
ââ 
.
ââ 
CreateIndex
ââ (
(
ââ( )
name
ää 
:
ää 
$str
ää %
,
ää% &
table
ãã 
:
ãã 
$str
ãã $
,
ãã$ %
column
åå 
:
åå 
$str
åå (
,
åå( )
unique
çç 
:
çç 
true
çç 
,
çç 
filter
éé 
:
éé 
$str
éé 6
)
éé6 7
;
éé7 8
migrationBuilder
êê 
.
êê 
CreateIndex
êê (
(
êê( )
name
ëë 
:
ëë 
$str
ëë 2
,
ëë2 3
table
íí 
:
íí 
$str
íí )
,
íí) *
column
ìì 
:
ìì 
$str
ìì  
)
ìì  !
;
ìì! "
migrationBuilder
ïï 
.
ïï 
CreateIndex
ïï (
(
ïï( )
name
ññ 
:
ññ 
$str
ññ 2
,
ññ2 3
table
óó 
:
óó 
$str
óó )
,
óó) *
column
òò 
:
òò 
$str
òò  
)
òò  !
;
òò! "
migrationBuilder
öö 
.
öö 
CreateIndex
öö (
(
öö( )
name
õõ 
:
õõ 
$str
õõ 1
,
õõ1 2
table
úú 
:
úú 
$str
úú (
,
úú( )
column
ùù 
:
ùù 
$str
ùù  
)
ùù  !
;
ùù! "
migrationBuilder
üü 
.
üü 
CreateIndex
üü (
(
üü( )
name
†† 
:
†† 
$str
†† "
,
††" #
table
°° 
:
°° 
$str
°° $
,
°°$ %
column
¢¢ 
:
¢¢ 
$str
¢¢ )
)
¢¢) *
;
¢¢* +
migrationBuilder
§§ 
.
§§ 
CreateIndex
§§ (
(
§§( )
name
•• 
:
•• 
$str
•• %
,
••% &
table
¶¶ 
:
¶¶ 
$str
¶¶ $
,
¶¶$ %
column
ßß 
:
ßß 
$str
ßß ,
,
ßß, -
unique
®® 
:
®® 
true
®® 
,
®® 
filter
©© 
:
©© 
$str
©© :
)
©©: ;
;
©©; <
migrationBuilder
´´ 
.
´´ 
CreateIndex
´´ (
(
´´( )
name
¨¨ 
:
¨¨ 
$str
¨¨ 4
,
¨¨4 5
table
≠≠ 
:
≠≠ 
$str
≠≠ (
,
≠≠( )
column
ÆÆ 
:
ÆÆ 
$str
ÆÆ #
)
ÆÆ# $
;
ÆÆ$ %
migrationBuilder
∞∞ 
.
∞∞ 
CreateIndex
∞∞ (
(
∞∞( )
name
±± 
:
±± 
$str
±± 8
,
±±8 9
table
≤≤ 
:
≤≤ 
$str
≤≤ (
,
≤≤( )
column
≥≥ 
:
≥≥ 
$str
≥≥ '
)
≥≥' (
;
≥≥( )
migrationBuilder
µµ 
.
µµ 
CreateIndex
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
$str
∂∂ 1
,
∂∂1 2
table
∑∑ 
:
∑∑ 
$str
∑∑ %
,
∑∑% &
column
∏∏ 
:
∏∏ 
$str
∏∏ #
)
∏∏# $
;
∏∏$ %
}
ππ 	
	protected
ªª 
override
ªª 
void
ªª 
Down
ªª  $
(
ªª$ %
MigrationBuilder
ªª% 5
migrationBuilder
ªª6 F
)
ªªF G
{
ºº 	
migrationBuilder
ΩΩ 
.
ΩΩ 
	DropTable
ΩΩ &
(
ΩΩ& '
name
ææ 
:
ææ 
$str
ææ (
)
ææ( )
;
ææ) *
migrationBuilder
¿¿ 
.
¿¿ 
	DropTable
¿¿ &
(
¿¿& '
name
¡¡ 
:
¡¡ 
$str
¡¡ (
)
¡¡( )
;
¡¡) *
migrationBuilder
√√ 
.
√√ 
	DropTable
√√ &
(
√√& '
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ (
)
ƒƒ( )
;
ƒƒ) *
migrationBuilder
∆∆ 
.
∆∆ 
	DropTable
∆∆ &
(
∆∆& '
name
«« 
:
«« 
$str
«« '
)
««' (
;
««( )
migrationBuilder
…… 
.
…… 
	DropTable
…… &
(
……& '
name
   
:
   
$str
   (
)
  ( )
;
  ) *
migrationBuilder
ÃÃ 
.
ÃÃ 
	DropTable
ÃÃ &
(
ÃÃ& '
name
ÕÕ 
:
ÕÕ 
$str
ÕÕ '
)
ÕÕ' (
;
ÕÕ( )
migrationBuilder
œœ 
.
œœ 
	DropTable
œœ &
(
œœ& '
name
–– 
:
–– 
$str
–– #
)
––# $
;
––$ %
migrationBuilder
““ 
.
““ 
	DropTable
““ &
(
““& '
name
”” 
:
”” 
$str
”” #
)
””# $
;
””$ %
migrationBuilder
’’ 
.
’’ 
	DropTable
’’ &
(
’’& '
name
÷÷ 
:
÷÷ 
$str
÷÷  
)
÷÷  !
;
÷÷! "
migrationBuilder
ÿÿ 
.
ÿÿ 
	DropTable
ÿÿ &
(
ÿÿ& '
name
ŸŸ 
:
ŸŸ 
$str
ŸŸ $
)
ŸŸ$ %
;
ŸŸ% &
migrationBuilder
€€ 
.
€€ 
	DropTable
€€ &
(
€€& '
name
‹‹ 
:
‹‹ 
$str
‹‹  
)
‹‹  !
;
‹‹! "
}
›› 	
}
ﬁﬁ 
}ﬂﬂ ‚&
C:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Context\Migrations\20221005140037_UpdateDomainToDotNet6.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %

Migrations% /
{ 
public 

partial 
class !
UpdateDomainToDotNet6 .
:/ 0
	Migration1 :
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str !
,! "
table 
: 
$str %
,% &
type 
: 
$str %
,% &
nullable 
: 
false 
,  
defaultValue 
: 
$str  
,  !

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldType 
: 
$str (
,( )
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name 
: 
$str !
,! "
table 
: 
$str !
,! "
type 
: 
$str %
,% &
nullable 
: 
false 
,  
defaultValue 
: 
$str  
,  !

oldClrType 
: 
typeof "
(" #
string# )
)) *
,* +
oldType 
: 
$str (
,( )
oldNullable 
: 
true !
)! "
;" #
migrationBuilder 
. 
AlterColumn (
<( )
string) /
>/ 0
(0 1
name   
:   
$str   !
,  ! "
table!! 
:!! 
$str!! !
,!!! "
type"" 
:"" 
$str"" %
,""% &
nullable## 
:## 
false## 
,##  
defaultValue$$ 
:$$ 
$str$$  
,$$  !

oldClrType%% 
:%% 
typeof%% "
(%%" #
string%%# )
)%%) *
,%%* +
oldType&& 
:&& 
$str&& (
,&&( )
oldNullable'' 
:'' 
true'' !
)''! "
;''" #
}(( 	
	protected** 
override** 
void** 
Down**  $
(**$ %
MigrationBuilder**% 5
migrationBuilder**6 F
)**F G
{++ 	
migrationBuilder,, 
.,, 
AlterColumn,, (
<,,( )
string,,) /
>,,/ 0
(,,0 1
name-- 
:-- 
$str-- !
,--! "
table.. 
:.. 
$str.. %
,..% &
type// 
:// 
$str// %
,//% &
nullable00 
:00 
true00 
,00 

oldClrType11 
:11 
typeof11 "
(11" #
string11# )
)11) *
,11* +
oldType22 
:22 
$str22 (
)22( )
;22) *
migrationBuilder44 
.44 
AlterColumn44 (
<44( )
string44) /
>44/ 0
(440 1
name55 
:55 
$str55 !
,55! "
table66 
:66 
$str66 !
,66! "
type77 
:77 
$str77 %
,77% &
nullable88 
:88 
true88 
,88 

oldClrType99 
:99 
typeof99 "
(99" #
string99# )
)99) *
,99* +
oldType:: 
::: 
$str:: (
)::( )
;::) *
migrationBuilder<< 
.<< 
AlterColumn<< (
<<<( )
string<<) /
><</ 0
(<<0 1
name== 
:== 
$str== !
,==! "
table>> 
:>> 
$str>> !
,>>! "
type?? 
:?? 
$str?? %
,??% &
nullable@@ 
:@@ 
true@@ 
,@@ 

oldClrTypeAA 
:AA 
typeofAA "
(AA" #
stringAA# )
)AA) *
,AA* +
oldTypeBB 
:BB 
$strBB (
)BB( )
;BB) *
}CC 	
}DD 
}EE æ
qC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Context\ValueConverters\CurrencyConverter.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Context1 8
;8 9
public 
class 
CurrencyConverter 
:  
ValueConverter! /
</ 0
Currency0 8
,8 9
string: @
>@ A
{ 
public 

CurrencyConverter 
( 
) 
:		 	
base		
 
(		 
currency

 
=>

 
currency

  
.

  !
Code

! %
,

% &
currencyCode 
=> 
Currency $
.$ %
FromCode% -
(- .
currencyCode. :
): ;
); <
{ 
} 
} æ
qC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Context\ValueConverters\MassUnitConverter.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Context1 8
;8 9
public 
class 
MassUnitConverter 
:  
ValueConverter! /
</ 0
MassUnit0 8
,8 9
string: @
>@ A
{ 
public 

MassUnitConverter 
( 
) 
:		 	
base		
 
(		 
massUnit

 
=>

 
massUnit

  
.

  !
Symbol

! '
,

' (

unitSymbol 
=> 
MassUnit "
." #

FromSymbol# -
(- .

unitSymbol. 8
)8 9
)9 :
{ 
} 
} ◊B
ZC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Seed\DbInitializer.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Seed1 5
;5 6
static 
class 
DbInitializer 
{ 
public 

static 
void 
SeedDatabase #
(# $
IApplicationBuilder$ 7

appBuilder8 B
,B C
IConfigurationD R
configurationS `
)` a
{ 
using 
( 
var 
scope 
= 

appBuilder %
.% &
ApplicationServices& 9
.9 :
CreateScope: E
(E F
)F G
)G H
{ 	
var 
services 
= 
scope  
.  !
ServiceProvider! 0
;0 1
var 
settings 
= 
configuration (
.( )
GetMyOptions) 5
<5 6!
ApplicationDbSettings6 K
>K L
(L M
)M N
;N O
try 
{ 
var 
context 
= 
services &
.& '
GetRequiredService' 9
<9 : 
ApplicationDbContext: N
>N O
(O P
)P Q
;Q R
if 
( 
settings 
. 
AutoMigrate (
==) +
true, 0
&&1 3
context4 ;
.; <
Database< D
.D E
IsSqlServerE P
(P Q
)Q R
)R S
{ 
context 
. 
Database $
.$ %
Migrate% ,
(, -
)- .
;. /
}   
if"" 
("" 
settings"" 
."" 
AutoSeed"" %
==""& (
true"") -
)""- .
{## 
SeedDefaultUser$$ #
($$# $
services$$$ ,
,$$, -
configuration$$. ;
.$$; <
GetMyOptions$$< H
<$$H I
UserSeedSettings$$I Y
>$$Y Z
($$Z [
)$$[ \
)$$\ ]
;$$] ^
SeedSampleData%% "
(%%" #
context%%# *
)%%* +
;%%+ ,
}&& 
}'' 
catch(( 
((( 
	Exception(( 
	exception(( &
)((& '
{)) 
var** 
logger** 
=** 
scope** "
.**" #
ServiceProvider**# 2
.**2 3
GetRequiredService**3 E
<**E F
ILogger**F M
<**M N 
ApplicationDbContext**N b
>**b c
>**c d
(**d e
)**e f
;**f g
logger,, 
.,, 
LogError,, 
(,,  
	exception,,  )
,,,) *
$str,,+ g
),,g h
;,,h i
throw.. 
;.. 
}// 
}00 	
}11 
private33 
static33 
void33 
SeedDefaultUser33 '
(33' (
IServiceProvider33( 8
services339 A
,33A B
UserSeedSettings33C S
settings33T \
)33\ ]
{44 
if55 

(55 
!55 
settings55 
.55 
SeedDefaultUser55 %
)55% &
return66 
;66 
using88 
(88 
var88 
userManager88 
=88  
services88! )
.88) *
GetRequiredService88* <
<88< =
UserManager88= H
<88H I
ApplicationUser88I X
>88X Y
>88Y Z
(88Z [
)88[ \
)88\ ]
{99 	
if:: 
(:: 
!:: 
userManager:: 
.:: 
Users:: "
.::" #
Any::# &
(::& '
u::' (
=>::) +
u::, -
.::- .
UserName::. 6
==::7 9
settings::: B
.::B C
DefaultUsername::C R
)::R S
)::S T
{;; 
var<< 
defaultUser<< 
=<<  !
new<<" %
ApplicationUser<<& 5
{<<6 7
UserName<<8 @
=<<A B
settings<<C K
.<<K L
DefaultUsername<<L [
,<<[ \
Email<<] b
=<<c d
settings<<e m
.<<m n
DefaultEmail<<n z
}<<{ |
;<<| }
var== 
result== 
=== 
userManager== (
.==( )
CreateAsync==) 4
(==4 5
defaultUser==5 @
,==@ A
settings==B J
.==J K
DefaultPassword==K Z
)==Z [
.==[ \

GetAwaiter==\ f
(==f g
)==g h
.==h i
	GetResult==i r
(==r s
)==s t
;==t u
if?? 
(?? 
!?? 
result?? 
.?? 
	Succeeded?? %
)??% &
{@@ 
throwAA 
newAA 
	ExceptionAA '
(AA' (
$"AA( *
$strAA* b
"AAb c
+BB 
resultBB  
.BB  !
ErrorsBB! '
.BB' (
	AggregateBB( 1
(BB1 2
$strBB2 4
,BB4 5
(BB6 7
sumBB7 :
,BB: ;
errBB< ?
)BB? @
=>BBA C
sumBBD G
+=BBH J
$"BBK M
{BBM N
EnvironmentBBN Y
.BBY Z
NewLineBBZ a
}BBa b
$strBBb e
{BBe f
errBBf i
.BBi j
DescriptionBBj u
}BBu v
"BBv w
)BBw x
)BBx y
;BBy z
}CC 
}DD 
}EE 	
}FF 
privateHH 
staticHH 
voidHH 
SeedSampleDataHH &
(HH& ' 
ApplicationDbContextHH' ;
contextHH< C
)HHC D
{II 
ifJJ 

(JJ 
!JJ 
contextJJ 
.JJ 
PartnersJJ 
.JJ 
AnyJJ !
(JJ! "
)JJ" #
&&JJ$ &
!JJ' (
contextJJ( /
.JJ/ 0
ProductsJJ0 8
.JJ8 9
AnyJJ9 <
(JJ< =
)JJ= >
)JJ> ?
{KK 	
varLL 
(LL 
productsLL 
,LL 
partnersLL #
)LL# $
=LL% &
DataGeneratorLL' 4
.LL4 5 
GenerateBaseEntitiesLL5 I
(LLI J
)LLJ K
;LLK L
contextNN 
.NN 
PartnersNN 
.NN 
AddRangeNN %
(NN% &
partnersNN& .
)NN. /
;NN/ 0
contextOO 
.OO 
ProductsOO 
.OO 
AddRangeOO %
(OO% &
productsOO& .
)OO. /
;OO/ 0
contextPP 
.PP 
SaveChangesPP 
(PP  
)PP  !
;PP! "
}QQ 	
ifSS 

(SS 
!SS 
contextSS 
.SS 
TransactionsSS !
.SS! "
AnySS" %
(SS% &
)SS& '
)SS' (
{TT 	
varUU 
productsUU 
=UU 
contextUU "
.UU" #
ProductsUU# +
.UU+ ,
ToListUU, 2
(UU2 3
)UU3 4
;UU4 5
varVV 
partnersVV 
=VV 
contextVV "
.VV" #
PartnersVV# +
.VV+ ,
ToListVV, 2
(VV2 3
)VV3 4
;VV4 5
var\\ "
transactionsToGenerate\\ &
=\\' (
$num\\) ,
;\\, -
for]] 
(]] 
int]] 
i]] 
=]] 
$num]] 
;]] 
i]] 
<]] "
transactionsToGenerate]]  6
;]]6 7
i]]8 9
++]]9 ;
)]]; <
{^^ 
context__ 
.__ 
Transactions__ $
.__$ %
Add__% (
(__( )
DataGenerator`` !
.``! "
GenerateTransaction``" 5
(``5 6
partners``6 >
,``> ?
products``@ H
)``H I
)``I J
;``J K
contextaa 
.aa 
SaveChangesaa #
(aa# $
)aa$ %
;aa% &
}bb 
}cc 	
}dd 
}ee ™
fC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Settings\ApplicationDbSettings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Settings1 9
;9 :
class !
ApplicationDbSettings 
{ 
[ 
Required 
] 
public		 

bool		 
?		 
AutoMigrate		 
{		 
get		 "
;		" #
init		$ (
;		( )
}		* +
[ 
Required 
] 
public 

bool 
? 
AutoSeed 
{ 
get 
;  
init! %
;% &
}' (
} Ê
bC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Settings\ConnectionStrings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Settings1 9
;9 :
public 
class 
ConnectionStrings 
{ 
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public 

string 
DefaultConnection #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
} ˙
aC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Settings\UserSeedSettings.cs
	namespace 	
MyWarehouse
 
. 
Infrastructure $
.$ %
Persistence% 0
.0 1
Settings1 9
;9 :
class 
UserSeedSettings 
{ 
[ 
MemberNotNullWhen 
( 
true 
, 
nameof #
(# $
DefaultUsername$ 3
)3 4
,4 5
nameof6 <
(< =
DefaultPassword= L
)L M
)M N
]N O
public		 

bool		 
SeedDefaultUser		 
{		  !
get		" %
;		% &
init		' +
;		+ ,
}		- .
[ 

RequiredIf 
( 
nameof 
( 
SeedDefaultUser &
)& '
,' (
true) -
)- .
]. /
public 

string 
? 
DefaultUsername "
{# $
get% (
;( )
init* .
;. /
}0 1
[ 

RequiredIf 
( 
nameof 
( 
SeedDefaultUser &
)& '
,' (
true) -
)- .
]. /
public 

string 
? 
DefaultPassword "
{# $
get% (
;( )
init* .
;. /
}0 1
public 

string 
DefaultEmail 
{  
get! $
;$ %
init& *
;* +
}, -
=. /
null0 4
!4 5
;5 6
} £
OC:\Users\csingare\Desktop\MyWarehouse\src\Infrastructure\Persistence\Startup.cs
	namespace

 	
MyWarehouse


 
.

 
Infrastructure

 $
.

$ %
Persistence

% 0
;

0 1
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
Startup 
{ 
public 

static 
void 
ConfigureServices (
(( )
this) -
IServiceCollection. @
servicesA I
,I J
IConfigurationK Y
configurationZ g
,g h
IHostEnvironmenti y
envz }
)} ~
{ 
services 
. 
AddSingleton 
( 
configuration +
.+ ,
GetMyOptions, 8
<8 9!
ApplicationDbSettings9 N
>N O
(O P
)P Q
)Q R
;R S
services 
. 
AddDbContext 
<  
ApplicationDbContext 2
>2 3
(3 4
options4 ;
=>< >
{? @
options 
. 
UseSqlServer  
(  !
configuration 
. 
GetMyOptions *
<* +
ConnectionStrings+ <
>< =
(= >
)> ?
.? @
DefaultConnection@ Q
,Q R
opts 
=> 
opts 
. 
MigrationsAssembly /
(/ 0
typeof0 6
(6 7 
ApplicationDbContext7 K
)K L
.L M
AssemblyM U
.U V
FullNameV ^
)^ _
)_ `
;` a
if 
( 
env 
. 
IsDevelopment !
(! "
)" #
)# $
options 
. &
EnableSensitiveDataLogging 2
(2 3
)3 4
;4 5
} 	
)	 

;
 
} 
public 

static 
void 
	Configure  
(  !
IApplicationBuilder! 4
app5 8
,8 9
IConfiguration: H
configurationI V
)V W
{   
Seed!! 
.!! 
DbInitializer!! 
.!! 
SeedDatabase!! '
(!!' (
app!!( +
,!!+ ,
configuration!!- :
)!!: ;
;!!; <
}"" 
}## 