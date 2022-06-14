# DBFair
Progetto di Basi di Dati - Anno Scolastico  2021/2022

IMPORT:
server>data import>import from self-contained file>start import
refresha
TADAA!!

EXPORT:
C:\xampp\mysql\bin\mysqldump --host=localhost --port=3306 --default-character-set=utf8 --user=root --protocol=tcp --skip-triggers "fairdb" > DBFair.sql

Controllare che nel file siano presenti all'inizio:

CREATE DATABASE fairdb;
USE fairdb;
