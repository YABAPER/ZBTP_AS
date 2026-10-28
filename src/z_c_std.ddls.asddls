@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CONSUMPTION VIEW FOR STD'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true


define root view entity Z_C_STD
  provider contract transactional_query
  as projection on Z_I_STD
{
  key Rollno,
      Studentname,
      Studentclass,
      Studentage,
      Schoolname,
      StudentStatus 
}
