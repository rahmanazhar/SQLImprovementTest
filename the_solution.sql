SELECT
    Jobs.*
    JobCategories.*
    JobTypes.*
FROM
    jobs Jobs
    INNER JOIN job_categories JobCategories ON (
        JobCategories.id = (Jobs.job_category_id)
        AND (JobCategories.name) LIKE '%キャビンアテンダント%' AND (JobCategories.deleted) IS NULL
    )
    INNER JOIN job_types JobTypes ON (
        JobTypes.id = (Jobs.job_type_id)
        AND (JobTypes.name) LIKE '%キャビンアテンダント%' AND (JobTypes.deleted) IS NULL
    )
WHERE
    (
        (
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
    50 OFFSET 0