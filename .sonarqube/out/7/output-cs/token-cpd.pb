õ
BC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\API\ApiStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
;+ ,
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 

ApiStartup  
{ 
public		 

static		 
void		 
AddMyApi		 
(		  
this		  $
IServiceCollection		% 7
services		8 @
)		@ A
{

 
services 
. 
AddHealthChecks  
(  !
)! "
;" #
services 
. 
AddControllers 
(  
)  !
. $
AddControllersAsServices %
(% &
)& '
. 
AddJsonOptions 
( 
c 
=>  
c 
. !
JsonSerializerOptions '
.' ( 
PropertyNamingPolicy( <
= 
JsonNamingPolicy &
.& '
	CamelCase' 0
)0 1
;1 2
} 
public 

static 
void 
UseMyApi 
(  
this  $
IApplicationBuilder% 8
app9 <
)< =
{ 
app 
. 
UseEndpoints 
( 
	endpoints "
=># %
{ 	
	endpoints 
. 
MapControllers $
($ %
)% &
;& '
	endpoints 
. 
MapHealthChecks %
(% &
$str& /
)/ 0
;0 1
} 	
)	 

;
 
} 
} ›:
LC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\API\V1\AccountController.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
API  
.  !
V1! #
;# $
[ 
ApiController 
] 
[		 

ApiVersion		 
(		 
$str		 
)		 
]		 
[

 
Route

 
(

 
$str

  
)

  !
]

! "
public 
class 
AccountController 
:  
ControllerBase! /
{ 
private 
readonly 
IUserService !
_userService" .
;. /
private 
readonly "
IExternalSignInService +"
_externalSignInService, B
;B C
public 

AccountController 
( 
IUserService )
userService* 5
,5 6"
IExternalSignInService7 M!
externalSignInServiceN c
)c d
{ 
_userService 
= 
userService "
;" #"
_externalSignInService 
=  !
externalSignInService! 6
;6 7
} 
[ 
AllowAnonymous 
] 
[ 
HttpPost 
( 
$str 
) 
] 
public 

async 
Task 
< 
ActionResult "
<" #
LoginResponseDto# 3
>3 4
>4 5
Login6 ;
(; <
[< =
FromBody= E
]E F
LoginDtoG O
loginP U
)U V
=> 
 
ProduceLoginResponse 
(  
await 
_userService 
. 
SignIn %
(% &
login& +
.+ ,
Username, 4
,4 5
login6 ;
.; <
Password< D
)D E
)E F
;F G
[ 
AllowAnonymous 
] 
[   
ApiVersionNeutral   
]   
[!! 
HttpPost!! 
(!! 
$str!! ,
)!!, -
]!!- .
[""  
ProducesResponseType"" 
("" 
typeof""  
(""  !
LoginResponseDto""! 1
)""1 2
,""2 3
StatusCodes""4 ?
.""? @
Status200OK""@ K
)""K L
]""L M
public## 

async## 
Task## 
<## 
ActionResult## "
<##" #
LoginResponseDto### 3
>##3 4
>##4 5
	LoginForm##6 ?
(##? @
[##@ A
FromForm##A I
]##I J
LoginDto##K S
login##T Y
)##Y Z
{$$ 
var%% 
(%% 
result%% 
,%% 
model%% 
)%% 
=%% 
await%% #
_userService%%$ 0
.%%0 1
SignIn%%1 7
(%%7 8
login%%8 =
.%%= >
Username%%> F
,%%F G
login%%H M
.%%M N
Password%%N V
)%%V W
;%%W X
return'' 
result'' 
switch'' 
{(( 	
MySignInResult)) 
.)) 
Success)) "
=>))# %
Ok))& (
())( )
new))) ,
{** 
access_token++ 
=++ 
model++ $
!++$ %
.++% &
Token++& +
.+++ ,
AccessToken++, 7
,++7 8

token_type,, 
=,, 
model,, "
.,," #
Token,,# (
.,,( )
	TokenType,,) 2
,,,2 3

expires_in-- 
=-- 
model-- "
.--" #
Token--# (
.--( )'
GetRemainingLifetimeSeconds--) D
(--D E
)--E F
}.. 
).. 
,.. 
_// 
=>// 
Unauthorized// 
(// 
)// 
}00 	
;00	 

}11 
[33 
AllowAnonymous33 
]33 
[44 
HttpPost44 
(44 
$str44 
)44 
]44 
public55 

async55 
Task55 
<55 
ActionResult55 "
<55" #
LoginResponseDto55# 3
>553 4
>554 5
ExternalLogin556 C
(55C D
ExternalLoginDto55D T
login55U Z
)55Z [
=>66 
 
ProduceLoginResponse66 
(66  
await77 "
_externalSignInService77 (
.77( )
SignInExternal77) 7
(777 8
login778 =
.77= >
Provider77> F
,77F G
login77H M
.77M N
IdToken77N U
)77U V
)77V W
;77W X
private99 
ActionResult99 
<99 
LoginResponseDto99 )
>99) * 
ProduceLoginResponse99+ ?
(99? @
(99@ A
MySignInResult99A O
result99P V
,99V W

SignInData99X b
?99b c
data99d h
)99h i
loginResults99j v
)99v w
{:: 
var;; 
(;; 
result;; 
,;; 
data;; 
);; 
=;; 
loginResults;; )
;;;) *
return== 
result== 
switch== 
{>> 	
MySignInResult?? 
.?? 
Failed?? !
=>??" $
Unauthorized??% 1
(??1 2
$str??2 S
)??S T
,??T U
MySignInResult@@ 
.@@ 
	LockedOut@@ $
=>@@% '
Forbid@@( .
(@@. /
$str@@/ P
)@@P Q
,@@Q R
MySignInResultAA 
.AA 

NotAllowedAA %
=>AA& (
ForbidAA) /
(AA/ 0
$strAA0 Q
)AAQ R
,AAR S
MySignInResultBB 
.BB 
SuccessBB "
whenBB# '
dataBB( ,
isBB- /
notBB0 3
nullBB4 8
=>BB9 ;
OkBB< >
(BB> ?
newBB? B
LoginResponseDtoBBC S
(BBS T
)BBT U
{BBa b
AccessTokenCC 
=CC 
dataCC "
.CC" #
TokenCC# (
.CC( )
AccessTokenCC) 4
,CC4 5
	TokenTypeDD 
=DD 
dataDD  
.DD  !
TokenDD! &
.DD& '
	TokenTypeDD' 0
,DD0 1
	ExpiresInEE 
=EE 
dataEE  
.EE  !
TokenEE! &
.EE& ''
GetRemainingLifetimeSecondsEE' B
(EEB C
)EEC D
,EED E
UsernameFF 
=FF 
dataFF 
.FF  
UsernameFF  (
,FF( )
EmailGG 
=GG 
dataGG 
.GG 
EmailGG "
,GG" #
IsExternalLoginHH 
=HH  !
dataHH" &
.HH& '
IsExternalLoginHH' 6
,HH6 7*
ExternalAuthenticationProviderII .
=II/ 0
dataII1 5
.II5 6*
ExternalAuthenticationProviderII6 T
}JJ 
)JJ 
,JJ 
_KK 
=>KK 
throwKK 
newKK (
InvalidEnumArgumentExceptionKK 7
(KK7 8
$strKK8 i
)KKi j
}LL 	
;LL	 

}MM 
}NN “"
LC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\API\V1\PartnerController.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
API  
.  !
V1! #
;# $
[

 
	Authorize

 

]


 
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 
( 
$str !
)! "
]" #
public 
class 
PartnerController 
:  
ControllerBase! /
{ 
private 
readonly 
	IMediator 
	_mediator (
;( )
public 

PartnerController 
( 
	IMediator &
mediator' /
)/ 0
=>1 3
	_mediator4 =
=> ?
mediator@ H
;H I
[ 
HttpPost 
] 
public 

async 
Task 
< 
ActionResult "
<" #
int# &
>& '
>' (
Create) /
(/ 0 
CreatePartnerCommand0 D
commandE L
)L M
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
command# *
)* +
)+ ,
;, -
[ 
HttpGet 
] 
public 

async 
Task 
< 
ActionResult "
<" #
IListResponseModel# 5
<5 6

PartnerDto6 @
>@ A
>A B
>B C
GetListD K
(K L
[L M
	FromQueryM V
]V W
ListQueryModelX f
<f g

PartnerDtog q
>q r
querys x
)x y
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
query# (
)( )
)) *
;* +
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
ActionResult "
<" #
PartnerDetailsDto# 4
>4 5
>5 6
Get7 :
(: ;
int; >
id? A
)A B
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
new# &"
GetPartnerDetailsQuery' =
(= >
)> ?
{@ A
IdB D
=E F
idG I
}J K
)K L
)L M
;M N
[   

HttpDelete   
(   
$str   
)   
]   
public!! 

async!! 
Task!! 
<!! 
ActionResult!! "
>!!" #
Delete!!$ *
(!!* +
int!!+ .
id!!/ 1
)!!1 2
{"" 
await## 
	_mediator## 
.## 
Send## 
(## 
new##   
DeletePartnerCommand##! 5
(##5 6
)##6 7
{##8 9
Id##: <
=##= >
id##? A
}##B C
)##C D
;##D E
return%% 
	NoContent%% 
(%% 
)%% 
;%% 
}&& 
[(( 
HttpPut(( 
((( 
$str(( 
)(( 
](( 
public)) 

async)) 
Task)) 
<)) 
ActionResult)) "
>))" #
Update))$ *
())* +
int))+ .
id))/ 1
,))1 2 
UpdatePartnerCommand))3 G
command))H O
)))O P
{** 
if++ 

(++ 
id++ 
!=++ 
command++ 
.++ 
Id++ 
)++ 
return++ $

BadRequest++% /
(++/ 0
)++0 1
;++1 2
await-- 
	_mediator-- 
.-- 
Send-- 
(-- 
command-- $
)--$ %
;--% &
return// 
	NoContent// 
(// 
)// 
;// 
}00 
}11 ü0
LC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\API\V1\ProductController.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
API  
.  !
V1! #
;# $
[ 
	Authorize 

]
 
[ 
ApiController 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 
( 
$str !
)! "
]" #
public 
class 
ProductController 
:  
ControllerBase! /
{ 
private 
readonly 
	IMediator 
	_mediator (
;( )
public 

ProductController 
( 
	IMediator &
mediator' /
)/ 0
=>1 3
	_mediator4 =
=> ?
mediator@ H
;H I
[ 
HttpPost 
] 
public 

async 
Task 
< 
ActionResult "
<" #
int# &
>& '
>' (
Create) /
(/ 0 
CreateProductCommand0 D
commandE L
)L M
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
command# *
)* +
)+ ,
;, -
[ 
HttpGet 
] 
public 

async 
Task 
< 
ActionResult "
<" #
IListResponseModel# 5
<5 6

ProductDto6 @
>@ A
>A B
>B C
GetListD K
(K L
[L M
	FromQueryM V
]V W 
GetProductsListQueryX l
querym r
)r s
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
query# (
)( )
)) *
;* +
[ 
HttpGet 
( 
$str 
) 
] 
public   

async   
Task   
<   
ActionResult   "
<  " #
ProductDetailsDto  # 4
>  4 5
>  5 6
Get  7 :
(  : ;
int  ; >
id  ? A
)  A B
=>!! 

Ok!! 
(!! 
await!! 
	_mediator!! 
.!! 
Send!! "
(!!" #
new!!# &"
GetProductDetailsQuery!!' =
(!!= >
)!!> ?
{!!@ A
Id!!B D
=!!E F
id!!G I
}!!J K
)!!K L
)!!L M
;!!M N
[## 

HttpDelete## 
(## 
$str## 
)## 
]## 
public$$ 

async$$ 
Task$$ 
<$$ 
ActionResult$$ "
>$$" #
Delete$$$ *
($$* +
int$$+ .
id$$/ 1
)$$1 2
{%% 
await&& 
	_mediator&& 
.&& 
Send&& 
(&& 
new&&   
DeleteProductCommand&&! 5
(&&5 6
)&&6 7
{&&8 9
Id&&: <
=&&= >
id&&? A
}&&B C
)&&C D
;&&D E
return(( 
	NoContent(( 
((( 
)(( 
;(( 
})) 
[++ 
HttpPut++ 
(++ 
$str++ 
)++ 
]++ 
public,, 

async,, 
Task,, 
<,, 
ActionResult,, "
>,," #
Update,,$ *
(,,* +
int,,+ .
id,,/ 1
,,,1 2 
UpdateProductCommand,,3 G
command,,H O
),,O P
{-- 
if.. 

(.. 
id.. 
!=.. 
command.. 
... 
Id.. 
).. 
return.. $

BadRequest..% /
(../ 0
)..0 1
;..1 2
await00 
	_mediator00 
.00 
Send00 
(00 
command00 $
)00$ %
;00% &
return22 
	NoContent22 
(22 
)22 
;22 
}33 
[55 
HttpGet55 
(55 
$str55 
)55 
]55 
public66 

async66 
Task66 
<66 
ActionResult66 "
<66" #
StockMassDto66# /
>66/ 0
>660 1
ProductStockMass662 B
(66B C
)66C D
=>77 

Ok77 
(77 
await77 
	_mediator77 
.77 
Send77 "
(77" #
new77# &!
ProductStockMassQuery77' <
(77< =
)77= >
)77> ?
)77? @
;77@ A
[99 
HttpGet99 
(99 
$str99 
)99 
]99 
public:: 

async:: 
Task:: 
<:: 
ActionResult:: "
<::" #
StockValueDto::# 0
>::0 1
>::1 2
ProductStockValue::3 D
(::D E
)::E F
=>;; 

Ok;; 
(;; 
await;; 
	_mediator;; 
.;; 
Send;; "
(;;" #
new;;# &"
ProductStockValueQuery;;' =
(;;= >
);;> ?
);;? @
);;@ A
;;;A B
[== 
HttpGet== 
(== 
$str== 
)== 
]== 
public>> 

async>> 
Task>> 
<>> 
ActionResult>> "
<>>" # 
ProductStockCountDto>># 7
>>>7 8
>>>8 9
ProductStockCount>>: K
(>>K L
)>>L M
=>?? 

Ok?? 
(?? 
await?? 
	_mediator?? 
.?? 
Send?? "
(??" #
new??# &"
ProductStockCountQuery??' =
(??= >
)??> ?
)??? @
)??@ A
;??A B
}@@ ¿
PC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\API\V1\TransactionController.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
API  
.  !
V1! #
;# $
[ 
	Authorize 

]
 
[		 
ApiController		 
]		 
[

 

ApiVersion

 
(

 
$str

 
)

 
]

 
[ 
Route 
( 
$str %
)% &
]& '
public 
class !
TransactionController "
:# $
ControllerBase% 3
{ 
private 
readonly 
	IMediator 
	_mediator (
;( )
public 
!
TransactionController  
(  !
	IMediator! *
mediator+ 3
)3 4
=>5 7
	_mediator8 A
=B C
mediatorD L
;L M
[ 
HttpPost 
] 
public 

async 
Task 
< 
ActionResult "
<" #
int# &
>& '
>' (
Create) /
(/ 0$
CreateTransactionCommand0 H
commandI P
)P Q
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
command# *
)* +
)+ ,
;, -
[ 
HttpGet 
] 
public 

async 
Task 
< 
ActionResult "
<" #
IListResponseModel# 5
<5 6
TransactionDto6 D
>D E
>E F
>F G
GetListH O
(O P
[P Q
	FromQueryQ Z
]Z [#
GetTransactionListQuery\ s
queryt y
)y z
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
query# (
)( )
)) *
;* +
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
ActionResult "
<" #!
TransactionDetailsDto# 8
>8 9
>9 :
Get; >
(> ?
int? B
idC E
)E F
=> 

Ok 
( 
await 
	_mediator 
. 
Send "
(" #
new# &&
GetTransactionDetailsQuery' A
(A B
)B C
{D E
IdF H
=I J
idK M
}N O
)O P
)P Q
;Q R
} «
XC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Authentication\AuthenticationStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
;+ ,
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class !
AuthenticationStartup +
{		 
public

 

static

 
void

 
AddMyApiAuthDeps

 '
(

' (
this

( ,
IServiceCollection

- ?
services

@ H
)

H I
{ 
services 
. "
AddHttpContextAccessor '
(' (
)( )
;) *
services 
. 
	AddScoped 
< 
ICurrentUserService .
,. /
CurrentUserService0 B
>B C
(C D
)D E
;E F
} 
} °
XC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Authentication\Dtos\ExternalLoginDto.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
.+ ,
Models, 2
.2 3
Dtos3 7
;7 8
public 
record 
ExternalLoginDto 
{ 
public 
*
ExternalAuthenticationProvider )
Provider* 2
{3 4
get5 8
;8 9
init: >
;> ?
}@ A
[		 
Required		 
,		 
	MinLength		 
(		 
$num		 
)		 
]		 
public

 

string

 
IdToken

 
{

 
get

 
;

  
init

! %
;

% &
}

' (
=

) *
null

+ /
!

/ 0
;

0 1
} √
PC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Authentication\Dtos\LoginDto.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
.+ ,
Models, 2
.2 3
Dtos3 7
;7 8
public 
record 
LoginDto 
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
;1 2
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
string		 
Password		 
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
 Á
XC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Authentication\Dtos\LoginResponseDto.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
.+ ,
Models, 2
.2 3
Dtos3 7
;7 8
public 
class 
LoginResponseDto 
{ 
public 

string 
AccessToken 
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
public 

string 
	TokenType 
{ 
get !
;! "
init# '
;' (
}) *
=+ ,
$str- 5
;5 6
public 

int 
	ExpiresIn 
{ 
get 
; 
init  $
;$ %
}& '
public 

string 
Username 
{ 
get  
;  !
init" &
;& '
}( )
=* +
null, 0
!0 1
;1 2
public 

string 
Email 
{ 
get 
; 
init #
;# $
}% &
=' (
null) -
!- .
;. /
public!! 

string!! 
?!! *
ExternalAuthenticationProvider!! 1
{!!2 3
get!!4 7
;!!7 8
init!!9 =
;!!= >
}!!? @
public## 

bool## 
IsExternalLogin## 
{##  !
get##" %
;##% &
init##' +
;##+ ,
}##- .
}$$ ë
^C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Authentication\Services\CurrentUserService.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Authentication +
.+ ,
Services, 4
;4 5
public 
class 
CurrentUserService 
:  !
ICurrentUserService" 5
{ 
private		 
const		 
string		 !
DefaultNonUserMoniker		 .
=		/ 0
$str		1 9
;		9 :
private

 
const

 
string

 
UknownUserMoniker

 *
=

+ ,
$str

- 8
;

8 9
public 

CurrentUserService 
(  
IHttpContextAccessor 2
httpContextAccessor3 F
)F G
{ 
if 

( 
httpContextAccessor 
.  
HttpContext  +
==, .
null/ 3
)3 4
{ 	
UserId 
= !
DefaultNonUserMoniker *
;* +
} 	
else 
{ 	
UserId 
= 
httpContextAccessor (
.( )
HttpContext) 4
.4 5
User5 9
?9 :
.: ;
FindFirstValue; I
(I J#
JwtRegisteredClaimNamesJ a
.a b

UniqueNameb l
)l m
?? 
UknownUserMoniker %
;% &
} 	
} 
public 

string 
UserId 
{ 
get 
; 
}  !
} ‹
DC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\CORS\CorsStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
CORS !
;! "
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
CorsStartup !
{		 
public

 

static

 
void

 "
AddMyCorsConfiguration

 -
(

- .
this

. 2
IServiceCollection

3 E
services

F N
,

N O
IConfiguration

P ^
configuration

_ l
)

l m
{ 
var 
corsSettings 
= 
configuration (
.( )
GetMyOptions) 5
<5 6
CorsSettings6 B
>B C
(C D
)D E
;E F
if 

( 
corsSettings 
== 
null  
)  !
return 
; 
services 
. 
AddCors 
( 
options  
=>! #
{ 	
options 
. 
AddDefaultPolicy $
($ %
builder% ,
=>- /
{ 
builder 
. 
AllowAnyMethod 
(  
)  !
. 
AllowAnyHeader 
(  
)  !
. 
AllowCredentials !
(! "
)" #
. 7
+SetIsOriginAllowedToAllowWildcardSubdomains <
(< =
)= >
. 
WithOrigins 
( 
corsSettings  
.  !
AllowedOrigins! /
)/ 0
. 
Build 
( 
) 
; 
} 
) 
; 
} 	
)	 

;
 
} 
public!! 

static!! 
void!! "
UseMyCorsConfiguration!! -
(!!- .
this!!. 2
IApplicationBuilder!!3 F
app!!G J
)!!J K
{"" 
app## 
.## 
UseCors## 
(## 
)## 
;## 
}$$ 
}%% œ
NC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\CORS\Settings\CorsSettings.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
CORS !
.! "
Settings" *
;* +
public 
class 
CorsSettings 
{ 
public 

string 
[ 
] 
AllowedOrigins "
{# $
get% (
;( )
init* .
;. /
}0 1
=2 3
null4 8
!8 9
;9 :
} µ
VC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\ErrorHandling\ErrorHandlingStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
ErrorHandling *
;* +
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class  
ErrorHandlingStartup *
{ 
public 

static 
void 
AddMyErrorHandling )
() *
this* .
IServiceCollection/ A
servicesB J
)J K
{		 
services

 
.

 
	Configure

 
<

 

MvcOptions

 %
>

% &
(

& '
o

' (
=>

) +
{ 	
if 
( 
o 
== 
null 
) 
{ 
throw 
new 
ArgumentException +
(+ ,
$", .
$str. :
{: ;
nameof; A
(A B

MvcOptionsB L
)L M
}M N
$str	N ö
"
ö õ
)
õ ú
;
ú ù
} 
o 
. 
Filters 
. 
Add 
< "
ExceptionMappingFilter 0
>0 1
(1 2
)2 3
;3 4
} 	
)	 

;
 
} 
} ‘'
`C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\ErrorHandling\Filters\ExceptionMappingFilter.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
ErrorHandling *
;* +
public 
class "
ExceptionMappingFilter #
:$ %
IExceptionFilter& 6
{ 
public 

void 
OnException 
( 
ExceptionContext ,
context- 4
)4 5
{ 
context 
. 
Result 
= 
GetExceptionResult +
(+ ,
context, 3
.3 4
	Exception4 =
)= >
;> ?
context 
. 
ExceptionHandled  
=! "
true# '
;' (
} 
[ #
ExcludeFromCodeCoverage 
] 
private 
static 
IActionResult  
GetExceptionResult! 3
(3 4
	Exception4 =
	exception> G
)G H
=> 

	exception 
switch 
{ 	$
InputValidationException $
e% &
=>' )%
HandleValidationException* C
(C D
eD E
)E F
,F G#
EntityNotFoundException #
e$ %
=>& (#
HandleNotFoundException) @
(@ A
eA B
)B C
,C D4
(ExternalAuthenticationPreventedException 4
e5 6
=>7 9,
 HandleCannotAuthenticateExternal: Z
(Z [
e[ \
)\ ]
,] ^
_ 
=> "
HandleUnknownException '
(' (
	exception( 1
)1 2
} 	
;	 

private 
static 
IActionResult  ,
 HandleCannotAuthenticateExternal! A
(A B4
(ExternalAuthenticationPreventedExceptionB j
ek l
)l m
{ 
var   
details   
=   
new   
ProblemDetails   (
{!! 	
Status"" 
="" 
StatusCodes""  
.""  !'
Status503ServiceUnavailable""! <
,""< =
Title## 
=## 
$str## {
,##{ |
Type$$ 
=$$ 
$str$$ F
}%% 	
;%%	 

return'' 
new'' 
ObjectResult'' 
(''  
details''  '
)''' (
{'') *

StatusCode''+ 5
=''6 7
StatusCodes''8 C
.''C D'
Status503ServiceUnavailable''D _
}''` a
;''a b
}(( 
private** 
static** 
IActionResult**  "
HandleUnknownException**! 7
(**7 8
	Exception**8 A
_**B C
)**C D
{++ 
var,, 
details,, 
=,, 
new,, 
ProblemDetails,, (
{-- 	
Status.. 
=.. 
StatusCodes..  
...  !(
Status500InternalServerError..! =
,..= >
Title// 
=// 
$str// F
,//F G
Type00 
=00 
$str00 F
}11 	
;11	 

return33 
new33 
ObjectResult33 
(33  
details33  '
)33' (
{33) *

StatusCode33+ 5
=336 7
StatusCodes338 C
.33C D(
Status500InternalServerError33D `
}33a b
;33b c
}44 
private66 
static66 
IActionResult66  %
HandleValidationException66! :
(66: ;$
InputValidationException66; S
	exception66T ]
)66] ^
{77 
var88 
details88 
=88 
new88 $
ValidationProblemDetails88 2
(882 3
	exception883 <
.88< =
Errors88= C
)88C D
{99 	
Type:: 
=:: 
$str:: F
};; 	
;;;	 

return== 
new== "
BadRequestObjectResult== )
(==) *
details==* 1
)==1 2
;==2 3
}>> 
private@@ 
static@@ 
IActionResult@@  #
HandleNotFoundException@@! 8
(@@8 9#
EntityNotFoundException@@9 P
	exception@@Q Z
)@@Z [
{AA 
varBB 
detailsBB 
=BB 
newBB 
ProblemDetailsBB (
(BB( )
)BB) *
{CC 	
TypeDD 
=DD 
$strDD F
,DDF G
TitleEE 
=EE 
$strEE ;
,EE; <
DetailFF 
=FF 
	exceptionFF 
.FF 
MessageFF &
}GG 	
;GG	 

returnII 
newII  
NotFoundObjectResultII '
(II' (
detailsII( /
)II/ 0
;II0 1
}JJ 
}KK B
@C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\GlobalUsings.csÒ
LC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Logging\Helper\LogHelper.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Logging $
.$ %
Helper% +
;+ ,
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
	LogHelper 
{ 
public 

static 
LogEventLevel 
ExcludeHealthChecks  3
(3 4
HttpContext4 ?
ctx@ C
,C D
doubleE K
_L M
,M N
	ExceptionO X
exY [
)[ \
=>] _
ex 

!= 
null 
? 
LogEventLevel 
. 
Error !
: 
ctx 
. 
Response 
. 

StatusCode %
>& '
$num( +
? 
LogEventLevel 
.  
Error  %
: !
IsHealthCheckEndpoint '
(' (
ctx( +
)+ ,
? 
LogEventLevel #
.# $
Verbose$ +
: 
LogEventLevel #
.# $
Information$ /
;/ 0
private 
static 
bool !
IsHealthCheckEndpoint -
(- .
HttpContext. 9
ctx: =
)= >
{ 
var 
endpoint 
= 
ctx 
. 
GetEndpoint &
(& '
)' (
;( )
if 

( 
endpoint 
is 
object 
) 
{ 	
return 
string 
. 
Equals  
(  !
endpoint 
. 
DisplayName $
,$ %
$str 
,  
StringComparison  
.  !
Ordinal! (
)( )
;) *
} 	
return!! 
false!! 
;!! 
}"" 
}## À
JC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Logging\LoggingStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Logging $
;$ %
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
 
LoggingStartup

 $
{ 
public 

static 
IHostBuilder 
AddMySerilogLogging 2
(2 3
this3 7
IHostBuilder8 D

webBuilderE O
)O P
{ 
return 

webBuilder 
. 

UseSerilog $
($ %
(% &
context& -
,- .
	loggerCfg/ 8
)8 9
=>: <
{ 	
	loggerCfg 
. 
MinimumLevel 
. 
Information )
() *
)* +
. 
Enrich 
. 
FromLogContext &
(& '
)' (
. 
Enrich 
. 
WithProperty $
($ %
$str% 6
,6 7
context8 ?
.? @
HostingEnvironment@ R
.R S
EnvironmentNameS b
)b c
. 
Enrich 
. 
WithMachineName '
(' (
)( )
;) *
if 
( 
context 
. 
HostingEnvironment *
.* +
IsDevelopment+ 8
(8 9
)9 :
): ;
{ 
	loggerCfg 
. 
WriteTo 
. 
Console  
(  !
)! "
. 
WriteTo 
. 
Debug 
( 
)  
;  !
} 
else 
{ 
	loggerCfg 
. 
MinimumLevel 
. 
Override &
(& '
$str' 2
,2 3
LogEventLevel4 A
.A B
WarningB I
)I J
.   
WriteTo   
.   
Console    
(    !$
restrictedToMinimumLevel  ! 9
:  9 :
LogEventLevel  ; H
.  H I
Error  I N
)  N O
;  O P
}!! 
var## 
logglySettings## 
=##  
context##! (
.##( )
Configuration##) 6
.##6 7
GetMyOptions##7 C
<##C D
LogglySettings##D R
>##R S
(##S T
)##T U
;##U V
if$$ 
($$ 
logglySettings$$ 
.$$ 
WriteToLoggly$$ ,
.$$, -
GetValueOrDefault$$- >
($$> ?
)$$? @
==$$A C
true$$D H
)$$H I
{%% 
	loggerCfg&& 
.&& 
WriteTo&& !
.&&! "
Loggly&&" (
(&&( )
customerToken'' !
:''! "
logglySettings''# 1
.''1 2
CustomerToken''2 ?
)''? @
;''@ A
}(( 
})) 	
)))	 

;))
 
}** 
public00 

static00 
IApplicationBuilder00 %
UseMyRequestLogging00& 9
(009 :
this00: >
IApplicationBuilder00? R

appBuilder00S ]
)00] ^
{11 
return22 

appBuilder22 
.44 $
UseSerilogRequestLogging44 %
(44% &
opts66 
=>66 
opts66 
.66 
GetLevel66 %
=66& '
	LogHelper66( 1
.661 2
ExcludeHealthChecks662 E
)66E F
;66F G
}77 
}88 ¯
SC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Logging\Settings\LogglySettings.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Logging $
.$ %
Settings% -
;- .
public 
class 
LogglySettings 
{ 
[ 
Required 
] 
[ 
MemberNotNullWhen 
( 
true 
, 
nameof #
(# $
CustomerToken$ 1
)1 2
)2 3
]3 4
public		 

bool		 
?		 
WriteToLoggly		 
{		  
get		! $
;		$ %
init		& *
;		* +
}		, -
[ 

RequiredIf 
( 
nameof 
( 
WriteToLoggly $
)$ %
,% &
true' +
)+ ,
], -
public 

string 
? 
CustomerToken  
{! "
get# &
;& '
init( ,
;, -
}. /
} Ü
;C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Program.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
; 
[ #
ExcludeFromCodeCoverage 
] 
public 
static 
class 
Program 
{		 
public

 

static

 
void

 
Main

 
(

 
string

 "
[

" #
]

# $
args

% )
)

) *
{ 
var 
builder 
= 
WebApplication $
.$ %
CreateBuilder% 2
(2 3
args3 7
)7 8
;8 9
builder 
. 
Host 
. 
AddMySerilogLogging  
(  !
)! "
. %
ConfigureAppConfiguration &
(& '
(' (
context( /
,/ 0
config1 7
)7 8
=>9 ;
{ 
config 
. 
AddUserSecrets %
(% &
Assembly& .
.. /
GetEntryAssembly/ ?
(? @
)@ A
,A B
optionalC K
:K L
trueM Q
)Q R
;R S
config 
. ,
 AddMyInfrastructureConfiguration 7
(7 8
context8 ?
)? @
;@ A
} 
) 
; 
var 
startup 
= 
new 
Startup !
(! "
builder" )
.) *
Configuration* 7
,7 8
builder9 @
.@ A
EnvironmentA L
)L M
;M N
startup 
. 
ConfigureServices !
(! "
builder" )
.) *
Services* 2
)2 3
;3 4
var 
app 
= 
builder 
. 
Build 
(  
)  !
;! "
startup   
.   
	Configure   
(   
app   
)   
;   
app"" 
."" 
Run"" 
("" 
)"" 
;"" 
}## 
}$$ Ω
;C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Startup.cs
	namespace

 	
MyWarehouse


 
.

 
WebApi

 
;

 
[ #
ExcludeFromCodeCoverage 
] 
public 
class 
Startup 
{ 
	protected 
IConfiguration 
Configuration *
{+ ,
get- 0
;0 1
}2 3
	protected 
IWebHostEnvironment !
Environment" -
{. /
get0 3
;3 4
}5 6
public 

Startup 
( 
IConfiguration !
configuration" /
,/ 0
IWebHostEnvironment1 D
environmentE P
)P Q
=> 

( 
Configuration 
, 
Environment &
)& '
=( )
(* +
configuration+ 8
,8 9
environment: E
)E F
;F G
public 

void 
ConfigureServices !
(! "
IServiceCollection" 4
services5 =
)= >
{ 
services 
. 
AddMyApi 
( 
) 
; 
services 
. 
AddMyApiAuthDeps !
(! "
)" #
;# $
services 
. 
AddMyErrorHandling #
(# $
)$ %
;% &
services 
. 
AddMySwagger 
( 
Configuration +
)+ ,
;, -
services 
. 
AddMyVersioning  
(  !
)! "
;" #
services 
. "
AddMyCorsConfiguration '
(' (
Configuration( 5
)5 6
;6 7
services 
. +
AddMyInfrastructureDependencies 0
(0 1
Configuration1 >
,> ?
Environment@ K
)K L
;L M
services 
. (
AddMyApplicationDependencies -
(- .
). /
;/ 0
} 
public!! 

void!! 
	Configure!! 
(!! 
IApplicationBuilder!! -
app!!. 1
)!!1 2
{"" 
app## 
.## 
UseMyRequestLogging## 
(##  
)##  !
;##! "
app$$ 
.$$ 
UseHttpsRedirection$$ 
($$  
)$$  !
;$$! "
app%% 
.%% 

UseRouting%% 
(%% 
)%% 
;%% 
app&& 
.&& "
UseMyCorsConfiguration&& "
(&&" #
)&&# $
;&&$ %
app'' 
.'' 
UseMySwagger'' 
('' 
Configuration'' &
)''& '
;''' (
app(( 
.(( 
UseMyInfrastructure(( 
(((  
Configuration((  -
,((- .
Environment((/ :
)((: ;
;((; <
app)) 
.)) 
UseMyApi)) 
()) 
))) 
;)) 
}** 
}++ ’
cC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Configuration\ConfigureSwaggerUIOptions.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Configuration% 2
;2 3
[ #
ExcludeFromCodeCoverage 
] 
internal 
class	 %
ConfigureSwaggerUIOptions (
:) *
IConfigureOptions+ <
<< =
SwaggerUIOptions= M
>M N
{		 
private

 
readonly

 
IConfiguration

 #
_configuration

$ 2
;

2 3
public 
%
ConfigureSwaggerUIOptions $
($ %
IConfiguration% 3
configuration4 A
)A B
=> 

_configuration 
= 
configuration )
;) *
public 

void 
	Configure 
( 
SwaggerUIOptions *
options+ 2
)2 3
{ 
var 
swaggerSettings 
= 
_configuration ,
., -
GetMyOptions- 9
<9 :
SwaggerSettings: I
>I J
(J K
)K L
;L M
options 
. 
SwaggerEndpoint 
(  
url 
: 
$str +
,+ ,
name 
: 
swaggerSettings !
.! "
ApiName" )
+* +
$str, 0
) 	
;	 

} 
} Ç
]C:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Configuration\SecuritySchemeNames.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Configuration% 2
;2 3
public 
static 
class 
SecuritySchemeNames '
{ 
public 

const 
string 
ApiLogin  
=! "
$str# -
;- .
} π	
YC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Configuration\SwaggerSettings.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Configuration% 2
;2 3
class 
SwaggerSettings 
{ 
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public 

string 
ApiName 
{ 
get 
;  
init! %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public

 

bool

 

UseSwagger

 
{

 
get

  
;

  !
init

" &
;

& '
}

( )
[ 
Required 
, 
	MinLength 
( 
$num 
) 
] 
public 

string 
	LoginPath 
{ 
get !
;! "
set# &
;& '
}( )
=* +
null, 0
!0 1
;1 2
} Â&
ZC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Filters\SwaggerAuthorizeFilter.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Filters% ,
;, -
[ #
ExcludeFromCodeCoverage 
] 
public 
class "
SwaggerAuthorizeFilter #
:$ %
IOperationFilter& 6
{ 
public 

void 
Apply 
( 
OpenApiOperation &
	operation' 0
,0 1"
OperationFilterContext2 H
contextI P
)P Q
{ 
var 
filterDescriptor 
= 
context &
.& '
ApiDescription' 5
.5 6
ActionDescriptor6 F
.F G
FilterDescriptorsG X
;X Y
var 
hasAuthorizeFilter 
=  
filterDescriptor! 1
.1 2
Select2 8
(8 9

filterInfo9 C
=>D F

filterInfoG Q
.Q R
FilterR X
)X Y
.Y Z
AnyZ ]
(] ^
filter^ d
=>e g
filterh n
iso q
AuthorizeFilter	r Å
)
Å Ç
;
Ç É
var 
allowAnonymous 
= 
filterDescriptor -
.- .
Select. 4
(4 5

filterInfo5 ?
=>@ B

filterInfoC M
.M N
FilterN T
)T U
.U V
AnyV Y
(Y Z
filterZ `
=>a c
filterd j
isk m"
IAllowAnonymousFilter	n É
)
É Ñ
;
Ñ Ö
var !
hasAuthorizeAttribute !
=" #
context$ +
.+ ,

MethodInfo, 6
.6 7
DeclaringType7 D
!D E
.E F
GetCustomAttributesF Y
(Y Z
trueZ ^
)^ _
._ `
Any` c
(c d
attrd h
=>i k
attrl p
isq s
AuthorizeAttribute	t Ü
)
Ü á
|| 
context 
. 

MethodInfo !
.! "
GetCustomAttributes" 5
(5 6
true6 :
): ;
.; <
Any< ?
(? @
attr@ D
=>E G
attrH L
isM O
AuthorizeAttributeP b
)b c
;c d
if 

( 
( 
hasAuthorizeFilter 
||  "!
hasAuthorizeAttribute# 8
)8 9
&&: <
!= >
allowAnonymous> L
)L M
{ 	
	operation 
. 
	Responses 
.  
Add  #
(# $
$str$ )
,) *
new+ .
OpenApiResponse/ >
{? @
DescriptionA L
=M N
$strO ]
}^ _
)_ `
;` a
	operation 
. 
	Responses 
.  
Add  #
(# $
$str$ )
,) *
new+ .
OpenApiResponse/ >
{? @
DescriptionA L
=M N
$strO Z
}[ \
)\ ]
;] ^
if 
( 
	operation 
. 
Security "
==# %
null& *
)* +
{ 
	operation 
. 
Security "
=# $
new% (
List) -
<- .&
OpenApiSecurityRequirement. H
>H I
(I J
)J K
;K L
} 
	operation!! 
.!! 
Security!! 
.!! 
Add!! "
(!!" #
new!!# &&
OpenApiSecurityRequirement!!' A
(!!A B
)!!B C
{"" 
{## 
new$$ !
OpenApiSecurityScheme$$ 1
{%% 
	Reference&& %
=&&& '
new&&( +
OpenApiReference&&, <
{'' 
Type((  $
=((% &
ReferenceType((' 4
.((4 5
SecurityScheme((5 C
,((C D
Id))  "
=))# $
SecuritySchemeNames))% 8
.))8 9
ApiLogin))9 A
}** 
,** 
Scheme++ "
=++# $
$str++% -
,++- .
Name,,  
=,,! "
$str,,# +
,,,+ ,
In-- 
=--  
ParameterLocation--! 2
.--2 3
Header--3 9
,--9 :
}.. 
,.. 
new// 
List//  
<//  !
string//! '
>//' (
(//( )
)//) *
}00 
}11 
)22 
;22 
}33 	
}44 
}55 µ
YC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Filters\SwaggerGroupAttribute.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Filters% ,
;, -
[ #
ExcludeFromCodeCoverage 
] 
[ 
AttributeUsage 
( 
AttributeTargets  
.  !
Class! &
,& '
AllowMultiple( 5
=6 7
false8 =
)= >
]> ?
public 
class !
SwaggerGroupAttribute "
:# $
	Attribute% .
{		 
public

 

string

 
	GroupName

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
!
SwaggerGroupAttribute  
(  !
string! '
	groupName( 1
)1 2
{ 
	GroupName 
= 
	groupName 
; 
} 
} ≤
VC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\Filters\SwaggerGroupFilter.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
.$ %
Filters% ,
;, -
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 
class

 
SwaggerGroupFilter

 
:

  !
IOperationFilter

" 2
{ 
public 

void 
Apply 
( 
OpenApiOperation &
	operation' 0
,0 1"
OperationFilterContext2 H
contextI P
)P Q
{ 
var  
customGroupAttribute  
=! "
context# *
.* +

MethodInfo+ 5
.5 6
DeclaringType6 C
!C D
.D E
GetCustomAttributesE X
(X Y
trueY ]
)] ^
. 
OfType 
< !
SwaggerGroupAttribute )
>) *
(* +
)+ ,
?, -
.- .
FirstOrDefault. <
(< =
)= >
;> ?
if 

(  
customGroupAttribute  
!=! #
null$ (
&&) +
!, -
string- 3
.3 4
IsNullOrWhiteSpace4 F
(F G 
customGroupAttributeG [
.[ \
	GroupName\ e
)e f
)f g
{ 	
	operation 
. 
Tags 
= 
new  
List! %
<% &

OpenApiTag& 0
>0 1
{2 3
new4 7

OpenApiTag8 B
(B C
)C D
{E F
NameG K
=L M 
customGroupAttributeN b
.b c
	GroupNamec l
}m n
}o p
;p q
} 	
} 
} ‰+
JC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Swagger\SwaggerStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 
Swagger $
;$ %
[

 #
ExcludeFromCodeCoverage

 
]

 
internal 
static	 
class 
SwaggerStartup $
{ 
public 

static 
void 
AddMySwagger #
(# $
this$ (
IServiceCollection) ;
services< D
,D E
IConfigurationF T
configurationU b
)b c
{ 
var 
swaggerSettings 
= 
configuration +
.+ ,
GetMyOptions, 8
<8 9
SwaggerSettings9 H
>H I
(I J
)J K
;K L
if 

( 
swaggerSettings 
. 

UseSwagger &
==' )
false* /
)/ 0
{ 	
return 
; 
} 	
services 
. 
AddSwaggerGen 
( 
c  
=>! #
{ 	
c 
. 

SwaggerDoc 
( 
$str 
, 
new "
OpenApiInfo# .
{/ 0
Title1 6
=7 8
swaggerSettings9 H
.H I
ApiNameI P
,P Q
VersionR Y
=Z [
$str\ `
}a b
)b c
;c d
c 
. !
AddSecurityDefinition #
(# $
SecuritySchemeNames$ 7
.7 8
ApiLogin8 @
,@ A
newB E!
OpenApiSecuritySchemeF [
{ 
Type 
= 
SecuritySchemeType )
.) *
OAuth2* 0
,0 1
Flows 
= 
new 
OpenApiOAuthFlows -
{ 
Password   
=   
new   "
OpenApiOAuthFlow  # 3
(  3 4
)  4 5
{!! 
TokenUrl""  
=""! "
new""# &
Uri""' *
(""* +
swaggerSettings""+ :
."": ;
	LoginPath""; D
,""D E
UriKind""F M
.""M N
Relative""N V
)""V W
}## 
}$$ 
}%% 
)%% 
;%% 
c(( 
.(( 
CustomSchemaIds(( 
((( 
x(( 
=>((  "
{)) 
var**  
lastNamespaceSection** (
=**) *
x**+ ,
.**, -
	Namespace**- 6
!**6 7
[**7 8
(**8 9
x**9 :
.**: ;
	Namespace**; D
!**D E
.**E F
LastIndexOf**F Q
(**Q R
$char**R U
)**U V
+**W X
$num**Y Z
)**Z [
..**[ ]
]**] ^
;**^ _
var++ 
genericParameters++ %
=++& '
string++( .
.++. /
Join++/ 3
(++3 4
$char++4 7
,++7 8
(++9 :
IEnumerable++: E
<++E F
Type++F J
>++J K
)++K L
x++L M
.++M N
GetGenericArguments++N a
(++a b
)++b c
)++c d
;++d e
return-- 
$"-- 
{--  
lastNamespaceSection-- .
}--. /
$str--/ 0
{--0 1
x--1 2
.--2 3
Name--3 7
}--7 8
{--8 9
(--9 :
string--: @
.--@ A
IsNullOrEmpty--A N
(--N O
genericParameters--O `
)--` a
?--b c
null--d h
:--i j
$str--k n
+--o p
genericParameters	--q Ç
+
--É Ñ
$str
--Ö à
)
--à â
}
--â ä
"
--ä ã
;
--ã å
}.. 
).. 
;.. 
c00 
.00 
OperationFilter00 
<00 
SwaggerGroupFilter00 0
>000 1
(001 2
)002 3
;003 4
c11 
.11 
OperationFilter11 
<11 "
SwaggerAuthorizeFilter11 4
>114 5
(115 6
)116 7
;117 8
}22 	
)22	 

;22
 
services55 
.55 
AddTransient55 
<55 
IConfigureOptions55 /
<55/ 0
SwaggerUIOptions550 @
>55@ A
,55A B%
ConfigureSwaggerUIOptions55C \
>55\ ]
(55] ^
)55^ _
;55_ `
}66 
public88 

static88 
void88 
UseMySwagger88 #
(88# $
this88$ (
IApplicationBuilder88) <
app88= @
,88@ A
IConfiguration88B P
configuration88Q ^
)88^ _
{99 
var:: 
swaggerSettings:: 
=:: 
configuration:: +
.::+ ,
GetMyOptions::, 8
<::8 9
SwaggerSettings::9 H
>::H I
(::I J
)::J K
;::K L
if<< 

(<< 
swaggerSettings<< 
.<< 

UseSwagger<< &
==<<' )
true<<* .
)<<. /
{== 	
app>> 
.>> 

UseSwagger>> 
(>> 
)>> 
;>> 
app?? 
.?? 
UseSwaggerUI?? 
(?? 
)?? 
;?? 
}@@ 	
}AA 
}BB Ö
dC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Versioning\Interfaces\IVersionedApiInputContract.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 

Versioning '
.' (

Interfaces( 2
;2 3
internal

 
	interface

	 &
IVersionedApiInputContract

 -
<

- .
TApplicationModel

. ?
>

? @
where 	
TApplicationModel
 
: 
IBaseRequest *
{ 
TApplicationModel 
ToApplicationModel (
(( )
)) *
;* +
} Å
eC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Versioning\Interfaces\IVersionedApiOutputContract.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 

Versioning '
.' (

Interfaces( 2
;2 3
internal 
	interface	 '
IVersionedApiOutputContract .
<. /
TApplicationModel/ @
,@ A
TThisB G
>G H
{		 
TThis 	 
FromApplicationModel
 
( 
TApplicationModel 0
applicationModel1 A
)A B
;B C
} µ
nC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Versioning\SwaggerConfiguration\ConfigureSwaggerGenOptions.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 

Versioning '
.' ( 
SwaggerConfiguration( <
;< =
[ #
ExcludeFromCodeCoverage 
] 
public		 
class		 &
ConfigureSwaggerGenOptions		 '
:		( )!
IPostConfigureOptions		* ?
<		? @
SwaggerGenOptions		@ Q
>		Q R
{

 
readonly *
IApiVersionDescriptionProvider +
_versionProvider, <
;< =
public 
&
ConfigureSwaggerGenOptions %
(% &*
IApiVersionDescriptionProvider& D
versionProviderE T
)T U
=> 

_versionProvider 
= 
versionProvider -
;- .
public 

void 
PostConfigure 
( 
string $
_% &
,& '
SwaggerGenOptions( 9
options: A
)A B
{ 
options 
. #
SwaggerGeneratorOptions '
.' (
SwaggerDocs( 3
.3 4
Clear4 9
(9 :
): ;
;; <
foreach 
( 
var 
description  
in! #
_versionProvider$ 4
.4 5"
ApiVersionDescriptions5 K
)K L
{ 	
options 
. 

SwaggerDoc 
( 
description 
. 
	GroupName #
,# $
new 
OpenApiInfo 
(  
)  !
{ 
Title 
= 
$" 
{ 
nameof %
(% &
MyWarehouse& 1
)1 2
}2 3
$str3 4
{4 5
description5 @
.@ A

ApiVersionA K
}K L
"L M
,M N
Version 
= 
description )
.) *

ApiVersion* 4
.4 5
ToString5 =
(= >
)> ?
,? @
} 
) 
; 
} 	
} 
}   Å
mC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Versioning\SwaggerConfiguration\ConfigureSwaggerUIOptions.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 

Versioning '
.' ( 
SwaggerConfiguration( <
;< =
[ #
ExcludeFromCodeCoverage 
] 
internal 
class	 %
ConfigureSwaggerUIOptions (
:) *!
IPostConfigureOptions+ @
<@ A
SwaggerUIOptionsA Q
>Q R
{		 
private

 
readonly

 *
IApiVersionDescriptionProvider

 3
_versionProvider

4 D
;

D E
public 
%
ConfigureSwaggerUIOptions $
($ %*
IApiVersionDescriptionProvider% C
versionProviderD S
)S T
=> 

_versionProvider 
= 
versionProvider -
;- .
public 

void 
PostConfigure 
( 
string $
_% &
,& '
SwaggerUIOptions( 8
options9 @
)@ A
{ 
options 
. 
ConfigObject 
. 
Urls !
=" #

Enumerable$ .
.. /
Empty/ 4
<4 5
UrlDescriptor5 B
>B C
(C D
)D E
;E F
foreach 
( 
var 
description  
in! #
_versionProvider$ 4
.4 5"
ApiVersionDescriptions5 K
)K L
{ 	
options 
. 
SwaggerEndpoint #
(# $
url 
: 
$" 
$str  
{  !
description! ,
., -
	GroupName- 6
}6 7
$str7 D
"D E
,E F
name 
: 
description !
.! "
	GroupName" +
.+ ,
ToUpperInvariant, <
(< =
)= >
)> ?
;? @
} 	
} 
} æ
PC:\Users\csingare\Desktop\MyWarehouse\src\WebApi\Versioning\VersioningStartup.cs
	namespace 	
MyWarehouse
 
. 
WebApi 
. 

Versioning '
;' (
[ #
ExcludeFromCodeCoverage 
] 
internal 
static	 
class 
VersioningStartup '
{ 
public 

static 
void 
AddMyVersioning &
(& '
this' +
IServiceCollection, >
services? G
)G H
{ 
services 
. 
AddApiVersioning !
(! "
options" )
=>* ,
{ 	
options 
. 
ApiVersionSelector &
=' (
new) ,3
'CurrentImplementationApiVersionSelector- T
(T U
optionsU \
)\ ]
;] ^
} 	
)	 

;
 
if 

( 
services 
. 
Any 
( 
x 
=> 
x 
.  
ServiceType  +
==, .
typeof/ 5
(5 6
ISwaggerProvider6 F
)F G
)G H
)H I
{ 	
services 
. #
AddVersionedApiExplorer ,
(, -
options- 4
=>5 7
{   
options!! 
.!! 
GroupNameFormat!! '
=!!( )
$str!!* 2
;!!2 3
options"" 
."" %
SubstituteApiVersionInUrl"" 1
=""2 3
true""4 8
;""8 9
options## 
.## 5
)AddApiVersionParametersWhenVersionNeutral## A
=##B C
true##D H
;##H I
}$$ 
)$$ 
;$$ 
services'' 
.'' 
AddTransient'' !
<''! "!
IPostConfigureOptions''" 7
<''7 8
SwaggerGenOptions''8 I
>''I J
,''J K&
ConfigureSwaggerGenOptions''L f
>''f g
(''g h
)''h i
;''i j
services(( 
.(( 
AddTransient(( !
<((! "!
IPostConfigureOptions((" 7
<((7 8
SwaggerUIOptions((8 H
>((H I
,((I J%
ConfigureSwaggerUIOptions((K d
>((d e
(((e f
)((f g
;((g h
})) 	
}** 
}++ 