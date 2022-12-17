/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Keyyapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsunve
“tedarikci_id” yi Foreign Key yapin.*/
CREATE TABLE tedarikciler3(
tedarikci_id char(10),
tedarikci_ismi varchar(20),
iletisim_isim varchar(20),
CONSTRAINT tedarikci_id_pk PRIMARY KEY (tedarikci_id)
);

CREATE TABLE urunler
(
tedarikci_id char(10),
product_id char(10),
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

/*“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”field’lari olsun.
“id” yi Primary Keyyapin, “isim” i Unique, “maas” i Not Nullyapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”,“sokak”, “cadde” ve “sehir”fieldlari olsun.
“adres_id” field‘iileForeign Key oluşturun. */
CREATE TABLE calisanlar(
id char(5) PRIMARY KEY,
isim varchar(15) UNIQUE,
maas int NOT NULL ,
ise_baslama date	
);

CREATE TABLE adresler(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),	
sehir varchar(15),
CONSTRAINT adresler_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--isim UNIQUE olmali
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--maas NOTNULL olmali
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--isim Unique olmali
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--maas int olmali
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');-- id unique olmali
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');-- id unique olmali
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');-- id primary null olmaz
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from calisanlar;

SELECT * from calisanlar WHERE maas>5000;
SELECT * FROM calisanlar WHERE isim='Mehmet Yılmaz';
SELECT * FROM calisanlar WHERE maas>=2000 and maas<=5000;
SELECT * FROM calisanlar WHERE maas IN (2000,5000);
SELECT * FROM calisanlar WHERE maas BETWEEN 2000 and 5000;

SELECT * from calisanlar WHERE maas=(select max (maas) FROM calisanlar);
SELECT * FROM calisanlar 
ORDER BY maas DESC
OFFSET 2 ROW FETCH NEXT 2 ROW ONLY;--en yuksek ikinci maas

--Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Maraş');

UPDATE adresler SET adres_id=10003 WHERE adres_id=NULL;---calismadi

SELECT * FROM adresler;
DELETE FROM adresler;

--sehirler2 tablosu olusturalim, nufusun negatif deger girilmemesiicin
--sinirlandirma (Constraint)koyalim

CREATE TABLE sehirler(
alan_kodu int,
isim varchar(20),
nufus int CHECK(nufus>0)
);

INSERT INTO sehirler(nufus) VALUES(15000);

select * from sehirler;
UPDATE sehirler SET isim='istanbul' WHERE isim IS NULL;
UPDATE sehirler SET isim='istanbul', nufus=30000 WHERE isim='Ankara' and nufus=15000;
UPDATE sehirler SET alan_kodu=850510 WHERE alan_kodu IS NULL;

-----DELETE------
CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);
INSERT INTO ogrenciler6 VALUES(127, 'Merve Gul', null, 99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', null);

----id'si 124 olan ogrenciyi siliniz.
DELETE FROM ogrenciler6 WHERE id=124;

--ismi Kemal Yasa olan satırını siliniz.
DELETE FROM ogrenciler6 WHERE isim='Kemal Yasa';

--ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
DELETE FROM ogrenciler6 WHERE isim='Nesibe Yilmaz' OR isim='Mustafa Bak' 
OR isim='Faruk Drama';

DELETE FROM ogrenciler6 WHERE isim='Ali Can' OR id=127;

DELETE FROM ogrenciler6 WHERE id IN(123,124) or isim IN ('Nesibe Yilmaz');

delete from ogrenciler6;

DELETE FROM ogrenciler6
WHERE id between 123 and 127;

DELETE FROM ogrenciler6 WHERE veli_isim IS NULL OR yazili_notu IS NULL;

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;

DELETE from notlar where talebe_id='123';

DELETE from talebeler where id='126';

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
select * from calisanlar2;
----Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri from calisanlar2 WHERE isyeri IN
(select marka_isim from markalar where calisan_sayisi>15000);

--marka_id’si 101’den büyük olan marka çalişanlarinin 
--isim, maaş ve şehirlerini listeleyiniz.

SELECT isim, maas, sehir from calisanlar2 
WHERE isyeri in(select marka_isim from markalar where marka_id>101 );

--Her markanin id’sini, ismini ve toplam kaç şehirde 
--bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id,marka_isim,
(select count(sehir) from calisanlar2 where isyeri=marka_isim)as toplam_sehir
from markalar;

--Her markanin ismini, calisan sayisini ve
--o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim)as toplam_maas
from markalar;

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.


SELECT marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim) as max_maas,
(select min(maas) from calisanlar2 where isyeri=marka_isim) as min_maas
from markalar;


CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
select*from mart;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

SELECT musteri_isim,urun_id from mart 
WHERE EXISTS (select urun_id from nisan where mart.urun_id= nisan.urun_id);

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select musteri_isim,urun_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where not exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--MART ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from mart
where not exists (select urun_isim from nisan where mart.urun_isim=nisan.urun_isim);


