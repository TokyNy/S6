create sequence seqTable start with 1 increment by 1;
create sequence seqAddition start with 1 increment by 1;
create sequence seqAdditionDetails start with 1 increment by 1;
create sequence seqIngredients start with 1 increment by 1;
create sequence seqPlat start with 1 increment by 1;
create sequence seqPlatDetails start with 1 increment by 1;
create sequence seqStock start with 1 increment by 1;


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


create table Plat(
    id varchar(10) not null default concat('Plat',nextval('seqPlat')),
    descri varchar(20) not null,
    prix float not null,
    PRIMARY KEY(id)
);

insert into Plat values (default,'Spaghetti carbonara',8000);
insert into Plat values (default,'Tacos ',5000);
insert into Plat values (default,'Salade verte',2000);



create table PlatDetails(
    id varchar(10) not null default concat('PlatDet',nextval('seqPlatDetails')),
    idPlat varchar(10) not null,
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);

insert into PlatDetails values (default,'Plat1','Ing1',0.30);
insert into PlatDetails values (default,'Plat1','Ing3',0.05);
insert into PlatDetails values (default,'Plat2','Ing4',0.15);
insert into PlatDetails values (default,'Plat2','Ing5',0.05);
insert into PlatDetails values (default,'Plat2','Ing6',0.05);
insert into PlatDetails values (default,'Plat2','Ing7',0.10);
insert into PlatDetails values (default,'Plat2','Ing8',0.01);
insert into PlatDetails values (default,'Plat3','Ing9',0.20);

create table Stock (
    id varchar(10) not null default concat('Stock',nextval('seqStock')),
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);

create table TTable(
    id varchar(10) not null default concat('Table',nextval('seqTable')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);

create table Addition(
    id varchar(10) not null default concat('Add',nextval('seqAddition')),
    idTable varchar(10) not null,
    date timestamp not null,
    prixTotal float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES TTable(id)
);

create table AdditionDetails(
    id varchar(10) not null default concat('AddDet',nextval('seqAdditionDetails')),
    idAddition varchar(10) not null,
    idPlat varchar(10) not null,
    prix float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idAddition) REFERENCES Addition(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id)
);