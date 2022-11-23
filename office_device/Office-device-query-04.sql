--update SUBSCRIBE member
--UPDATE "member-schema"."member" 
--SET subscribe_10minutes=true
--WHERE subscribe_10minutes is null;
--
--UPDATE "member-schema"."member" 
--SET subscribe_wmn=false 
--WHERE subscribe_wmn=true;

--set back not null for subscribes
--ALTER TABLE "member-schema"."member" ALTER COLUMN subscribe_wmn SET NOT NULL;
--ALTER TABLE "member-schema"."member" ALTER COLUMN subscribe_10minutes SET NOT NULL;
--
--ALTER TABLE "member-schema".profile ALTER COLUMN gender DROP NOT NULL;
--ALTER TABLE "member-schema".profile ALTER COLUMN birthdate DROP NOT NULL;
--ALTER TABLE "member-schema".profile ALTER COLUMN city DROP NOT NULL;
--
--ALTER TABLE "member-schema".profile ALTER COLUMN gender SET NOT NULL;
--ALTER TABLE "member-schema".profile ALTER COLUMN birthdate SET NOT NULL;
--ALTER TABLE "member-schema".profile ALTER COLUMN city SET NOT NULL;
--
--select * from "member-schema".profile order by ID desc;

--update "member-schema"."member" 
--set email=lower(email);

select * from "member" m where email='septiaherma24@gmail.com';
delete 

--select m.email, p.fullname from "member" m join profile p on m.id=p."memberId";