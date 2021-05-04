create function registroUpdatePais() returns trigger 
as
$$
begin

    insert into datostrigger values('update', current_user, current_time, new.id_pais);

return new;
end
$$
language plpgsql;

create function registroEliminarPais() returns trigger 
as
$$
begin

    insert into datostrigger values('delete', current_user, current_time, old.id_pais);

return new;
end
$$
language plpgsql;


create trigger updatePais before update on pais
for each row 
execute procedure registroUpdatePais();

create trigger deletePais before delete on pais
for each row 
execute procedure registroeliminarPais();