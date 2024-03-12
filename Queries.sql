use lms1;
-- 1- find all candidate having java technology

select first_name as name from user_details as a 
left join tech_stack as b 
on a.id = b.Id
where b.Tech_Name = 'Java';

-- 2- find all mentors and ideations have java technology
select * from mentor m
join tech_stack t1 on m.Creator_User = t1.Creator_User
join mentor_ideation_map i on m.Creator_User = i.Creator_User
join tech_stack t2 on i.Creator_User = t2.Creator_User
where t1.Tech_Name = 'java' and t2.Tech_Name = 'java';

-- 3- find name of candidate which did not assign technology
select First_name from fellowship_candidate as f 
join tech_stack as t 
on f.Id = t.Creator_User where t.Tech_Name = null; 

-- 4- find name of cnadidate which is not submit documents
select First_name from fellowship_candidate as n
join candidate_documents as c 
on n.Id = c.Creator_User
where c.Status = 'Pending';

-- 5- find name of candidate which is not submit bank details
select First_name from fellowship_candidate as n 
join candidate_bank_details as c 
on n.Id = c.Creator_User
where c.Is_Account_Num_Verified= false or c.Is_Ifsc_Code_Verified = false;

-- 6-find name of candidates which is joined in dec month
select First_name from fellowship_candidate where month(Joining_Date) = 12;

-- 7-find name of candidates which is end of couse in feb
select First_name from fellowship_candidate as f
left join candidate_stack_assignment as c 
on f.Id = c.Creator_User
where month(c.Complete_Date) = 02;

-- 8-find name of candidates which is ending date accounding to joining date if joining date is 22-02-2019
select First_name from fellowship_candidate where Joining_Date = '2019-02-22';

-- 9-find all candidates which is passed out in 2019 year
select First_name from fellowship_candidate as a 
inner join candidate_qualification as b 
on a.Id = b.Creator_User
where Passing_Year = '2019';

-- 10-which technology assign to which Candidates which is having MCA background
select Tech_Name from tech_stack as t 
join candidate_qualification as  c 
on t.Creator_User = c.Creator_User
where c.Employee_Discipline = 'MCA';

-- 11-how many candiates which is having last month
select COUNT(*) as Temp_Table from Fellowship_Candidate
where month(Joining_Date) = month(current_date - interval 1 month) and year(Joining_Date) = year(current_date - interval 1 month);

-- 12-how many week candidate completed in the bridgelabz since joining date candidate id is 2
select  datediff(now() , Joining_Date)/7  as week from fellowship_candidate where Id = 2;

-- 13-find joining date of candidate if candidate id is 4
select Joining_Date from fellowship_candidate where Id = 4;

-- 14-how many week remaining of candidate in the bridglabz from today if candidate id is 5
select round(datediff(now(), Complete_Date)/7) as Pending_weeks from candidate_stack_assignment where Creator_User = 5;

-- 15-how many days remaining of candidate in the bridgelabz from today if candidate is is 6
select datediff(Complete_Date, now() ) as pending_days from candidate_stack_assignment where Creator_User = 6;

-- 16 -find candidates which is deployed
select First_name from fellowship_candidate as f 
join candidate_stack_assignment as c on f.Creator_User= c.Creator_User
join company_requirement as r on f.Creator_User =r. Creator_User
where c.Complete_Date < r.Requested_Month;

-- 17-find name and other details and name of company which is assign to condidate.
select * from fellowship_candidate as f 
inner join company as c 
on f.Id = c.Creator_User;

-- 18-find all condidate and mentors which is related to lab= banglore/mumbai/pune.

select f.First_Name as Candidate_name , m.Name as mentor_name , l.Location from  fellowship_candidate as f 
join lab as l on f.Creator_User = l.Creator_User
join mentor as m on f.Creator_User = m.Creator_User
where l.Location = 'Mumbai';

-- 19-find buddy mentors and ideation mentor and which technology assign to perticular candidate if candidate id is 6
SELECT 
    f.First_name, 
    c.Ideation_Engg_Id AS Ideation_Mentor_Id, 
    m.Name AS Ideation_Mentor,
    m2.Name AS Buddy_Mentor,
    ts.Tech_Name AS Assigned_Technology
FROM 
    fellowship_candidate AS f
JOIN 
    company_requirement AS c ON f.Creator_User = c.Creator_User
JOIN 
    mentor AS m ON c.Ideation_Engg_Id = m.Id
JOIN 
    mentor AS m2 ON c.Buddy_Engg_Id = m2.Id
JOIN 
    candidate_stack_assignment AS ca ON f.Creator_User = ca.Creator_User
JOIN 
    tech_stack AS ts ON ca.Id = ts.Id
WHERE 
    f.Id = 6;



