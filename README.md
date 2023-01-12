# TopEats
Create the following app call TopEats. We want to try to compete with UberEats :smile:
In your application you should have:

### Users table.
Users can be of two types: customer or courier  
Has a full name  
Has a Phone number  
Has an email  
Has many orders  
Has one address (let's keep it simple)  
Has many vehicles (only if it's a courier )  
### Address table
Has many users  
Has the address field  
### Vehicles table
Has one user (has to be courier)  
Has a vehicle type. Can only be: car, bicycle, motorcycle  
### Orders table.
The order table should reference twice to the user table :warning:  One for customer and another for courier  
Has a status. Can only be: pending, accepted, preparing, delivered  
Has a total price (needs to be a decimal number)  
Has many menu items  
### Menu items table
Has a name  
Has many orders  
