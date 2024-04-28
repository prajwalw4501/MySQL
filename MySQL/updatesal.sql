delimiter //
create procedure updsall()
begin
declare efinished int default 0;
declare eempno,eexp int default 0;
declare eename , ejob varchar(20) default '';
declare esal,newsal float(9,2);
declare ehiredate date ;
declare empcur cursor for select empno,ename,job,hiredate,sal from emp;
declare continue handler for NOT FOUND set efinished =1;
open empcur;
label1:loop
fetch empcur into eempno,eename,ejob,ehiredate,esal;
if efinished=1 then
leave label1;
end if;
select floor(datediff(curdate(),ehiredate)/365) into eexp
from emp where empno=eempno;
if eexp<= 35 then
set newsal=esal;
elseif eexp>35 and eexp<=38 then
set newsal=esal*1.2;
else  
set newsal=esal*1.25;
end if;
select eempno,eename,ejob,ehiredate,esal,newsal;
end loop;
close empcur;
end//
 