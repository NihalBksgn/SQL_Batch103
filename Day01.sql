--DATABASE(veri Tabani) olusturma
Create database nihal;

create database bakisgan;

--DDL - DATA DEFINITION LANG:
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,     --ondalikli sayilar kullanilir
kayit_tarih date
);

--VAROLAN TABLODAN YENI TABLO OLUSTURMA
CREATE TABLE ogrenci_ortalamalar 
as select isim, soyisim, not_ort--benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo
--olusturmak icin, normal tablo olustururkenki parantezler yerine AS kullanip Select komutuyla
--almak istedigimiz verileri aliriz
from ogrenciler;

--DATA MANUPULATION LANG
--INSERT(Data Base'e Veri ekleme)

insert into ogrenciler values('1234567','Nihal','Bakisgan',85.5,now());
insert into ogrenciler values('1234567','Nihal','Bakisgan',85.5,'2022-12-1');

--Bir Tabloya Parcali Veri Eklemek Istersek

insert into ogrenciler(isim,soyisim) values ('Hakan','Bakisgan');

--DQL- DATA QUERY LANG:
--SELECT

select * from ogrenciler;--Buradaki yildiz sembolu herseyi anlamindadir




