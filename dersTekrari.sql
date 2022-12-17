CREATE TABLE ogrenciler
(
id char(4),
isim_soyisim varchar(50),
not_ort real,
kayit_tarihi date	
);

CREATE TABLE ogrenci_ortalamalar
AS SELECT isim_soyisim,not_ort
FROM ogrenciler;

INSERT INTO ogrenciler VALUES('5678','Idil Bakisgan',80.20,'15.10.2022');

INSERT INTO ogrenciler(id,isim_soyisim)VALUES('1023','Inci Bakisgan');
 SELECT * FROM ogrenciler;
SELECT * FROM ogrenci_ortalamalar;

--EXAMPLE: “tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”,“tedarikci_adres”
--          ve“ulasim_tarihi”field’lari olsun.

CREATE TABLE tedarikciler
(
tedarikci_id char(5),
tedarikci_ismi varchar(20),
tedarikci_adres	varchar(50),
ulasim_tarihi date	
);
drop table tedarikciler;

--EXAMPLE: “tedarikçi_ziyaret” isminde bir tabloyu “tedarikciler” tablosundan olusturun.
--          Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lariolsun

CREATE TABLE tedarikçi_ziyaret
AS SELECT tedarikci_ismi,ulasim_tarihi
FROM tedarikciler;

CREATE TABLE ogretmenler(
kimlik_no char(9),
isim varchar(25),
brans varchar(20),
cinsiyet varchar(10)	
);
INSERT INTO ogretmenler VALUES('234431223','Ayse Guler','Matematik','Kadin');
INSERT INTO ogretmenler VALUES('565797624','Ali Veli');
SELECT * FROM ogretmenler;
SELECT isim FROM ogretmenler;

---“id”field’ini“tekrarsiz” yapmak icin , id field’inda Data Type’dan sonra“UNIQUE” yazmak gerekir
CREATE TABLE ogrenciler2
(
id char(4) UNIQUE,
isim_soyisim varchar(50),
not_ort real,
kayit_tarihi date	
);
--  “isim”field’inin “NULL” deger kabul etmemesi icin , isim field’i olusturulurken Data
--   Type’dan sonra “NOT NULL” yazmak gerekir
CREATE TABLE ogrenciler2
(
id char(4) UNIQUE,
isim_soyisim varchar(50) NOTNULL,
not_ort real,
kayit_tarihi date	
);
--Personel isminde bir tablo olusturun, icinde id,isim,soyisim,email,ise_baslama_tarihive
--maas fieldlari olsun, isim field’I bosbirakilamasin
CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date, 
maas int
);

INSERT INTO personel VALUES('1234567890','nb@gmail.com');--bunu ekleyemeyiz

/*EXAMPLE: “sehirler” isimli bir Table olusturun. Tabloda “alan_kodu”, “isim”, “nufus” field’lari olsun. Isim field’ibos
            birakilamasin.
            1.Yontemi kullanarak “alan_kodu” field’ini “Primary Key” yapin
*/
CREATE TABLE sehirler(
alan_kodu char(4),
isim varchar(15) PRIMARY KEY,
nufus varchar(50)
);

/*“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun
ve “tedarikci_id” yi Primary Keyyapin.“urunler” isminde baska bir tablo olusturun 
“tedarikci_id” ve “urun_id” field’lari olsun ve “tedarikci_id” yi Foreign Key yapin.*/

CREATE TABLE tedarikciler3(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);
CREATE TABLE urunler(
tedarikci_id char(5),
urun_id char(10),
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)	
);
/*“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”field’lari olsun.
“id” yi Primary Keyyapin, “isim” i Unique, “maas” i Not Nullyapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”,“sokak”, “cadde” ve “sehir”fieldlari olsun.
“adres_id” field‘iileForeign Key oluşturun.*/

CREATE TABLE calisanlar(
id char(5) PRIMARY KEY,
isim varchar(20) UNIQUE,
maas int NOT NULL,
ise_baslama date	
);

CREATE TABLE adresler(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),	
CONSTRAINT adresler_fk FOREIGN KEY (adres_id) REFERENCES calisanlar (id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--isim unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--maas notnull
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--isim unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--maas int
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--id unique
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
