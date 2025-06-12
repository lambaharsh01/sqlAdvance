'(^| )SN[0-9]{4}-[0-9]{4}($| )'
1. (^| ) : the substring should be the start of the string or should have a white space 'SN---' OR '--- SN---'
2. SN : should be as is
3. [0-9]{4} : 4 characters following SN should be on of (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
4. - : after the 4 digits there should be a "-"
5. [0-9]{4} : again after "-" there should be 4 digits
6. ($| ) : the substring should end with a white space or be the end of the string '---1234 ' OR '---1234' 



'^[A-Za-z0-9_]*@[A-Za-z]*\.com$'
1. ^[A-Za-z0-9]* : the start of the string can have N number of characters(*) characters could be uppoer and lower case alphabets and numbers ranging from 0-9 i.e 'Harsh123'
2. @[A-Za-z]* : the characters should be followed by an @ and after @ there could be N number of characters but this time only upper and lowercase alphabets
3. \.com$ : after the characters the string should be followed by a .com and then end after that

+-----------------------------------------------------------------------------------------------+
| The part \.com is matching the literal string .com, and here's why the backslash (\) is needed|
>> . (dot) in regex means “any character” (like a, 1, @, etc.).                                 |
>> \.com tells regex: "Match a literal . (dot character), followed by the letters com."         |
+-----------------------------------------------------------------------------------------------+



'^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$'
1. ^[A-Za-z] : first letter of the string should be an upper or lower case alphabet
2. [A-Za-z0-9._-]* : the following characters can be alphanumeric characters with ('.', '_', '-') being the exceptional special characters, and the length of this can be N
3. @leetcode\.com$ : the string should end with @leetcode\.com$