create table TTable(
    id varchar(10) not null default concat('Table',nextval('seqTable')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);

create table Addition(
    id varchar(10) not null default concat('Add',nextval('seqAddition')),
    idTable varchar(10) not null,
    date datetime not null,
    prixTotal float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idTable) REFERENCES TTable(id),
);

create table AddictionDetails(
    id varchar(10) not null default concat('AddDet',nextval('seqAdditionDetails')),
    idAddition varchar(10) not null,
    idPlat varchar(10) not null,
    prix float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idAddition) REFERENCES Addition(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id)
);

create table Ingredients(
    id varchar(10) not null default concat('Ing',nextval('seqIngredients')),
    descri varchar(20) not null,
    PRIMARY KEY(id)
);

create table Plat(
    id varchar(10) not null default concat('Plat',nextval('seqPlat')),
    descri varchar(20) not null,
    prix float not null,
    PRIMARY KEY(id)
);


create table PlatDetails(
    id varchar(10) not null default concat('PlatDet',nextval('seqPlatDetails')),
    idPlat varchar(10) not null,
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idPlat) REFERENCES Plat(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
);

create table Stock (
    id varchar(10) not null default concat('Stock',nextval('seqStock')),
    idIngredient varchar(10) not null,
    poids float not null,
    PRIMARY KEY(id),
    FOREIGN KEY(idIngredient) REFERENCES Ingredients(id)
)