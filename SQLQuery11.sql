create database Filmlerdb
use Filmlerdb

create table Genres(
Id int primary key Identity,
[Name] nvarchar(20) not null
)
create table Rejissors(
Id int primary key Identity,
[Name] nvarchar(20) not null,
)
create table Movies(
Id int primary key Identity,
[Name] nvarchar(20) not null,
[Language] nvarchar(21) not null,
GenreId int foreign key references Genres(Id),
RejissorId int foreign key references Rejissors(Id)
)


create table Actors(
Id int primary key Identity,
[Name] nvarchar(20) not null,
Milliyet nvarchar(21) not null
)
create table MovieActors(
Id int primary key Identity,
MovieId int foreign key references Movies(Id),
ActorId int foreign key references Actors(Id)
)
insert into Genres values ('Drama'),('Komedi'),('Qorxu')

insert into Rejissors values('Filankes'),('Filankes1'),('Filankes2')
select *from Rejissors
insert into Movies values ('FilmAdi','turk',2,1),('F2','Az',3,2),('Freunds','Alman',2,3)
select * from Movies
insert into Actors values('Angelina','Amerikali'),('Jhonny','Amerikali'),('Con','Almanyali')
select *from Actors
insert into MovieActors values(1,2),(2,3),(3,1)
select *from MovieActors
select m.Id,m.Name,g.Name[Genre Name] from Movies as m
inner join Genres as g
On
m.GenreId=g.Id

select m.Id,m.Name,r.Name[Rejissor Name] from Movies as m
inner join Rejissors as r
On
m.RejissorId=r.Id

update Rejissors set Name='Teymur'
where Name='Filankes'
update Rejissors set Name='Abbas'
where Name='Filankes1'
update Rejissors set Name='Orxan'
where Name='Filankes2'
alter table Rejissors add Surname nvarchar(60)
alter table Rejissors drop column Surname 
delete Rejissors
where Name='Filankes'
delete Rejissors
where Name='Filankes1'
delete Rejissors
where Name='Filankes2'
select m.Id,m.Name,r.Name[Rejissor Name],r.Surname[Regissor SURNAME] from Movies as m
right join Rejissors as r
On
m.RejissorId=r.Id
select m.Id,a.Name[Actor Name] from MovieActors as m
inner join Actors as a
On
m.ActorId=a.Id
select a.Id,m.Name[Movie Name] from MovieActors as a
inner join Movies as m
On
a.MovieId=m.Id
