â
KC:\Users\csingare\Desktop\MyWarehouse\src\Application\ApplicationStartup.cs
	namespace 	
MyWarehouse
 
. 
Application !
;! "
public 
static 
class 
ApplicationStartup &
{ 
public		 

static		 
void		 (
AddMyApplicationDependencies		 3
(		3 4
this		4 8
IServiceCollection		9 K
services		L T
)		T U
{

 
services 
. 
AddAutoMapper 
( 
Assembly '
.' ( 
GetExecutingAssembly( <
(< =
)= >
)> ?
;? @
services 
. %
AddValidatorsFromAssembly *
(* +
Assembly+ 3
.3 4 
GetExecutingAssembly4 H
(H I
)I J
)J K
;K L
services 
. 

AddMediatR 
( 
Assembly $
.$ % 
GetExecutingAssembly% 9
(9 :
): ;
); <
;< =
services 
. 
AddTransient 
( 
typeof $
($ %
IPipelineBehavior% 6
<6 7
,7 8
>8 9
)9 :
,: ;
typeof< B
(B C$
ExceptionLoggingBehaviorC [
<[ \
,\ ]
>] ^
)^ _
)_ `
;` a
services 
. 
AddTransient 
( 
typeof $
($ %
IPipelineBehavior% 6
<6 7
,7 8
>8 9
)9 :
,: ;
typeof< B
(B C%
RequestValidationBehaviorC \
<\ ]
,] ^
>^ _
)_ `
)` a
;a b
} 
} Á
RC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\AppOperationResult.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
{ 
} î
bC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Behaviors\ExceptionLoggingBehavior.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
	Behaviors) 2
;2 3
public 
class $
ExceptionLoggingBehavior %
<% &
TRequest& .
,. /
	TResponse0 9
>9 :
:; <
IPipelineBehavior= N
<N O
TRequestO W
,W X
	TResponseY b
>b c
where 	
TRequest
 
: 
IRequest 
< 
	TResponse &
>& '
{ 
private		 
readonly		 
ILogger		 
<		 
TRequest		 %
>		% &
_logger		' .
;		. /
public 
$
ExceptionLoggingBehavior #
(# $
ILogger$ +
<+ ,
TRequest, 4
>4 5
logger6 <
)< =
=> 

_logger 
= 
logger 
; 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9
CancellationToken: K
cancellationTokenL ]
,] ^"
RequestHandlerDelegate_ u
<u v
	TResponsev 
>	 Ä
next
Å Ö
)
Ö Ü
{ 
try 
{ 	
return 
await 
next 
( 
) 
;  
} 	
catch 
( $
InputValidationException '
ive( +
)+ ,
{ 	
var 
requestName 
= 
typeof $
($ %
TRequest% -
)- .
.. /
Name/ 3
;3 4
_logger 
. 
LogError 
( 
ive  
,  !
$str	" ó
,
ó ò
requestName
ô §
,
§ •
request
¶ ≠
,
≠ Æ
ive
Ø ≤
.
≤ ≥
Errors
≥ π
)
π ∫
;
∫ ª
throw 
; 
} 	
catch 
( 
	Exception 
e 
) 
{ 	
var 
requestName 
= 
typeof $
($ %
TRequest% -
)- .
.. /
Name/ 3
;3 4
_logger 
. 
LogError 
( 
e 
, 
$str  v
,v w
requestName	x É
,
É Ñ
request
Ö å
)
å ç
;
ç é
throw   
;   
}!! 	
}"" 
}## Ω
cC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Behaviors\RequestValidationBehavior.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
	Behaviors) 2
;2 3
public 
class %
RequestValidationBehavior &
<& '
TRequest' /
,/ 0
	TResponse1 :
>: ;
:< =
IPipelineBehavior> O
<O P
TRequestP X
,X Y
	TResponseZ c
>c d
where 	
TRequest
 
: 
IRequest 
< 
	TResponse '
>' (
{ 
private		 
readonly		 
IEnumerable		  
<		  !

IValidator		! +
<		+ ,
TRequest		, 4
>		4 5
>		5 6
_validators		7 B
;		B C
public 
%
RequestValidationBehavior $
($ %
IEnumerable% 0
<0 1

IValidator1 ;
<; <
TRequest< D
>D E
>E F

validatorsG Q
)Q R
{ 
_validators 
= 

validators  
;  !
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest( 0
request1 8
,8 9
CancellationToken: K
cancellationTokenL ]
,] ^"
RequestHandlerDelegate_ u
<u v
	TResponsev 
>	 Ä
next
Å Ö
)
Ö Ü
{ 
if 

( 
_validators 
. 
Any 
( 
) 
) 
{ 	
var 
context 
= 
new 
ValidationContext /
</ 0
TRequest0 8
>8 9
(9 :
request: A
)A B
;B C
var 
results 
= 
await 
Task  $
.$ %
WhenAll% ,
(, -
_validators- 8
. 
Select 
( 
v 
=> 
v 
. 
ValidateAsync ,
(, -
context- 4
)4 5
)5 6
)6 7
;7 8
var 
failures 
= 
results "
. 
Where 
( 
r 
=> 
! 
r 
. 
IsValid &
)& '
. 

SelectMany 
( 
r 
=>  
r! "
." #
Errors# )
)) *
. 
ToList 
( 
) 
; 
if 
( 
failures 
. 
Any 
( 
) 
) 
{ 
throw   
new   $
InputValidationException   2
(  2 3
failures  3 ;
)  ; <
;  < =
}!! 
}"" 	
return$$ 
await$$ 
next$$ 
($$ 
)$$ 
;$$ 
}%% 
}&& È

cC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\IUnitOfWork.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
;@ A
public 
	interface 
IUnitOfWork 
: 
IDisposable *
{ 
public 

IPartnerRepository 
Partners &
{' (
get) ,
;, -
}. /
public 

IProductRepository 
Products &
{' (
get) ,
;, -
}. /
public		 
"
ITransactionRepository		 !
Transactions		" .
{		/ 0
get		1 4
;		4 5
}		6 7
bool

  
HasActiveTransaction

	 
{

 
get

  #
;

# $
}

% &
Task !
BeginTransactionAsync	 
( 
)  
;  !
Task "
CommitTransactionAsync	 
(  
)  !
;! "
Task $
RollbackTransactionAsync	 !
(! "
)" #
;# $
public 

Task 
SaveChanges 
( 
) 
; 
} œ
~C:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\Common\IListResponseModel.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
.M N
CommonN T
;T U
public 
	interface 
IListResponseModel #
<# $
T$ %
>% &
{ 
int 
	PageIndex 
{ 
get 
; 
} 
int 
PageSize 
{ 
get 
; 
} 
int 
	PageCount 
{ 
get 
; 
} 
int		 
RowCount		 
{		 
get		 
;		 
}		 
string 

?
 
ActiveFilter 
{ 
get 
; 
}  !
string 

?
 
ActiveOrderBy 
{ 
get 
;  
}! "
int 
FirstRowOnPage 
{ 
get 
; 
} 
int 
LastRowOnPage 
{ 
get 
; 
} 
IEnumerable 
< 
T 
> 
Results 
{ 
get  
;  !
set" %
;% &
}' (
} ˚
wC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\Common\IRepository.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
.M N
CommonN T
;T U
public 
	interface 
IRepository 
< 
TEntity $
>$ %
where& +
TEntity, 3
:4 5
IEntity6 =
{ 
Task 
< 	
TEntity	 
? 
> 
GetByIdAsync 
(  
int  #
id$ &
)& '
;' (
Task 
< 	
IEnumerable	 
< 
TEntity 
> 
> 
GetFiltered *
(* +

Expression+ 5
<5 6
Func6 :
<: ;
TEntity; B
,B C
boolD H
>H I
>I J
filterK Q
,Q R
boolS W
readOnlyX `
=a b
falsec h
)h i
;i j
void 
Add	 
( 
TEntity 
entity 
) 
; 
void 
AddRange	 
( 
IEnumerable 
< 
TEntity %
>% &
entities' /
)/ 0
;0 1
void 
Remove	 
( 
TEntity 
entity 
) 
;  
void 
RemoveRange	 
( 
IEnumerable  
<  !
TEntity! (
>( )
entities* 2
)2 3
;3 4
void 
StartTracking	 
( 
TEntity 
entity %
)% &
;& '
Task 
< 	
TDto	 
? 
> 
GetProjectedAsync !
<! "
TDto" &
>& '
(' (
int( +
id, .
,. /
bool0 4
readOnly5 =
=> ?
false@ E
)E F
whereG L
TDtoM Q
:R S
IMapFromT \
<\ ]
TEntity] d
>d e
;e f
Task   
<   	
IListResponseModel  	 
<   
TDto    
>    !
>  ! "!
GetProjectedListAsync  # 8
<  8 9
TDto  9 =
>  = >
(  > ?
ListQueryModel  ? M
<  M N
TDto  N R
>  R S
model  T Y
,  Y Z

Expression  [ e
<  e f
Func  f j
<  j k
TEntity  k r
,  r s
bool  t x
>  x y
>  y z
?  z {
additionalFilter	  | å
=
  ç é
null
  è ì
,
  ì î
bool
  ï ô
readOnly
  ö ¢
=
  £ §
false
  • ™
)
  ™ ´
where
  ¨ ±
TDto
  ≤ ∂
:
  ∑ ∏
IMapFrom
  π ¡
<
  ¡ ¬
TEntity
  ¬ …
>
  …  
;
    À
}!! Æ
zC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\Common\ListQueryModel.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
.M N
CommonN T
;T U
public 
class 
ListQueryModel 
< 
TDto  
>  !
:" #
IRequest$ ,
<, -
IListResponseModel- ?
<? @
TDto@ D
>D E
>E F
{ 
[

 
Range

 

(


 
$num

 
,

 
int

 
.

 
MaxValue

 
,

 
ErrorMessage

 (
=

) *
$str

+ I
)

I J
]

J K
public 

int 
	PageIndex 
{ 
get 
; 
set  #
;# $
}% &
=' (
$num) *
;* +
[ 
Range 

(
 
$num 
, 
MAX_PAGESIZE 
) 
] 
public 

int 
PageSize 
{ 
get 
; 
set "
;" #
}$ %
=& '
DEFAULT_PAGESIZE( 8
;8 9
public 

string 
OrderBy 
{ 
get 
;  
set! $
;$ %
}& '
=( )
$str* .
;. /
public 

string 
? 
Filter 
{ 
get 
;  
set! $
;$ %
}& '
private 
const 
int 
DEFAULT_PAGESIZE &
=' (
$num) +
;+ ,
private 
const 
int 
MAX_PAGESIZE "
=# $
$num% (
;( )
public   

void   *
ThrowOrderByIncorrectException   .
(  . /
	Exception  / 8
?  8 9
innerException  : H
)  H I
{!! 
throw"" 
new"" $
InputValidationException"" *
(""* +
innerException""+ 9
,""9 :
(## 
PropertyName$$ 
:$$ 
nameof$$ $
($$$ %
OrderBy$$% ,
)$$, -
,$$- .
ErrorMessage%% 
:%% 
$"%%  
$str%%  >
{%%> ?
OrderBy%%? F
}%%F G
$str%%G T
"%%T U
)&& 
)'' 	
;''	 

}(( 
public** 

void** )
ThrowFilterIncorrectException** -
(**- .
	Exception**. 7
?**7 8
innerException**9 G
)**G H
{++ 
throw,, 
new,, $
InputValidationException,, *
(,,* +
innerException,,+ 9
,,,9 :
(-- 
PropertyName.. 
:.. 
nameof.. $
(..$ %
Filter..% +
)..+ ,
,.., -
ErrorMessage// 
:// 
$"//  
$str//  =
{//= >
Filter//> D
}//D E
$str//E R
"//R S
)00 
)11 	
;11	 

}22 
}33 ∏
wC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\IPartnerRepository.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
;M N
public 
	interface 
IPartnerRepository #
:$ %
IRepository& 1
<1 2
Partner2 9
>9 :
{ 
} ü
wC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\IProductRepository.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
;M N
public 
	interface 
IProductRepository #
:$ %
IRepository& 1
<1 2
Product2 9
>9 :
{ 
Task 
< 	
List	 
< 
Product 
> 
> 
GetHeaviestProducts +
(+ ,
int, /
numberOfProducts0 @
)@ A
;A B
Task		 
<		 	
List			 
<		 
Product		 
>		 
>		 "
GetMostStockedProducts		 .
(		. /
int		/ 2
numberOfProducts		3 C
)		C D
;		D E
}

 å
{C:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\DataAccess\Repositories\ITransactionRepository.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Dependencies) 5
.5 6

DataAccess6 @
.@ A
RepositoriesA M
;M N
public 
	interface "
ITransactionRepository '
:( )
IRepository* 5
<5 6
Transaction6 A
>A B
{ 
Task 
< 	
Transaction	 
? 
>  
GetEntireTransaction +
(+ ,
int, /
id0 2
)2 3
;3 4
}		 Ë
iC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\Services\ICurrentUserService.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Dependencies" .
.. /
Services/ 7
;7 8
public 
	interface 
ICurrentUserService $
{ 
string 

UserId 
{ 
get 
; 
} 
} ”
_C:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\Services\IDateTime.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Dependencies" .
.. /
Services/ 7
;7 8
public 
	interface 
	IDateTime 
{ 
DateTime 
Now 
{ 
get 
; 
} 
} ﬂ
mC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Dependencies\Services\IStockStatisticsService.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Dependencies" .
.. /
Services/ 7
;7 8
public 
	interface #
IStockStatisticsService (
{ 
Task 
< 	
Mass	 
> $
GetProductStockTotalMass '
(' (
MassUnit( 0
unit1 5
)5 6
;6 7
Task 
< 	
Money	 
> %
GetProductStockTotalValue )
() *
)* +
;+ ,
Task 
< 	
(	 

int
 
ProductCount 
, 
int 

TotalStock  *
)* +
>+ ,!
GetProductStockCounts- B
(B C
)C D
;D E
} å
bC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Exceptions\EntityNotFoundException.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )

Exceptions) 3
;3 4
public 
class #
EntityNotFoundException $
:% &
	Exception' 0
{ 
public 
#
EntityNotFoundException "
(" #
)# $
: 	
base
 
( 
$str &
)& '
{ 
} 
public

 
#
EntityNotFoundException

 "
(

" #
string

# )
message

* 1
)

1 2
: 	
base
 
( 
message 
) 
{ 
} 
public 
#
EntityNotFoundException "
(" #
string# )
message* 1
,1 2
	Exception3 <
innerException= K
)K L
: 	
base
 
( 
message 
, 
innerException &
)& '
{ 
} 
public 
#
EntityNotFoundException "
(" #
string# )

entityName* 4
,4 5
object6 <
entityId= E
)E F
: 	
base
 
( 
$" 
$str 
{ 

entityName $
}$ %
$str% 0
{0 1
entityId1 9
}9 :
$str: J
"J K
)K L
{ 
} 
} É&
cC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Exceptions\InputValidationException.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )

Exceptions) 3
;3 4
public 
class $
InputValidationException %
:& '
	Exception( 1
{ 
public		 

IDictionary		 
<		 
string		 
,		 
string		 %
[		% &
]		& '
>		' (
Errors		) /
{		0 1
get		2 5
;		5 6
}		7 8
public 
$
InputValidationException #
(# $
	Exception$ -
?- .
innerException/ =
=> ?
null@ D
)D E
: 	
base
 
( 
$str ?
,? @
innerExceptionA O
)O P
=> 

Errors 
= 
new 

Dictionary "
<" #
string# )
,) *
string+ 1
[1 2
]2 3
>3 4
(4 5
)5 6
;6 7
public 
$
InputValidationException #
(# $
params$ *
(+ ,
string, 2
PropertyName3 ?
,? @
stringA G
ErrorMessageH T
)T U
[U V
]V W
failuresX `
)` a
:b c
thisd h
(h i
)i j
=> 

SaveGroupedErrors 
( 
failures %
)% &
;& '
public 
$
InputValidationException #
(# $
	Exception$ -
?- .
innerException/ =
,= >
params? E
(F G
stringG M
PropertyNameN Z
,Z [
string\ b
ErrorMessagec o
)o p
[p q
]q r
failuress {
){ |
:} ~
this	 É
(
É Ñ
innerException
Ñ í
)
í ì
=> 

SaveGroupedErrors 
( 
failures %
)% &
;& '
public 
$
InputValidationException #
(# $
IEnumerable$ /
</ 0
ValidationFailure0 A
>A B
failuresC K
)K L
:M N
thisO S
(S T
)T U
=> 

SaveGroupedErrors 
( 
failures %
.% &
Select& ,
(, -
x- .
=>/ 1
(2 3
x3 4
.4 5
PropertyName5 A
,A B
xC D
.D E
ErrorMessageE Q
)Q R
)R S
)S T
;T U
private 
void 
SaveGroupedErrors "
(" #
IEnumerable# .
<. /
(/ 0
string0 6
PropertyName7 C
,C D
stringE K
ErrorMessageL X
)X Y
>Y Z
failures[ c
)c d
{ 
var 
failureGroups 
= 
failures $
. 
GroupBy 
( 
e 
=> 
e 
. 
PropertyName (
,( )
e* +
=>, .
e/ 0
.0 1
ErrorMessage1 =
)= >
;> ?
foreach 
( 
var 
failureGroup !
in" $
failureGroups% 2
)2 3
{ 	
var 
propertyName 
= 
failureGroup +
.+ ,
Key, /
;/ 0
var   
propertyFailures    
=  ! "
failureGroup  # /
.  / 0
ToArray  0 7
(  7 8
)  8 9
;  9 :
Errors"" 
."" 
Add"" 
("" 
propertyName"" #
,""# $
propertyFailures""% 5
)""5 6
;""6 7
}## 	
}$$ 
public&& 

override&& 
string&& 
ToString&& #
(&&# $
)&&$ %
{'' 
return(( 
nameof(( 
((( $
InputValidationException(( .
)((. /
+((0 1
$str((2 6
+((7 8
JsonSerializer((9 G
.((G H
	Serialize((H Q
(((Q R
this((R V
,((V W
new((X [!
JsonSerializerOptions((\ q
(((q r
)((r s
{((t u
WriteIndented	((v É
=
((Ñ Ö
true
((Ü ä
}
((ã å
)
((å ç
;
((ç é
})) 
}** ˙
PC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Mapping\IMapFrom.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Mapping) 0
;0 1
public 
	interface 
IMapFrom 
< 
TEntity !
>! "
{ 
void 
Mapping	 
( 
Profile 
profile  
)  !
=>" $
profile% ,
., -
	CreateMap- 6
(6 7
typeof7 =
(= >
TEntity> E
)E F
,F G
GetTypeH O
(O P
)P Q
)Q R
;R S
} Û
VC:\Users\csingare\Desktop\MyWarehouse\src\Application\Common\Mapping\MappingProfile.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Common" (
.( )
Mapping) 0
{ 
public 

class 
MappingProfile 
:  !
Profile" )
{ 
public 
MappingProfile 
( 
) 
{ 	%
ApplyMappingsFromAssembly %
(% &
Assembly& .
.. / 
GetExecutingAssembly/ C
(C D
)D E
)E F
;F G
} 	
private 
void %
ApplyMappingsFromAssembly .
(. /
Assembly/ 7
assembly8 @
)@ A
{ 	
var 
types 
= 
assembly  
.  !
GetExportedTypes! 1
(1 2
)2 3
. 
Where 
( 
t 
=> 
t 
. 
GetInterfaces +
(+ ,
), -
.- .
Any. 1
(1 2
i2 3
=>4 6
i 
. 
IsGenericType #
&&$ &
i' (
.( )$
GetGenericTypeDefinition) A
(A B
)B C
==D F
typeofG M
(M N
IMapFromN V
<V W
>W X
)X Y
)Y Z
)Z [
. 
ToList 
( 
) 
; 
foreach 
( 
var 
type 
in  
types! &
)& '
{ 
var 
instance 
= 
	Activator (
.( )
CreateInstance) 7
(7 8
type8 <
)< =
;= >
var 

methodInfo 
=  
type! %
.% &
	GetMethod& /
(/ 0
$str0 9
)9 :
?? 
type 
. 
GetInterface (
(( )
$str) 5
)5 6
?6 7
.7 8
	GetMethod8 A
(A B
$strB K
)K L
;L M

methodInfo!! 
?!! 
.!! 
Invoke!! "
(!!" #
instance!!# +
,!!+ ,
new!!- 0
object!!1 7
[!!7 8
]!!8 9
{!!: ;
this!!< @
}!!A B
)!!B C
;!!C D
}"" 
}## 	
}$$ 
}%% G
EC:\Users\csingare\Desktop\MyWarehouse\src\Application\GlobalUsings.csÜ"
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\CreatePartner\CreatePartnerCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
CreatePartner+ 8
;8 9
public 
record  
CreatePartnerCommand "
:# $
IRequest% -
<- .
int. 1
>1 2
{ 
public 

string 
Name 
{ 
get 
; 
init "
;" #
}$ %
=& '
null( ,
!, -
;- .
public		 


AddressDto		 
Address		 
{		 
get		  #
;		# $
init		% )
;		) *
}		+ ,
=		- .
null		/ 3
!		3 4
;		4 5
public 

record 

AddressDto 
{ 
public 
string 
Country 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ZipCode 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
Street 
{ 
get "
;" #
init$ (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
City 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
} 
} 
public 
class '
CreatePartnerCommandHandler (
:) *
IRequestHandler+ :
<: ; 
CreatePartnerCommand; O
,O P
intQ T
>T U
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
CreatePartnerCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
int 
> 
Handle !
(! " 
CreatePartnerCommand" 6
request7 >
,> ?
CancellationToken@ Q
cancellationTokenR c
)c d
{ 
var 
partner 
= 
new 
Partner !
(! "
name 
: 
request 
. 
Name 
. 
Trim #
(# $
)$ %
,% &
address 
: 
new 
Address  
(  !
country   
:   
request    
.    !
Address  ! (
.  ( )
Country  ) 0
.  0 1
Trim  1 5
(  5 6
)  6 7
,  7 8
zipcode!! 
:!! 
request!!  
.!!  !
Address!!! (
.!!( )
ZipCode!!) 0
.!!0 1
Trim!!1 5
(!!5 6
)!!6 7
,!!7 8
street"" 
:"" 
request"" 
.""  
Address""  '
.""' (
Street""( .
."". /
Trim""/ 3
(""3 4
)""4 5
,""5 6
city## 
:## 
request## 
.## 
Address## %
.##% &
City##& *
.##* +
Trim##+ /
(##/ 0
)##0 1
)$$ 
)$$ 
;$$ 
_unitOfWork&& 
.&& 
Partners&& 
.&& 
Add&&  
(&&  !
partner&&! (
)&&( )
;&&) *
await'' 
_unitOfWork'' 
.'' 
SaveChanges'' %
(''% &
)''& '
;''' (
return)) 
partner)) 
.)) 
Id)) 
;)) 
}** 
}++ í
mC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\CreatePartner\CreatePartnerCommandValidator.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
CreatePartner+ 8
;8 9
public 
class )
CreatePartnerCommandValidator *
:+ ,
AbstractValidator- >
<> ? 
CreatePartnerCommand? S
>S T
{ 
public 
)
CreatePartnerCommandValidator (
(( )
)) *
{ 
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
. 
MaximumLength 
( 
PartnerInvariants ,
., -
NameMaxLength- :
): ;
;; <
RuleFor 
( 
x 
=> 
x 
. 
Address 
) 
.  
NotNull  '
(' (
)( )
.) *
DependentRules* 8
(8 9
(9 :
): ;
=>< >
{ 	
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
Country# *
)* +
.+ ,
NotNull, 3
(3 4
)4 5
.5 6
MaximumLength6 C
(C D
$numD G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
ZipCode# *
)* +
.+ ,
NotNull, 3
(3 4
)4 5
.5 6
MaximumLength6 C
(C D
$numD G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
Street# )
)) *
.* +
NotNull+ 2
(2 3
)3 4
.4 5
MaximumLength5 B
(B C
$numC F
)F G
;G H
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
City# '
)' (
.( )
NotNull) 0
(0 1
)1 2
.2 3
MaximumLength3 @
(@ A
$numA D
)D E
;E F
} 	
)	 

;
 
} 
} ©
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\DeletePartner\DeletePartnerCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
DeletePartner+ 8
;8 9
public 
record  
DeletePartnerCommand "
:# $
IRequest% -
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
init		 
;		 
}		  
}

 
public 
class '
DeletePartnerCommandHandler (
:) *
IRequestHandler+ :
<: ; 
DeletePartnerCommand; O
>O P
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
DeletePartnerCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
Unit 
> 
Handle "
(" # 
DeletePartnerCommand# 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 
var 
partner 
= 
await 
_unitOfWork '
.' (
Partners( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Partner8 ?
)? @
,@ A
requestB I
.I J
IdJ L
)L M
;M N
_unitOfWork 
. 
Partners 
. 
Remove #
(# $
partner$ +
)+ ,
;, -
await 
_unitOfWork 
. 
SaveChanges %
(% &
)& '
;' (
return 
Unit 
. 
Value 
; 
} 
} Ú
jC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\GetPartnerDetails\GetPartnerDetailsQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
GetPartnerDetails+ <
;< =
public 
record "
GetPartnerDetailsQuery $
:% &
IRequest' /
</ 0
PartnerDetailsDto0 A
>A B
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
set		 
;		 
}		 
}

 
public 
class )
GetPartnerDetailsQueryHandler *
:+ ,
IRequestHandler- <
<< ="
GetPartnerDetailsQuery= S
,S T
PartnerDetailsDtoU f
>f g
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
private 
readonly 
IMapper 
_mapper $
;$ %
public 
)
GetPartnerDetailsQueryHandler (
(( )
IUnitOfWork) 4

unitOfWork5 ?
,? @
IMapperA H
mapperI O
)O P
{ 
_unitOfWork 
= 

unitOfWork  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
PartnerDetailsDto '
>' (
Handle) /
(/ 0"
GetPartnerDetailsQuery0 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 
var 
partner 
= 
await 
_unitOfWork '
.' (
Partners( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Partner8 ?
)? @
,@ A
requestB I
.I J
IdJ L
)L M
;M N
return 
_mapper 
. 
Map 
< 
PartnerDetailsDto ,
>, -
(- .
partner. 5
)5 6
;6 7
} 
} ı
eC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\GetPartnerDetails\PartnerDetailsDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
GetPartnerDetails+ <
;< =
public 
record 
PartnerDetailsDto 
:  !
IMapFrom" *
<* +
Partner+ 2
>2 3
{ 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public		 

string		 
Name		 
{		 
get		 
;		 
init		 "
;		" #
}		$ %
=		& '
null		( ,
!		, -
;		- .
public

 

DateTime

 
	CreatedAt

 
{

 
get

  #
;

# $
init

% )
;

) *
}

+ ,
public 

DateTime 
? 
LastModifiedAt #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
public 


AddressDto 
Address 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
new/ 2
(2 3
)3 4
;4 5
public 

void 
Mapping 
( 
Profile 
profile  '
)' (
{ 
profile 
. 
	CreateMap 
< 
Partner !
,! "
PartnerDetailsDto# 4
>4 5
(5 6
)6 7
;7 8
profile 
. 
	CreateMap 
< 
Address !
,! "

AddressDto# -
>- .
(. /
)/ 0
;0 1
} 
public 

record 

AddressDto 
{ 
public 
string 
Country 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ZipCode 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
City 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 
string 
Street 
{ 
get "
;" #
init$ (
;( )
}* +
=, -
null. 2
!2 3
;3 4
} 
} ‚
fC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\GetPartnersList\GetPartnersListQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
GetPartners+ 6
;6 7
public 
class '
GetPartnersListQueryHandler (
:) *
IRequestHandler+ :
<: ;
ListQueryModel; I
<I J

PartnerDtoJ T
>T U
,U V
IListResponseModelW i
<i j

PartnerDtoj t
>t u
>u v
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public

 
'
GetPartnersListQueryHandler

 &
(

& '
IUnitOfWork

' 2

unitOfWork

3 =
)

= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

Task 
< 
IListResponseModel "
<" #

PartnerDto# -
>- .
>. /
Handle0 6
(6 7
ListQueryModel7 E
<E F

PartnerDtoF P
>P Q
requestR Y
,Y Z
CancellationToken[ l
cancellationTokenm ~
)~ 
=> 

_unitOfWork 
. 
Partners 
.  !
GetProjectedListAsync  5
(5 6
request6 =
,= >
readOnly? G
:G H
trueI M
)M N
;N O
} û
\C:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\GetPartnersList\PartnerDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
GetPartners+ 6
;6 7
public 
record 

PartnerDto 
: 
IMapFrom #
<# $
Partner$ +
>+ ,
{ 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public		 

string		 
Name		 
{		 
get		 
;		 
init		 "
;		" #
}		$ %
=		& '
null		( ,
!		, -
;		- .
public 

string 
Address 
{ 
get 
;  
init! %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 

string 
Country 
{ 
get 
;  
init! %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 

string 
ZipCode 
{ 
get 
;  
init! %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 

string 
City 
{ 
get 
; 
init "
;" #
}$ %
=& '
null( ,
!, -
;- .
public 

string 
Street 
{ 
get 
; 
init  $
;$ %
}& '
=( )
null* .
!. /
;/ 0
public 

void 
Mapping 
( 
Profile 
profile  '
)' (
{ 
profile 
. 
	CreateMap 
< 
Partner !
,! "

PartnerDto# -
>- .
(. /
)/ 0
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Country$ +
,+ ,
x- .
=>/ 1
x2 3
.3 4
MapFrom4 ;
(; <
src< ?
=>@ B
srcC F
.F G
AddressG N
.N O
CountryO V
)V W
)W X
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
ZipCode$ +
,+ ,
x- .
=>/ 1
x2 3
.3 4
MapFrom4 ;
(; <
src< ?
=>@ B
srcC F
.F G
AddressG N
.N O
ZipCodeO V
)V W
)W X
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
City$ (
,( )
x* +
=>, .
x/ 0
.0 1
MapFrom1 8
(8 9
src9 <
=>= ?
src@ C
.C D
AddressD K
.K L
CityL P
)P Q
)Q R
. 
	ForMember 
( 
dest 
=> 
dest #
.# $
Street$ *
,* +
x, -
=>. 0
x1 2
.2 3
MapFrom3 :
(: ;
src; >
=>? A
srcB E
.E F
AddressF M
.M N
StreetN T
)T U
)U V
;V W
} 
} ∂%
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\UpdatePartner\UpdatePartnerCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
UpdatePartner+ 8
;8 9
public 
record  
UpdatePartnerCommand "
:# $
IRequest% -
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
init		 
;		 
}		  
public

 

string

 
Name

 
{

 
get

 
;

 
init

 "
;

" #
}

$ %
=

& '
null

( ,
!

, -
;

- .
public 


AddressDto 
Address 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

record 

AddressDto 
{ 
public 
string 
Country 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ZipCode 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
Street 
{ 
get "
;" #
init$ (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
City 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
} 
} 
public 
class '
UpdatePartnerCommandHandler (
:) *
IRequestHandler+ :
<: ; 
UpdatePartnerCommand; O
>O P
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
UpdatePartnerCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
Unit 
> 
Handle "
(" # 
UpdatePartnerCommand# 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 
var 
partner 
= 
await 
_unitOfWork '
.' (
Partners( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
??   
throw   
new   #
EntityNotFoundException   0
(  0 1
nameof  1 7
(  7 8
Partner  8 ?
)  ? @
,  @ A
request  B I
.  I J
Id  J L
)  L M
;  M N
partner"" 
."" 

UpdateName"" 
("" 
request"" "
.""" #
Name""# '
.""' (
Trim""( ,
("", -
)""- .
)"". /
;""/ 0
partner## 
.## 
UpdateAddress## 
(## 
new## !
Address##" )
(##) *
country$$ 
:$$ 
request$$ 
.$$ 
Address$$ $
.$$$ %
Country$$% ,
.$$, -
Trim$$- 1
($$1 2
)$$2 3
,$$3 4
zipcode%% 
:%% 
request%% 
.%% 
Address%% $
.%%$ %
ZipCode%%% ,
.%%, -
Trim%%- 1
(%%1 2
)%%2 3
,%%3 4
street&& 
:&& 
request&& 
.&& 
Address&& #
.&&# $
Street&&$ *
.&&* +
Trim&&+ /
(&&/ 0
)&&0 1
,&&1 2
city'' 
:'' 
request'' 
.'' 
Address'' !
.''! "
City''" &
.''& '
Trim''' +
(''+ ,
)'', -
)(( 	
)((	 

;((
 
await** 
_unitOfWork** 
.** 
SaveChanges** %
(**% &
)**& '
;**' (
return,, 
Unit,, 
.,, 
Value,, 
;,, 
}-- 
}.. í
mC:\Users\csingare\Desktop\MyWarehouse\src\Application\Partners\UpdatePartner\UpdatePartnerCommandValidator.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Partners" *
.* +
UpdatePartner+ 8
;8 9
public 
class )
UpdatePartnerCommandValidator *
:+ ,
AbstractValidator- >
<> ? 
UpdatePartnerCommand? S
>S T
{ 
public 
)
UpdatePartnerCommandValidator (
(( )
)) *
{ 
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
. 
MaximumLength 
( 
PartnerInvariants ,
., -
NameMaxLength- :
): ;
;; <
RuleFor 
( 
x 
=> 
x 
. 
Address 
) 
.  
NotNull  '
(' (
)( )
.) *
DependentRules* 8
(8 9
(9 :
): ;
=>< >
{ 	
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
Country# *
)* +
.+ ,
NotNull, 3
(3 4
)4 5
.5 6
MaximumLength6 C
(C D
$numD G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
ZipCode# *
)* +
.+ ,
NotNull, 3
(3 4
)4 5
.5 6
MaximumLength6 C
(C D
$numD G
)G H
;H I
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
Street# )
)) *
.* +
NotNull+ 2
(2 3
)3 4
.4 5
MaximumLength5 B
(B C
$numC F
)F G
;G H
RuleFor 
( 
x 
=> 
x 
. 
Address "
." #
City# '
)' (
.( )
NotNull) 0
(0 1
)1 2
.2 3
MaximumLength3 @
(@ A
$numA D
)D E
;E F
} 	
)	 

;
 
} 
} Ò
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\CreateProduct\CreateProductCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
CreateProduct+ 8
;8 9
public 
record  
CreateProductCommand "
:# $
IRequest% -
<- .
int. 1
>1 2
{		 
public

 

string

 
Name

 
{

 
get

 
;

 
init

 "
;

" #
}

$ %
=

& '
null

( ,
!

, -
;

- .
public 

string 
Description 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

float 
	MassValue 
{ 
get  
;  !
init" &
;& '
}( )
public 

string 
MassUnitSymbol  
{! "
get# &
;& '
init( ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 

decimal 
PriceAmount 
{  
get! $
;$ %
init& *
;* +
}, -
public 

string 
PriceCurrencyCode #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
} 
public 
class '
CreateProductCommandHandler (
:) *
IRequestHandler+ :
<: ; 
CreateProductCommand; O
,O P
intQ T
>T U
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
CreateProductCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
int 
> 
Handle !
(! " 
CreateProductCommand" 6
request7 >
,> ?
CancellationToken@ Q
cancellationTokenR c
)c d
{ 
var 
product 
= 
new 
Product !
(! "
name 
: 
request 
. 
Name 
. 
Trim #
(# $
)$ %
,% &
description 
: 
request  
.  !
Description! ,
., -
Trim- 1
(1 2
)2 3
,3 4
price   
:   
new   
Money   
(   
request   $
.  $ %
PriceAmount  % 0
,  0 1
ProductInvariants  2 C
.  C D 
DefaultPriceCurrency  D X
)  X Y
,  Y Z
mass!! 
:!! 
new!! 
Mass!! 
(!! 
request!! "
.!!" #
	MassValue!!# ,
,!!, -
ProductInvariants!!. ?
.!!? @
DefaultMassUnit!!@ O
)!!O P
)"" 	
;""	 

_unitOfWork$$ 
.$$ 
Products$$ 
.$$ 
Add$$  
($$  !
product$$! (
)$$( )
;$$) *
await%% 
_unitOfWork%% 
.%% 
SaveChanges%% %
(%%% &
)%%& '
;%%' (
return'' 
product'' 
.'' 
Id'' 
;'' 
}(( 
})) ≥
mC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\CreateProduct\CreateProductCommandValidator.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
CreateProduct+ 8
;8 9
public 
class )
CreateProductCommandValidator *
:+ ,
AbstractValidator- >
<> ? 
CreateProductCommand? S
>S T
{ 
public 
)
CreateProductCommandValidator (
(( )
)) *
{ 
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
. 
MaximumLength 
( 
ProductInvariants ,
., -
NameMaxLength- :
): ;
;; <
RuleFor 
( 
x 
=> 
x 
. 
Description "
)" #
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
ProductInvariants ,
., - 
DescriptionMaxLength- A
)A B
;B C
RuleFor 
( 
x 
=> 
x 
. 
	MassValue  
)  !
.  
GreaterThanOrEqualTo !
(! "
ProductInvariants" 3
.3 4
MassMinimum4 ?
)? @
;@ A
RuleFor 
( 
x 
=> 
x 
. 
PriceAmount "
)" #
.  
GreaterThanOrEqualTo !
(! "
ProductInvariants" 3
.3 4
PriceMinimum4 @
)@ A
;A B
RuleFor 
( 
x 
=> 
x 
. 
MassUnitSymbol %
)% &
. 
NotEmpty 
( 
) 
. 
Equal 
( 
ProductInvariants $
.$ %
DefaultMassUnit% 4
.4 5
Symbol5 ;
); <
. 
WithMessage 
( 
x 
=> 
$"  
$str  +
{+ ,
x, -
.- .
MassUnitSymbol. <
}< =
$str= z
{z {
ProductInvariants	{ å
.
å ç
DefaultMassUnit
ç ú
.
ú ù
Symbol
ù £
}
£ §
$str
§ ¶
"
¶ ß
)
ß ®
;
® ©
RuleFor 
( 
x 
=> 
x 
. 
PriceCurrencyCode (
)( )
. 
NotEmpty 
( 
) 
. 
Equal 
( 
ProductInvariants $
.$ % 
DefaultPriceCurrency% 9
.9 :
Code: >
)> ?
. 
WithMessage 
( 
x 
=> 
$"  
$str  /
{/ 0
x0 1
.1 2
PriceCurrencyCode2 C
}C D
$str	D Ç
{
Ç É
ProductInvariants
É î
.
î ï"
DefaultPriceCurrency
ï ©
.
© ™
Code
™ Æ
}
Æ Ø
$str
Ø ±
"
± ≤
)
≤ ≥
;
≥ ¥
}   
}!! ©
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\DeleteProduct\DeleteProductCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
DeleteProduct+ 8
;8 9
public 
record  
DeleteProductCommand "
:# $
IRequest% -
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
init		 
;		 
}		  
}

 
public 
class '
DeleteProductCommandHandler (
:) *
IRequestHandler+ :
<: ; 
DeleteProductCommand; O
>O P
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
DeleteProductCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
Unit 
> 
Handle "
(" # 
DeleteProductCommand# 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 
var 
product 
= 
await 
_unitOfWork '
.' (
Products( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Product8 ?
)? @
,@ A
requestB I
.I J
IdJ L
)L M
;M N
_unitOfWork 
. 
Products 
. 
Remove #
(# $
product$ +
)+ ,
;, -
await 
_unitOfWork 
. 
SaveChanges %
(% &
)& '
;' (
return 
Unit 
. 
Value 
; 
} 
} Î
jC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\GetProductDetails\GetProductDetailsQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +

GetProduct+ 5
;5 6
public 
record "
GetProductDetailsQuery $
:% &
IRequest' /
</ 0
ProductDetailsDto0 A
>A B
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
set		 
;		 
}		 
}

 
public 
class )
GetProductDetailsQueryHandler *
:+ ,
IRequestHandler- <
<< ="
GetProductDetailsQuery= S
,S T
ProductDetailsDtoU f
>f g
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
private 
readonly 
IMapper 
_mapper $
;$ %
public 
)
GetProductDetailsQueryHandler (
(( )
IUnitOfWork) 4

unitOfWork5 ?
,? @
IMapperA H
mapperI O
)O P
{ 
_unitOfWork 
= 

unitOfWork  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
ProductDetailsDto '
>' (
Handle) /
(/ 0"
GetProductDetailsQuery0 F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 
var 
product 
= 
await 
_unitOfWork '
.' (
Products( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Product8 ?
)? @
,@ A
requestB I
.I J
IdJ L
)L M
;M N
return 
_mapper 
. 
Map 
< 
ProductDetailsDto ,
>, -
(- .
product. 5
)5 6
;6 7
} 
} °
eC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\GetProductDetails\ProductDetailsDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +

GetProduct+ 5
;5 6
public 
record 
ProductDetailsDto 
:  !
IMapFrom" *
<* +
Product+ 2
>2 3
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
init		 
;		 
}		  
public 

string 
Name 
{ 
get 
; 
init "
;" #
}$ %
=& '
null( ,
!, -
;- .
public 

string 
Description 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

DateTime 
	CreatedAt 
{ 
get  #
;# $
init% )
;) *
}+ ,
public 

string 
	CreatedBy 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 

DateTime 
? 
LastModifiedAt #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
public 

string 
? 
LastModifiedBy !
{" #
get$ '
;' (
init) -
;- .
}/ 0
public 

decimal 
PriceAmount 
{  
get! $
;$ %
init& *
;* +
}, -
public 

string 
PriceCurrencyCode #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 

float 
	MassValue 
{ 
get  
;  !
init" &
;& '
}( )
public 

string 
MassUnitSymbol  
{! "
get# &
;& '
init( ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 

int 
NumberInStock 
{ 
get "
;" #
init$ (
;( )
}* +
} ·
fC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\GetProductsList\GetProductsListQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
GetProducts+ 6
;6 7
public 
class  
GetProductsListQuery !
:" #
ListQueryModel$ 2
<2 3

ProductDto3 =
>= >
{ 
public 

ProductStatus 
Status 
{  !
get" %
;% &
init' +
;+ ,
}- .
public		 

bool		 
StockedOnly		 
=>		 
Status		 %
==		& (
ProductStatus		) 6
.		6 7
Stocked		7 >
;		> ?
public 

enum 
ProductStatus 
{ 
Default 
, 
Stocked 
} 
} 
public 
class '
GetProductsListQueryHandler (
:) *
IRequestHandler+ :
<: ; 
GetProductsListQuery; O
,O P
IListResponseModelQ c
<c d

ProductDtod n
>n o
>o p
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
GetProductsListQueryHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

Task 
< 
IListResponseModel "
<" #

ProductDto# -
>- .
>. /
Handle0 6
(6 7 
GetProductsListQuery7 K
requestL S
,S T
CancellationTokenU f
cancellationTokeng x
)x y
=> 

_unitOfWork 
. 
Products 
.  !
GetProjectedListAsync  5
(5 6
request6 =
,= >
additionalFilter 
: 
request %
.% &
StockedOnly& 1
?2 3
x4 5
=>6 8
x9 :
.: ;
NumberInStock; H
>I J
$numK L
:M N
nullO S
,S T
readOnly 
: 
true 
) 
; 
} Ø
\C:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\GetProductsList\ProductDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
GetProducts+ 6
;6 7
public 
record 

ProductDto 
: 
IMapFrom #
<# $
Product$ +
>+ ,
{ 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public

 

string

 
Name

 
{

 
get

 
;

 
init

 "
;

" #
}

$ %
=

& '
null

( ,
!

, -
;

- .
public 

string 
Description 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

decimal 
PriceAmount 
{  
get! $
;$ %
init& *
;* +
}, -
public 

string 
PriceCurrencyCode #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 

float 
	MassValue 
{ 
get  
;  !
init" &
;& '
}( )
public 

string 
MassUnitSymbol  
{! "
get# &
;& '
init( ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 

int 
NumberInStock 
{ 
get "
;" #
init$ (
;( )
}* +
} ø
hC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockCount\ProductStockCountDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
GetProductsSummary+ =
;= >
public 
record  
ProductStockCountDto "
{ 
public 

int 
ProductCount 
{ 
get !
;! "
init# '
;' (
}) *
public 

int 

TotalStock 
{ 
get 
;  
init! %
;% &
}' (
} ˘
jC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockCount\ProductStockCountQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
GetProductsSummary+ =
;= >
public 
record "
ProductStockCountQuery $
:% &
IRequest' /
</ 0 
ProductStockCountDto0 D
>D E
{ 
} 
public		 
class		 )
ProductStockCountQueryHandler		 *
:		+ ,
IRequestHandler		- <
<		< ="
ProductStockCountQuery		= S
,		S T 
ProductStockCountDto		U i
>		i j
{

 
private 
readonly #
IStockStatisticsService ,
_statisticsService- ?
;? @
public 
)
ProductStockCountQueryHandler (
(( )#
IStockStatisticsService) @
statisticsServiceA R
)R S
=> 

_statisticsService 
= 
statisticsService  1
;1 2
public 

async 
Task 
<  
ProductStockCountDto *
>* +
Handle, 2
(2 3"
ProductStockCountQuery3 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 
var 
res 
= 
await 
_statisticsService *
.* +!
GetProductStockCounts+ @
(@ A
)A B
;B C
return 
new  
ProductStockCountDto '
(' (
)( )
{* +
ProductCount 
= 
res 
. 
ProductCount +
,+ ,

TotalStock 
= 
res 
. 

TotalStock '
} 	
;	 

} 
} ó
hC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockMass\ProductStockMassQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
ProductStockMass+ ;
;; <
public 
record !
ProductStockMassQuery #
:$ %
IRequest& .
<. /
StockMassDto/ ;
>; <
{ 
} 
public

 
class

 (
ProductStockMassQueryHandler

 )
:

* +
IRequestHandler

, ;
<

; <!
ProductStockMassQuery

< Q
,

Q R
StockMassDto

S _
>

_ `
{ 
private 
readonly #
IStockStatisticsService ,
_statisticsService- ?
;? @
public 
(
ProductStockMassQueryHandler '
(' (#
IStockStatisticsService( ?
statisticsService@ Q
)Q R
=> 

_statisticsService 
= 
statisticsService  1
;1 2
public 

async 
Task 
< 
StockMassDto "
>" #
Handle$ *
(* +!
ProductStockMassQuery+ @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 
var 
mass 
= 
await 
_statisticsService +
.+ ,$
GetProductStockTotalMass, D
(D E
MassUnitE M
.M N
TonneN S
)S T
;T U
return 
new 
StockMassDto 
(  
)  !
{ 	
Value 
= 
mass 
. 
Value 
, 
Unit 
= 
mass 
. 
Unit 
. 
Symbol #
} 	
;	 

} 
} „
_C:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockMass\StockMassDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
ProductStockMass+ ;
;; <
public 
record 
StockMassDto 
{ 
public 

float 
Value 
{ 
get 
; 
init "
;" #
}$ %
public 

string 
Unit 
{ 
get 
; 
init "
;" #
}$ %
=& '
null( ,
!, -
;- .
} £
jC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockValue\ProductStockValueQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
ProductStockValue+ <
;< =
public 
record "
ProductStockValueQuery $
:% &
IRequest' /
</ 0
StockValueDto0 =
>= >
{ 
} 
public		 
class		 )
ProductStockValueQueryHandler		 *
:		+ ,
IRequestHandler		- <
<		< ="
ProductStockValueQuery		= S
,		S T
StockValueDto		U b
>		b c
{

 
private 
readonly #
IStockStatisticsService ,
_statisticsService- ?
;? @
public 
)
ProductStockValueQueryHandler (
(( )#
IStockStatisticsService) @"
stockStatisticsServiceA W
)W X
=> 

_statisticsService 
= "
stockStatisticsService  6
;6 7
public 

async 
Task 
< 
StockValueDto #
># $
Handle% +
(+ ,"
ProductStockValueQuery, B
requestC J
,J K
CancellationTokenL ]
cancellationToken^ o
)o p
{ 
var 
totalStockValue 
= 
await #
_statisticsService$ 6
.6 7%
GetProductStockTotalValue7 P
(P Q
)Q R
;R S
return 
new 
StockValueDto  
(  !
)! "
{ 	
Amount 
= 
totalStockValue $
.$ %
Amount% +
,+ ,
CurrencyCode 
= 
totalStockValue *
.* +
Currency+ 3
.3 4
Code4 8
} 	
;	 

} 
} Ú
aC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\ProductStockValue\StockValueDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
ProductStockValue+ <
;< =
public 
record 
StockValueDto 
{ 
public 

decimal 
Amount 
{ 
get 
;  
init! %
;% &
}' (
public 

string 
CurrencyCode 
{  
get! $
;$ %
init& *
;* +
}, -
=. /
null0 4
!4 5
;5 6
} ê
dC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\UpdateProduct\UpdateProductCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
UpdateProduct+ 8
;8 9
public 
record  
UpdateProductCommand "
:# $
IRequest% -
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
init		 
;		 
}		  
public 

string 
Name 
{ 
get 
; 
init "
;" #
}$ %
=& '
null( ,
!, -
;- .
public 

string 
Description 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

float 
	MassValue 
{ 
get  
;  !
init" &
;& '
}( )
public 

decimal 
PriceAmount 
{  
get! $
;$ %
init& *
;* +
}, -
} 
public 
class '
UpdateProductCommandHandler (
:) *
IRequestHandler+ :
<: ; 
UpdateProductCommand; O
>O P
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
'
UpdateProductCommandHandler &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
Unit 
> 
Handle "
(" # 
UpdateProductCommand# 7
request8 ?
,? @
CancellationTokenA R
cancellationTokenS d
)d e
{ 
var 
product 
= 
await 
_unitOfWork '
.' (
Products( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
IdF H
)H I
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Product8 ?
)? @
,@ A
requestB I
.I J
IdJ L
)L M
;M N
product 
. 

UpdateName 
( 
request "
." #
Name# '
.' (
Trim( ,
(, -
)- .
). /
;/ 0
product 
. 
UpdateDescription !
(! "
request" )
.) *
Description* 5
.5 6
Trim6 :
(: ;
); <
)< =
;= >
product   
.   

UpdateMass   
(   
request   "
.  " #
	MassValue  # ,
)  , -
;  - .
product!! 
.!! 
UpdatePrice!! 
(!! 
request!! #
.!!# $
PriceAmount!!$ /
)!!/ 0
;!!0 1
await## 
_unitOfWork## 
.## 
SaveChanges## %
(##% &
)##& '
;##' (
return%% 
Unit%% 
.%% 
Value%% 
;%% 
}&& 
}'' ©
mC:\Users\csingare\Desktop\MyWarehouse\src\Application\Products\UpdateProduct\UpdateProductCommandValidator.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Products" *
.* +
UpdateProduct+ 8
;8 9
public 
class )
UpdateProductCommandValidator *
:+ ,
AbstractValidator- >
<> ? 
UpdateProductCommand? S
>S T
{ 
public 
)
UpdateProductCommandValidator (
(( )
)) *
{ 
RuleFor		 
(		 
x		 
=>		 
x		 
.		 
Name		 
)		 
.

 
NotEmpty

 
(

 
)

 
. 
MaximumLength 
( 
ProductInvariants ,
., -
NameMaxLength- :
): ;
;; <
RuleFor 
( 
x 
=> 
x 
. 
Description "
)" #
. 
NotEmpty 
( 
) 
. 
MaximumLength 
( 
ProductInvariants ,
., - 
DescriptionMaxLength- A
)A B
;B C
RuleFor 
( 
x 
=> 
x 
. 
	MassValue  
)  !
.  
GreaterThanOrEqualTo !
(! "
ProductInvariants" 3
.3 4
MassMinimum4 ?
)? @
;@ A
RuleFor 
( 
x 
=> 
x 
. 
PriceAmount "
)" #
.  
GreaterThanOrEqualTo !
(! "
ProductInvariants" 3
.3 4
PriceMinimum4 @
)@ A
;A B
} 
} Ã7
pC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\CreateTransaction\CreateTransactionCommand.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /
CreateTransaction/ @
;@ A
public 
record $
CreateTransactionCommand &
:' (
IRequest) 1
<1 2
int2 5
>5 6
{		 
public

 

int

 
	PartnerId
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
 
init

  $
;

$ %
}

& '
public 

TransactionType 
TransactionType *
{+ ,
get- 0
;0 1
init2 6
;6 7
}8 9
public 

TransactionLine 
[ 
] 
TransactionLines -
{. /
get0 3
;3 4
init5 9
;9 :
}; <
== >
Array? D
.D E
EmptyE J
<J K
TransactionLineK Z
>Z [
([ \
)\ ]
;] ^
public 

struct 
TransactionLine !
{ 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
public 
int 
ProductQuantity "
{# $
get% (
;( )
init* .
;. /
}0 1
} 
} 
public 
class +
CreateTransactionCommandHandler ,
:- .
IRequestHandler/ >
<> ?$
CreateTransactionCommand? W
,W X
intY \
>\ ]
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
+
CreateTransactionCommandHandler *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
int 
> 
Handle !
(! "$
CreateTransactionCommand" :
request; B
,B C
CancellationTokenD U
cancellationTokenV g
)g h
{ 
var 
partner 
= 
await 
_unitOfWork '
.' (
Partners( 0
.0 1
GetByIdAsync1 =
(= >
request> E
.E F
	PartnerIdF O
)O P
?? 
throw 
new $
InputValidationException 1
(1 2
(2 3
nameof3 9
(9 :
request: A
.A B
	PartnerIdB K
)K L
,L M
$"N P
$strP ]
{] ^
request^ e
.e f
	PartnerIdf o
}o p
$str	p Ä
"
Ä Å
)
Å Ç
)
Ç É
;
É Ñ
await"" 
_unitOfWork"" 
."" !
BeginTransactionAsync"" /
(""/ 0
)""0 1
;""1 2
int##  
createdTransactionId##  
=##! "
$num### $
;##$ %
try$$ 
{%% 	
var&& 
orderedProductIds&& !
=&&" #
request&&$ +
.&&+ ,
TransactionLines&&, <
.&&< =
Select&&= C
(&&C D
x&&D E
=>&&F H
x&&I J
.&&J K
	ProductId&&K T
)&&T U
.&&U V
Distinct&&V ^
(&&^ _
)&&_ `
;&&` a
var'' 
orderedProducts'' 
=''  !
await''" '
_unitOfWork''( 3
.''3 4
Products''4 <
.''< =
GetFiltered''= H
(''H I
x''I J
=>''K M
orderedProductIds''N _
.''_ `
Contains''` h
(''h i
x''i j
.''j k
Id''k m
)''m n
)''n o
;''o p
var)) 

validLines)) 
=)) 
request)) $
.))$ %
TransactionLines))% 5
.))5 6
Select))6 <
())< =
line))= A
=>))B D
(** 
product++ 
:++ 
orderedProducts++ ,
.++, -
FirstOrDefault++- ;
(++; <
p++< =
=>++> @
p++A B
.++B C
Id++C E
==++F H
line++I M
.++M N
	ProductId++N W
)++W X
??,, 
throw,,  
new,,! $$
InputValidationException,,% =
(,,= >
(,,> ?
nameof,,? E
(,,E F
line,,F J
.,,J K
	ProductId,,K T
),,T U
,,,U V
$",,W Y
$str,,Y f
{,,f g
line,,g k
.,,k l
	ProductId,,l u
},,u v
$str	,,v Ü
"
,,Ü á
)
,,á à
)
,,à â
,
,,â ä
qty-- 
:-- 
line-- 
.-- 
ProductQuantity-- -
).. 
)// 
;// 
var11 
transaction11 
=11 
request11 %
.11% &
TransactionType11& 5
switch116 <
{22 
TransactionType33 
.33  
Sales33  %
=>33& (
partner33) 0
.330 1
SellTo331 7
(337 8

validLines338 B
)33B C
,33C D
TransactionType44 
.44  
Procurement44  +
=>44, .
partner44/ 6
.446 7
ProcureFrom447 B
(44B C

validLines44C M
)44M N
,44N O
_55 
=>55 
throw55 
new55 (
InvalidEnumArgumentException55 ;
(55; <
$"55< >
$str55> Z
{55Z [
nameof55[ a
(55a b
TransactionType55b q
)55q r
}55r s
$str55s x
{55x y
request	55y Ä
.
55Ä Å
TransactionType
55Å ê
}
55ê ë
$str
55ë ì
"
55ì î
)
55î ï
}66 
;66 
await88 
_unitOfWork88 
.88 
SaveChanges88 )
(88) *
)88* +
;88+ , 
createdTransactionId99  
=99! "
transaction99# .
.99. /
Id99/ 1
;991 2
}:: 	
catch;; 
{<< 	
await== 
_unitOfWork== 
.== $
RollbackTransactionAsync== 6
(==6 7
)==7 8
;==8 9
throw>> 
;>> 
}?? 	
awaitAA 
_unitOfWorkAA 
.AA "
CommitTransactionAsyncAA 0
(AA0 1
)AA1 2
;AA2 3
returnCC  
createdTransactionIdCC #
;CC# $
}DD 
}EE ∂-
yC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\CreateTransaction\CreateTransactionCommandValidator.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /
CreateTransaction/ @
;@ A
public 
class -
!CreateTransactionCommandValidator .
:/ 0
AbstractValidator1 B
<B C$
CreateTransactionCommandC [
>[ \
{ 
private 
readonly 
IProductRepository '
_productRepository( :
;: ;
public		 
-
!CreateTransactionCommandValidator		 ,
(		, -
IProductRepository		- ?
productRepository		@ Q
)		Q R
{

 
_productRepository 
= 
productRepository .
;. /
RuleFor 
( 
x 
=> 
x 
. 
TransactionLines '
)' (
. 
NotEmpty 
( 
) 
. 
DependentRules 
( 
( 
) 
=> !
{" #
RuleForEach 
( 
x 
=>  
x! "
." #
TransactionLines# 3
)3 4
. 
Must 
( 
l 
=> 
l  
.  !
ProductQuantity! 0
>1 2
$num3 4
)4 5
. 
WithMessage  
(  !
$str! c
)c d
;d e
RuleFor 
( 
x 
=> 
x 
. 
TransactionLines /
)/ 0
. 
Must 
( 
x 
=> 
x  
.  !
GroupBy! (
(( )
x) *
=>+ -
x. /
./ 0
	ProductId0 9
)9 :
.: ;
Any; >
(> ?
g? @
=>A C
gD E
.E F
CountF K
(K L
)L M
==N P
$numQ R
)R S
)S T
. 
WithMessage  
(  !
$str! c
)c d
;d e
RuleFor 
( 
x 
=> 
x 
. 
TransactionLines /
)/ 0
. 
	MustAsync 
( 
HaveSufficientStock 2
)2 3
. 
WithMessage  
(  !
$str	! •
)
• ¶
;
¶ ß
} 
) 
; 
} 
private 
async 
Task 
< 
bool 
> 
HaveSufficientStock 0
(0 1$
CreateTransactionCommand1 I
cJ K
,K L$
CreateTransactionCommandM e
.e f
TransactionLinef u
[u v
]v w
linesx }
,} ~
ValidationContext	 ê
<
ê ë&
CreateTransactionCommand
ë ©
>
© ™
ctx
´ Æ
,
Æ Ø
CancellationToken
∞ ¡
_
¬ √
)
√ ƒ
{   
if!! 

(!! 
c!! 
.!! 
TransactionType!! 
==!!  
Domain!!! '
.!!' (
TransactionType!!( 7
.!!7 8
Procurement!!8 C
)!!C D
{"" 	
return## 
true## 
;## 
}$$ 	
var&& 
requestedProducts&& 
=&& 
await&&  %
_productRepository&&& 8
.&&8 9
GetFiltered&&9 D
(&&D E
x'' 
=>'' 
lines'' 
.'' 
Select'' 
('' 
l'' 
=>''  "
l''# $
.''$ %
	ProductId''% .
)''. /
.''/ 0
Contains''0 8
(''8 9
x''9 :
.'': ;
Id''; =
)''= >
)''> ?
;''? @
foreach)) 
()) 
var)) 
line)) 
in)) 
lines)) "
)))" #
{** 	
var++ 
product++ 
=++ 
requestedProducts++ +
.+++ ,
Where++, 1
(++1 2
p++2 3
=>++4 6
p++7 8
.++8 9
Id++9 ;
==++< >
line++? C
.++C D
	ProductId++D M
)++M N
.++N O
Single++O U
(++U V
)++V W
;++W X
if-- 
(-- 
product-- 
.-- 
NumberInStock-- %
<--& '
line--( ,
.--, -
ProductQuantity--- <
)--< =
{.. 
ctx// 
.// 
MessageFormatter// $
.//$ %
AppendArgument//% 3
(//3 4
$str//4 A
,//A B
product//C J
.//J K
Name//K O
)//O P
;//P Q
ctx00 
.00 
MessageFormatter00 $
.00$ %
AppendArgument00% 3
(003 4
$str004 B
,00B C
product00D K
.00K L
NumberInStock00L Y
)00Y Z
;00Z [
ctx11 
.11 
MessageFormatter11 $
.11$ %
AppendArgument11% 3
(113 4
$str114 B
,11B C
line11D H
.11H I
ProductQuantity11I X
)11X Y
;11Y Z
return22 
false22 
;22 
}33 
}44 	
return66 
true66 
;66 
}77 
}88 Ø
vC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\GetTransactionDetails\GetTransactionDetailsQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /!
GetTransactionDetails/ D
;D E
public 
record &
GetTransactionDetailsQuery (
:) *
IRequest+ 3
<3 4!
TransactionDetailsDto4 I
>I J
{ 
public		 

int		 
Id		 
{		 
get		 
;		 
set		 
;		 
}		 
}

 
public 
class -
!GetTransactionDetailsQueryHandler .
:/ 0
IRequestHandler1 @
<@ A&
GetTransactionDetailsQueryA [
,[ \!
TransactionDetailsDto] r
>r s
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
private 
readonly 
IMapper 
_mapper $
;$ %
public 
-
!GetTransactionDetailsQueryHandler ,
(, -
IUnitOfWork- 8

unitOfWork9 C
,C D
IMapperE L
mapperM S
)S T
{ 
_unitOfWork 
= 

unitOfWork  
;  !
_mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< !
TransactionDetailsDto +
>+ ,
Handle- 3
(3 4&
GetTransactionDetailsQuery4 N
requestO V
,V W
CancellationTokenX i
cancellationTokenj {
){ |
=> 

await 
_unitOfWork 
. 
Transactions )
.) *
GetProjectedAsync* ;
<; <!
TransactionDetailsDto< Q
>Q R
(R S
requestS Z
.Z [
Id[ ]
,] ^
readOnly_ g
:g h
truei m
)m n
?? 
throw 
new #
EntityNotFoundException 0
(0 1
nameof1 7
(7 8
Transaction8 C
)C D
,D E
requestF M
.M N
IdN P
)P Q
;Q R
} –,
qC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\GetTransactionDetails\TransactionDetailsDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /!
GetTransactionDetails/ D
;D E
public 
record !
TransactionDetailsDto #
:$ %
IMapFrom& .
<. /
Transaction/ :
>: ;
{ 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public		 

int		 
TransactionType		 
{		  
get		! $
;		$ %
init		& *
;		* +
}		, -
public 

DateTime 
	CreatedAt 
{ 
get  #
;# $
init% )
;) *
}+ ,
public 

string 
	CreatedBy 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
null- 1
!1 2
;2 3
public 

DateTime 
? 

ModifiedAt 
{  !
get" %
;% &
init' +
;+ ,
}- .
public 

string 
? 

ModifiedBy 
{ 
get  #
;# $
init% )
;) *
}+ ,
public 

int 
	PartnerId 
{ 
get 
; 
init  $
;$ %
}& '
public 

string 
PartnerName 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

string 
PartnerAddress  
{! "
get# &
;& '
init( ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 

bool 
PartnerIsDeleted  
{! "
get# &
;& '
init( ,
;, -
}. /
public 

decimal 
TotalAmount 
{  
get! $
;$ %
init& *
;* +
}, -
public 

string 
TotalCurrencyCode #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 

List 
< 
TransactionLineDto "
>" #
TransactionLines$ 4
{5 6
get7 :
;: ;
init< @
;@ A
}B C
=D E
newF I
(I J
)J K
;K L
public 

struct 
TransactionLineDto $
{ 
public 
int 
	ProductId 
{ 
get "
;" #
init$ (
;( )
}* +
public 
string 
ProductName !
{" #
get$ '
;' (
init) -
;- .
}/ 0
public 
int 
Quantity 
{ 
get !
;! "
init# '
;' (
}) *
public   
bool   
ProductIsDeleted   $
{  % &
get  ' *
;  * +
init  , 0
;  0 1
}  2 3
public"" 
string"" 
	UnitPrice"" 
{""  !
get""" %
;""% &
init""' +
;""+ ,
}""- .
public## 
decimal## 
UnitPriceAmount## &
{##' (
get##) ,
;##, -
init##. 2
;##2 3
}##4 5
public$$ 
string$$ !
UnitPriceCurrencyCode$$ +
{$$, -
get$$. 1
;$$1 2
init$$3 7
;$$7 8
}$$9 :
}%% 
public'' 

void'' 
Mapping'' 
('' 
Profile'' 
profile''  '
)''' (
{(( 
profile)) 
.)) 
	CreateMap)) 
<)) 
Transaction)) %
,))% &!
TransactionDetailsDto))' <
>))< =
())= >
)))> ?
.** 
	ForMember** 
(** 
dest** 
=>** 
dest** #
.**# $
PartnerIsDeleted**$ 4
,**4 5
cfg**6 9
=>**: <
cfg**= @
.++ 
MapFrom++ 
(++ 
src++ 
=>++ 
src++  #
.++# $
Partner++$ +
.+++ ,
	DeletedAt++, 5
!=++6 8
null++9 =
)++= >
)++> ?
;++? @
profile-- 
.-- 
	CreateMap-- 
<-- 
TransactionLine-- )
,--) *
TransactionLineDto--+ =
>--= >
(--> ?
)--? @
... 
	ForMember.. 
(.. 
dest.. 
=>.. 
dest.. #
...# $
ProductIsDeleted..$ 4
,..4 5
cfg..6 9
=>..: <
cfg..= @
.// 
MapFrom// 
(// 
src// 
=>// 
src//  #
.//# $
Product//$ +
.//+ ,
	DeletedAt//, 5
!=//6 8
null//9 =
)//= >
)//> ?
;//? @
}00 
}11 æ
rC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\GetTransactionsList\GetTransactionsListQuery.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /
GetTransactionsList/ B
;B C
public 
class #
GetTransactionListQuery $
:% &
ListQueryModel' 5
<5 6
TransactionDto6 D
>D E
{ 
public		 

TransactionType		 
?		 
Type		  
{		! "
get		# &
;		& '
init		( ,
;		, -
}		. /
}

 
public 
class +
GetTransactionsListQueryHandler ,
:- .
IRequestHandler/ >
<> ?#
GetTransactionListQuery? V
,V W
IListResponseModelX j
<j k
TransactionDtok y
>y z
>z {
{ 
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
+
GetTransactionsListQueryHandler *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
=> 

_unitOfWork 
= 

unitOfWork #
;# $
public 

async 
Task 
< 
IListResponseModel (
<( )
TransactionDto) 7
>7 8
>8 9
Handle: @
(@ A#
GetTransactionListQueryA X
requestY `
,` a
CancellationTokenb s
cancellationToken	t Ö
)
Ö Ü
=> 

await 
_unitOfWork 
. 
Transactions )
.) *!
GetProjectedListAsync* ?
(? @
request@ G
,G H
additionalFilter 
: 
request %
.% &
Type& *
.* +
HasValue+ 3
?4 5
x6 7
=>8 :
x; <
.< =
TransactionType= L
==M O
requestP W
.W X
TypeX \
:] ^
null_ c
,c d
readOnly 
: 
true 
) 
; 
} ö
hC:\Users\csingare\Desktop\MyWarehouse\src\Application\Transactions\GetTransactionsList\TransactionDto.cs
	namespace 	
MyWarehouse
 
. 
Application !
.! "
Transactions" .
.. /
GetTransactionsList/ B
;B C
public 
record 
TransactionDto 
: 
IMapFrom '
<' (
Transaction( 3
>3 4
{ 
public 

int 
Id 
{ 
get 
; 
init 
; 
}  
public		 

DateTime		 
	CreatedAt		 
{		 
get		  #
;		# $
init		% )
;		) *
}		+ ,
public

 

int

 
TransactionType

 
{

  
get

! $
;

$ %
init

& *
;

* +
}

, -
public 

string 
PartnerName 
{ 
get  #
;# $
init% )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

decimal 
TotalAmount 
{  
get! $
;$ %
init& *
;* +
}, -
public 

string 
TotalCurrencyCode #
{$ %
get& )
;) *
init+ /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
} 