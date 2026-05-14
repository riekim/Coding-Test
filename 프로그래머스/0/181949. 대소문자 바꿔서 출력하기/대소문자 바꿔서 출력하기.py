str = input()

result = ""

for c in str:
    if c.islower():
         result += c.upper()
    else:
        result += c.lower()
        
print(result)
    