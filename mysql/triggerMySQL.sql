/*Impide borrar en una tabla*/
create trigger evitarBorrar
before delete on pais
for each row
begin
    signal sqlstate '45000' set message_text = 'No puedes borrar en esta tabla';
end;