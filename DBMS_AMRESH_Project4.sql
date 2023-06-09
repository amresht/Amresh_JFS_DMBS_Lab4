-- * @author          Amresh Tripathi 
-- * @date            25-Apr-2023
-- * @version         1.0
-- * @DESC            CREATE ALL TABLES and INSERT DATA
-- Table structure for table `category`  by Amresh
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int NOT NULL DEFAULT '0',
  `cat_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONIC'),
(5, 'CLOTHES');

-- --------------------------------------------------------

--
-- Table structure for table `customer` by Amresh
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cus_id` int NOT NULL DEFAULT '0',
  `cus_name` varchar(20) NOT NULL,
  `cus_phone` varchar(10) NOT NULL,
  `cus_city` varchar(30) NOT NULL,
  `cus_gender` char(1) DEFAULT 'M',
  PRIMARY KEY (`cus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M'),
(7, 'ROHIT', '8888111222', 'MUMBIA', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `order` by Amresh
--

CREATE TABLE IF NOT EXISTS `order` (
  `ord_id` int  NOT NULL DEFAULT '0',
  `ord_amount` int NOT NULL,
  `ord_date` date NOT NULL,
  `cus_id` int  NULL,
  `pricing_id` int  DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `cus_id` (`cus_id`),
  KEY `pricing_id` (`pricing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`  by Amresh
--

INSERT INTO `order` (`ord_id`, `ord_date`, `cus_id`, `pricing_id`, `ord_amount`) VALUES
(101, '2021-10-06', 2, 1, 1500),
(102, '2021-10-12', 3, 5, 1000),
(103, '2021-09-16', 5, 2, 30000),
(104, '2021-10-05', 1, 1, 1500),
(105, '2021-08-16', 4, 3, 3000),
(106, '2021-08-18', 1, 9, 1450),
(107, '2021-09-01', 3, 7, 789),
(108, '2021-09-07', 5, 6, 780),
(109, '2021-09-10', 5, 3, 3000),
(110, '2021-09-10', 2, 4, 2500),
(111, '2021-09-15', 4, 5, 1000),
(112, '2021-09-16', 4, 7, 789),
(113, '2021-09-16', 1, 8, 31000),
(114, '2021-09-16', 3, 5, 1000),
(115, '2021-09-16', 5, 3,3000),
(116, '2021-09-17', 2, 14,99);


-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `pro_id` int NOT NULL DEFAULT '0',
  `pro_name` varchar(20) NOT NULL DEFAULT 'Dummy',
  `pro_desc` varchar(60) DEFAULT NULL,
  `cat_id` DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product` by Amresh
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `cat_id`) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating` by amresh
--

CREATE TABLE IF NOT EXISTS `rating` (
  `rat_id` int  NOT NULL DEFAULT '0',
  `ord_id` int  NOT NULL,
  `stars` int  NOT NULL,
  PRIMARY KEY (`rat_id`),
  KEY `ord_id` (`ord_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Table structure for table `supplier` created by Amresh
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supp_id` int(11) NOT NULL DEFAULT '0',
  `supp_name` varchar(50) NOT NULL,
  `supp_city` varchar(50) NOT NULL,
  `supp_phone` varchar(50) NOT NULL,
  PRIMARY KEY (`supp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier` by Amresh

INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_pricing` by Amresh
--

CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `pricing_id` int  NOT NULL DEFAULT '0',
  `pro_id` int  DEFAULT NULL,
  `supp_id` int  DEFAULT NULL,
  `supp_price` int  DEFAULT 0,
  PRIMARY KEY (`pricing_id`),
  KEY `pro_id` (`pro_id`),
  KEY `supp_id` (`supp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_pricing` by Amresh
--

INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

-- --------------------------------------------------------

--
-- Dumping data for table `rating` by Amresh
--

INSERT INTO `rating` (`rat_id`, `ord_id`, `stars`) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);