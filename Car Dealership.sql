create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(50)
);

create table car(
	car_id SERIAL primary key,
	make VARCHAR(30),
	model VARCHAR(30),
	make_year NUMERIC(4)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	email VARCHAR(50),
	billing_info VARCHAR(100),
	car_id INTEGER,
	foreign key(car_id) references car(car_id)
);

create table invoice(
	invoice_number SERIAL primary key,
	amount NUMERIC(10,2),
	order_date DATE,
	salesperson_id INTEGER,
	customer_id INTEGER,
	car_id INTEGER,
	foreign key(salesperson_id) references salesperson(salesperson_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(car_id) references car(car_id)
);

create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(30),
	last_name VARCHAR(30)
);

create table parts(
	part_id SERIAL primary key,
	part_description VARCHAR(100),
	purchase_price NUMERIC(6),
	retail_price NUMERIC(6)
);

create table service_ticket(
	service_ticket_number SERIAL primary key,
	service_date DATE,
	amount NUMERIC(6,2),
	customer_id INTEGER,
	mechanic_id INTEGER,
	part_id INTEGER,
	foreign key (customer_id) references customer(customer_id),
	foreign key (mechanic_id) references mechanic(mechanic_id),
	foreign key (part_id) references parts(part_id)
);

create or replace function add_salesperson(_salesperson_id INTEGER,_first_name VARCHAR(100),_last_name VARCHAR(100),_email VARCHAR(50))
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id,first_name,last_name,email)
	values(_salesperson_id,_first_name,_last_name,_email);
end;
$MAIN$
language plpgsql;

select add_salesperson(1,'Liza','Jane','lizajane@wesellcars.com');

select add_salesperson(2,'Lebron','James','lebronjames@wesellcars.com')

drop function add_salesperson;

create or replace function add_car(_car_id INTEGER,_make VARCHAR(30),_model VARCHAR(30),_make_year NUMERIC(4))
returns void
as $MAIN$
begin 
	insert into car(car_id,make,model,make_year)
	values(_car_id,_make,_model,_make_year);
end;
$MAIN$
language plpgsql;

select add_car(100,'Honda','Civic',1988);

select add_car(101,'Honda','Pilot',2007);

select * from car

drop function add_car;


create or replace function add_customer(_customer_id INTEGER,_first_name VARCHAR(30),_last_name VARCHAR(30),_email VARCHAR(50),_billing_info VARCHAR(100))
returns void
as $MAIN$
begin 
	insert into customer(customer_id,first_name,last_name,email,billing_info)
	values(_customer_id,_first_name,_last_name,_email,_billing_info);
end;
$MAIN$
language plpgsql;

select add_customer(1,'Rick','Dozier','rickyd@gmail.com','145 W 10th St, Columbus, OH 39450');

select add_customer(2,'Meg','Cranston','maggiec@yahoo.com','3209 North St, Orlando, FL 43059');

drop function add_customer;

insert into invoice(invoice_number,amount,order_date,salesperson_id,customer_id,car_id)
VALUES(1001,6000.00,'2022-02-01',1,1,100);

select * from invoice

insert into invoice(invoice_number,amount,order_date,salesperson_id,customer_id,car_id)
VALUES(1002,10000.00,'2023-01-01',2,2,101);

insert into mechanic(mechanic_id,first_name,last_name)
VALUES(10,'Billy','Toolbox')

insert into mechanic(mechanic_id,first_name,last_name)
VALUES(11,'Uncle','Hammer')

select * from mechanic

insert into parts(part_id,part_description,purchase_price,retail_price)
VALUES(100,'brake pads',100,20)

insert into parts(part_id,part_description,purchase_price,retail_price)
VALUES(101,'tires',500,200)

insert into service_ticket(service_ticket_number,service_date,amount,customer_id,mechanic_id,part_id)
VALUES(2000,'2022-05-21',500.00,2,11,100)

insert into service_ticket(service_ticket_number,service_date,amount,customer_id,mechanic_id,part_id)
VALUES(2001,'2022-06-21',700.00,2,10,101)

select * from service_ticket
























