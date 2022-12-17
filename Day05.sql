CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;
delete from personel;
--Isme gore toplam maaslari bulun
select isim, sum(maas)as toplam_maas from personel
group by isim;
--personel tablosundaki isimleri gruplayin
select isim from personel
group by isim;
--sehirlere gore personel sayisini gruplayin
select sehir,count(isim) as calisan_sayisi from personel
group by sehir;

--HAVING KULLANIMI---
/*
Having komutu yanlızca group by komutu ile kullanılır. 
Eğer gruplamadan sonra bir şart varsa having komutu kullanılır
Where kullanımı ile aynı mantıkta çalışır
*/
--Her sirketin min maaslarini eger 4000'den buyukse goster
select * from personel

select sirket,min(maas) from personel
group by sirket
having min(maas)> 4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas) as toplam_maas from personel
group by isim
having sum(maas)>10000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise
--ismi ve toplam maasi gosteren sorguyaziniz

SELECT isim, SUM (maas) AS toplam_maas FROM personel
GROUP BY isim
HAVING SUM (maas)>10000;

--Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorguyaziniz
SELECT sehir, COUNT (isim) AS toplam_personel_sayisi FROM personel
GROUP BY sehir
HAVING COUNT (isim)>1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

select sehir,max(maas)as max_maas from personel
group by sehir
having sum(maas)<5000;

--------UNION OPERATOR--------------------------------------------------------

-- Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

SELECT isim AS isci_veya_sehir_ismi,maas
FROM personel WHERE maas >4000 
UNION
SELECT sehir,maas
FROM personel
WHERE maas >5000;
select * from personel;
--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelinmaaslarini
--bir tabloda gosteren sorguyaziniz

select isim as isim_veya_sehir,maas from personel where isim='Mehmet Ozturk'
UNION
select sehir as isim_veya_sehir,maas from personel where sehir='Istanbul';


CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY(id)
);

CREATE TABLE personel_bilgi
(
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel;
select * from personel_bilgi;