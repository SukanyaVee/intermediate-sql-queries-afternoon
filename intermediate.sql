/* PRACTICE JOINS */

SELECT * FROM Invoice JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId WHERE UnitPrice>0.99;

SELECT Invoice.InvoiceDate, Customer.FirstName, Customer.LastName, Invoice.Total FROM Invoice JOIN Customer ON Customer.CustomerId = Invoice.CustomerId;

SELECT Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName FROM Customer JOIN Employee ON Customer.SupportRepID = Employee.EmployeeId;

SELECT Album.Title, Artist.Name FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId;

SELECT PlaylistTrack.TrackId FROM PlaylistTrack JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId WHERE Playlist.Name IS 'Music';

SELECT Track.Name FROM Track JOIN PlaylistTrack ON PlaylistTrack.TrackId=Track.TrackId WHERE PlaylistTrack.PlaylistId IS 5;

SELECT Track.Name, Playlist.Name FROM Track JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId JOIN Playlist ON Playlist.PlaylistId= PlaylistTrack.PlaylistId;

SELECT Track.Name, Album.Title FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId JOIN Album ON Track.AlbumId = Album.AlbumId WHERE Genre.Name = "Alternative";

-- PRACTICE NESTED QUERIES


SELECT * FROM Invoice WHERE InvoiceId IN 
(SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice>0.99);

SELECT * FROM PlaylistTrack WHERE PlaylistId in 
(SELECT PlaylistId FROM Playlist WHERE name IS 'Music');

SELECT Name FROM Track WHERE TrackId IN 
(SELECT TrackId FROM PlaylistTrack WHERE PlaylistID IS 5);

select * from track where genreid in (
  select genreid from genre where name is 'Comedy');
  
select * from track where albumid in 
(select albumid from album where title is 'Fireball'); 

select * from track where albumid in 
(select albumid from album where artistid in
 (select artistid from artist where name is 'Queen'));

-- PRACTICE UPDATING ROWS

UPDATE Customer SET Fax = null WHERE Fax IS NOT  null;

UPDATE Customer SET Company = "Self" WHERE Company IS null;

UPDATE Customer SET LastName = "Thompson" WHERE FirstName = "Julia" AND LastName = "Barnett";

UPDATE Customer SET SupportRepId = 4 WHERE email = 'luisrojas@yahoo.cl';

update track set composer = "The darkness around us" where genreid in 
(select genreid from genre where name = 'Metal') and composer is null;

-- GROUP BY

SELECT Count(*), genre.Name FROM Track JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.genreid;

SELECT count(*) from track join genre on track.genreid = genre.genreid
where genre.name = "Pop" OR genre.name = "Rock"
GROUP BY genre.name;

select artist.name, count(*) from artist join album on artist.artistid = album.artistid
group by artist.artistid;

-- USE DISTINCT

SELECT DISTINCT composer FROM track;

select distinct BillingPostalCode from invoice;

select distinct company from customer;

-- DELETE ROWS


delete from practice_delete where type = 'bronze';

delete from practice_delete where type = "silver";

delete from practice_delete where value = '150';

-- eCOMMERCE SIMULATION

CREATE TABLE USERS 
(userid integer primary key autoincrement,name string, email string);
insert into users (name, email)
values
('Einstein', 'einstein@einstein.com'),
 ('Beyonce','beyonce@beyonce.com'),
 ('Eminem','eminem@eminem.com');

create table products
(prod_id integer primary key autoincrement, prod_name string, price decimal);
insert into products
(prod_name, price)
values
('Ping Pong balls',12.34),
('Batteries',2.23),
('Legos',33.87);

create table orders
(order_id integer primary key autoincrement, ref integer)
insert into orders
(ref) values (1),(2),(1);

select * from users;
select * from products;
select * from orders;

select * from orders where order_id is 1;
SELECT * from orders;
select sum(price) from products join orders on products.prod_id = orders.order_id
group by orders.order_id



