DATA TYPES HAS TO BE MORE EXPLICITLY DEFINED IN POSTGRES SQL AS IT FOLLOWS MORE STRICTER SQL COMPLIANCE THAN MySQL

EXPLICIT TYPE CONVERSIONS 

SHORTHAND 
    SELECT '123'::int;
    Only works in PostgreSQL (non-standard SQL).


ANSI SQL standard
    SELECT CAST('123' AS int);
    portable across databases (e.g., SQL Server, MySQL, etc.).
    Slightly more verbose.
    Recommended if you want cross-database compatibility.


Numeric Types
    smallint - 2-byte integer
    integer / int - 4-byte integer
    bigint - 8-byte integer
    decimal(p,s) / numeric - Exact precision
    real - 4-byte float
    double precision - 8-byte float
    serial, bigserial - Auto-incrementing ints

Character Types
    char(n) - Fixed-length string
    varchar(n) - Variable-length string
    text - Unlimited-length string

Boolean
    boolean - TRUE/FALSE

Date/Time
    date - Calendar date
    time [tz] - Time of day (optionally with time zone)
    timestamp [tz] - Date + time (optionally with time zone)
    interval - Span of time (e.g., 2 days)

UUID & Binary
    uuid - Universally unique identifier
    bytea - Binary data

JSON Types
    json - Text-based JSON
    jsonb - Binary-encoded JSON

