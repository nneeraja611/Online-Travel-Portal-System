CREATE TABLE `book` (
  `tripid` int(5) NOT NULL,
  `id_hotel` int(3) NOT NULL
) 


INSERT INTO `booking` (`tripid`, `id_hotel`) VALUES
(11233, 179),
(54712, 123),
(11233, 179),
(54236, 569),
(54712, 569);


CREATE TABLE `customer` (
  `phone_number` int(11) NOT NULL,
  `id_passport` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL
) 


INSERT INTO `customer` (`phone_number`, `id_passport`, `name`, `age`) VALUES
(2125987413, 12356, 'Noah', 35),
(2135457412, 56987, 'James', 12),
(2125698745, 58419, 'Joseph', 25),
(1123657845, 65478, 'Benjamin', 36),
(1256897423, 89654, 'Alexander', 20);


CREATE TABLE `employee` (
  `emp_id` int(8) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `travel_id` int(5) NOT NULL
) 


INSERT INTO `employee` (`emp_id`, `fname`, `lname`, `travel_id`) VALUES
(45698736, 'Elizabeth', 'A', 11232),
(56321789, 'George', 'C', 34762),
(58741236, 'Micheal', 'B', 12346),
(65874139, 'Anna', 'M', 59874),
(65897412, 'Grace', 'A', 68714);


CREATE TABLE `hotel` (
  `room_type` char(1) NOT NULL,
  `hotel_id` int(3) NOT NULL,
  `hotel_name` varchar(20) NOT NULL,
  `hotel_cost` decimal(10,0) NOT NULL,
  `number_of_days` int(11) NOT NULL
) 


INSERT INTO `hotel` (`room_type`, `hotel_id`, `hotel_name`, `hotel_cost`, `number_of_days`) VALUES
('A', 123, 'Holiday Inn', '5500', 2),
('B', 179, 'Grand hotel', '14000', 4),
('A', 235, 'Crown Plaza', '15000', 6),
('B', 569, 'Hotel Indigo', '7526', 5),
('C', 784, 'Four seasons', '10000', 5);


CREATE TABLE `reservation` (
  `passport_id` int(5) NOT NULL,
  `travel_id` int(5) NOT NULL,
  `tripid` int(5) NOT NULL
) 


INSERT INTO `reservation` (`passport_id`, `travel_id`, `tripid`) VALUES
(65478, 12346, 54712),
(89654, 11232, 11233),
(56987, 34762, 45789),
(58419, 59874, 12121),
(12356, 68714, 45789);


CREATE TABLE `service` (
  `pass_id` int(5) NOT NULL,
  `employee_id` int(8) NOT NULL
) 


INSERT INTO `service` (`pass_id`, `employee_id`) VALUES
(12356, 45698736),
(56987, 56321789),
(58419, 58741236),
(65478, 65874139),
(89654, 65897412);


CREATE TABLE `tickets` (
  `ticket_id` int(5) NOT NULL,
  `seat_type` char(1) NOT NULL,
  `ticket_cost` decimal(10,0) NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_time` time NOT NULL,
  `tr_id` int(5) NOT NULL
) 


INSERT INTO `tickets` (`ticket_id`, `seat_type`, `ticket_cost`, `arrival_time`, `departure_time`, `tr_id`) VALUES
(12345, 'B', '5000', '09:00:00', '09:20:00', 11233),
(45781, 'A', '25600', '10:30:00', '10:45:00', 12121),
(58471, 'A', '2500', '08:00:00', '08:10:00', 45789),
(58743, 'A', '1500', '11:00:00', '11:30:00', 54236),
(63547, 'B', '4500', '11:15:00', '11:20:00', 54712);


CREATE TABLE `travel_agency` (
  `address` text NOT NULL,
  `ph_number` int(11) NOT NULL,
  `T_name` varchar(15) NOT NULL,
  `T_id` int(5) NOT NULL
) 


INSERT INTO `travel_agency` (`address`, `ph_number`, `T_name`, `T_id`) VALUES
('No:12,BTM layout,Bangalore', 2136589467, 'Oasis Travel', 11232),
('No:16,Shree layout,Kerala', 1269874563, 'Paradise travel', 12346),
('No:21,Chandra layout,Mangalore', 2137634112, 'Sunset vacation', 34762),
('No:56,Vikas layout,Delhi', 2119874365, 'Vacation connec', 59874),
('No:24,Reddy layout,Bangalore', 1987456379, 'Tropical travel', 68714);


CREATE TABLE `trip` (
  `trip_id` int(5) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(20) NOT NULL
) 


INSERT INTO `trip` (`trip_id`, `date`, `type`) VALUES
(11233, '2022-12-15', 'Beach'),
(12121, '2023-02-08', 'Eco tour'),
(45789, '2023-01-10', 'Adventure'),
(54236, '2022-11-03', 'Medical'),
(54712, '2022-12-30', 'Adventure');


ALTER TABLE `booking`
  ADD KEY `fk_book_trip` (`tripid`),
  ADD KEY `fk_book_hotel` (`id_hotel`);


ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_passport`);


ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_emp_travel` (`travel_id`);


ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`);


ALTER TABLE `reservation`
  ADD KEY `fk_cust_reserve` (`passport_id`),
  ADD KEY `fk_travel_reserve` (`travel_id`),
  ADD KEY `fk_trip_reserve` (`tripid`);


ALTER TABLE `service`
  ADD KEY `fk_cust_service` (`pass_id`),
  ADD KEY `fk_employee_service` (`employee_id`);


ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `fk_trip_tickets` (`tr_id`);


ALTER TABLE `travel_agency`
  ADD PRIMARY KEY (`T_id`);


ALTER TABLE `trip`
  ADD PRIMARY KEY (`trip_id`);


ALTER TABLE `booking`
  ADD CONSTRAINT `fk_book_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `fk_book_trip` FOREIGN KEY (`tripid`) REFERENCES `trip` (`trip_id`);


ALTER TABLE `employee`
  ADD CONSTRAINT `fk_emp_travel` FOREIGN KEY (`travel_id`) REFERENCES `travel_agency` (`T_id`);


ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_cust_reserve` FOREIGN KEY (`passport_id`) REFERENCES `customer` (`id_passport`),
  ADD CONSTRAINT `fk_travel_reserve` FOREIGN KEY (`travel_id`) REFERENCES `travel_agency` (`T_id`),
  ADD CONSTRAINT `fk_trip_reserve` FOREIGN KEY (`tripid`) REFERENCES `trip` (`trip_id`);


ALTER TABLE `service`
  ADD CONSTRAINT `fk_cust_service` FOREIGN KEY (`pass_id`) REFERENCES `customer` (`id_passport`),
  ADD CONSTRAINT `fk_employee_service` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`emp_id`);


ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_trip_tickets` FOREIGN KEY (`tr_id`) REFERENCES `trip` (`trip_id`);
COMMIT;

