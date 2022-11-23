delete from "memberInterest" mi 
join profile p on mi."profileId" = p.id
join "member" m on m.id = p."memberId" 
where m.email = 'muhammad.fadhil225@gmail.com'