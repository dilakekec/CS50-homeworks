-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT * FROM crime_scene_reports
WHERE street = "Humphrey Street";
SELECT * FROM interviews
WHERE transcript LIKE "%bakery%";
SELECT * FROM bakery_sequrity_logs WHERE year = 2024 AND month = 7 AND day = 28 AND hour = 10 AND minute BETWEEN 15 AND 25;
SELECT p.name, bsl.activity, bsl.license_plate, bsl.year, bsl.month, bsl.day, bsl.hour, bsl.minute
FROM bakery_security_logs bsl
JOIN people p ON p.license_plate = bsl.license_plate
WHERE bsl.year = 2024 AND bsl.month = 7 AND bsl.day = 28 AND bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 25;
SELECT * FROM atm_transactions
WHERE atm_location = "Leggett Street"
AND year = 2024 AND month = 7 AND day = 28;
SELECT a.*, p.name
FROM atm_transactions a
JOIN bank_accounts b ON a.account_number = b.account_number
JOIN people p ON b.person_id = p.id
WHERE a.atm_location = "Leggett Street" AND a.year = 2024 AND a.month = 7 AND a.day = 28 AND a.transaction_type = "withdraw";
SELECT *
FROM phone_calls
WHERE year = 2024 AND month = 7 AND day = 28 AND duration < 60;
SELECT p.name, pc.caller, pc.receiver, pc.year, pc.month, pc.day, pc.duration
FROM phone_calls pc
JOIN people p ON pc.caller = p.phone_number
WHERE pc.year = 2024 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;
SELECT * FROM airports;
SELECT f.*, origin.full_name AS origin_airport, destination.full_name AS destination_airport
FROM flights f
JOIN airports origin ON f.origin_airport_id = origin.id
JOIN airports destination ON f.destination_airport_id = destination.id
WHERE origin.id = 8 AND f.year = 2024 AND f.month = 7 AND f.day = 29
ORDER BY f.hour, f.minute;
SELECT p.name
FROM bakery_security_logs bsl
JOIN people p ON p.license_plate = bsl.license_plate
JOIN bank_accounts ba ON ba.person_id = p.id
JOIN atm_transactions at ON at.account_number = ba.account_number
JOIN phone_calls pc ON pc.caller = p.phone_number
WHERE bsl.year = 2024 AND bsl.month = 7 AND bsl.day = 28 AND bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 25
AND at.atm_location = "Leggett Street" AND at.year = 2024  AND at.month = 7 AND at.day = 28 AND at.transaction_type = "withdraw"
AND pc.year = 2024 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;
SELECT p.name
FROM people p
JOIN passengers ps ON p.passport_number = ps.passport_number
WHERE ps.flight_id = 36
AND p.name IN ('Bruce', 'Diana');
SELECT p2.name AS receiver
FROM phone_calls pc
JOIN people p1 ON pc.caller = p1.phone_number
JOIN people p2 ON pc.receiver = p2.phone_number
WHERE p1.name = 'Bruce' AND pc.year = 2024 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;


+-----+------+-------+-----+-----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id  | year | month | day |     street      |                                                                                                       description                                                                                                        |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 80  | 2024 | 2     | 26  | Humphrey Street | Theft took place at 03:11. Two people witnessed the event.                                                                                                                                                               |
| 113 | 2024 | 3     | 20  | Humphrey Street | Credit card fraud took place at 08:41. One person witnessed the incident.                                                                                                                                                |
| 128 | 2024 | 4     | 4   | Humphrey Street | Expired parking meter took place at 03:17. Two people witnessed the event.                                                                                                                                               |
| 254 | 2024 | 7     | 6   | Humphrey Street | Shoplifting took place at 04:45. Two people witnessed the event.                                                                                                                                                         |
| 295 | 2024 | 7     | 28  | Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |
| 297 | 2024 | 7     | 28  | Humphrey Street | Littering took place at 16:36. No known witnesses.                                                                                                                                                                       |
| 299 | 2024 | 7     | 30  | Humphrey Street | Littering took place at 17:49. Two people witnessed the event.                                                                                                                                                           |
+-----+------+-------+-----+-----------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+yok


+-----+---------+------+-------+-----+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id  |  name   | year | month | day |                                                                                                                                                     transcript                                                                                                                                                      |
+-----+---------+------+-------+-----+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 161 | Ruth    | 2024 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
| 162 | Eugene  | 2024 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
| 163 | Raymond | 2024 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
| 192 | Kiana   | 2024 | 5     | 17  | I saw Richard take a bite out of his pastry at the bakery before his pastry was stolen from him.                                                                                                                                                                                                                    |
+-----+---------+------+-------+-----+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


+-----+------+-------+-----+------+--------+----------+---------------+
| id  | year | month | day | hour | minute | activity | license_plate |
+-----+------+-------+-----+------+--------+----------+---------------+
| 260 | 2024 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
| 261 | 2024 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 262 | 2024 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
| 263 | 2024 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 264 | 2024 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| 265 | 2024 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 266 | 2024 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 267 | 2024 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
+-----+------+-------+-----+------+--------+----------+---------------+


+---------+----------+---------------+------+-------+-----+------+--------+
|  name   | activity | license_plate | year | month | day | hour | minute |
+---------+----------+---------------+------+-------+-----+------+--------+
| Vanessa | exit     | 5P2BI95       | 2024 | 7     | 28  | 10   | 16     |
| Bruce   | exit     | 94KL13X       | 2024 | 7     | 28  | 10   | 18     |
| Barry   | exit     | 6P58WS2       | 2024 | 7     | 28  | 10   | 18     |
| Luca    | exit     | 4328GD8       | 2024 | 7     | 28  | 10   | 19     |
| Sofia   | exit     | G412CB7       | 2024 | 7     | 28  | 10   | 20     |
| Iman    | exit     | L93JTIZ       | 2024 | 7     | 28  | 10   | 21     |
| Diana   | exit     | 322W7JE       | 2024 | 7     | 28  | 10   | 23     |
| Kelsey  | exit     | 0NTHK55       | 2024 | 7     | 28  | 10   | 23     |
+---------+----------+---------------+------+-------+-----+------+--------+


+-----+----------------+------+-------+-----+----------------+------------------+--------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 246 | 28500762       | 2024 | 7     | 28  | Leggett Street | withdraw         | 48     |
| 264 | 28296815       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 266 | 76054385       | 2024 | 7     | 28  | Leggett Street | withdraw         | 60     |
| 267 | 49610011       | 2024 | 7     | 28  | Leggett Street | withdraw         | 50     |
| 269 | 16153065       | 2024 | 7     | 28  | Leggett Street | withdraw         | 80     |
| 275 | 86363979       | 2024 | 7     | 28  | Leggett Street | deposit          | 10     |
| 288 | 25506511       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 313 | 81061156       | 2024 | 7     | 28  | Leggett Street | withdraw         | 30     |
| 336 | 26013199       | 2024 | 7     | 28  | Leggett Street | withdraw         | 35     |
+-----+----------------+------+-------+-----+----------------+------------------+--------+



+-----+----------------+------+-------+-----+----------------+------------------+--------+---------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |  name   |
+-----+----------------+------+-------+-----+----------------+------------------+--------+---------+
| 267 | 49610011       | 2024 | 7     | 28  | Leggett Street | withdraw         | 50     | Bruce   |
| 336 | 26013199       | 2024 | 7     | 28  | Leggett Street | withdraw         | 35     | Diana   |
| 269 | 16153065       | 2024 | 7     | 28  | Leggett Street | withdraw         | 80     | Brooke  |
| 264 | 28296815       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     | Kenny   |
| 288 | 25506511       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     | Iman    |
| 246 | 28500762       | 2024 | 7     | 28  | Leggett Street | withdraw         | 48     | Luca    |
| 266 | 76054385       | 2024 | 7     | 28  | Leggett Street | withdraw         | 60     | Taylor  |
| 313 | 81061156       | 2024 | 7     | 28  | Leggett Street | withdraw         | 30     | Benista |
+-----+----------------+------+-------+-----+----------------+------------------+--------+---------+


+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2024 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2024 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2024 | 7     | 28  | 50       |
| 254 | (286) 555-6063 | (676) 555-6554 | 2024 | 7     | 28  | 43       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2024 | 7     | 28  | 49       |
| 261 | (031) 555-6622 | (910) 555-3251 | 2024 | 7     | 28  | 38       |
| 279 | (826) 555-1652 | (066) 555-9701 | 2024 | 7     | 28  | 55       |
| 281 | (338) 555-6650 | (704) 555-2131 | 2024 | 7     | 28  | 54       |
+-----+----------------+----------------+------+-------+-----+----------+


+---------+----------------+----------------+------+-------+-----+----------+
|  name   |     caller     |    receiver    | year | month | day | duration |
+---------+----------------+----------------+------+-------+-----+----------+
| Sofia   | (130) 555-0289 | (996) 555-8899 | 2024 | 7     | 28  | 51       |
| Kelsey  | (499) 555-9472 | (892) 555-8872 | 2024 | 7     | 28  | 36       |
| Bruce   | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
| Kelsey  | (499) 555-9472 | (717) 555-1342 | 2024 | 7     | 28  | 50       |
| Taylor  | (286) 555-6063 | (676) 555-6554 | 2024 | 7     | 28  | 43       |
| Diana   | (770) 555-1861 | (725) 555-3243 | 2024 | 7     | 28  | 49       |
| Carina  | (031) 555-6622 | (910) 555-3251 | 2024 | 7     | 28  | 38       |
| Kenny   | (826) 555-1652 | (066) 555-9701 | 2024 | 7     | 28  | 55       |
| Benista | (338) 555-6650 | (704) 555-2131 | 2024 | 7     | 28  | 54       |
+---------+----------------+----------------+------+-------+-----+----------+

SELECT * FROM airports;
+----+--------------+-----------------------------------------+---------------+
| id | abbreviation |                full_name                |     city      |
+----+--------------+-----------------------------------------+---------------+
| 1  | ORD          | O'Hare International Airport            | Chicago       |
| 2  | PEK          | Beijing Capital International Airport   | Beijing       |
| 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
| 4  | LGA          | LaGuardia Airport                       | New York City |
| 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
| 6  | BOS          | Logan International Airport             | Boston        |
| 7  | DXB          | Dubai International Airport             | Dubai         |
| 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
| 9  | HND          | Tokyo International Airport             | Tokyo         |
| 10 | CDG          | Charles de Gaulle Airport               | Paris         |
| 11 | SFO          | San Francisco International Airport     | San Francisco |
| 12 | DEL          | Indira Gandhi International Airport     | Delhi         |
+----+--------------+-----------------------------------------+---------------+


+----+-------------------+------------------------+------+-------+-----+------+--------+-----------------------------+-------------------------------------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |       origin_airport        |         destination_airport         |
+----+-------------------+------------------------+------+-------+-----+------+--------+-----------------------------+-------------------------------------+
| 36 | 8                 | 4                      | 2024 | 7     | 29  | 8    | 20     | Fiftyville Regional Airport | LaGuardia Airport                   |
| 43 | 8                 | 1                      | 2024 | 7     | 29  | 9    | 30     | Fiftyville Regional Airport | O'Hare International Airport        |
| 23 | 8                 | 11                     | 2024 | 7     | 29  | 12   | 15     | Fiftyville Regional Airport | San Francisco International Airport |
| 53 | 8                 | 9                      | 2024 | 7     | 29  | 15   | 20     | Fiftyville Regional Airport | Tokyo International Airport         |
| 18 | 8                 | 6                      | 2024 | 7     | 29  | 16   | 0      | Fiftyville Regional Airport | Logan International Airport         |
+----+-------------------+------------------------+------+-------+-----+------+--------+-----------------------------+-------------------------------------+

+-------+
| name  |
+-------+
| Bruce |
| Diana |
+-------+

+-------+
| name  |
+-------+
| Bruce |
+-------+

+----------+
| receiver |
+----------+
| Robin    |
+----------+
