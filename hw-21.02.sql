-- database: :memory:
-- 1 уровень сложности: В рамках БД "песочница" напишите след/запросы:


--1.Вывести среднюю стоимость товара в категории 1 (проекция: название_категории, сред/стоимость)

SELECT AVG(Price) AS avg_price
FROM Products
WHERE CategoryID = 1;




--2.Вывести телефоны поставщиков (suppliers) и перевозчиков (shippers)

SELECT Suppliers.SupplierName, 
Suppliers.Phone AS SupplierPhone,
 Shippers.ShipperName, Shippers.Phone AS ShipperPhone
FROM Suppliers, Shippers;



--3.Вывести все заказы, добавив поле is_premium, если его доставит перевозчик 3 (ShipperID)

SELECT *,
       CASE WHEN ShipperID = 3 THEN 'Yes' ELSE 'No' END AS is_premium
FROM Orders;



--4.Вывести все товары, причем для товаров от поставщиков 1 и 3 и ценой до 250 EUR добавить скидку в 5.5% (проекция: все поля + поле Price_down)


SELECT *,
       CASE WHEN SupplierID IN (1, 3) AND Price <= 250 THEN Price * 0.945 ELSE Price END AS Price_down
FROM Products;
