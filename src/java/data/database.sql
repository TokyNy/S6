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

insert into PlatDetails values (default,'Plat4','Ing1',0.30);
insert into PlatDetails values (default,'Plat5','Ing3',0.05);
insert into PlatDetails values (default,'Plat5','Ing4',0.15);
insert into PlatDetails values (default,'Plat6','Ing5',0.05);
insert into PlatDetails values (default,'Plat6','Ing6',0.05);
insert into PlatDetails values (default,'Plat6','Ing7',0.10);
insert into PlatDetails values (default,'Plat5','Ing8',0.01);
insert into PlatDetails values (default,'Plat4','Ing9',0.20);

create table Stock (
    id varchar(10) not null default concat('Stock',nextval('seqStock')),
    idIngredient varchar(10) not null,
    poids float not null,
    Etat int not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);
Alter table Stock add prix float not null;

insert into Stock values (default,'Ing1',1,1,5000);
insert into Stock values (default,'Ing2',1,1,3000);
insert into Stock values (default,'Ing2',1,1,4000);
insert into Stock values (default,'Ing3',1,1,6000);
insert into Stock values (default,'Ing4',1,1,1000);
insert into Stock values (default,'Ing5',1,1,6000);
insert into Stock values (default,'Ing6',1,1,2000);
insert into Stock values (default,'Ing7',1,1,3000);
insert into Stock values (default,'Ing8',1,1,9000);
insert into Stock values (default,'Ing9',1,1,9000);
insert into Stock values (default,'Ing9',2,1,8000);


insert into Stock values (default,'Ing1',0.3,0,0);
insert into Stock values (default,'Ing3',0.05,0,0);
insert into Stock values (default,'Ing4',0.3,0,0);
insert into Stock values (default,'Ing5',0.1,0,0);
insert into Stock values (default,'Ing6',0.1,0,0);
insert into Stock values (default,'Ing7',0.2,0,0);
insert into Stock values (default,'Ing8',0.02,0,0);

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
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES TTable(id)
);
insert into Addition values (default,'Table1',now());
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



-----VIew Stock in et out avec Ingredient
create view inOut as
select idIngredient,(case when stock.etat=0 then sum(stock.poids) else 0 end) as totalSortie,
(case when stock.etat=1 then sum(stock.poids) else 0 end) as totalEntree 
from stock group by idIngredient,etat;

create view vStockIngredient as
select idIngredient,sum(totalEntree)-sum(totalSortie) as reste,sum(totalSortie) as totalSortie,sum(totalEntree) as totalEntree
    from inOut group by idIngredient;

-----VIew prix moyen par ingredient
create view vue_prix_moyen as
select idIngredient,(sum(poids*prix))/sum(poids) as prix_moyen from stock where etat=1 group by idIngredient;
-----VIew prix moyen par ingredient
create view vue_prix_ingredient_plat as
select platdetails.*,vue_prix_moyen.prix_moyen from platdetails join vue_prix_moyen on platdetails.idIngredient=vue_prix_moyen.idingredient;
-----VIew prix ingredient par par plat
create view vue_prix_ingredient_par_plat as
select *,poids*prix_moyen as prix_ingredient from vue_prix_ingredient_plat;
-----VIew prix plat de revient plat
create view vue_plat_prixDeRevient as
select idplat,sum(prix_ingredient) as prix_de_revient from vue_prix_ingredient_par_plat group by idplat