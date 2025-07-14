create table Bank_Accounts
(
account_id number(20) Primary key,
bank_acc_no Varchar2(30) unique,
recon_type varchar2(30),
cat_code varchar2(20),
sub_acc_no varchar2(30),
status varchar2(10) default 'ACTIVE'
);

INSERT INTO Bank_Accounts (account_id,bank_acc_no,recon_type) VALUES (1,'ACC_001', 'cash');

INSERT INTO Bank_Accounts (account_id,bank_acc_no,recon_type) VALUES (2,'ACC_002', 'stock');

INSERT INTO Bank_Accounts (account_id,bank_acc_no,recon_type) VALUES (3,'ACC_003', 'Trade');


select * from bank_Accounts;


create table Item (
item_id Number(10) Primary key,
bank_acc_no varchar2(30) references Bank_Accounts(bank_acc_no),
txn_reference varchar2(50),
txn_amount number(12,4),
drocr varchar2(1),
txn_ccy varchar2(3),
stmt_date Date,
system_entry_date Timestamp,
valuedate Date,
item_type varchar2(20),
txn_stock_type varchar2(12),
stock_id number,
quantity number(12,4),
price number(12,4)
);


create table Asset_Register (
stock_id Number Primary key,
stock_code varchar2(12) unique,
description varchar2(100),
asset_type varchar2(20));

INSERT INTO Asset_Register (stock_id, stock_code, asset_type)
VALUES (1, 'GOOG987654', 'ISIN');

INSERT INTO Asset_Register (stock_id, stock_code, asset_type)
VALUES (2, 'MSFT112233', 'CUSIP');

INSERT INTO Asset_Register (stock_id, stock_code, asset_type)
VALUES (3, 'TSLA998877', 'SEDOL');


create table Closing_Balances (
cb_id Number Primary key,
bank_acc_no varchar2(30) references Bank_Accounts(bank_acc_no),
cbal_date Date,
cbal_Amount Number(12,4),
currency_code varchar2(3));

