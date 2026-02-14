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
--x: virgülden önceki basamk sayısı
--y:virgulden sonra
-- ornek ----Ortalama :75,12 /// 100,00
--			   Decimal(4,2)  /// (5,2)           

Select * from  TBLOGRENCILER

Select OGRSEHIR from TBLOGRENCILER

Select * From TBLOGRENCILER where OGRAD='kutay'
Select * From TBLOGRENCILER where OGRSEHIR ='adana' 
Select * from TBLOGRENCILER where OGRCINS = 'erkek' and OGRSEHIR='adana'
Select * from TBLOGRENCILER where OGRCINS = 'kadın' or OGRSEHIR='adana'

Select *From TBLNOTLAR 
Select(SINAV1+SINAV2+SINAV3)/3 FROM TBLNOTLAR -- basit ortalama

--Insert Into TBLOTBLOGRENCILER(OGRID,OGRAD,OGRSOYAD,OGRCINS,OGRKULUP,OGRSEHIR)VALUE()
Insert Into TBLOGRENCILER (OGRAD,OGRSOYAD,OGRSEHIR) VALUEs ('İlayda','Ayas','Adana')
Insert Into TBLNOTLAR(OGRENCI,DERS,SINAV1,SINAV3) VALUES (9,3,88,97)


-- Delete From TBLNOTLAR ---calisinca tum tblnotlar tablosunu siler eger tek deger silinecekse
Delete From TBLDERSLER WHERE DERSID= 4 
Select *From TBLDERSLER


-- Truncate Komutu // tablo icerigini tamamen sifirlar
Truncate Table TBLDERSLER


-- Update Komutu
 Update TBLOGRENCILER Set OGRKULUP = 'Gitar' where OGRID = 9
 Update TBLOGRENCILER Set OGRCINS ='Kadın' Where OGRID= 9
 Select * from TBLOGRENCILER

 Insert INTO TBLNOTLAR(OGRENCI,Ders,Sınav1,SINAV2) VALUES (5,2,77,35)


Update TBLNOTLAR set DURUM = 1 WHERE ORTALAMA >= 70
Update TBLNOTLAR set DURUM = 0 WHERE ORTALAMA<65
Update TBLNOTLAR set ORTALAMA=((SINAV1+SINAV2+Sınav3)/3)

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
Select COUNT(*) AS[Toplam Kayıt] from TBLOGRENCILER
Select count(*) as[Adana'da Toplam Kişi] from TBLOGRENCILER where OGRSEHIR = 'AdAna'

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

/*gruplandırmalar*** group by *** having *** like *** distinct(tekrarsiz siralama) *** order by(siralama) */

Select * From TBLOGRENCILER
Select*from TBLNOTLAR
Select OGRSEHIR, Count(*) as [Toplam] From TBLOGRENCILER group by OGRSEHIR
Select OGRCINS, COUNT(*) as[Cinsiyete Göre] from TBLOGRENCILER group by OGRCINS
Select OGRKULUP, COunt(*) as [Kuluplere Göre] from TBLOGRENCILER group by OGRKULUP

Update TBLOGRENCILER set OGRCINS='Kadın' where OGRCINS='kız'

/*odev: notlar talosunda gecen ve kalan ogrenci sayisini veren sorgu*/
Select DURUM,COUNT(*) as[Geçen Ogrenci Sayısı] from TBLNOTLAR group by DURUM having DURUM = 1
Select DURUM,COUNT(*) as[Kalan Ogrenci Sayısı] from TBLNOTLAR group by DURUM having DURUM = 0

Select OGRSEHIR, COUNT(*) as [Şehire göre Ogr Dağılımı] from TBLOGRENCILER group by OGRSEHIR  --tamamini
Select OGRSEHIR, COUNT(*) as [Şehire göre Ogr Dağılımı] from TBLOGRENCILER group by OGRSEHIR having COUNT(*) = 3 -- tabloda 3 sehirli olanlari getirir
Select OGRKULUP, COUNT(*) as [Kuluplere Göre] from TBLOGRENCILER group by OGRKULUP having OGRKULUP ='BİLİŞİM'

Select * from TBLOGRENCILER where OGRAD like '%i%'
Select * from TBLOGRENCILER where OGRSOYAD like '%an%'

Select * from TBLOGRENCILER where OGRKULUP like '%an%' or OGRSEHIR like '%A'
Select * from TBLOGRENCILER where OGRKULUP like '%an%' and OGRSEHIR like '%A'
Select * from TBLOGRENCILER where OGRAD like 'a%' and OGRCINS = 'kadın'
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

Select * from TBLOGRENCILER order by OGRAD asc --alfabetik olarak a'dan z'ye sıralar
Select * from TBLOGRENCILER order by OGRAD desc --alfabetik olarak z'den a'ya sıralar

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

Select * from TBLNOTLAR where SINAV2 in(78,45,95,90,35)  -- 2.sınav notları arasında 78,45,95,90,35 bu notlari olan ogr
Select * from TBLNOTLAR where SINAV2 not in(78,45,95,90,39)

/*between-arasinda*/

Select * from TBLNOTLAR where ORTALAMA between 60 and 99 
Select * from TBLOGRENCILER where OGRAD between 'A' and 'l' --alfabetik siraya gore j,k,l dersek k yazdigimizda k'yi dahil etmiyor 
Select * from TBLOGRENCILER where OGRAD not between 'A' and 'l'

Select * from TBLNOTLAR 
Select * from TBLOGRENCILER
