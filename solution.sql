
--   I will first create these view for better fetch performance
  
  create view personalitiesView as select JobsPersonalities.job_id, Personalities.name from jobs_personalities JobsPersonalities left join personalities Personalities ON (
    Personalities.id = (
      JobsPersonalities.personality_id
    ) 
    AND (Personalities.deleted) IS NULL
  ); 
 
 create view practical_skillsView as select JobsPracticalSkills.job_id,  PracticalSkills.name from  jobs_practical_skills JobsPracticalSkills
  LEFT JOIN practical_skills PracticalSkills ON (
    PracticalSkills.id = (
      JobsPracticalSkills.practical_skill_id
    ) 
    AND (PracticalSkills.deleted) IS NULL
  ); 
  
  create view basic_abilitiesView as select JobsBasicAbilities.job_id, BasicAbilities.name from  jobs_basic_abilities JobsBasicAbilities 
  LEFT JOIN basic_abilities BasicAbilities ON (
    BasicAbilities.id = (
      JobsBasicAbilities.basic_ability_id
    ) 
    AND (BasicAbilities.deleted) IS NULL
  ); 
  
    create view ToolsView as select JobsTools.job_id,Tools.name from jobs_tools JobsTools 
  LEFT JOIN affiliates Tools ON (
    Tools.type = 1 
    AND Tools.id = (JobsTools.affiliate_id) 
    AND (Tools.deleted) IS NULL
  ) ;
  
    
  create view CareerPathsView as select   JobsCareerPaths.job_id , CareerPaths.name from jobs_career_paths JobsCareerPaths
  LEFT JOIN affiliates CareerPaths ON (
    CareerPaths.type = 3 
    AND CareerPaths.id = (JobsCareerPaths.affiliate_id) 
    AND (CareerPaths.deleted) IS NULL
  ) ;
  
    create view RecQualificationsView as select  JobsRecQualifications.job_id,  RecQualifications.name from jobs_rec_qualifications JobsRecQualifications
  LEFT JOIN affiliates RecQualifications ON (
    RecQualifications.type = 2 
    AND RecQualifications.id = (
      JobsRecQualifications.affiliate_id
    ) 
    AND (RecQualifications.deleted) IS NULL
  ) ;
  
     create view ReqQualificationsView as select JobsReqQualifications.job_id, ReqQualifications.name from jobs_req_qualifications JobsReqQualifications
  LEFT JOIN affiliates ReqQualifications ON (
    ReqQualifications.type = 2 
    AND ReqQualifications.id = (
      JobsReqQualifications.affiliate_id
    ) 
    AND (ReqQualifications.deleted) IS NULL
  );


--   And then chnage the select query to below, 
--  here move the inner join upper to that we can reduce the fisrt table size then only we inner join with view
--  this solution not just make the performance better and also make the code neat and clean.

SELECT 
  Jobs.id AS `Jobs__id`, 
  Jobs.name AS `Jobs__name`, 
  Jobs.media_id AS `Jobs__media_id`, 
  Jobs.job_category_id AS `Jobs__job_category_id`, 
  Jobs.job_type_id AS `Jobs__job_type_id`, 
  Jobs.description AS `Jobs__description`, 
  Jobs.detail AS `Jobs__detail`, 
  Jobs.business_skill AS `Jobs__business_skill`, 
  Jobs.knowledge AS `Jobs__knowledge`, 
  Jobs.location AS `Jobs__location`, 
  Jobs.activity AS `Jobs__activity`, 
  Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`, 
  Jobs.academic_degree_master AS `Jobs__academic_degree_master`, 
  Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`, 
  Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`, 
  Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`, 
  Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`, 
  Jobs.salary_range_average AS `Jobs__salary_range_average`, 
  Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`, 
  Jobs.restriction AS `Jobs__restriction`, 
  Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`, 
  Jobs.remarks AS `Jobs__remarks`, 
  Jobs.url AS `Jobs__url`, 
  Jobs.seo_description AS `Jobs__seo_description`, 
  Jobs.seo_keywords AS `Jobs__seo_keywords`, 
  Jobs.sort_order AS `Jobs__sort_order`, 
  Jobs.publish_status AS `Jobs__publish_status`, 
  Jobs.version AS `Jobs__version`, 
  Jobs.created_by AS `Jobs__created_by`, 
  Jobs.created AS `Jobs__created`, 
  Jobs.modified AS `Jobs__modified`, 
  Jobs.deleted AS `Jobs__deleted`, 
  JobCategories.id AS `JobCategories__id`, 
  JobCategories.name AS `JobCategories__name`, 
  JobCategories.sort_order AS `JobCategories__sort_order`, 
  JobCategories.created_by AS `JobCategories__created_by`, 
  JobCategories.created AS `JobCategories__created`, 
  JobCategories.modified AS `JobCategories__modified`, 
  JobCategories.deleted AS `JobCategories__deleted`, 
  JobTypes.id AS `JobTypes__id`, 
  JobTypes.name AS `JobTypes__name`, 
  JobTypes.job_category_id AS `JobTypes__job_category_id`, 
  JobTypes.sort_order AS `JobTypes__sort_order`, 
  JobTypes.created_by AS `JobTypes__created_by`, 
  JobTypes.created AS `JobTypes__created`, 
  JobTypes.modified AS `JobTypes__modified`, 
  JobTypes.deleted AS `JobTypes__deleted` 
FROM 
  jobs Jobs 
    INNER JOIN job_categories JobCategories ON (
    JobCategories.id = (Jobs.job_category_id) 
    AND (JobCategories.deleted) IS NULL
  ) 
  INNER JOIN job_types JobTypes ON (
    JobTypes.id = (Jobs.job_type_id) 
    AND (JobTypes.deleted) IS NULL
  ) 
  LEFT JOIN personalitiesView Personalities on Jobs.id = Personalities.job_id
  LEFT JOIN practical_skillsView PracticalSkills on Jobs.id = PracticalSkills.job_id
  LEFT JOIN basic_abilitiesView BasicAbilities on Jobs.id = BasicAbilities.job_id
  LEFT JOIN ToolsView Tools on Jobs.id = Tools.job_id
  LEFT JOIN CareerPathsView CareerPaths on Jobs.id = CareerPaths.job_id
  LEFT JOIN RecQualificationsView RecQualifications on Jobs.id = RecQualifications.job_id
  LEFT JOIN ReqQualificationsView ReqQualifications on Jobs.id = ReqQualifications.job_id
WHERE 
  (
    (
      JobCategories.name LIKE '%キャビンアテンダント%' 
      OR JobTypes.name LIKE '%キャビンアテンダント%' 
      OR Jobs.name LIKE '%キャビンアテンダント%' 
      OR Jobs.description LIKE '%キャビンアテンダント%' 
      OR Jobs.detail LIKE '%キャビンアテンダント%' 
      OR Jobs.business_skill LIKE '%キャビンアテンダント%' 
      OR Jobs.knowledge LIKE '%キャビンアテンダント%' 
      OR Jobs.location LIKE '%キャビンアテンダント%' 
      OR Jobs.activity LIKE '%キャビンアテンダント%' 
      OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%' 
      OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%' 
      OR Jobs.restriction LIKE '%キャビンアテンダント%' 
      OR Jobs.remarks LIKE '%キャビンアテンダント%' 
      OR Personalities.name LIKE '%キャビンアテンダント%' 
      OR PracticalSkills.name LIKE '%キャビンアテンダント%' 
      OR BasicAbilities.name LIKE '%キャビンアテンダント%' 
      OR Tools.name LIKE '%キャビンアテンダント%' 
      OR CareerPaths.name LIKE '%キャビンアテンダント%' 
      OR RecQualifications.name LIKE '%キャビンアテンダント%' 
      OR ReqQualifications.name LIKE '%キャビンアテンダント%'
    ) 
    AND publish_status = 1 
    AND (Jobs.deleted) IS NULL
  ) 
GROUP BY 
  Jobs.id 
ORDER BY 
  Jobs.sort_order desc, 
  Jobs.id DESC 
LIMIT 
  50 OFFSET 0;