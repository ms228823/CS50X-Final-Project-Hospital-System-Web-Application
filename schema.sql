-- users (employees) table
CREATE TABLE users (id INTEGER PRIMARY KEY ,
                    first_name TEXT NOT NULL,
                    middle_name TEXT,
                    last_name TEXT NOT NULL,
                    username TEXT NOT NULL,
                    hash TEXT NOT NULL,
                    role TEXT NOT NULL, --"Admin","Reception Manager","Receptionist","Reporter"
                    status TEXT NULL-- "Working","Fired","Retired","Moved","Promoted","Demoted","Transferred"
                    );
-- rooms table
CREATE TABLE rooms (id INTEGER PRIMARY KEY ,
                    room_number INTEGER NOT NULL,
                    status TEXT NOT NULL,-- "open","reserved"
                    price NUMERIC NOT NULL);
-- action report table
CREATE TABLE action_report (id INTEGER PRIMARY KEY ,
                            action TEXT NOT NULL,
                            user_id INTEGER  NOT NULL,
                            number_of_reservations INTEGER,
                            Actions_notes_of_employee TEXT,
                            FOREIGN KEY (user_id) REFERENCES users(id) );
-- patient table
CREATE TABLE patient (id INTEGER PRIMARY KEY,
                        first_name TEXT NOT NULL,
                        middle_name TEXT,
                        last_name TEXT NOT NULL,
                        birth_date DATE NOT NULL,
                        age INTEGER,
                        gender TEXT NOT NULL,
                        Email varchar(255),
                        phone1 VARCHAR(15) NOT NULL,
                        phone2 VARCHAR(15),
                        emergency_contact_name TEXT NOT NULL,
                        emergency_contact_relation TEXT NOT NULL,
                        emergency_contact_phone VARCHAR(15) NOT NULL,
                        emergency_contact_address TEXT,
                        registration_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        Patient_reservation_status TEXT NOT NULL, -- "wait for a room" , "checked in"
                        user_id INTEGER NOT NULL,                        
                        FOREIGN KEY (user_id) REFERENCES users(id));
-- reservations table
CREATE TABLE reservations (id INTEGER PRIMARY KEY ,
                            roomid INTEGER NOT NULL,
                            patient_id INTEGER NOT NULL,
                            user_id INTEGER NOT NULL,
                            price NUMERIC,
                            checkin DATE NOT NULL,
                            checkout DATE NOT NULL,
                            days INTEGER,
                            exit_date DATE,
                            reservation_status TEXT NOT NULL,-- "Done" , "checked out", "hold"
                            payment TEXT NOT NULL,-- "Cash" , "Visa, Mastercard"
                            registration_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (user_id) REFERENCES users(id),
                            FOREIGN KEY (patient_id) REFERENCES patient(id),
                            FOREIGN KEY (roomid) REFERENCES rooms(id));


-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",1,0,"none");
-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",2,0,"none");
-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",3,0,"none");
-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",4,0,"none");
-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",5,0,"none");
-- INSERT INTO action_report(action ,user_id, number_of_reservations, Actions_notes_of_employee) VALUES ("none",6,0,"none");

-- INSERT INTO rooms(room_number,status,price) VALUES (101,"open",1000);
-- INSERT INTO rooms(room_number,status,price) VALUES (102,"open",1500);
-- INSERT INTO rooms(room_number,status,price) VALUES (103,"open",2000);
-- INSERT INTO rooms(room_number,status,price) VALUES (104,"open",2500);
-- INSERT INTO rooms(room_number,status,price) VALUES (201,"open",3000);
-- INSERT INTO rooms(room_number,status,price) VALUES (202,"open",3500);
-- INSERT INTO rooms(room_number,status,price) VALUES (203,"open",4000);
-- INSERT INTO rooms(room_number,status,price) VALUES (204,"open",4500);
-- INSERT INTO rooms(room_number,status,price) VALUES (301,"open",5000);
-- INSERT INTO rooms(room_number,status,price) VALUES (302,"open",5500);

-- SELECT users.first_name,users.middle_name,users.last_name,users.role,action_report.action ,action_report.user_id, action_report.number_of_reservations, action_report.Actions_notes_of_employee FROM action_report JOIN users ON users.id = action_report.user_id ;

SELECT * FROM reservations;
SELECT * FROM patient;
SELECT * FROM action_report;
SELECT * FROM rooms;
SELECT * FROM users;


-- INSERT INTO reservations(roomid, user_id, price, checkin, checkout, days, reservation_status, payment) VALUES (1,1,2000,12-09-2023,13-09-2023,2,"Done","Cash");
-- UPDATE rooms SET status = "open" WHERE id = 1;
-- UPDATE rooms SET status = "open" WHERE id = 2;

-- SELECT id FROM users WHERE first_name = "Charlotte" AND last_name = "Brown" AND username = "cb234" AND role = "Receptionist" AND status = "Working";