 get-aduser -filter * -properties whencreated,msDS-UserPasswordExpiryTimeComputed,pwdLastSet  | 
 Select-Object samaccountname,whencreated,
 @{name="Expired";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}},
 @{name="PWDLastset";Expression={[datetime]::FromFileTime($_."pwdLastSet")}} | export-csv C:\Users\worawit.o\Desktop\all-Ad-user.csv
 
 #Option filter 'enabled -eq $true'
