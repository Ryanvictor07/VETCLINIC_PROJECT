CREATE VIEW ClientsPetsView 
AS
SELECT 
       c.first_name + ' ' + c.last_name AS client_name,
       c.phone_number,
       p.name AS pet_name, p.species, p.breed, p.sex
FROM Clients c JOIN Pets p 
ON c.client_id = p.client_id

GO

