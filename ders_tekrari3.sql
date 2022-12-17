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

--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar  order by adres;
select * from insanlar order by 2 asc;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olaraklisteleyin
select * from insanlar order by isim asc, soyisim desc;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar order by length (soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' ' ||soyisim as isim_soyisim from insanlar
order by length (isim) + length(soyisim);

select concat(isim, ' ',soyisim)as isim_soyisim from insanlar order by length(isim)+length(soyisim)desc;

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

--Isme gore alinan toplam urunleri bulun
select isim,sum(Urun_miktar)as alinan_toplam_meyve from manav 
group by isim;

--Urun ismine gore urunu alan toplam kisisayisi
select Urun_adi, count(isim)as kisi sayisi from manav
group by Urun_adi;

CREATE TABLE personel (
id int primary key,
isim varchar(50), 
sehir varchar(50), 
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz','Istanbul', 5500,'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456789013, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500,'Honda');

--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket,count(isim) from personel
where maas>5000
group by sirket;

--Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket,min(maas) from personel
group by sirket
having min(maas)>4000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorguyaziniz
select isim,sum(maas) from personel
group by isim
having sum(maas)>10000;

--Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorguyaziniz
select sehir,count(isim)as personel_sayisi from personel
group by sehir
having count(isim)>1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorguyaziniz
select sehir,max(maas)as maximum_maas from personel
group by sehir
having max(maas)<5000;


--Maasi 4000’den cok olan isci isimlerini ve 
--5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_veya_sehir,maas from personel where maas>4000
union
select sehir as isim_veya_sehir,maas from personel where maas>5000;

--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelinmaaslarini
--bir tabloda gosteren sorguyaziniz
SELECT sehir AS isci_veya_sehir_ismi,maas FROM personel WHERE sehir='Istanbul'
UNION
SELECT isim AS isci_veya_sehir_ismi , maas FROM personel WHERE isim = 'Mehmet Ozturk'
order by isci_veya_sehir_ismi desc;

--Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az olanlari 
--bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
select sehir as sehir_veya_isim,maas from personel where maas>3000
union
select isim,maas from personel where maas<5000
order by maas;


CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678',5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678',4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245',3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659',3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698',2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574',2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585',1);


--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini,
--personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin

select sehir,maas from personel where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789
