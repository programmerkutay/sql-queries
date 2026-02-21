/*		---------ASAMA BIR---------		*/

/*1.Secilen satirlari yorum haline getirir*/
/*1.1. comment out the selected lines*/
/*2.create,alter,drop table kullanimi 12,02,2026*/

Create Table TBLDERSLER
(
DERSID tinyint,
DERSADI varchar(20)
)

Alter Table TBLDERSLER /*alter duzenleme islemi icin*/
Add KONTENJAN smallint /*ekleme*/
Alter Table TBLDERSLER /*silme*/
Drop Column KONTENJAN
Alter Table TBLDERSLER

/*select, insert, update, delete*/
--Decimal(x,y)
--x: virgülden önceki basamk sayýsý
--y:virgulden sonra
-- ornek ----Ortalama :75,12 /// 100,00
--			   Decimal(4,2)  /// (5,2)           

Select * from  TBLOGRENCILER

Select OGRSEHIR from TBLOGRENCILER

Select * From TBLOGRENCILER where OGRAD='kutay'
Select * From TBLOGRENCILER where OGRSEHIR ='adana' 
Select * from TBLOGRENCILER where OGRCINS = 'erkek' and OGRSEHIR='adana'
Select * from TBLOGRENCILER where OGRCINS = 'kadýn' or OGRSEHIR='adana'

Select *From TBLNOTLAR 
Select(SINAV1+SINAV2+SINAV3)/3 FROM TBLNOTLAR -- basit ortalama

--Insert Into TBLOTBLOGRENCILER(OGRID,OGRAD,OGRSOYAD,OGRCINS,OGRKULUP,OGRSEHIR)VALUE()
Insert Into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRSEHIR) VALUEs ('Ýlayda','Ayas','Adana')
Insert Into TBLNOTLAR(OGRENCI,DERS,SINAV1,SINAV3) VALUES (9,3,88,97)


-- Delete From TBLNOTLAR ---calisinca tum tblnotlar tablosunu siler eger tek deger silinecekse
Delete From TBLDERSLER WHERE DERSID= 4 
Select *From TBLDERSLER


-- Truncate Komutu // tablo icerigini tamamen sifirlar
Truncate Table TBLDERSLER


-- Update Komutu
 Update TBLOGRENCILER Set OGRKULUP = 'Gitar' where OGRID = 9
 Update TBLOGRENCILER Set OGRCINS ='Kadýn' Where OGRID= 9
 Select * from TBLOGRENCILER

 Insert INTO TBLNOTLAR(OGRENCI,Ders,Sýnav1,SINAV2) VALUES (5,2,77,35)


Update TBLNOTLAR set DURUM = 1 WHERE ORTALAMA >= 50
Update TBLNOTLAR set DURUM = 0 WHERE ORTALAMA < 50
Update TBLNOTLAR set ORTALAMA=((SINAV1+SINAV2+Sýnav3)/3) where DERS=2

Update TBLNOTLAR set SINAV3 = 40 where OGRENCI = 9
Update TBLNOTLAR set SINAV3 = 05 where OGRENCI = 2
Update TBLNOTLAR set SINAV2 = 10 where OGRENCI = 2
Select * from TBLNOTLAR

/*  sum, tamami/toplam
  count,
	min,
	max,
	avg,
*/

Select COUNT(*) AS[Toplam Kayýt] from TBLOGRENCILER
Select count(*) as[Adana'da Toplam Kiþi] from TBLOGRENCILER where OGRSEHIR = 'AdAna'

Select SUM(SINAV1) from TBLNOTLAR
Select SUM(SINAV2)from TBLNOTLAR
Select SUM(SINAV3)from TBLNOTLAR
/*ya da*/
Select SUM(SINAV1) AS [1.SINAV],SUM(SINAV2)AS [2.SINAV],SUM(SINAV3)AS [3.SINAV] FROM TBLNOTLAR -- AS OLMASA DA OLUR

/* AVG/ORTALAMA */
SELECT AVG(SINAV1)AS [1.SINAV ORT],AVG(SINAV2)AS [2.SINAV ORT],AVG(SINAV3)AS [3.SINAV ORT] FROM TBLNOTLAR

SELECT MAX(SINAV1)AS [1.SINAV MAX NOTU],MAX(SINAV2)AS [2.SINAV MAX NOTU],MAX(SINAV3)AS [3.SINAV MAX NOTU] FROM TBLNOTLAR
SELECT MIN(SINAV1)AS [1.SINAV MAX NOTU],MIN(SINAV2)AS [2.SINAV MAX NOTU],MIN(SINAV3)AS [3.SINAV MAX NOTU] FROM TBLNOTLAR
Select * from TBLNOTLAR  

/*gruplandýrmalar*** group by *** having *** like *** distinct(tekrarsiz siralama) *** order by(siralama) */

Select * From TBLOGRENCILER
Select*from TBLNOTLAR
Select OGRSEHIR, Count(*) as [Toplam] From TBLOGRENCILER group by OGRSEHIR
Select OGRCINS, COUNT(*) as[Cinsiyete Göre] from TBLOGRENCILER group by OGRCINS
Select OGRKULUP, COunt(*) as [Kuluplere Göre] from TBLOGRENCILER group by OGRKULUP

Update TBLOGRENCILER set OGRCINS='Kadýn' where OGRCINS='kýz'

/*odev: notlar talosunda gecen ve kalan ogrenci sayisini veren sorgu*/
Select DURUM,COUNT(*) as[Geçen Ogrenci Sayýsý] from TBLNOTLAR group by DURUM having DURUM = 1
Select DURUM,COUNT(*) as[Kalan Ogrenci Sayýsý] from TBLNOTLAR group by DURUM having DURUM = 0

Select OGRSEHIR, COUNT(*) as [Þehire göre Ogr Daðýlýmý] from TBLOGRENCILER group by OGRSEHIR  --tamamini
Select OGRSEHIR, COUNT(*) as [Þehire göre Ogr Daðýlýmý] from TBLOGRENCILER group by OGRSEHIR having COUNT(*) = 3 -- tabloda 3 sehirli olanlari getirir
Select OGRKULUP, COUNT(*) as [Kuluplere Göre] from TBLOGRENCILER group by OGRKULUP having OGRKULUP ='BÝLÝÞÝM'

Select * from TBLOGRENCILER where OGRAD like '%i%'
Select * from TBLOGRENCILER where OGRSOYAD like '%an%'

Select * from TBLOGRENCILER where OGRKULUP like '%an%' or OGRSEHIR like '%A'
Select * from TBLOGRENCILER where OGRKULUP like '%an%' and OGRSEHIR like '%A'
Select * from TBLOGRENCILER where OGRAD like 'a%' and OGRCINS = 'kadýn'
Select * from TBLOGRENCILER where OGRAD like 'a%'
Select * from TBLOGRENCILER where OGRAD like '%a'

Select * from TBLOGRENCILER where OGRKULUP not like '%a%'
Select * from TBLOGRENCILER where OGRKULUP not like '%a%' and OGRKULUP not like '%i%'

Select * from TBLOGRENCILER where OGRSEHIR like '%_an%'
Select * from TBLOGRENCILER where OGRSEHIR like '%an_%'

Select * from TBLOGRENCILER where OGRAD like '%[i,b]%'
Select * from TBLOGRENCILER where OGRAD like '[i,b]%' -- i ya da b ile baslayan
Select * from TBLOGRENCILER where OGRAD like '%[i,b]' -- i ya da b ile biten

Select * from TBLOGRENCILER where OGRAD like '[a-d]%'    -- adi a'dan baslaip d'ye kadar olanlar
Select * from TBLOGRENCILER where OGRKULUP like '[g-s]%' -- kulubu g'den baslaip s'ye kadar olanlar


Select distinct OGRSEHIR From TBLOGRENCILER
Select COUNT(DISTINCT(OGRSEHIR)) as [Tekrarsiz Sehir Sayisi] From TBLOGRENCILER

Select * from TBLOGRENCILER order by OGRAD asc --alfabetik olarak a'dan z'ye sýralar
Select * from TBLOGRENCILER order by OGRAD desc --alfabetik olarak z'den a'ya sýralar

Select * from TBLOGRENCILER order by OGRID asc
Select * from TBLOGRENCILER order by OGRID desc

/* select top *** percent*/

Select top 3 * From TBLOGRENCILER  -- ustten 3 kaydi getirir
Select top 5 * from TBLOGRENCILER order by OGRID desc -- sondan bes kayit gelir
Select top 60 percent * from TBLOGRENCILER -- percent tablonun yüzde belirtilen sayisini getirir

/* in kullanimi veya ifadesi yerine kullanilabilir*/
Select * from TBLOGRENCILER where OGRSEHIR='izmir' or OGRSEHIR='adana' or OGRSEHIR='Antalya'
Select * from TBLOGRENCILER where OGRSEHIR in('mersin','adana','istanbul') -- yukaridaki kullanimin basit hali
Select * from TBLOGRENCILER where OGRSEHIR not in('mersin','adana','istanbul') -- sehri bunlar olmayani getirir

Select * from TBLNOTLAR where SINAV2 in(78,45,95,90,35)  -- 2.sýnav notlarý arasýnda 78,45,95,90,35 bu notlari olan ogr
Select * from TBLNOTLAR where SINAV2 not in(78,45,95,90,39)

/*between-arasinda*/

Select * from TBLNOTLAR where ORTALAMA between 60 and 99 
Select * from TBLOGRENCILER where OGRAD between 'A' and 'l' --alfabetik siraya gore j,k,l dersek k yazdigimizda k'yi dahil etmiyor 
Select * from TBLOGRENCILER where OGRAD not between 'A' and 'l'

Select * from TBLNOTLAR 
Select * from TBLDERSLER
Select*FRom TBLKULUPLER
Select * from TBLOGRENCILER

/*14.02.2026*/
/* Iliskili tablolar ve Alt Sorgular  */
-- veri karmasikligini ve veri tekrarini onler, veri performansi saglar
-- bire bir
-- bire cok
-- coka cok

Update TBLOGRENCILER Set OGRKULUP=1 where OGRKULUP ='biliþim'
Update TBLOGRENCILER Set OGRKULUP=2 where OGRKULUP ='Kitaplýk'
Update TBLOGRENCILER Set OGRKULUP=3 where OGRKULUP ='BinicilikK'
Update TBLOGRENCILER Set OGRKULUP=4 where OGRKULUP ='Satranç'
Update TBLOGRENCILER Set OGRKULUP=5 where OGRKULUP ='Gastronomi'
Update TBLOGRENCILER Set OGRKULUP=6 where OGRKULUP ='Gezi'
Update TBLOGRENCILER Set OGRKULUP=7 where OGRKULUP ='Voleybol'
Update TBLOGRENCILER Set OGRKULUP=8 where OGRKULUP ='Çöpçatan'
Update TBLOGRENCILER Set OGRKULUP=8 where OGRKULUP ='Gitar'

Insert into TBLOGRENCILER(OGRAD,OGRKULUP,OGRSEHIR) values ('Berna',5,'Elazýð')

SELECT * FROM TBLNOTLAR

/*Birlestirme Islemleri ***INNER JOIN*** */

Select NOTID,DERSADI,SINAV1,SINAV2,SINAV3,DURUM from TBLNOTLAR
INNER JOIN TBLDERSLER 
ON TBLNOTLAR.DERS=TBLDERSLER.DERSID  

---------------------------------------------------

Select NOTID,OGRAD + ' ' +OGRSOYAD AS [OGRENCININ ADI VE SOYADI],
DERSADI,SINAV1,SINAV2,SINAV3,DURUM from TBLNOTLAR
INNER JOIN TBLDERSLER 
ON TBLNOTLAR.DERS=TBLDERSLER.DERSID
INNER JOIN TBLOGRENCILER
ON TBLNOTLAR.OGRENCI=TBLOGRENCILER.OGRID

--------------------------------------------------

Select * FROM TBLNOTLAR
INNER JOIN TBLOGRENCILER
ON TBLOGRENCILER.OGRID=TBLNOTLAR.OGRENCI

--------------------------------------------------

Select * FROM TBLNOTLAR
RIGHT JOIN TBLOGRENCILER
ON TBLOGRENCILER.OGRID=TBLNOTLAR.OGRENCI
/* NOTLARI OLMAYANLARIDA BU SEKILDE ALIR */
--------------------------------------------------

Select * FROM TBLNOTLAR
FULL JOIN TBLOGRENCILER
ON TBLOGRENCILER.OGRID=TBLNOTLAR.OGRENCI

--------------------------------------------------
/* UNION -- tablolari birlestirdi */
SELECT *FROM TBLKULUPLER UNION SELECT* FROM TBLDERSLER


--------------------------------------------------

/*dersler tablosunda, matematik dersine ait not bilgileri*/ 
/*alt sorgu -- sub query*/
/* notlar tablosundaki sql dersine ait en yuksek sinav1 i getiren sorgu*/

select MAX(SINAV1) from TBLNOTLAR Where DERS=(Select DERSID FROM TBLDERSLER where DERSADI='sql')
Select * From TBLNOTLAR Where DERS= (Select DERSID FROM TBLDERSLER WHERE DERSADI='matematik')


/* Aritmetik fonksiyonlar */ 


select 20 + 45 as 'toplam', 40-24 as 'fark', 12*15 as 'Çarpým', 98/3 as 'Bolum'

SELECT * from TBLNOTLAR where DERS=2 

Update TBLNOTLAR Set SINAV2=SINAV2+10 from TBLNOTLAR Where DERS=2
Update TBLNOTLAR Set SINAV2=100  where sýnav2 > 100
Update TBLNOTLAR set ORTALAMA=((SINAV1+SINAV2+Sýnav3)/3) where DERS=2

--genel sýnýf ort
SELECT AVG(Ortalama) as [Genel Sýnýf Ortalamasý] from TBLNOTLAR where DERS=2

-- odev:sýnýf ortalamasýnýn altýnda olan ogrencilerin Durum2 sütunlarýnýn yanýna 'altýnda'/''üstünde yazdýran sorgu 

 --ABS // mutlak deger
 --power // us alma
 -- sqrt // karekok
 --floor // tabana yuvarlama
 --ceiling // tavan

 Select ABS(-1235) as [mutlak deger]
 Select POWER(3,4) as 'Üs Alma'
 Select POWER(SINAV1,2) from TBLNOTLAR
 Select SQRT(625) as [karekök]
 select FLOOR(4.67) as 'Taban', CEILING(6.21) as 'Tavan'


 /* SUM() / AVG() */

 SELECT SINAV1, DERS FROM TBLNOTLAR WHERE OGRENCI=3

 SELECT DERSADI,SINAV1,SINAV2,SINAV3 FROM TBLNOTLAR INNER JOIN TBLDERSLER 
 ON TBLNOTLAR.DERS=TBLDERSLER.DERSID 
 WHERE OGRENCI=(SELECT OGRID FROM TBLOGRENCILER WHERE OGRAD='KUTAY')

 /* upper / lower */

 select UPPER('selamlar') -- buyutme
 select UPPER(OGRAD) as [Büyük Harf Þeklinde] from TBLOGRENCILER
 select UPPER(OGRSOYAD) from TBLOGRENCILER

 select LOWER('MERHABALAR') -- kucultme
 select LOWER(OGRSEHIR) from TBLOGRENCILER
 Select UPPER(OGRAD) as [Büyük Ýsim], LOWER(OGRSOYAD) as [küçük soyad] from TBLOGRENCILER

 /*odev: sehri istanbul(benim tablomda ist daha fazla) olan kulubu  bilisim olanlarin adi buyuk soyadi kucuk sekilde getir*/
 Select * from TBLOGRENCILER where OGRSEHIR ='istanbul' and OGRKULUP=1	-- sadece sehir kulup
 Select UPPER(OGRAD) as [Ad], LOWER(OGRSOYAD) as [Soyad] from TBLOGRENCILER where OGRSEHIR='istanbul' and OGRKULUP=1

/*substring*/
Select SUBSTRING(OGRAD,1,3) from TBLOGRENCILER --1.karakterden baslat 3.karaktere kadar
Select SUBSTRING(OGRAD,1,1) + '.' + OGRSOYAD as [AD/SOYAD] from TBLOGRENCILER

/*üstteki sorgu tarzinda: OGR KULUBUNUN ILK 3 HARFI -- inner join ile*/

Select SUBSTRING(OGRAD,1,1) + '.' + OGRSOYAD as [Ad/Soyad], SUBSTRING(KULUPAD,1,3)  as [Kulup]
from TBLOGRENCILER inner join TBLKULUPLER
on TBLOGRENCILER.OGRKULUP = TBLKULUPLER.KULUPID

/* left /right fonksiyonlari */

Select LEFT('SELAMLAR',5) -- soldan 5 karakter alinir
Select RIGHT('Selamlar',6) -- sagdan 6 k

Select LEFT(OGRAD,3) as [Soldan 3 krk], RIGHT(OGRSOYAD,2) as [Saðdan 2 krk] from TBLOGRENCILER
Select Left(OGRAD,1) + ' . ' + OGRSOYAD as [Ad-Soyad] from TBLOGRENCILER

Select LEFT(DERSADI,3),AVG(ORTALAMA) AS[ORTALAMA] from TBLNOTLAR 
inner join TBLDERSLER
ON TBLNOTLAR.DERS = TBLDERSLER.DERSID GROUP BY DERSADI


Select * from TBLNOTLAR 
Select * from TBLDERSLER
Select*FRom TBLKULUPLER
Select * from TBLOGRENCILER

/* len komutu -- kac karakter*/

select Len('Selamlar') as [Karakter Sayýsý]

select OGRAD,OGRKULUP, Len(OGRAD) as[Ad Karakter Sayýsý] FRom TBLOGRENCILER where OGRSEHIR= 'istanbul' and 
OGRKULUP=(select KULUPID from TBLKULUPLER where KULUPAD='biliþim') -- sehri istanbul, kulubu bilisim olanlar

Select * From TBLOGRENCILER where LEN(OGRAD) = 4 or LEN(OGRAD) =3

/* odev: ad ve soyadi toplami 3-7 char arasinda olan ogr getir*/
Select * from TBLOGRENCILER where LEN(OGRAD)+ LEN(OGRSOYAD) between 2 and 9

/*ltrim - rtrim - replace*/

select ltrim('            Ne Mutlu Türküm Diyene                  ')
select rtrim('            Ne Mutlu Türküm Diyene                  ')

select replace('Kutay Ayas', 'AYAS','K.Can Ayas')
--             cumlenin asli,degisecek yer, istedigin metin
select('Bugün hava çok soðuk')
select replace('Bugün hava çok soðuk','soðuk','sýcak')

select replace(replace(replace('Bugün hava çok soðuk','ð','g'), 'ü','u'),'ç','c')

/* CharIndex - reverse */
Select CHARINDEX('a','Kutay Can Ayas') -- ilk a'yi bulur
Select CHARINDEX('a','Kutay Can Ayas',7) -- 7chardan sonraki a'yi bulur // aradaki bosluklarda dahil 7
Select CHARINDEX('i','Kutay Can Ayas') -- olmayani bulmaz
select charindex('a',OGRAD) from TBLOGRENCILER

select reverse('kutay')
select reverse(OGRSOYAD) from TBLOGRENCILER -- ters yazdirma

				/*		--------- ASAMA IKI ---------		*/

/*----------------------- Genel Tekrar -----------------------*/

Create Database SatisVT

use SatisVT

Create Table TBLKATEGORI(
	KATEGORIID tinyint identity(1,1) primary key,
	KATEGORIAD varchar(30)
)

Create Table TBLURUNLER(
	URUNID tinyint identity(1,1) primary key,
	URUNAD varchar(20),
	URUNMARKA varchar(20),
	KATEGORI tinyint,
	UrunAlisFiyat decimal(18,2),
	UrunSatisFiyat decimal(18,2),
	URUNSTOK smallint check(URUNSTOK>0),
	URUNDURUM bit default '1'
)

Create Table TBLPERSONEL(
	PERSONELID smallint identity(1,1) primary key,
	PERSONELADSOYAD varchar(30)
)

Create Table TBLMUSTERI(
	MUSTERIID int primary key identity(1,1),
	MUSTERIAD varchar(15),
	MUSTERISOYAD varchar(15),
	MUSTERISEHIR varchar(14),
	MUSTERIBAKIYE decimal(18,2)
)

Create Table TBLHAREKET(
	HAREKETID int primary key identity (1,1),
	URUN int,
	MUSTERI int,
	PERSONEL smallint,
	ADET int,
	TUTAR decimal(18,2),
	TARIH smalldatetime
)

CREATE TABLE TBLKASA(
	TOPLAM decimal(18,2)
)

create table TBLSAYAC(
	ISLEM int
)

CREATE TABLE TBLTOPLAMKATEGORI(
	ADET INT
)


truncate table TBLURUNLER  -- tablo icerigi bosaltir

insert into TBLKATEGORI (KATEGORIAD) values ('Bilgisayar')
insert into TBLKATEGORI (KATEGORIAD) values ('Beyaz Eþya')
insert into TBLKATEGORI (KATEGORIAD) values ('Küçük Ev Aleti')
insert into TBLKATEGORI (KATEGORIAD) values ('TV')

insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values('BUZDOLABI','SIEMENS',2,4356,4580,10)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Laptop','Asus',1,15000,18500,15)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Laptop','Lenovo',1,14200,16000,20)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Laptop','HP',1,16500,19000,8)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Buzdolabý','Bosch',2,22000,25000,12)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Buzdolabý','Arçelik',2,19500,21000,25)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Buzdolabý','Samsung',2,24000,28500,10)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Çamaþýr Makinesi','LG',2,17000,19500,14)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Çamaþýr Makinesi','Vestel',2,13500,15000,30)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Bulaþýk Makinesi','Siemens',2,18000,21000,9)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Bulaþýk Makinesi','Altus',2,11000,12500,18)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Ütü','Philips',3,2500,3200,50)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Ütü','Tefal',3,2100,2700,45)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Tost Makinesi','Korkmaz',3,1800,2300,60)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Tost Makinesi','Arzum',3,1500,1900,40)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Kahve Makinesi','Fakir',3,3500,4200,22)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Smart TV','Samsung',4,32000,38000,7)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Smart TV','LG',4,30000,35500,11)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Smart TV','Sony',4,45000,52000,4)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Fýrýn','Beko',2,10500,12000,16)
insert into TBLURUNLER(URUNAD,URUNMARKA,KATEGORI,UrunAlisFiyat,UrunSatisFiyat, URUNSTOK) values ('Fýrýn','Kumtel',2,5500,6500,35)


INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Ali', 'Yýlmaz', 'Ýstanbul', 15000.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Ayþe', 'Kaya', 'Ankara', 14250.50)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Mehmet', 'Demir', 'Ýzmir', 11200.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Fatma', 'Çelik', 'Adana', 18700.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Ahmet', 'Þahin', 'Bursa', 10250.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Zeynep', 'Yýldýz', 'Ýstanbul', 25000.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Mustafa', 'Öztürk', 'Antalya', 13200.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Elif', 'Arslan', 'Ankara', 16000.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Burak', 'Doðan', 'Ýzmir', 10950.75)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Cem', 'Koç', 'Trabzon', 14100.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Deniz', 'Kurt', 'Adana', 10150.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Esra', 'Tekin', 'Gaziantep', 18900.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Hakan', 'Yavuz', 'Konya', 10550.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Seda', 'Polat', 'Ýstanbul', 21200.50)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Eren', 'Turan', 'Eskiþehir', 12750.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Merve', 'Kýlýç', 'Kayseri', 13300.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Oðuz', 'Ünal', 'Ýstanbul', 10450.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Selin', 'Aksoy', 'Ankara', 19800.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Kemal', 'Erdoðan', 'Samsun', 11750.00)
INSERT INTO TBLMUSTERI (MUSTERIAD, MUSTERISOYAD, MUSTERISEHIR, MUSTERIBAKIYE) VALUES ('Gamze', 'Þen', 'Muðla', 16200.25)

insert into TBLKASA values(0)

UPDATE TBLMUSTERI SET MUSTERIBAKIYE=30000  where MUSTERIID=1

Select KATEGORIAD, COUNT(*) from TBLURUNLER inner join TBLKATEGORI
on TBLURUNLER.KATEGORI = TBLKATEGORI.KATEGORIID
Group by KATEGORIAD order by COUNT(*)

select * from TBLKASA
select * from TBLURUNLER
select * from TBLMUSTERI
select * from TBLHAREKET



Select HAREKETID,URUNAD,MUSTERIAD + ' ' + MUSTERISOYAD AS [MÜÞTERÝ Ad-Soyad], PERSONELADSOYAD, TUTAR,TARIH,ADET
from TBLHAREKET 
inner join TBLURUNLER ON TBLHAREKET.URUN=TBLURUNLER.URUNID
INNER JOIN TBLMUSTERI ON TBLHAREKET.MUSTERI=TBLMUSTERI.MUSTERIID
INNER JOIN TBLPERSONEL ON TBLHAREKET.PERSONEL=TBLPERSONEL.PERSONELID

/*PROCEDURE KULLINIMI*/

CREATE PROCEDURE HAREKETLER 
AS
Select HAREKETID,URUNAD,MUSTERIAD + ' ' + MUSTERISOYAD AS [MÜÞTERÝ Ad-Soyad], PERSONELADSOYAD, TUTAR,TARIH,ADET
from TBLHAREKET 
inner join TBLURUNLER ON TBLHAREKET.URUN=TBLURUNLER.URUNID
INNER JOIN TBLMUSTERI ON TBLHAREKET.MUSTERI=TBLMUSTERI.MUSTERIID
INNER JOIN TBLPERSONEL ON TBLHAREKET.PERSONEL=TBLPERSONEL.PERSONELID

EXECUTE HAREKETLER -- yukaridaki join iþlemini sadece exec ederek cagirdik

/* PROCEDURE SILME VE GUNCELLEME */
-- !!!!! SILME DENEMESI ICIN YENI PROCEDURE OLUSTUR !!!!!

CREATE PROCEDURE DENEME
AS SELECT*FROM TBLURUNLER WHERE URUNSTOK>10

EXEC DENEME

DROP PROCEDURE DENEME
--------------------------------------------------------

ALTER PROCEDURE [dbo].[HAREKETLER] 
AS
Select HAREKETID,URUNAD,LEFT(MUSTERIAD,1) + '. ' + MUSTERISOYAD AS [MÜÞTERÝ Ad-Soyad], PERSONELADSOYAD, TUTAR,TARIH,ADET
from TBLHAREKET 
inner join TBLURUNLER ON TBLHAREKET.URUN=TBLURUNLER.URUNID
INNER JOIN TBLMUSTERI ON TBLHAREKET.MUSTERI=TBLMUSTERI.MUSTERIID
INNER JOIN TBLPERSONEL ON TBLHAREKET.PERSONEL=TBLPERSONEL.PERSONELID

ALTER PROCEDURE [dbo].[HAREKETLER] 
AS
Select HAREKETID,URUNAD,MUSTERIAD + ' - ' + MUSTERISOYAD AS [MÜÞTERÝ Ad-Soyad], PERSONELADSOYAD, TUTAR,TARIH,ADET
from TBLHAREKET 
inner join TBLURUNLER ON TBLHAREKET.URUN=TBLURUNLER.URUNID
INNER JOIN TBLMUSTERI ON TBLHAREKET.MUSTERI=TBLMUSTERI.MUSTERIID
INNER JOIN TBLPERSONEL ON TBLHAREKET.PERSONEL=TBLPERSONEL.PERSONELID

EXECUTE HAREKETLER

/*PARAMETRELI PRCEDURE*/

CREATE PROCEDURE URUNGETIR                                 -------\
AS														   --------> OLUSTURMA KISMI
SELECT URUNAD,URUNSTOK,URUNMARKA FROM TBLURUNLER		   -------/

ALTER PROCEDURE URUNGETIR								   -------\
AS														   --------> GUNCELLEME KISMI
SELECT URUNAD,URUNSTOK,URUNMARKA FROM TBLURUNLER           -------/

ALTER PROCEDURE URUNGETIR
@Deger varchar(20) ='BUZDOLABI'							   -------\
AS														   --------> PARAMETRELI PROCEDURE 
SELECT URUNAD,URUNSTOK,URUNMARKA FROM TBLURUNLER           -------/
where URUNAD=@Deger

exec URUNGETIR @Deger='tost makinesi'					  --\
exec URUNGETIR @Deger='Çamaþýr Makinesi'				   --\
															   ---------> senin istegine bagli
exec URUNGETIR @Deger='Ütü'								   --/
exec URUNGETIR @Deger='Smart TV'						  --/

EXEC URUNGETIR

/*odev1: stok sayisi 10dan buyuk olan urunlerin procedure sorgusu */
/*odev2: stok sayisi disaridan girilen procedure sorgusu */

alter procedure ONDANBUYUK
as
select URUNAD,URUNSTOK from TBLURUNLER where URUNSTOK>45

exec ONDANBUYUK


create procedure ODEVIKI
@Degr int = 56
as
select URUNAD,URUNSTOK from  TBLURUNLER 
where URUNSTOK > @Degr

alter procedure ODEVIKI
@Degr int = 56
as
select URUNAD,URUNSTOK from  TBLURUNLER 
where URUNSTOK > @Degr

exec ODEVIKI @Degr = 36
exec ODEVIKI @Degr = 40         
exec ODEVIKI @Degr = 55

 /* DATEPART - DATENAME - DateDiff - DateAdd KULLANIMI*/

select * from TBLHAREKET where datepart(DAY,TARIH) between 1 and 2

select * from TBLHAREKET where DATEPART(DAY,TARIH) between 1 and 3 and
MUSTERI=(select MUSTERIID from TBLMUSTERI where MUSTERISEHIR='bursa')    

Select DATENAME(MONTH,getdate()), datename(month,'2026.01.06') -- belirtilen tarihin, gunu
SELECT datename(WEEKDAY,getdate()) -- bugunu gosterir

Select DATEDIFF(YEAR,'2017.10.15',Getdate())  as [Geçen Yýl]
select datediff(MONTH,'2015.12.18',GETDATE()) as [Geçen Ay]
select datediff(DAY, '2026.01.01',GETDATE())  as [Geçen Gün]
select datediff(dAY,TARIH,GETDATE()) from TBLHAREKET where HAREKETID=3

select dateadd(Year,3,'2021.05.07')
select dateadd(MONTH,18,'2021.05.07')
select dateadd(DAY,85,'2021.05.07')

 /* alt sorgu - ic ice sorgular*/

select URUNAD,COUNT(*) from TBLHAREKET 
inner join TBLURUNLER on TBLHAREKET.URUN=TBLURUNLER.URUNID
group by URUNAD order by count(*) desc

select * from TBLHAREKET where URUN IN (select URUNID from TBLURUNLER where KATEGORI=2) -- sadece bilg kategorisinde satilan urunler
select * from TBLHAREKET where MUSTERI in(select MUSTERIID from TBLMUSTERI where MUSTERISEHIR='adana') -- adanili musteriler
select * from TBLHAREKET where URUN IN(select URUNID from TBLURUNLER where KATEGORI=(select KATEGORIID from TBLKATEGORI where KATEGORIAD='tv'))

  --adanali veya ankarali msuterilere satilan toplam urun fiyati 
select SUM(TUTAR) from TBLHAREKET  where MUSTERI IN( select MUSTERIID from TBLMUSTERI where MUSTERISEHIR='ADANA' OR MUSTERISEHIR='ANKARA')
select SUM(TUTAR) from TBLHAREKET  where MUSTERI IN( select MUSTERIID from TBLMUSTERI where MUSTERISEHIR IN('ADANA','ÝSTANBUL','ANKARA'))

select * from TBLHAREKET where URUN=1
update TBLURUNLER set URUNSTOK = URUNSTOK - (Select SUM(ADET) from TBLHAREKET where URUN=10) where URUNID=10 --satilan urun adedi azaltma
update TBLKASA set TOPLAM =(SELECT SUM(TUTAR) from TBLHAREKET) -- kasayi guncelleme

/* Trigger(tetikleyici) otomatiklestirme */

insert into TBLSAYAC values (0)

update TBLSAYAC set ISLEM=(SELECT COUNT(*) from TBLHAREKET)
select * from TBLSAYAC
--------------------------------------------------------

create trigger ISLEMARTIS
on TBLHAREKET
after INSERT
as 
update TBLSAYAC set ISLEM=ISLEM+1

--------------------------------------------------------
UPDATE TBLTOPLAMKATEGORI SET ADET =(SELECT COUNT(*) FROM TBLKATEGORI)

CREATE TRIGGER KATEGORIARTIS
ON TBLKATEGORI
AFTER INSERT
AS
UPDATE TBLTOPLAMKATEGORI SET ADET+=1
--------------------------------------------------------
create trigger KATEGORIAZALIS
ON TBLKATEGORI
AFTER DELETE
AS
UPDATE TBLTOPLAMKATEGORI SET ADET -=1

/******************** VIEW *****************/

create VIEW TEST1
as
select * from TBLKATEGORI

select * from TEST1
-----------------------------
alter view TEST1
as
select * from TBLKATEGORI where KATEGORIID >=2

select * from TEST1
-----------------------------
SELECT * FROM TEST2 /* SIHIRBAZ KULLANIMI OLAN YER - asagidaki sorgu */

/* SELECT        dbo.TBLURUNLER.URUNID, dbo.TBLURUNLER.URUNAD, dbo.TBLURUNLER.URUNMARKA, dbo.TBLKATEGORI.KATEGORIAD
   FROM          dbo.TBLURUNLER INNER JOIN
                 dbo.TBLKATEGORI ON dbo.TBLURUNLER.KATEGORI = dbo.TBLKATEGORI.KATEGORIID */

----------------------------

select * from TEST3
/*
SELECT        dbo.TBLURUNLER.URUNAD, dbo.TBLMUSTERI.MUSTERIAD, dbo.TBLMUSTERI.MUSTERISOYAD, dbo.TBLPERSONEL.PERSONELADSOYAD, dbo.TBLHAREKET.TUTAR, dbo.TBLHAREKET.ADET, dbo.TBLHAREKET.TARIH
FROM            dbo.TBLHAREKET INNER JOIN
                         dbo.TBLPERSONEL ON dbo.TBLHAREKET.PERSONEL = dbo.TBLPERSONEL.PERSONELID INNER JOIN
                         dbo.TBLMUSTERI ON dbo.TBLHAREKET.MUSTERI = dbo.TBLMUSTERI.MUSTERIID INNER JOIN
                         dbo.TBLURUNLER ON dbo.TBLHAREKET.URUN = dbo.TBLURUNLER.URUNID
WHERE        (dbo.TBLHAREKET.ADET > 2) AND (dbo.TBLHAREKET.TUTAR < 300000)
*/

/* hazir db linki */
-- https://disk.yandex.com.tr/d/wuDMwIoKOcfLdw
-- northwind hazir db sorgu ornekleri

select * from Products

select * from Products where CategoryID=(select CategoryID from Categories where CategoryName='seafood') and UnitsInStock > 10 
and SupplierID=(Select SupplierID from Suppliers where city='osaka')
----porcedure---
create procedure TEST1
as
select * from Orders where EmployeeID in(select EmployeeID from Employees where city='london') and ShipVia=3 and ShipCountry ='France'

exec TEST1
-----join ve view sihirbazi-----

CREATE VIEW VIEW1
as
select OrderID,CompanyName,FirstName + ' ' + LastName as 'Employee', OrderDate,ShipName,ShipCountry,ShipCity from Orders 
inner join Customers on Orders.CustomerID=Customers.CustomerID
inner join Employees on Orders.EmployeeID=Employees.EmployeeID

select * from VIEW1
-------------------------------
SELECT        dbo.Orders.ShipName, dbo.Orders.ShipAddress, dbo.Orders.ShipCity, dbo.Orders.ShipRegion, dbo.Orders.ShipPostalCode, dbo.Orders.ShipCountry, dbo.Orders.CustomerID, dbo.Customers.CompanyName AS CustomerName, 
                         dbo.Customers.Address, dbo.Customers.City, dbo.Customers.Region, dbo.Customers.PostalCode, dbo.Customers.Country, dbo.Employees.FirstName + ' ' + dbo.Employees.LastName AS Salesperson, dbo.Orders.OrderID, 
                         dbo.Orders.OrderDate, dbo.Orders.RequiredDate, dbo.Orders.ShippedDate, dbo.Shippers.CompanyName AS ShipperName, dbo.[Order Details].ProductID, dbo.Products.ProductName, dbo.[Order Details].UnitPrice, 
                         dbo.[Order Details].Quantity, dbo.[Order Details].Discount, CONVERT(money, (dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity) * (1 - dbo.[Order Details].Discount) / 100) * 100 AS ExtendedPrice, 
                         dbo.Orders.Freight
FROM            dbo.Shippers INNER JOIN
                         dbo.Products INNER JOIN
                         dbo.Employees INNER JOIN
                         dbo.Customers INNER JOIN
                         dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID ON dbo.Employees.EmployeeID = dbo.Orders.EmployeeID INNER JOIN
                         dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID ON dbo.Products.ProductID = dbo.[Order Details].ProductID ON dbo.Shippers.ShipperID = dbo.Orders.ShipVia
-- alttaki ve ustteki sorgu ayni ama ustte cok uzun sekilde, altta sadece view sihirbazini kullanarak
select * from Invoices

select * from View2

exec CustOrderHist ANATR -- hazirda olan procedure

/*******------------- T-SQL/ DEGISKENLER -------------*******/

--Declare @Sayi int 
--set @Sayi=24
--Select @sayi as [Deðiþken kullanýmý] 

Declare @kisi1 varchar(20)
set @kisi1='Kutay'
Select @kisi1

--Declare @sayi1 int, @sayi2 int, @toplam int
--set @sayi1=20
--set @sayi2=30
--set @toplam=@sayi1+@sayi2
--select @toplam as[iki sayýnýn toplamý]

--odev: 3 tane sinav notu girilen ogrencinin ortalamasini ondalikli hesapla
Declare @snv1 decimal(18,2), @snv2 decimal(18,2) ,@snv3 decimal(18,2), @ortalama decimal(18,2)
set @snv1 = 75.48
set @snv2 = 50.68
set @snv3 = 83.70
set @ortalama=(@snv1 + @snv2 + @snv3)/3
select @ortalama

/*soru: sorgu kismindan gonderilen 3basamakli sayiyi, basamaklarina ayirip toplayan sorgu */
declare @sayi int, @birler int, @onlar int, @yuzler int, @toplam int, @isaret char
set @isaret = '='
set @sayi = 456
set @birler=@sayi % 10
set @onlar=(@sayi/10) % 10
set @yuzler=@sayi/100
set @toplam=@yuzler + @onlar +@birler

select  @yuzler as[yuzler], @onlar as[onlar],@birler as[birler] , @isaret , @toplam as[Toplamý]

select * from TBLMUSTERI
declare @bakiye int
set @bakiye=(select MAX(MUSTERIBAKIYE) from TBLMUSTERI)
select @bakiye

select * from TBLURUNLER

declare @stok int
set @stok=(select max(URUNSTOK) from TBLURUNLER) ----------------> en fazla stok
select @stok
select * from TBLURUNLER where URUNSTOK=@stok    ----------------> en fazla stok urunune ait bilgiler

/* SISTEM FONKSIYONLARI */
Select @@SERVERNAME AS[SERVER ISMI], @@ERROR AS[HATA SATIRI], @@DEFAULT_LANGID AS[VARSAYILAN DIL ID], @@LANGUAGE AS[DIL],@@MAX_CONNECTIONS AS[MAX BAGLANTI],
@@MICROSOFTVERSION AS[MS VERSIYONU], @@VERSION AS[VERSION], @@IDENTITY AS[?], @@TEXTSIZE AS[METIN BOYUTU] 

/* PRINT */
PRINT 'MERHABA'

DECLARE @s1 int, @s2 int, @sonuc int
set @s1=4
set @s2=8
set @sonuc=@s1*@s2 
print '4 ile 8in çarpýmý = '
print @sonuc

/* TABLO TIPI DEGISKENLER */

DECLARE @Kisiler table
(
	KisiID int identity(1,1),
	KisiAD varchar(10),
	KisiSehir varchar(15)
)
insert into @Kisiler(KisiAD,KisiSehir) values ('Kutay','ADANA')
insert into @Kisiler(KisiAD,KisiSehir) values ('Duygu','Adana')
insert into @Kisiler(KisiAD,KisiSehir) values ('Can','Ýzmir')
select * from @Kisiler where KisiSehir like '%an%'

/* if-else kullanimi */

if(10<11)
 print 'selam'
else
 print 'selam yok'

if(select sum(URUNSTOK) from TBLURUNLER) > 500
 print 'stok 200un uzerinde'
else
 print 'STOK TEDARIK EDINIZ'

if(select count(*) from TBLURUNLER) > 20
 print '20den fazla çeþit'
else
 print 'çeþit sayýsý 20den az'

/* Case Kullanimi */
select URUNAD,URUNMARKA,URUNDURUM=
CASE URUNDURUM
	when '1' then 'ÜRÜN VAR'
	when '0' then 'ÜRÜN YOK'
end
from TBLURUNLER

select URUNAD,URUNMARKA,KATEGORI=
case KATEGORI
	when '1' then 'Laptop'
	when '2' then 'Beyaz Eþya'
	--when '3' then 'Küçük Ev Aleti'
end
from TBLURUNLER

select URUNAD,URUNMARKA,URUNSTOK,URUNSTOK=
case
	when URUNSTOK < 1 then 'ÜRÜN YOK!!!!!'
	when URUNSTOK >=2 and URUNSTOK <= 13 THEN 'Kritik Seviye'
	when URUNSTOK >=14 and URUNSTOK <= 25 then 'Takviye Gerekli'
	when URUNSTOK >25 then 'Yeterli Ürün'
end
from TBLURUNLER

-------- bu sorunun procedure ile olani -------------
create procedure test4
as
select URUNAD,URUNMARKA,URUNSTOK,URUNSTOK=
case
	when URUNSTOK < 1 then 'ÜRÜN YOK!!!!!'
	when URUNSTOK >=2 and URUNSTOK <= 13 THEN 'Kritik Seviye'
	when URUNSTOK >=14 and URUNSTOK <= 25 then 'Takviye Gerekli'
	when URUNSTOK >25 then 'Yeterli Ürün'
end
from TBLURUNLER

exec test4
 
/* WHILE DONGUSU */

-- 5 esit olana kadar printle
DECLARE @sayac1 int
 set @sayac1=1
  while @sayac1 <=5
   begin
    print '73. SQL Dersi'
    set @sayac1 = @sayac1+1
   end
--------------------
Declare @i int
set @i=1
while @i<=10
begin
 print @i 
 set @i=@i+1
end
--------------------
Declare @toplam int, @sayac int
set @sayac=1
set @toplam =0
 while(@sayac <= 10) 
 begin
 set @toplam=@toplam+@sayac
 set @sayac+=1
 end
 print '1-10 arasý sayýlarýn toplamý'
 print '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
 print @toplam
--------------------

while(select avg(UrunSatisFiyat-UrunAlisFiyat) from TBLURUNLER where KATEGORI=2) <= 6500
begin
update TBLURUNLER set UrunSatisFiyat+=UrunSatisFiyat*10/100 -- yuzde 10 zam
--update TBLURUNLER set UrunSatisFiyat-=UrunSatisFiyat*10/100 -- yuzde 10 indirim
end

--ODEV:toplam urun sayisi 500u gecene kadar urun stokta her urune 1 urun ekleyen sorgu
while(select sum(URUNSTOK) from TBLURUNLER) < 500
begin
update TBLURUNLER set URUNSTOK+=1
end

select sum(URUNSTOK) from TBLURUNLER


 /* WaitFor Kullanimi -- bekleme yapiyor*/

waitfor delay '00:00:06'
select * from TBLURUNLER

WAITFOR DELAY '00:00:05'
INSERT INTO TBLKATEGORI(KATEGORIAD) VALUES ('Diðer')

select * from TBLKATEGORI  

 select URUNAD,URUNMARKA,URUNSTOK,URUNSTOK=
case
	when URUNSTOK < 1 then 'ÜRÜN YOK!!!!!'
	when URUNSTOK >=2 and URUNSTOK <= 13 THEN 'Kritik Seviye'
	when URUNSTOK >=14 and URUNSTOK <= 25 then 'Takviye Gerekli'
	when URUNSTOK >25 then 'Yeterli Ürün'
end
from TBLURUNLER

exec test4
exec URUNGETIR
select * from TBLKATEGORI
Select KATEGORIAD,COUNT(*) from TBLKATEGORI inner join TBLURUNLER on TBLKATEGORI.KATEGORIID=TBLURUNLER.KATEGORI group by KATEGORIAD

select MUSTERISEHIR ,count(*) as [Þehirlerdeki Müþteri Sayýsý] from TBLMUSTERI group by MUSTERISEHIR
Select MUSTERISEHIR, Count(*) from TBLMUSTERI group by MUSTERISEHIR
			
			/*		---------ASAMA BIR---------		*/

create database DbYeni

use DbYeni

create table TBLMUSTERI
(
	ID int primary key identity(1,1),
	AD varchar(20),
	SOYAD varchar (20),
	SEHIR varchar (20),
	BAKIYE decimal(18,2)
)

create table TBLKATEGORI
(
	KATEGORIID int primary key identity(1,1),
	KATEGORIAD varchar(20),
) 
 create table TBLURUN
 (
	URUNID int primary key identity(1,1),
	AD varchar(30),
	SATISFIYAT decimal (18,2),
	STOK int,
	DURUM BIT,
	KATEGORI INT
 )
 ALTER TABLE TBLURUN ADD ALISFIYATI decimal(18,2);
 TRUNCATE TABLE TBLURUN
 DELETE FROM TBLSTOK
 DELETE FROM TBLSATIS
 DELETE FROM TBLURUN
 
 CREATE TABLE TBLSATIS
 (
	SATISID int primary key identity(1,1),
	MUSTERI INT,
	URUN INT,
	TARIH DATE
 )

select * from TBLMUSTERI
SELECT * FROM TBLKATEGORI
SELECT * FROM TBLURUN
SELECT * FROM TBLSTOK


-- BEYAZ EÞYA (KATEGORI: 1)
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Buzdolabý', 19000.00, 25500.00, 50, 1, 1);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Çamaþýr Makinesi', 14500.00, 18200.50, 40, 1, 1);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Bulaþýk Makinesi', 11000.00, 15400.00, 30, 1, 1);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Derin Dondurucu', 8500.00, 12000.00, 15, 1, 1);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Fýrýn', 6700.00, 9850.00, 25, 1, 1);

-- BÝLGÝSAYAR (KATEGORI: 2)
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Laptop', 38000.00, 45000.00, 10, 1, 2);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Ofis Bilgisayarý', 15000.00, 18500.00, 20, 1, 2);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('27 Inç Monitör', 5800.00, 7500.00, 35, 1, 2);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Mekanik Klavye', 1400.00, 2200.00, 100, 1, 2);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Kablosuz Mouse', 850.00, 1250.00, 150, 1, 2);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Kablosuz Kulaklý', 4850.00, 6250.00, 60, 1, 2);

-- KÜÇÜK EV ALETLERÝ (KATEGORI: 3)
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Airfryer', 4200.00, 5500.00, 60, 1, 3);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Robot Süpürge', 10500.00, 13200.00, 20, 1, 3);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Türk Kahvesi Makinesi', 2600.00, 3400.00, 45, 1, 3);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Blender Seti', 1950.00, 2750.00, 55, 1, 3);
INSERT INTO TBLURUN (AD, ALISFIYATI, SATISFIYAT, STOK, DURUM, KATEGORI) VALUES ('Tost Makinesi', 1600.00, 2250.00, 100, 1, 3);


 update TBLSTOK set TOPLAMURUN=(select COUNT(*) FROM TBLURUN)
 update TBLSTOK set TOPLAMURUN=(SELECT SUM(STOK) FROM TBLURUN)

 /* tetikleyici */

--create trigger ARTTIR
--on TBLURUN
--after insert
--as
--update TBLSTOK set TOPLAMURUN+=1

--create trigger AZALT
--on TBLURUN
--after insert
--as
--update TBLSTOK set TOPLAMURUN-=1
 
-- drop trigger ARTTIR
-- drop trigger AZALT

create trigger ARTTIR
on TBLURUN
after insert
as
DECLARE @STOKSAYI INT
SELECT @STOKSAYI=STOK FROM inserted
UPDATE TBLSTOK SET TOPLAMURUN+=@STOKSAYI

create trigger AZALT
on TBLURUN
after DELETE
as
DECLARE @STOKSAYI INT
SELECT @STOKSAYI=STOK FROM deleted
UPDATE TBLSTOK SET TOPLAMURUN= TOPLAMURUN - @STOKSAYI

/* TRANSACTION -> ROLLBACK --- COMMIT*/

BEGIN TRANSACTION 
INSERT INTO TBLKATEGORI (KATEGORIAD) VALUES ('TV')
INSERT INTO TBLKATEGORI (KATEGORIAD) VALUES ('Halý')
ROLLBACK /*----*/
SELECT * FROM TBLKATEGORI

BEGIN TRANSACTION
INSERT INTO TBLURUN (AD,STOK) values ('ürün3',10)
INSERT INTO TBLURUN (AD,STOK) values ('ürün4','B')
select * from TBLURUN
COMMIT /* YA HEP YA HIC OLAYI */


/* fonksiyon oluþturma */

select * from TBLURUN 

create function STOKARTTIR(@ADET INT)
RETURNS INT 
AS
BEGIN
RETURN @ADET+10
END

SELECT AD,STOK,DBO.STOKARTTIR(STOK) FROM TBLURUN

/*ODEV: fonksiyon cagir karekokunu al ve 3 ile carp*/

create FUNCTION Odev3(@KOK FLOAT)
returns FLOAT 
as
begin 
	return SQRT(@KOK)
end

select AD, STOK, (DBO.Odev3(STOK) * 3) FROM TBLURUN

ALTER FUNCTION KUCUKHARF(@ISIM VARCHAR(20))
RETURNS VARCHAR(20)
AS
BEGIN
RETURN LOWER(@ISIM)
END

SELECT DBO.KUCUKHARF(AD),STOK FROM TBLURUN

/*KDV FONKSIYON*/


CREATE FUNCTION KDV(@FIYAT DECIMAL(18,2))
RETURNS DECIMAL(18,2)
AS
BEGIN
RETURN @FIYAT*1.18
END

SELECT AD,ALISFIYATI,SATISFIYAT,DBO.KDV(SATISFIYAT) AS [KDV'LÝ FÝYAT] FROM TBLURUN
------------ TABLO SONUCLU FONKSIYONLAR -------------

CREATE FUNCTION URUNBILGI(@URID INT)
RETURNS TABLE
AS
RETURN SELECT * FROM TBLURUN WHERE URUNID=@URID

SELECT * FROM DBO.URUNBILGI(21)

/* INDEX ---> buyuk olcekli tablolarda kullanilir --kisaca bir kitabýn icerigi gibi dusun */
/* clustered index ---> kumelenmis index */
/* Non clustered index ---> hem yazar hem kitap adina gore arama yapilabilir */

create table TABLO1
(
	ID INT IDENTITY(1,1),
	AD VARCHAR(20)
)

DECLARE @SAYAC INT=1
   WHILE @SAYAC <= 250000
	BEGIN
	 INSERT TABLO1
	 SELECT 'Kitap' + CAST(@SAYAC AS varchar(20))
	 SET @SAYAC=@SAYAC+1
	END

SELECT COUNT(*) FROM TABLO1

SELECT * FROM TABLO1 WHERE ID=210343 /*BU SONUCU SCAN ISLEMI VAR MI DIYE KONTROL EDIYORUZ*/
SET STATISTICS IO ON
SET STATISTICS TIME ON /*KONTROL KISIMLARI*/

CREATE CLUSTERED INDEX TABLOOKUMA /*INDEX ILE OKUMA*/
ON TABLO1(ID)

SELECT * FROM TABLO1 WHERE ID=210254





