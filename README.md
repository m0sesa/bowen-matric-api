# bowen-matric-api

DELETE [POST]
matric_gen/delete
```
matricNumber=BUXXYYYZZZZ
reason=Some reasons
firstName=John
lastName=Mark
```
INSERT [POST]
matric_gen
```
email=example@bowen.com
firstName=Bowen
lastName=Bowen
college=COBOW
programme=BOW
session=2021/2022
level=200
formNumber=XXXX
isFreshStudent=1|0
```
LIST [GET]
matric_gen?session=2021/2022
