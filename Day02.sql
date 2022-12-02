create table ogrenciler5
(ogrenci_no char(7),
 isim varchar(20),
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date
);

create table Notlar as select isim,not_ort from ogrenciler5;

select * from Notlar;

-- INSERT---TABLOYA VERI EKLEME
INSERT INTO Notlar values ('Fatma',90.0);

--CONSTRAINT
--UNUQEU

create table ogrenciler6
(ogrenci_no char(7) unique,
 isim varchar(20) not null,
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date
);

select * from ogrenciler6;


create table ogrenciler7
(ogrenci_no char(7) unique,
 isim varchar(20) not null,
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date
);

select * from ogrenciler7;
INSERT INTO ogrenciler7 VALUES ('1234567','Nihal','Bakisgan',95.5,now());
INSERT INTO ogrenciler7 VALUES ('1234568','Ali','Veli',95.5,now());


insert into ogrenciler7(ogrenci_no,soisim,not_ort) values('124569','evren',86.0);

--PRIMARY KEY ATAMASI
--1:YOL:
create table ogrenciler8
(ogrenci_no char(7) primary key,
 isim varchar(20) not null,
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date
);

--2:YOL:
create table ogrenciler9
(ogrenci_no char(7),
 isim varchar(20) not null,
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date,
 CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
 
);

create table ogrenciler10
(ogrenci_no char(7),
 isim varchar(20) not null,
 soyisim varchar(25),
 not_ort real,
 kayit_tarih date,
PRIMARY KEY(ogrenci_no)
 
);


create table tedarikciler3
(tedarikci_id char(10) primary key,
tedarikci_ismi varchar(25),
 iletisim_isim varchar(25)
);

create table urunler
(tedarikci_id char(10),
 urun_id char(10),
foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)
);

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun.
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.
Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. 
“adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
id char (5) primary key,
isim varchar (20) unique,
maas int not Null,
ise_baslama date	
);

create table adresler
(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
foreign key(adres_id) references calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;



-- CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);
insert into calisanlar1 values ('10002','Mehmet yilmaz',19000, '2018-04-14');

select * from calisanlar1;

--DQL-- WHERE KULLANIMI
SELECT * from calisanlar;
SELECT isim FROM calisanlar;

--calisanlar tablosundan maasi 5000den buyuk olan isimleri listeleyin
select isim from calisanlar where maas>5000;

--calisanlar tablosundan ismi veli han olani getirin
select * from calisanlar where isim ='Veli Han';

--calisanlar tablosundan maasi 5000 olan tum verileri listele
select * from calisanlar where maas=5000;

--DML--DELETE KOMUTU

delete from calisanlar;
-- eger parent table baska bir child table ile iliskili ise once child table silinmelidir

delete from adresler;


--adresler tablosundan sehri antep olanlari siliniz
delete from adresler where sehir='Antep';


CREATE TABLE ogrenciler2
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler2 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler2 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler2 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler2 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(127, 'Mustafa Bak', 'Ali', 99);


-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim
delete from ogrenciler2 where isim='Nesibe Yilamz' or isim='Mustafa Bak';







