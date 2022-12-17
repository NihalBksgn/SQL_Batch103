CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler3
where isim = 'Nesibe Yilmaz' or isim='Mustafa Bak';

--İsmi Ali Can ve id'si 123 olan kaydı siliniz.
delete from ogrenciler3 where isim = 'Ali Can' and id = 123;

--Veli ismi hasan olan datayi siliniz
delete from ogrenciler3 where veli_isim='Hasan';

--TRUNCATE --
--Bir tablodakitum verileri geri alamayacagimiz sekilde siler,sartli silme yapmaz
truncate table ogrenciler3;


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

--ON DELETE CASCADE
DROP TABLE IF EXISTS talebeler --eger tablo varsa tabloyu siler

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);
select * from talebe;
select * from not1;

--talebelerden id si 126 olan veriyi silin

delete from talebe where id='126';

--IN CONDITION
Drop Table if exists musteriler;
CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler;

--Musteriler tablosundan urun ismi orange, apple veya apricot olan datalari listeleyiniz
select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';

-- IN CONDITION
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

--NOT IN -- Yazdigimiz verilerin disindakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');

--BETWEEN CONDITION-- 
--Musteriler tablosundan urun_id'si 20 ile 40 arasinda olan tum verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40;

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;



--------------SUBQUERIES--------------------------------------

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM markalar;
SELECT * FROM calisanlar2;

--calisan sayisi 15000'den cok olan markalarin isimlerini
--ve bu markada calisanlarin isimlerini ve maaslarini listeleyin

select isim,maas,isyeri from calisanlar2 
where isyeri IN(select marka_isim from markalar where calisan_sayisi>15000);


--marka id'si 101'den buyuk olan marka calisanlarinin isim maas ve sehirlerini listeleyiniz
select isim,maas,sehir from calisanlar2
where isyeri IN(select marka_isim from markalar where marka_id>101);

--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

SELECT marka_id,calisan_sayisi FROM markalar
WHERE marka_isim IN
(SELECT isyeri FROM calisanlar2 WHERE sehir='Ankara');
------------------AGGREGATE METHOD---------------

SELECT max(maas) AS maksimum_maas from calisanlar2;-- max degeri getirdik

select min(maas) from calisanlar2;--min degerini getirdik
select min(maas) as en_dusuk_maas from calisanlar2;
--as dersek gecici bir isimle sorgumuzu listeleyebiliriz

--calisanlar tablosundaki maaslarin toplami
select sum(maas) from calisanlar2;

--calisanlar tablosundaki maas'larin ortalamasini listeleyiniz
select avg(maas) from calisanlar2;

select round(avg(maas),2) from calisanlar2;--virgulden sonraki kismi duzenlemek icin 

--calisanlar tablosundaki maas'larin sayisini listeleyiniz
select count(maas) from calisanlar2;

select count(*) from calisanlar;-- usttekiyle ayni sonucu verir cunku satir sayar count

---------------AGGREGATE METHODLARDA SUBQUERY---------------

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,(select count (sehir) as sehir_sayisi 
from calisanlar2 where marka_isim=isyeri) from markalar;


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
--toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,
(select sum(maas)as toplam_maas from calisanlar2 where isyeri=marka_isim)
from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve 
--minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(select min(maas)as minimum_maas from calisanlar2 where isyeri=marka_isim ),
(select max(maas)as maximum_maas from calisanlar2 where isyeri=marka_isim )
from markalar;

-----------------VIEW KULLANIMI-----------------------------
--daha onceden yapmis oldugumuz sorgulari hafizaya alir ve tekrar bizden istenen
--sorgu yerine view'e atadigimiz ismi select komutuyla cagiririz

create view maxminmaas
as
select marka_isim,calisan_sayisi,
(select min(maas)as minimum_maas from calisanlar2 where isyeri=marka_isim ),
(select max(maas)as maximum_maas from calisanlar2 where isyeri=marka_isim )
from markalar;


SELECT * FROM maxminmaas;


create view summaas
as
select marka_isim,calisan_sayisi,
(select sum(maas)as toplam_maas from calisanlar2 where isyeri=marka_isim)
from markalar;


select * from summaas;


CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

select urun_id,musteri_isim from mart
where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id)

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri 
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
-- NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.




CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');


CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler;
select * from urunler1;

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri'
 */

UPDATE tedarikciler
SET firma_ismi= 'Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve 
--irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler SET firma_ismi='Casper' where vergi_no=101;
UPDATE tedarikciler SET irtibat_ismi='Ali Veli' where vergi_no=101;
--2.yol:
UPDATE tedarikciler SET firma_ismi='Casper',irtibat_ismi='Ali Veli' 
where vergi_no=101;

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler set urun_isim='Telefon' Where urun_isim='Phone';


-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler SET urun_id= urun_id+1 where urun_id>1004;

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri
--ile toplayarak güncelleyiniz.
UPDATE urunler
SET urun_id = urun_id + ted_vergino;

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.



--ALIASES--------
CREATE TABLE calisanlar 
(calisan_id char(9),
 calisan_isim varchar(50),
 calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar;

select calisan_id as id from calisanlar;

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar

--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar


----------IS NULL ----
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar;
--Name sutununda null olan degerleri listeleyelim
select name from insanlar where name is null;
--insanlar tablosunda sadece null olmayan degerleri listeleyiniz
select name from insanlar where name is not null;


UPDATE insanlar 
SET name='no name' where name is null;


-------ORDER BY-------------
/*
Tablolardaki verileri siralamak icin order by komutu kullaniriz
Buyukten kucuge ya da kucukten buyuge siralama yapabiliriz
default olarak kucukten buyuge siralama yapar
eger BUYUKTEN KUCUGE siralamak istersek order by komutundan sonra DESC komutunu kullaniriz
*/
drop table if exists insanlar
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar;
--insanlar tablosundaki datalari adrese gore siralayin
select * from insanlar ORDER BY adres;

select * from insanlar ORDER BY soyisim;
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar where isim='Mine' ORDER BY ssn;


/*NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin */
select * from insanlar where soyisim='Bulut' order by 2;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olaraklisteleyin
select * from insanlar order by isim asc, soyisim desc;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
Ve yine uzunlugu buyukten kucuge siralamak istersek  sonuna DESC komutunu ekleriz
*/

select isim,soyisim from insanlar order by length (soyisim) desc;

---- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select isim||' '||soyisim as isim_soyisim from insanlar order by length (isim||soyisim);

select isim||' '||soyisim as isim_soyisim from insanlar order by length (isim)+ length(soyisim);

select concat(isim,' ',soyisim) as isim_soyisim from insanlar order by length (isim)+ length(soyisim);

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))

----GROUP BY CLAUSE-------------
/*
Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
komutuyla birlikte kullanılır.
*/
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav;
--isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge siralayiniz
select isim, sum(urun_miktar) as toplam_urun from manav
group by isim order by toplam_urun desc;

--Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) as urunu_alan_toplam_kisiler from manav
group by urun_adi;





