select * distinct from student
order by lieming asc



select * from table1
where colcoum between 10 and 100


select * from table2
where country in ('china','korea')

select * from table3
where country like 'c%' -- 以c开头
order by colcoum2 desc  

select * from table3
where country like '__c%' -- 第三个字母是c
order by colcoum2 desc  


select * from table1
inner join table2 -- 内连接
on table1.country = table2.country


select * from table1
left join table2 -- 左连接
on table1.country = table2.country


select * from table1
right join table2 -- 右连接
on table1.country = table2.country

select * from table1
union -- 外连接，无重复
select * from table2

select * from table1
union all -- 外连接，有重复
select * from table2


-- 多字段排序
select * from table1 order by col1 asc,clo2 asc

use table1

select lower(col1) from table1

select upper(col1) from table1

select substr(col1,1,1) from table1 -- 从第一个字符开始，截取一个字符

select substr(col1,2,length(col1)) from table1 -- length获取长度

select concat(col1,col2) from table1 -- 拼接col1和col2

select rand(col1) from table1 -- 产生随机数

select round(rand()*100) from table1 -- round四舍五入，rand产生随机数

select max(col1) from  table1


select min(col) from table1
select avg(col) from table1
select sum(col) from table1 -- 列值相加
select count(col) from table1 -- 列条目数


-- 函数在分组后使用
-- 因为sql语句执行顺序
from > where > group by > select > order by -- 也就是说函数不能出现在from和where中
select col1 from table1 where col1 >= avg(col1) -- 错误

-- 分组查询
select sum(col1),job from table1 group by job -- 按工作分组，计算每组的col1总和

select sum(col1),job from table1 group by job order by sum(col1) desc -- 按总和降序排序

select col1 ,col2 max(col3) from table1 group by col1,col2 -- 多分组，col1，col2都分组，col1和col2都相同的条目分到一组

select col1 ,col2 sum(col3) from table1 group by col1,col2 having sum(col3) > 9000 -- having相当于where，必须与group by同时出现。只保留sum>9000的分组信息
select distinct col1 from table1 -- 去重

-- 笛卡尔积
select e.ename,d.dname from emp e,dmp,d -- 没有指定条件，会输出m*n个，做笛卡尔积

select e.ename,d.dname from emp e,dmp,d where e.deptno = d.deptno -- 


select ename,dname from emp jion dmp on emp.deptno = dmp.deptno -- 连接emp和dmp表，条件关键字是on，不是where

select ename,grade from emp jion salgrade on emp.sal between salgrade.low and salgrade.high

-- 自连接
select e.ename as a,b.ename as b from emp e join emp b on e.mgr = b.empno -- mgr上级编号 = 员工编号，上级也有员工编号
-- 左连接，左边全有，右边查不到则没有
select e.ename as a,b.ename as b from emp e left join emp b on e.mgr = b.empno -- mgr上级编号 = 员工编号，上级也有员工编号

-- 三表连接
select e.ename,d.dname,s.grade from emp e jion dept d on e.deptno = d.deptno jion salgrade s on e.sal between s.low and s.high
-- 先连接前两个，再连接第三个


-- 子查询,函数不能出现在where和from的时候可以用子查询
select ename,sal from emp where sal > (select min(sal) from emp)


-- 子查询放在from
select t.avgsal, t.job, s.grade from
-- 子查询查每组的平均工资，avgsal必须起别名，因为后面on条件中用到，而on中不能用函数
(select job,avg(sal) as avgsal from emp group by job) as t
jion
salgrade as s 
on avgsal between s.low and s.high -- 查avgsal在哪个等级



select ename from emp where empno=1 or empno=2
-- 等价于
select ename freom emp where empno=1 union select ename from emp where empno=2

-- union减少笛卡尔积


