@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BASIC VIEW FOR STD'
@Metadata.ignorePropagatedAnnotations: true

define root view entity Z_I_STD 
    as select from zstd_table_demo
  {  
  
   key rollno       as Rollno,
      studentname  as Studentname,
      studentclass as Studentclass,
      studentage   as Studentage,
      schoolname   as Schoolname,
      studentstatus as StudentStatus

}
