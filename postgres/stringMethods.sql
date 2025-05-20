POSTGRES STRING METHODS

+------------------------------+-----------------------------------------------+------------------------------+
| Function / Operator         | Description                                   | Example                      |
+------------------------------+-----------------------------------------------+------------------------------+
| length(string)              | Returns number of characters                  | length('Hello') → 5         |
| lower(string)               | Converts to lowercase                         | lower('Hello') → 'hello'    |
| upper(string)               | Converts to uppercase                         | upper('Hello') → 'HELLO'    |
| initcap(string)            | Capitalizes first letter of each word         | initcap('hello world') → 'Hello World' |
| reverse(string)             | Reverses the string                           | reverse('abc') → 'cba'      |
+------------------------------+-----------------------------------------------+------------------------------+
| string1 || string2          | Concatenates two strings                      | 'Post' || 'greSQL' → 'PostgreSQL' |
| concat(a, b, c...)          | Concatenates multiple values                  | concat('a','-','b') → 'a-b' |
| concat_ws(sep, a, b...)     | Concatenates with separator                   | concat_ws('-', '2025', '05', '20') → '2025-05-20' |
+------------------------------+-----------------------------------------------+------------------------------+
| trim([LEADING|TRAILING|BOTH]| Removes characters from string                | trim(' x ') → 'x'           |
| ltrim(string, chars)        | Trims characters from the start               | ltrim('123abc','123') → 'abc'|
| rtrim(string, chars)        | Trims characters from the end                 | rtrim('abc123','123') → 'abc'|
| lpad(string, length, fill)  | Pads from left                                | lpad('abc', 5, '0') → '00abc'|
| rpad(string, length, fill)  | Pads from right                               | rpad('abc', 5, '-') → 'abc--'|
+------------------------------+-----------------------------------------------+------------------------------+
| substring(str FROM x FOR y) | Extracts substring                            | substring('abcdef' FROM 2 FOR 3) → 'bcd' |
| left(string, n)             | First n characters                            | left('abcdef', 3) → 'abc'   |
| right(string, n)            | Last n characters                             | right('abcdef', 2) → 'ef'   |
| replace(str, from, to)      | Replaces substring                            | replace('abcabc', 'a', 'x') → 'xbcxbc' |
+------------------------------+-----------------------------------------------+------------------------------+
| position(substring IN str)  | Finds position of substring                   | position('e' IN 'hello') → 2|
| strpos(str, substr)         | Finds position of substring                   | strpos('abcdef', 'cd') → 3  |
+------------------------------+-----------------------------------------------+------------------------------+
| LIKE / ILIKE                | Pattern matching (case sensitive / insensitive)| 'abc' LIKE 'a%' → true      |
| ~ / ~*                      | Regex match (case-sensitive / insensitive)    | 'ABC' ~* '^[a-z]+$' → true  |
| !~ / !~*                    | Regex not match                               | '123' !~ '[a-z]' → true     |
+------------------------------+-----------------------------------------------+------------------------------+
| split_part(str, delim, n)   | Splits and returns the nth part               | split_part('a,b,c', ',', 2) → 'b' |
| regexp_replace(str, pat, r) | Regex replacement                             | regexp_replace('abc123','[0-9]+','') → 'abc' |
| regexp_matches(str, pat)    | Returns array of regex matches                | regexp_matches('abc123','[a-z]+') → {'abc'} |
+------------------------------+-----------------------------------------------+------------------------------+


HOW TO FIND LENGTH OF A CHARACTER IN A STRING: 
    LENGTH(column) - LENGTH(REPLACE(column, 'a', ''))
    IT IS LIKE REMOVING ALL THE CHARACTER FORM A STRING AND THEN COMPARING THE REDUCED LENGTH WITH THE PREVIOUS FULL LENGTH STRING


CONVERT A STRING TO AN ARRAY SELECT unnest(string_to_array('a,b,c,d,e', ',')) AS value;



FINDING INVALID IP

WITH ip_agg AS (
    SELECT ip, COUNT(*) AS invalid_count FROM logs GROUP BY ip
), unnested AS (
    SELECT ip, invalid_count, UNNEST(STRING_TO_ARRAY(ip, '.')) AS unnest FROM ip_agg
) SELECT ip, invalid_count FROM  unnested
    WHERE unnest LIKE '0%' 
        OR CAST(unnest AS numeric) > 255 
        OR ip IN (SELECT ip AS invalid_count FROM unnested GROUP BY ip HAVING COUNT(*) != 4)
    GROUP BY ip, invalid_count
    ORDER BY invalid_count DESC, ip DESC 
