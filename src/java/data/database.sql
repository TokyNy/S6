create sequence seqTable start with 1 increment by 1;
create sequence seqAddition start with 1 increment by 1;
create sequence seqAdditionDetails start with 1 increment by 1;
create sequence seqIngredients start with 1 increment by 1;
create sequence seqPlat start with 1 increment by 1;
create sequence seqPlatDetails start with 1 increment by 1;
create sequence seqStock start with 1 increment by 1;
create sequence seqCategorie start with 1 increment by 1;



create table Ingredients(
    id varchar(10) not null default concat('Ing',nextval('seqIngredients')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);
insert into Ingredients values(default,'pate blanche');
insert into Ingredients values(default,'sauce huitre');
insert into Ingredients values(default,'fromage');
insert into Ingredients values(default,'Pate Tacos');
insert into Ingredients values(default,'boullette de poisson');
insert into Ingredients values(default,'saucisse');
insert into Ingredients values(default,'Poulet');
insert into Ingredients values(default,'Mayonnaise');
insert into Ingredients values(default,'Salade');

create table Categorie (
    id varchar(10) not null default concat('Cat',nextval('seqCategorie')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);

insert into categorie values(default,'Entrée Chaude');
insert into categorie values(default,'Entrée Froide');
insert into categorie values(default,'Desert');
insert into categorie values(default,'Snacking');



create table Plat(
    id varchar(10) not null default concat('Plat',nextval('seqPlat')),
    descri varchar(20) not null,
    prix float not null,
    idCategorie varchar(10) not null,
    PRIMARY KEY(id)
);

insert into Plat values (default,'Spaghetti carbonara',8000,'Cat1');
insert into Plat values (default,'Tacos ',5000,'Cat4');
insert into Plat values (default,'Salade verte',2000,'Cat2');



create table PlatDetails(
    id varchar(10) not null default concat('PlatDet',nextval('seqPlatDetails')),
    idPlat varchar(10) not null,
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);

insert into PlatDetails values (default,'Plat7','Ing1',0.30);
insert into PlatDetails values (default,'Plat7','Ing3',0.05);
insert into PlatDetails values (default,'Plat8','Ing4',0.15);
insert into PlatDetails values (default,'Plat8','Ing5',0.05);
insert into PlatDetails values (default,'Plat8','Ing6',0.05);
insert into PlatDetails values (default,'Plat8','Ing7',0.10);
insert into PlatDetails values (default,'Plat8','Ing8',0.01);
insert into PlatDetails values (default,'Plat9','Ing9',0.20);

create table Stock (
    id varchar(10) not null default concat('Stock',nextval('seqStock')),
    idIngredient varchar(10) not null,
    poids float not null,
    Etat int not null, //etat=1 :StockIn, etat=0:stockOut
    PRIMARY KEY(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);
insert into Stock values (default,'Ing1',1,1);
insert into Stock values (default,'Ing2',1,1);
insert into Stock values (default,'Ing3',1,1);
insert into Stock values (default,'Ing4',1,1);
insert into Stock values (default,'Ing5',1,1);
insert into Stock values (default,'Ing6',1,1);
insert into Stock values (default,'Ing7',1,1);
insert into Stock values (default,'Ing8',1,1);
insert into Stock values (default,'Ing9',1,1);

insert into Stock values (default,'Ing1',0.3,0);
insert into Stock values (default,'Ing3',0.05,0);
insert into Stock values (default,'Ing4',0.3,0);
insert into Stock values (default,'Ing5',0.1,0);
insert into Stock values (default,'Ing6',0.1,0);
insert into Stock values (default,'Ing7',0.2,0);
insert into Stock values (default,'Ing8',0.02,0);


create table TTable(
    id varchar(10) not null default concat('Table',nextval('seqTable')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);
insert into TTable values(default,'Table Num 1');
create table Addition(
    id varchar(10) not null default concat('Add',nextval('seqAddition')),
    idTable varchar(10) not null,
    date timestamp not null,
    prixTotal float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES TTable(id)
);
insert into Addition values (default,'Table1',now(),13000);
create table AdditionDetails(
    id varchar(10) not null default concat('AddDet',nextval('seqAdditionDetails')),
    idAddition varchar(10) not null,
    idPlat varchar(10) not null,
    prix float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idAddition) REFERENCES Addition(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id)
);
insert into AdditionDetails values (default,'Add1','Plat7',8000);
insert into AdditionDetails values (default,'Add1','Plat8',5000);
insert into AdditionDetails values (default,'Add1','Plat8',5000);


create view 
select pd.idIngredient,sum(pd.poids) from platdetails pd join additionDetails ad on pd.idplat=ad.idPlat group by pd.idIngredient;
select idIngredient,reste,sum(stock.poids) as totalSortie,sum(stock.poids) as totalEntree
    from 