CLASS lhc_Z_I_STD DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations
      FOR INSTANCE AUTHORIZATION
      IMPORTING keys
                  REQUEST requested_authorizations
                  FOR _studentdetail
      RESULT    result.

    METHODS validateStudentAge
      FOR VALIDATE ON SAVE
      IMPORTING keys
                  FOR _studentdetail~ValidateStudentAge.

    METHODS SetInitialStatus
      FOR DETERMINE ON MODIFY
      IMPORTING keys
                  FOR _studentdetail~SetInitialStatus.

    METHODS ApproveStudent
      FOR MODIFY
      IMPORTING keys
       FOR ACTION _studentdetail~ApproveStudent
      RESULT    result.

ENDCLASS.

CLASS lhc_Z_I_STD IMPLEMENTATION.

  METHOD get_instance_authorizations.

    result = VALUE #(
        FOR key IN keys
        (
          %tky    = key-%tky
          %update = if_abap_behv=>auth-allowed
          %delete = if_abap_behv=>auth-allowed
        )
      ).



  ENDMETHOD.

  METHOD validatestudentage.

    READ ENTITIES OF z_i_std IN LOCAL MODE
     ENTITY _studentdetail
     FIELDS ( Studentage )
     WITH CORRESPONDING #( keys )
     RESULT DATA(lt_students).

    LOOP AT lt_students INTO DATA(ls_student).

      DATA(lv_age) = CONV i( ls_student-Studentage ).

      IF lv_age < 5 OR lv_age > 100.

        APPEND VALUE #(
          %tky = ls_student-%tky
        ) TO failed-_studentdetail.

        APPEND VALUE #(
          %tky = ls_student-%tky
          %msg = new_message_with_text(
            severity = if_abap_behv_message=>severity-error
            text     = 'Student age must be between 5 and 100'
          )
          %element-Studentage = if_abap_behv=>mk-on
        ) TO reported-_studentdetail.

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD setinitialstatus.

    READ ENTITIES OF z_i_std IN LOCAL MODE
        ENTITY _studentdetail
        FIELDS ( StudentStatus )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_students).

    DELETE lt_students WHERE StudentStatus IS NOT INITIAL.

    CHECK lt_students IS NOT INITIAL.

    MODIFY ENTITIES OF z_i_std IN LOCAL MODE
      ENTITY _studentdetail
      UPDATE FIELDS ( StudentStatus )
      WITH VALUE #(
        FOR ls_student IN lt_students
        (
          %tky          = ls_student-%tky
          StudentStatus = 'NEW'
        )
      ).

  ENDMETHOD.

  METHOD approvestudent.
    MODIFY ENTITIES OF z_i_std IN LOCAL MODE
        ENTITY _studentdetail
        UPDATE FIELDS ( StudentStatus )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky = key-%tky
            StudentStatus = 'APPROVED'
          )
        ).

    READ ENTITIES OF z_i_std IN LOCAL MODE
      ENTITY _studentdetail
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #(
      FOR ls_result IN lt_result
      (
        %tky = ls_result-%tky
        %param = ls_result
      )
    ).
  ENDMETHOD.

ENDCLASS.
