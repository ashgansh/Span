# In Case
## You want to try using triggers to handle asset expiry date
### Trigger function to calculate date

```
create or replace function my_function()
returns trigger as
$BODY$
begin
  update assets set updated_at = ( (NEW.lifespan || 'hours')::interval + new.inserted_at) where id=NEW.id;
  return null;
end;
$BODY$ LANGUAGE plpgsql;

 ```

### Creation of the trigger itself


 ```
create trigger mytrigger2 after insert on assets
for row
execute procedure my_function();

 ```
