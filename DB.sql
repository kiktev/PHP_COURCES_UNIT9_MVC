-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Трв 19 2021 р., 12:57
-- Версія сервера: 5.7.33-cll-lve
-- Версія PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `k79523_FileCloud`
--

-- --------------------------------------------------------

--
-- Структура таблиці `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin_role` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `customer`
--

INSERT INTO `customer` (`customer_id`, `last_name`, `first_name`, `telephone`, `email`, `city`, `password`, `admin_role`) VALUES
(1, 'Півкач', 'Михайло', '+380501111111', 'mykhailo.pivkach@transoftgroup.com', 'Мукачево', '3fc0a7acf087f549ac2b266baf94b8b1', 1),
(6, 'Kiktev', 'Anton', '0995374505', 'kiktev.anton888@gmail.com', 'Muckachevo', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(7, 'Александра', 'Наталія', '0994468340', 'alexandra@gmail.com', 'Ужгород', '4f7b884f2445ef08da9bbc77b028722c', 1),
(9, 'Ляльчук', 'Святослав', '0997584223', 'lyalchuk@gmail.com', 'Мукачево', '5555', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `admin_role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `customers`
--

INSERT INTO `customers` (`customer_id`, `last_name`, `first_name`, `phone`, `email`, `password`, `city`, `admin_role`) VALUES
(2, 'Півкач', 'Михайло', '+380501111111', 'mykhailo.pivkach@transoftgroup.com', '3fc0a7acf087f549ac2b266baf94b8b1', 'Мукачево', 1),
(13, 'Murff', 'Donald', '+443125911482', 'murf@microsoft.com', '440655d6d98f244c507d27576a9209c5', 'Chicago', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `menu`
--

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `path` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` smallint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `menu`
--

INSERT INTO `menu` (`id`, `name`, `path`, `active`, `sort_order`) VALUES
(1, 'Товари', '/product/list', 1, 1),
(2, 'Клієнти', '/customer/list', 1, 2),
(3, 'Тест', '/test/test', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `nameOrd` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` bigint(15) NOT NULL,
  `sku` varchar(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `orders`
--

INSERT INTO `orders` (`id`, `nameOrd`, `email`, `telephone`, `sku`, `name`, `price`, `date_at`) VALUES
(1, 'Михайло', 'mykhailo.pivkach@transoftgroup.com', 313137862, 'фывфывыф', '<h1>выфвфыв</h1>', 0.00, '2019-11-21 10:33:46');

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `sku` varchar(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(12,3) NOT NULL DEFAULT '0.000',
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `qty`, `description`) VALUES
(10, 't00001', 'Телефон 1', 5050.00, 7.000, 'Діагональ екрану: 5,4.'),
(11, 't00002', 'Телефон 2', 6000.00, 15.000, 'Діагональ екрану: 6.'),
(13, 't00004', 'Телефон 4', 7000.00, 10.000, 'Діагональ екрану: 7.'),
(14, 't00005', 'Телефон 5', 8000.00, 4.000, 'Діагональ екрану: 6,5.');

-- --------------------------------------------------------

--
-- Структура таблиці `sales_order`
--

CREATE TABLE `sales_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `sales_order`
--

INSERT INTO `sales_order` (`order_id`, `customer_id`, `datetime`) VALUES
(1, 1, '2019-10-24 15:29:59'),
(2, 1, '2019-10-24 15:31:17'),
(3, 1, '2019-10-24 15:44:08'),
(4, 1, '2019-10-24 15:44:10');

-- --------------------------------------------------------

--
-- Структура таблиці `sales_orderitem`
--

CREATE TABLE `sales_orderitem` (
  `orderitem_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` decimal(12,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `shopping`
--

CREATE TABLE `shopping` (
  `orderitem_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `result` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `test`
--

INSERT INTO `test` (`id`, `name`, `date`) VALUES
(1, 'test', '2019-10-22 18:44:59');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Індекси таблиці `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Індекси таблиці `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_ORDER_CUSTOMER` (`customer_id`);

--
-- Індекси таблиці `sales_orderitem`
--
ALTER TABLE `sales_orderitem`
  ADD PRIMARY KEY (`orderitem_id`),
  ADD KEY `FK_ORDERITEM_ORDER` (`order_id`),
  ADD KEY `FK_ORDERITEM_PRODUCT` (`product_id`);

--
-- Індекси таблиці `shopping`
--
ALTER TABLE `shopping`
  ADD PRIMARY KEY (`orderitem_id`),
  ADD KEY `FK_ORDERITEM_ORDER` (`customer_id`),
  ADD KEY `FK_ORDERITEM_PRODUCT` (`product_id`);

--
-- Індекси таблиці `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблиці `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `sales_orderitem`
--
ALTER TABLE `sales_orderitem`
  MODIFY `orderitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `shopping`
--
ALTER TABLE `shopping`
  MODIFY `orderitem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `sales_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `sales_orderitem`
--
ALTER TABLE `sales_orderitem`
  ADD CONSTRAINT `sales_orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `shopping`
--
ALTER TABLE `shopping`
  ADD CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
