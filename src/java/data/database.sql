create sequence seqTable start with 1 increment by 1;
create sequence seqAddition start with 1 increment by 1;
create sequence seqAdditionDetails start with 1 increment by 1;
create sequence seqIngredients start with 1 increment by 1;
create sequence seqPlat start with 1 increment by 1;
create sequence seqPlatDetails start with 1 increment by 1;
create sequence seqStock start with 1 increment by 1;
create sequence seqCategorie start with 1 increment by 1;
create sequence seqServeur start with 1 increment by 1;




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
    idServeur varchar(10),
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES TTable(id)
);
drop view vue_total_par_commande;
Alter table Addition drop idServeur;

update addition set idServeur='Serv1';
insert into Addition values (default,'Table1',now(),'Serv1');
insert into Addition values (default,'Table1',now(),'Serv2');


create table AdditionDetails(
    id varchar(10) not null default concat('AddDet',nextval('seqAdditionDetails')),
    idAddition varchar(10) not null,
    idPlat varchar(10) not null,
    prix float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idAddition) REFERENCES Addition(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id)
);
Alter table additionDetails add idServeur varchar(10);
Alter table additionDetails add etat varchar(1);


update additionDetails set idServeur=5 where id='AddDet16';

insert into AdditionDetails values (default,'Add1','Plat4',8000,'Serv1');
insert into AdditionDetails values (default,'Add1','Plat5',5000,'Serv1');
insert into AdditionDetails values (default,'Add1','Plat6',5000,'Serv2');


insert into AdditionDetails values (default,'Add2','Plat4',6000,'Serv2');
insert into AdditionDetails values (default,'Add2','Plat4',5000,'Serv2');
insert into AdditionDetails values (default,'Add2','Plat5',3000,'Serv1');
insert into AdditionDetails values (default,'Add5','Plat7',6000);
insert into AdditionDetails values (default,'Add5','Plat8',5000);
insert into AdditionDetails values (default,'Add5','Plat8',8000);
insert into AdditionDetails values (default,'Add5','Plat10',3000);

update additiondetails set etat='1' where idPlat='Plat4';
update additiondetails set etat='2' where idPlat='Plat5';
update additiondetails set etat='3' where idPlat='Plat6';

create table marge (
    min float,
    max float,
    pourcentage float not null
);
insert into marge values (100,500,300.0);
insert into marge values (500,1000,250.0);
insert into marge values (1000,2000,200.0);
insert into marge values (2000,3000,150.0);
insert into marge values (3000,5000,100.0);
insert into marge values (5000,10000,50.0);


create table serveur(
    id varchar(10) not null default concat('Serv',nextval('seqServeur')),
    nom varchar(20) not null
);

insert into serveur values(default,'Rakoto');
insert into serveur values(default,'Rabe');

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

-----VIew prix total par commande
create view vue_total_par_commande as select a.id,a.date,ad.idServeur,sum(ad.prix) as prix from Addition as a join AdditionDetails  as ad on a.id=ad.idAddition group by a.id,ad.idServeur;

-----VIew plat additionDetails
create view  plat_AdditionDetails as select ad.*,plat.descri as nom from additionDetails as ad join plat on ad.idPlat=plat.id;

create view total_addition_par_table as
select a.id,a.idTable,a.date,SUM(ad.prix) as prixTotal
from AdditionDetails ad join Addition a on ad.idAddition=a.id  where ad.etat='3'
GROUP BY a.id;

---view relation plat_addition_additiondetails
create view vue_plat_commande as   select ad.*,p.descri as nomPlat,a.date from addition as a join additiondetails as ad on a.id=ad.idAddition join plat as p on ad.idPlat=p.id where ad.etat='1' order by a.date; 

--view relation plat_finit_cuisine
create view vue_plat_preparer as select a.idTable,t.descri,ad.*,p.descri as nomPlat from addition as a join additiondetails as ad on a.id=ad.idAddition join ttable t on t.id=a.idtable join  plat as p on p.id=ad.idPlat where ad.etat='2';

--view listigredient vendu par date
create view vue_ingredient_vendu as select a.date,i.id,i.descri,pd.poids from addition as a join additiondetails as ad on a.id=ad.idAddition join plat as p on p.id=ad.idPlat join platdetails as pd on pd.idPlat=p.id join ingredients as i on i.id=pd.idIngredient where ad.etat='2' or ad.etat='3';

create view stockOut as select idingredient,sum(poids) as stockOut from stock  where etat='0' group by idingredient;
create view stockIn as select idingredient,sum(poids) as stockOut from stock  where etat='1' group by idingredient;

create view vue_stock_ingredient as
select sI.idingredient,
case when stockOut is not null then stockIn-stockOut 
when stockOut is null then stockIn 
end as stock,i.descri from stockIn as sI left join stockOut as sO on sI.idIngredient=sO.idIngredient join ingredients as i on i.id=sI.idIngredient;

 create sequence seqPaie start with 1 increment by 1;
create sequence seqTypePaie start with 1 increment by 1;

create table TypePaiement (
        id varchar(10) not null default concat('TypePaie',nextval('seqTypePaie')),
        intitule varchar(15) not null,
        PRIMARY KEY(id)
);

insert into typePaiement values (default,'espece');
insert into typePaiement values (default,'mobile money');

create table Paiement (
        id varchar(10) not null default concat('Paie',nextval('seqPaie')),
        idAdditionDetails varchar(10) not null,        
        idTypePaiement varchar(10) not null,
        montant float not null,
        date timestamp,
        PRIMARY KEY(id),
        FOREIGN KEY(idAdditionDetails) REFERENCES AdditionDetails(id),
        FOREIGN KEY(idTypePaiement) REFERENCES TypePaiement(id)
);
insert into paiement values (default,'AddDet21','TypePaie1',5000,'2022-04-01 01:00');
insert into paiement values (default,'AddDet22','TypePaie2',8000,'2022-04-01 01:00');
insert into paiement values (default,'AddDet27','TypePaie1',5000,now());
insert into paiement values (default,'AddDet28','TypePaie2',5000,now());
insert into paiement values (default,'AddDet12','TypePaie2',5000,now());
insert into paiement values (default,'AddDet12','TypePaie2',3000,now());
