view: ad_hoc_query_tool_pharmacy {
  label: "Ad hoc Tool PHARMACY"
  derived_table: {
    sql: select
          "UNIQUE_ID" as PATIENT_ID_P,
          "DATE_FILLED" as SERVICE_DATE,
          "BRAND_OR_GENERIC" as BRAND_OR_GENERIC,
          "RELATIONSHIP_TO_EMPLOYEE" as RELATIONSHIP_TO_EMPLOYEE,
          "TOTAL_BILLED_AMT" as Total_Billed_Amt_P,
          "TOTAL_EMPLOYER_PAID_AMT" as Total_Paid_Amt_P,
          "NON_PROPRIETARY_NAME" as Drug_List,
          "TEA_CATEGORY" as TEA_Cat_List
        from
        "DB_KAIROS_PROD"."SCH_VIRBAC"."VW_PHARMACY"
        WHERE                                 /* Dynamic Filter condition*/
            {% condition DRUG %} "NON_PROPRIETARY_NAME" {% endcondition %} AND
            {% condition DRUG_CODE %} "DRUG_CODE" {% endcondition %} AND
            {% condition TEA_CATEGORY %} "TEA_CATEGORY" {% endcondition %} AND
            {% condition ACE_INHIBITOR_DRUGS %} "ACE_INHIBITOR" {% endcondition %} AND
            {% condition STATIN_DRUGS %} "STATIN" {% endcondition %} AND
            {% condition BETA_BLOCKER_DRUGS %} "BETA_BLOCKER" {% endcondition %} AND
            {% condition ARB_DRUGS %} "ARB" {% endcondition %} AND
            {% condition DRI_DRUGS %} "DRI" {% endcondition %} AND
            {% condition BLACK_LABEL_DRUG %} "BLACK_LABEL_DRUG" {% endcondition %} AND
            {% condition SPECIALTY_DRUGS %} "SPECIALTY_DRUGS" {% endcondition %} AND
            {% condition MAINTENANCE_DRUGS %} "MAINTENANCE" {% endcondition %} AND
            {% condition DIGESTIVE_DISEASE_DRUGS %} "DIGESTIVE_DISEASE" {% endcondition %} AND
            {% condition BRAND_OR_GENERIC %} "BRAND_OR_GENERIC" {% endcondition %}
          AND
            UNIQUE_ID IN (Select DISTINCT UNIQUE_ID from "DB_KAIROS_PROD"."SCH_VIRBAC"."VW_MEDICAL"
            WHERE
              {% condition DISEASE_CATEGORY %} "ICD_DISEASE_CATEGORY" {% endcondition %} AND
              {% condition DISEASE_DESCRIPTION %} "ICD_DESCRIPTION" {% endcondition %} AND
              {% condition DIAGNOSIS_CODE %} "RECONCILED_DIAGNOSIS_CODE_ICD10" {% endcondition %} AND
              {% condition CHRONIC_CATEGORY %} "ICD_CHRONIC_CAT" {% endcondition %} AND
              {% condition GENDER %} "PATIENT_GENDER" {% endcondition %} AND
              {% condition EMPLOYEE_RELATIONSHIP %} "RELATIONSHIP_TO_EMPLOYEE" {% endcondition %} AND
              {% condition PLACE_OF_SERVICE_DESC %} "PLACE_OF_SERVICE_DESCRIPTION" {% endcondition %} AND
              {% condition MAJOR_DISEASE_DIABETES %} "ICD_MAJOR_DISEASE" {% endcondition %} AND
              {% condition PROCEDURE_CODE_TYPE %} "PROCEDURE_CODE_TYPE" {% endcondition %} AND
              {% condition PROCEDURE_CODE_DESC %} "PROCEDURE_DESCRIPTION" {% endcondition %} AND
              {% condition PROCEDURE_CODE %} "PRIMARY_PROCEDURE_CODE" {% endcondition %} AND
              {% condition LS_MODIFY_OR_NOT %} "ICD_LS_MODIFY" {% endcondition %} AND
              {% condition ACUTE_OR_NOT %} "ICD_ACUTE" {% endcondition %} AND
              {% condition PREVENTATIVE_OR_NOT %} "ICD_PREVENTATIVE" {% endcondition %} AND
              {% condition CHRONIC_OR_NOT %} "2012_CHRONIC" {% endcondition %} AND
              {% condition AVOIDABLE_ER_OR_NOT %} "ICD_AVOIDABLE_ER" {% endcondition %} AND
              {% condition DIGESTIVE_DISEASE_OR_NOT %} "ICD_DIGESTIVE_DISEASE" {% endcondition %}
            ) ;;
  }

  #All the MEDICAL table Filter, Dimension & Measures.
  filter: DISEASE_CATEGORY {
    #default_value: "Diseases of the Musculoskeletal System and Connective Tissue"
    type: string
    label: "DISEASE CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_disease_category
  }

  filter: DISEASE_DESCRIPTION {
    type: string
    label: "DISEASE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_description
  }

  filter: DIAGNOSIS_CODE {
    type: string
    label: "DIAGNOSIS CODE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.reconciled_diagnosis_code_icd10
  }

  filter: PROCEDURE_CODE_DESC {
    type: string
    label: "PROCEDURE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.procedure_description
  }

  filter: PROCEDURE_CODE {
    type: string
    label: "PROCEDURE CODE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.primary_procedure_code
  }

  filter: CHRONIC_CATEGORY {
    type: string
    label: "CHRONIC CATEGORY"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_chronic_cat
  }

  filter: GENDER {
    type: string
    label: "GENDER"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.patient_gender
  }

  filter: EMPLOYEE_RELATIONSHIP {
    type: string
    label: "EMPLOYEE/SPOUSE/DEPENDENT"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.relationship_to_employee
  }

  filter: MAJOR_DISEASE_DIABETES {
    type: string
    label: "DIABETES ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.ICD_MAJOR_DISEASE
  }

  filter: PLACE_OF_SERVICE_DESC {
    type: string
    label: "PLACE OF SERVICE DESCRIPTION"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.place_of_service_description
  }

  filter: PROCEDURE_CODE_TYPE {
    type: string
    label: "PROCEDURE CODE TYPE"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.procedure_code_type
  }

  filter: LS_MODIFY_OR_NOT {
    type: string
    label: "LIFESTYLE MODIFIABLE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_ls_modify
  }

  filter: ACUTE_OR_NOT {
    type: string
    label: "ACUTE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_acute
  }

  filter: PREVENTATIVE_OR_NOT {
    type: string
    label: "PREVENTATIVE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_preventative
  }

  filter: CHRONIC_OR_NOT {
    type: string
    label: "CHRONIC ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.2012_chronic
  }

  filter: AVOIDABLE_ER_OR_NOT {
    type: string
    label: "AVOIDABLE ER ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_avoidable_er
  }

  filter: DIGESTIVE_DISEASE_OR_NOT {
    type: string
    label: "DIGESTIVE DISEASE ?"
    suggest_explore: vw_medical
    suggest_dimension: vw_medical.icd_digestive_disease
  }


#All the Pharmacy table Filter, Dimension & Measures.
  filter: DRUG {
    type: string
    label: "DRUGS"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.non_proprietary_name
  }

  filter: DRUG_CODE {
    type: string
    label: "DRUG CODE"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.drug_code
  }

  filter: TEA_CATEGORY {
    type: string
    label: "TEA CATEGORY"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.tea_category
  }

  filter: ACE_INHIBITOR_DRUGS {
    type: string
    label: "ACE INHIBITOR DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.ace_inhibitor
  }

  filter: STATIN_DRUGS {
    type: string
    label: "STATIN DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.statin
  }

  filter: BETA_BLOCKER_DRUGS {
    type: string
    label: "BETA BLOCKER DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.beta_blocker
  }

  filter: ARB_DRUGS {
    type: string
    label: "ARB DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.arb
  }

  filter: DRI_DRUGS {
    type: string
    label: "DRI DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.dri
  }

  filter: SPECIALTY_DRUGS {
    type: string
    label: "SPECIALTY DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.specialty_drugs
  }

  filter: MAINTENANCE_DRUGS {
    type: string
    label: "MAINTENANCE DRUGS ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.maintenance
  }

  filter: DIGESTIVE_DISEASE_DRUGS {
    type: string
    label: "DIGESTIVE DISEASE DRUG ?"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.digestive_disease
  }

  filter: BRAND_OR_GENERIC {
    type: string
    label: "BRAND OR GENERIC"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.brand_or_generic
  }

  filter: BLACK_LABEL_DRUG {
    type: string
    label: "BLACK LABEL DRUG"
    suggest_explore: vw_pharmacy
    suggest_dimension: vw_pharmacy.black_label_drug
  }


  dimension_group: SERVICE_DATE {
    type: time
    label: "SERVICE"
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
    sql: ${TABLE}."SERVICE_DATE" ;;
  }

  dimension: Unique_Id_P {
    type: string
    hidden: yes
    label: "Unique Id_P"
    sql: ${TABLE}.PATIENT_ID_P ;;
  }

  dimension: DRUG_BRAND_OR_GENERIC {
    type: string
    label: "BRAND/GENERIC"
    drill_fields: [TEA_CAT_LIST, DRUG_LIST]
    sql: ${TABLE}.BRAND_OR_GENERIC ;;
  }

  dimension: RELATIONSHIP_TO_EMPLOYEE {
    type: string
    drill_fields: [TEA_CAT_LIST, DRUG_LIST]
    label: "RELATIONSHIP TO EMPLOYEE"
    sql: ${TABLE}.RELATIONSHIP_TO_EMPLOYEE ;;
  }

  dimension: TEA_CAT_LIST {
    type: string
    drill_fields: [DRUG_LIST]
    label: "TEA CATEGORY"
    sql: ${TABLE}.TEA_Cat_List ;;
  }

  dimension: DRUG_LIST {
    type: string
    can_filter: no
    label: "DRUGS"
    sql: ${TABLE}.Drug_List ;;
  }

  measure: Total_Patients_P {
    type: count_distinct
    label: "Total Patients"
    sql: ${Unique_Id_P} ;;
  }

  measure: TOTAL_BILLED_AMT_P {
    type: sum
    label: "PHARMA_TOTAL BILLED AMT"
    sql: ${TABLE}.Total_Billed_Amt_P ;;
    value_format: "$0.00,,\" M\""
  }

  measure: TOTAL_PAID_AMT_P {
    type: sum
    label: "PHARMA_TOTAL PAID AMT"
    sql: ${TABLE}.Total_Paid_Amt_P ;;
    value_format: "$0.00,,\" M\""
  }

  measure: AVERAGE_PAID_AMT_P {
    type: number
    label: "PHARMA_MEAN PAID AMT"
    sql: CASE WHEN ${Total_Patients_P} <> 0 THEN ${TOTAL_PAID_AMT_P}/${Total_Patients_P}
          ELSE 0
          END;;
    value_format: "$#,##0.00"
  }

}
