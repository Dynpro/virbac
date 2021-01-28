view: vw_medical {
  label: "Medical records"
  sql_table_name: "SCH_VIRBAC"."VW_MEDICAL"
    ;;

  dimension: 2012_chronic {
    type: string
    label: "CHRONIC ?"
    sql: ${TABLE}."2012_CHRONIC" ;;
  }

  dimension: address_city {
    type: string
    label: "ADDRESS- CITY"
    sql: ${TABLE}."ADDRESS_CITY" ;;
  }

  dimension: address_state {
    type: string
    label: "ADDRESS- STATE"
    sql: ${TABLE}."ADDRESS_STATE" ;;
  }

  dimension: address_zip_code {
    type: string
    label: "ADDRESS- ZIP CODE"
    sql: ${TABLE}."ADDRESS_ZIP_CODE" ;;
  }

  dimension: age_group_1 {
    type: string
    label: "AGE GROUP-1"
    sql: ${TABLE}."AGE_GROUP_1" ;;
  }

  dimension: claim_number {
    type: string
    label: "CLAIM No"
    hidden: yes
    sql: ${TABLE}."CLAIM_NUMBER" ;;
  }

  dimension: class_code {
    type: string
    label: "CLASS CODE"
    hidden: yes
    sql: ${TABLE}."CLASS_CODE" ;;
  }

  dimension: co_payment_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."CO_PAYMENT_AMT" ;;
  }

  dimension: coverage_type {
    type: string
    hidden: yes
    sql: ${TABLE}."COVERAGE_TYPE" ;;
  }

  dimension_group: date_claim_received {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    hidden: yes
    sql: ${TABLE}."DATE_CLAIM_RECEIVED" ;;
  }

  dimension: dependent_relationship_code {
    type: string
    hidden: yes
    sql: ${TABLE}."DEPENDENT_RELATIONSHIP_CODE" ;;
  }

  dimension: diagnosis_code_2 {
    type: string
    hidden: yes
    sql: ${TABLE}."DIAGNOSIS_CODE_2" ;;
  }

  dimension: diagnosis_code_3 {
    type: string
    hidden: yes
    sql: ${TABLE}."DIAGNOSIS_CODE_3" ;;
  }

  dimension: diagnosis_code_4 {
    type: string
    hidden: yes
    sql: ${TABLE}."DIAGNOSIS_CODE_4" ;;
  }

  dimension_group: diagnosis {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "DIAGOSIS"
    drill_fields: [diagnosis_year, diagnosis_quarter, diagnosis_month, diagnosis_raw]
    sql: ${TABLE}."DIAGNOSIS_DATE" ;;
  }

  dimension: disease_group {
    type: string
    hidden: yes
    sql: ${TABLE}."DISEASE_GROUP" ;;
  }

  dimension: employer_name {
    type: string
    sql: ${TABLE}."EMPLOYER_NAME" ;;
  }

  dimension: icd_acute {
    type: string
    label: "ACUTE ?"
    sql: ${TABLE}."ICD_ACUTE" ;;
  }

  dimension: icd_avoidable_er {
    type: string
    label: "AVOIDABLE ER ?"
    sql: ${TABLE}."ICD_AVOIDABLE_ER" ;;
  }

  dimension: icd_chronic_cat {
    type: string
    label: "CHRONIC CATEGORY"
    drill_fields: [icd_description]
    sql: ${TABLE}."ICD_CHRONIC_CAT" ;;
  }

  dimension: icd_chronic_cat_new {
    type: string
    hidden: yes
    sql: ${TABLE}."ICD_CHRONIC_CAT_NEW" ;;
  }

  dimension: icd_description {
    type: string
    label: "DIAGNOSIS DESCRIPTION"
    sql: ${TABLE}."ICD_DESCRIPTION" ;;
  }

  dimension: icd_digestive_disease {
    type: string
    label: "DIGESTIVE DISEASE ?"
    sql: ${TABLE}."ICD_DIGESTIVE_DISEASE" ;;
  }

  dimension: icd_disease_category {
    type: string
    label: "DIAGNOSIS CATEGORY"
    drill_fields: [icd_description, procedure_description, icd_chronic_cat]
    sql: ${TABLE}."ICD_DISEASE_CATEGORY" ;;
  }

  dimension: icd_indicator {
    type: string
    hidden: yes
    sql: ${TABLE}."ICD_INDICATOR" ;;
  }

  dimension: icd_ls_modify {
    type: string
    label: "LIFESTYLE MODIFIABLE ?"
    sql: ${TABLE}."ICD_LS_MODIFY" ;;
  }

  dimension: icd_lt_all_absences_midrange {
    type: string
    hidden: yes
    sql: ${TABLE}."ICD_LT_ALL_ABSENCES_MIDRANGE" ;;
  }

  dimension: icd_preventative {
    type: string
    label: "PREVENTATIVE ?"
    sql: ${TABLE}."ICD_PREVENTATIVE" ;;
  }

  dimension: icd_rh_chronic {
    type: string
    hidden: yes
    sql: ${TABLE}."ICD_RH_CHRONIC" ;;
  }

  dimension: ineligable_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."INELIGABLE_AMT" ;;
  }

  dimension: insured_out_of_pocket_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."INSURED_OUT_OF_POCKET_AMT" ;;
  }

  dimension: job_designation {
    type: string
    label: "JOB DESIGNATION"
    sql: ${TABLE}."JOB_DESIGNATION" ;;
  }

  dimension: job_type {
    type: string
    label: "JOB TYPE"
    sql: ${TABLE}."JOB_TYPE" ;;
  }

  dimension: patient_age {
    type: number
    label: "PATIENT AGE"
    drill_fields: [age_group_1, Chroni_vs_NonChronic]
    sql: ${TABLE}."PATIENT_AGE" ;;
  }

  dimension: patient_gender {
    type: string
    label: "PATIENT GENDER"
    drill_fields: [age_group_1, Chroni_vs_NonChronic, diagnosis_year, diagnosis_quarter, diagnosis_month]
    sql: ${TABLE}."PATIENT_GENDER" ;;
  }

  dimension: payee_provider_id {
    type: string
    hidden: yes
    sql: ${TABLE}."PAYEE_PROVIDER_ID" ;;
  }

  dimension: place_of_service {
    type: string
    label: "PLACE OF SERVICE"
    sql: ${TABLE}."PLACE_OF_SERVICE" ;;
  }

  dimension: place_of_service_description {
    type: string
    label: "PLACE OF SERVICE DESCRIPTION"
    sql: ${TABLE}."PLACE_OF_SERVICE_DESCRIPTION" ;;
  }

  dimension: primary_diagnosis_code {
    type: string
    hidden: yes
    sql: ${TABLE}."PRIMARY_DIAGNOSIS_CODE" ;;
  }

  dimension: primary_procedure_code {
    type: string
    label: "PROCEDURE CODE"
    sql: ${TABLE}."PRIMARY_PROCEDURE_CODE" ;;
  }

  dimension: procedure_code_2 {
    type: string
    hidden: yes
    sql: ${TABLE}."PROCEDURE_CODE_2" ;;
  }

  dimension: procedure_code_3 {
    type: string
    hidden: yes
    sql: ${TABLE}."PROCEDURE_CODE_3" ;;
  }

  dimension: procedure_code_4 {
    type: string
    hidden: yes
    sql: ${TABLE}."PROCEDURE_CODE_4" ;;
  }

  dimension: procedure_code_type {
    type: string
    label: "PROCEDURE CODE TYPE"
    sql: ${TABLE}."PROCEDURE_CODE_TYPE" ;;
  }

  dimension: procedure_consumer_description {
    type: string
    label: "PROCEDURE CONSUMER DESCRIPTION"
    sql: ${TABLE}."PROCEDURE_CONSUMER_DESCRIPTION" ;;
  }

  dimension: procedure_description {
    type: string
    label: "PROCEDURE DESCRIPTION"
    sql: ${TABLE}."PROCEDURE_DESCRIPTION" ;;
  }

  dimension: reconciled_diagnosis_code_icd10 {
    type: string
    label: "DIAGNOSIS CODE"
    sql: ${TABLE}."RECONCILED_DIAGNOSIS_CODE_ICD10" ;;
  }

  dimension: relationship_to_employee {
    type: string
    label: "RELATIONSHIP TO EMPLOYEE"
    sql: ${TABLE}."RELATIONSHIP_TO_EMPLOYEE" ;;
  }

  dimension: service_code {
    type: string
    hidden: yes
    sql: ${TABLE}."SERVICE_CODE" ;;
  }

  dimension: service_provider_city {
    type: string
    label: "SERVICE PROVIDER CITY"
    sql: ${TABLE}."SERVICE_PROVIDER_CITY" ;;
  }

  dimension: service_provider_id {
    type: string
    hidden: yes
    sql: ${TABLE}."SERVICE_PROVIDER_ID" ;;
  }

  dimension: service_provider_name {
    type: string
    label: "SERVICE PROVIDER NAME"
    sql: ${TABLE}."SERVICE_PROVIDER_NAME" ;;
  }

  dimension: service_provider_speciality_code {
    type: string
    label: "SERVICE PROVIDER SPECIALITY CODE"
    sql: ${TABLE}."SERVICE_PROVIDER_SPECIALITY_CODE" ;;
  }

  dimension: service_provider_speciality_code_desc {
    type: string
    label: "SERVICE PROVIDER SPECIALITY CODE DESCRIPTION"
    sql: ${TABLE}."SERVICE_PROVIDER_SPECIALITY_CODE_DESC" ;;
  }

  dimension: service_provider_state {
    type: string
    label: "SERVICE PROVIDER STATE"
    sql: ${TABLE}."SERVICE_PROVIDER_STATE" ;;
  }

  dimension: tooth_number {
    type: string
    label: "TOOTH NUMBER"
    sql: ${TABLE}."TOOTH_NUMBER" ;;
  }

  dimension: total_billed_amt {
    type: number
    label: "TOTAL BILLED AMT"
    hidden: yes
    sql: ${TABLE}."TOTAL_BILLED_AMT" ;;
  }

  dimension: total_employer_paid_amt {
    type: number
    label: "TOTAL PAID AMT"
    hidden: yes
    sql: ${TABLE}."TOTAL_EMPLOYER_PAID_AMT" ;;
  }

  dimension: total_patient_paid_amt {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_PATIENT_PAID_AMT" ;;
  }

  dimension: type_of_service_code {
    type: string
    label: "TYPE OF SERVICE CODE"
    sql: ${TABLE}."TYPE_OF_SERVICE_CODE" ;;
  }

  dimension: type_of_service_description {
    type: string
    label: "TYPE OF SERVICE DESCRIPTION"
    sql: ${TABLE}."TYPE_OF_SERVICE_DESCRIPTION" ;;
  }

  dimension: unique_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: Chroni_vs_NonChronic {
    type: string
    label: "CHRONIC/NON-CHRONIC"
    sql: CASE WHEN ${icd_chronic_cat} IS NULL THEN 'Non-Chronic'
      ELSE 'Chronic' END ;;

  }

  dimension: Work_related_MSK_Disease  {
    type: string
    label: "WORK RELATED MSK DIAGNOSIS"
    sql:  CASE WHEN ${primary_diagnosis_code} IN ('7221', '72273', '72400', '72420', '72430', '72450', '847', '8471', '8472',
        '8473', '8471', '8472', '8473', '8474', '8479', 'M4800', 'M5106', 'M5127', 'M5442', 'M549', 'S138XXA',  'S138XXD',
        'S138XXS',  'S139XXA',  'S139XXD', 'S139XXS',  'S233XXA',  'S233XXD',  'S233XXS',  'S335XXA',  'S335XXD',  'S335XXS',
        'S338XXA',  'S338XXD',  'S338XXS', 'S339XXA',  'S339XXD',  'S339XXS',  'S39012A',  'S39012D',  'S39012S')
        THEN 'Back'
        WHEN ${primary_diagnosis_code} IN ('7261', '72610', '72611', '72612', '72613', '72619', '72631', '72632', '72761', '84040',
        '8404', 'M65821', 'M65822', 'M65829', 'M70811', 'M70812', 'M70819', 'M70911', 'M70912', 'M70919', 'M7101',  'M71011',
        'M71012', 'M71019', 'M71111', 'M71112', 'M71119', 'M71311', 'M71312', 'M71319', 'M71811', 'M71812', 'M71819', 'M75100',
        'M75101', 'M75102', 'M75110', 'M75111', 'M75112', 'M75120', 'M75121', 'M75122', 'M7520',  'M7521',  'M7522',  'M7530',
        'M7531',  'M7532', 'M7700',  'M7701',  'M7702',  'M7710',  'M7711',  'M7712',  'M7812',  'S43421A',  'S43421D',
        'S43421S', 'S43422A', 'S43422D',  'S43422S',  'S43429A',  'S43429D',  'S43429S')
        THEN 'Upper Extremity'
        WHEN ${primary_diagnosis_code} IN ('72703', '72704', '72705', '7274', '72740', '72741', '72742', '72743', '72749', 'M6530',
        'M65321', 'M65322', 'M65329', 'M65331', 'M65332', 'M65339', 'M65341', 'M65342', 'M65349', 'M65351', 'M65352', 'M65359',
        'M654', 'M65831', 'M65841', 'M65842', 'M67241', 'M67242', 'M67249', 'M67429', 'M67431', 'M67432', 'M67439', 'M67441',
        'M67442', 'M67449')
        THEN 'Hand & Wrist'
        ELSE 'Others' END    ;;
  }

  dimension: ageGroup {
    type: tier
    label: "AGE GROUP-2"
    tiers: [20, 30, 40, 50, 60]
    style: integer
    sql:  ${patient_age};;
  }

  dimension: Total_Paid_Amount {
    type: number
    hidden: yes
    sql:  ${total_employer_paid_amt} ;;
  }

  measure: Total_Patients {
    type: count_distinct
    label: "TOTAL PATIENTS"
    sql:  ${unique_id} ;;
  }

  measure: Total_Patient_Percentage {
    type: percent_of_total
    label: "TOTAL PATIENTS %"
    value_format: "0.0"
    sql: ${Total_Patients} ;;
  }

  measure: Total_Paid_Amt {
    type: sum
    label: "TOTAL PAID AMT"
    sql:  ${Total_Paid_Amount} ;;
    value_format: "$#,##0.00"
  }

  measure: Avg_Total_Paid_amount {
    type: number
    label: "MEAN PAID AMT"
    sql:  CASE WHEN ${Total_Patients} <> 0 THEN ${Total_Paid_Amt}/${Total_Patients}
        ELSE 0
        END;;
    value_format: "$#,##0.00"
  }

  measure: count {
    type: count
    label: "TOTAL RECORDS"
    hidden: yes
    drill_fields: [service_provider_name, employer_name]
  }

  dimension: ICD_MAJOR_DISEASE {
    type: string
    label: "DIABETES ?"
    sql: ${TABLE}."ICD_MAJOR_DISEASE" ;;
  }


#Total Visits logic.
  dimension: Total_Visit_Unique_Id {
    type: string
    hidden: yes
    sql: concat(${unique_id}, ${diagnosis_year}, ${diagnosis_month}, IFNULL(${claim_number}, 0), ${reconciled_diagnosis_code_icd10}) ;;
  }

  measure: Total_Visit {
    type: count_distinct
    label: "TOTAL VISITS"
    sql: ${Total_Visit_Unique_Id} ;;
  }


#Total Lost Days & Spend logic.
  dimension: Lost_Days_Unique_Id {
    type: string
    sql: concat(${unique_id}, ${diagnosis_year}, ${reconciled_diagnosis_code_icd10}) ;;
  }

  measure: Total_Lost_Days {
    type: sum_distinct
    label: "TOTAL LOST DAYS"
    sql_distinct_key: ${Lost_Days_Unique_Id} ;;
    sql: ${icd_lt_all_absences_midrange} ;;
  }

  measure: Total_Lost_Day_Expense {
    type: sum_distinct
    label: "TOTAL LOST DAYS SPEND"
    sql_distinct_key: ${Lost_Days_Unique_Id} ;;
    sql: ${icd_lt_all_absences_midrange}*8*19 ;;
    #Lost days expense logic as per PHM report: Lost_Days*8*10 (hours - 8, Cost/perhour - $10)
    value_format: "$#,##0"
  }

  # Catastrophic Claim flag (Paid Amt/Claim > $100,000)
  dimension: CATASTROPHIC_FLAG {
    type: string
    label: "CATASTROPHIC/NON-CATASTROPHIC CLAIM"
    sql: ${TABLE}."CATASTROPHIC_FLAG" ;;
  }

}
