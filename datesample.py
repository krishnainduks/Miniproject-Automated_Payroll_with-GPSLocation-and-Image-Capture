from datetime import datetime as dt
  
# Getting current date and time
now = dt.now()
  
# Example 1
s = now.strftime("%m-%Y")
print('\nExample 1:', s)