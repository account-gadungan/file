<cfcomponent name="SFPerformancePlanning" hint="SunFish Performance Planning Object" extends="SFBP">
	<cfsetting showdebugoutput="yes">
    <cfset strckArgument = {"Module" 			= "PM","ObjectName" 		= "PerformancePlanning-","ObjectTable" 		= "TPMDPERFORMANCE_PLANH",
							"ObjectTitle" 		= "Performance Planning","KeyField" 			= "request_no","TitleField" 		= "Request No",
							"GridColumn" 		= "", "PKeyField" 		= "","ObjectApproval" 	= "PERFORMANCE.Plan","DocApproval" 		= "PERFORMANCEPLAN",
							"bIsTransaction" 	= true } />
	<cfset Init(argumentCollection = strckArgument) />
	<cfset variables.objEnterpriseUser = CreateObject("component", "SFEnterpriseUser") />
	<cfset variables.objRequestApproval = CreateObject("component","SFRequestApproval").init(false) />
	<cfset REQUEST.SHOWCOLUMNGENERATEPERIOD = objEnterpriseUser.CheckCompanyParamForPerformance()>
	<Cfset REQUEST.InitVarCountDeC = objEnterpriseUser.getDecimalCountFromParam()>
	<cffunction name="CheckCompanyParamForPerformance">
		<cfreturn objEnterpriseUser.CheckCompanyParamForPerformance()>
	</cffunction>
	<cffunction name="ValidateAdminUser">
		<cfreturn objEnterpriseUser.ValidateAdminUser()>
	</cffunction>
	<cffunction name="refPeriodForReplacePlan">
    	<cfreturn objEnterpriseUser.refPeriodForReplacePlan()>
    </cffunction> 
	<cffunction name="Upload">
    	<cfreturn objEnterpriseUser.UploadPlanning()>
    </cffunction> 
	<cffunction name="refPeriod">
		<cfreturn objEnterpriseUser.refPeriod()>
    </cffunction> 
	<cffunction name="getEmpDetail">
    	<cfargument name="empid" default="">
    	<cfreturn objEnterpriseUser.getEmpDetail(empid=empid,varcoid=REQUEST.SCOOKIE.COID)>
    </cffunction>
	<cffunction name="getPeriodCompData">
    	<cfargument name="periodcode" default="">
        <cfargument name="refdate" default="">
        <cfargument name="posid" default="">
        <cfargument name="compcode" default="">
        <cfreturn objEnterpriseUser.getPeriodCompData(periodcode=arguments.periodcode,refdate=arguments.refdate,posid=arguments.posid,compcode=arguments.compcode)>
    </cffunction>
	<cffunction name="getEmpHistory">
    	<cfargument name="empid" default="">
    	<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
    	<cfargument name="periodcode" default="">
    	<cfargument name="poscode" default="">
    	<cfreturn objEnterpriseUser.getEmpHistory(empid=arguments.empid,varcoid=arguments.varcoid,periodcode=arguments.periodcode,poscode=arguments.poscode)>
    </cffunction>
	
	<cffunction name="getLastForm">
    	<cfargument name="empid" default="">
    	<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
    	<cfargument name="periodcode" default="">
        <cfargument name="posid" default="">
    	<cfreturn objEnterpriseUser.getLastPlanForm(empid=arguments.empid,varcoid=arguments.varcoid,periodcode=arguments.periodcode,posid=arguments.posid)>
    </cffunction>	
	<cffunction name="getFlagRev">
		<cfargument name="formno" default="">
		<cfargument name="reqno" default="">
		<cfreturn objEnterpriseUser.getFlagRevPlanForm(formno=arguments.formno,reqno=arguments.reqno)>
	</cffunction>
	<cffunction name="getAchType">
		<cfargument name="lib_code" required="yes">
    	<cfargument name="lib_type" required="yes">
		<cfargument name="period_code" required="yes">
		<cfargument name="component_code" required="yes">
		<cfargument name="position_id" required="no" default=""> 
		<cfreturn objEnterpriseUser.getAchTypePlanForm(lib_code=arguments.lib_code,lib_type=arguments.lib_type,period_code=arguments.period_code,component_code=arguments.component_code,position_id=arguments.position_id)>
	</cffunction>
	<cffunction name="getAddNotes">
		<cfargument name="periodcode" default="">
		<cfargument name="formno" default="">
		<cfargument name="refdate" default="#now()#">
		<cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
		<cfreturn objEnterpriseUser.getAddNotesPlanForm2(periodcode=arguments.periodcode,formno=arguments.formno,refdate=arguments.refdate,varcocode=arguments.varcocode)>
	</cffunction>
	<cffunction name="getEmpNoteData">
        <cfargument name="periodcode" default="">
        <cfargument name="refdate" default="">
        <cfargument name="lstreviewer" default="">
        <cfargument name="formno" default="">
        <cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
        <cfreturn objEnterpriseUser.getAddNotesPlanForm(periodcode=arguments.periodcode,formno=arguments.formno,refdate=arguments.refdate,varcocode=arguments.varcocode,lstreviewer=arguments.lstreviewer)>
    </cffunction>
	 <cffunction name="getPlanGradeStat"> 
    	<cfargument name="empid" default="">
    	<cfargument name="formno" default="">
    	<cfargument name= "reqno" default="">
        <cfreturn objEnterpriseUser.getPlanGradeStat(empid=arguments.empid,formno=arguments.formno,reqno=arguments.reqno)>
    </cffunction>
	<cffunction name="getRevisionDetail">
    	<cfargument name="periodcode" default="">
		<cfreturn objEnterpriseUser.getPlanStartEndDate(periodcode=arguments.periodcode)>
    </cffunction>
    <cffunction name="getRevisionTable">
    	<cfargument name="formnumber" default="">
    	<cfreturn objEnterpriseUser.getListRevPlan(formnumber=arguments.formnumber)>
    </cffunction>
	<cffunction name="getEmpWorkLocation">
    	<cfargument name="empid" default="">
    	<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
    	<cfargument name="periodcode" default="">
    	<cfreturn objEnterpriseUser.getEmpWorkLocation(empid=arguments.empid,varcoid=arguments.varcoid,periodcode=arguments.periodcode)>
    </cffunction>
	<cffunction name="GetPlanFormOnly">
		<cfargument name="period_code" default="">
		<cfargument name="empnolist" default="" required="no">
		<cfreturn objEnterpriseUser.GetPlanFormOnly(period_code=arguments.period_code,empnolist=arguments.empnolist)>
	</cffunction>
	<cffunction name="qGetListEval">
	    <cfargument name="period_code" default="">
		<cfreturn objEnterpriseUser.qGetListEval(period_code=arguments.period_code)>		
	</cffunction>
    <cffunction name="qGetListPlanFullyApproveAndClosed">
		<cfargument name="period_code" default="" required="No">
		<cfargument name="lst_emp_id" default="" required="Yes">
		<cfargument name="is_emp_defined" default="N" required="No">
		<cfargument name="by_form_no" default="N" required="No">
		<cfargument name="form_no" default="" required="No">
		<cfargument name="allstatus" default="false" required="No">
		<cfargument name="replacestatus" default="false" required="No">
		
		<cfargument name="isformstatus" default="N" required="No">
		<cfargument name="hdnSelectedformstatus" default="" required="No">
		<cfset LOCAL.qDataResult = objEnterpriseUser.getListPlanFullyApproveAndClosed(
		    period_code=arguments.period_code,
		    lst_emp_id=arguments.lst_emp_id,
		    is_emp_defined=arguments.is_emp_defined,
		    by_form_no=arguments.by_form_no,
		    form_no=arguments.form_no,
		    allstatus=arguments.allstatus,
		    replacestatus=arguments.replacestatus,
		    isformstatus=arguments.isformstatus,
		    hdnSelectedformstatus=arguments.hdnSelectedformstatus
		  )>
		<cfreturn qDataResult>		
	</cffunction>
	<cffunction name="getReqDataKPI">
		<cfargument name="empid" default="">
        <cfargument name="periodcode" default="">
        <cfargument name="refdate" default="">
        <cfargument name="compcode" default="">
        <cfargument name="reqno" default="">
        <cfargument name="formno" default="">
        <cfargument name="reviewerempid" default="">
		<cfargument name="kpitype" default="ORGUNIT">
		<cfargument name="posid" default="">
		<cfargument name="showfinal" default="0">
		<cfargument name="flagparent" default="0">
		<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
        <cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
		<cfreturn objEnterpriseUser.getReqDataKPIPlanForm(empid=arguments.empid,periodcode=arguments.periodcode,refdate=arguments.refdate,compcode=arguments.compcode,reqno=arguments.reqno,formno=arguments.formno,reviewerempid=arguments.reviewerempid,kpitype=arguments.kpitype,posid=arguments.posid,showfinal=arguments.showfinal,flagparent=arguments.flagparent,varcoid=arguments.varcoid,varcocode=arguments.varcocode)>
  
				  
  
	</cffunction>
	<cffunction name="getReqData">
		<cfargument name="empid" default="">
        <cfargument name="periodcode" default="">
        <cfargument name="refdate" default="">
        <cfargument name="compcode" default="">
        <cfargument name="reqno" default="">
        <cfargument name="formno" default="">
        <cfargument name="reviewerempid" default="">
		<cfargument name="kpitype" default="ORGUNIT">
		<cfargument name="posid" default="">
		<cfargument name="reviewstep" default="1">
		<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
        <cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
		<cfreturn objEnterpriseUser.getReqDataPlanForm(empid=arguments.empid,periodcode=arguments.periodcode,refdate=arguments.refdate,compcode=arguments.compcode,reqno=arguments.reqno,formno=arguments.formno,reviewerempid=arguments.reviewerempid,kpitype=arguments.kpitype,posid=arguments.posid,reviewstep=arguments.reviewstep,varcoid=arguments.varcoid,varcocode=arguments.varcocode)>
														  
											   
			   
				  
	</cffunction>
	<cffunction name="View">
        <cfparam name="empid" default="">
        <cfparam name="reqno" default="">
        <cfparam name="periodcode" default="">
        <cfparam name="varcoid" default="#request.scookie.coid#">
        <cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),Datepart("d",now())),"mm/dd/yyyy")>
        <cfquery name="LOCAL.qGetReqStatus" datasource="#REQUEST.SDSN#">
          	SELECT	status, requester FROM	TCLTRequest WHERE	req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar"> AND company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer"> and UPPER(req_type)='PERFORMANCE.PLAN'
        </cfquery>
		<cfset LOCAL.qPlanDate = objEnterpriseUser.getPlanStartEndDate(periodcode=periodcode)>
        <cfset LOCAL.plansd = DATEFORMAT(#qPlanDate.plan_startdate#,"mm/dd/yyyy")>
        <cfset LOCAL.planed = DATEFORMAT(#qPlanDate.plan_enddate#,"mm/dd/yyyy")>
        <cfif planed lt nowdate><cfset LOCAL.plandatevalid= 0 ><cfelse> <cfset LOCAL.plandatevalid=1></cfif>
        <cfquery name="LOCAL.qGetFormDetail" datasource="#request.sdsn#">
        	SELECT EP.full_name AS empname, EC.emp_no AS empno, EC.position_id AS emppos, EP.photo AS empphoto,EC.emp_id AS empid, '#qGetReqStatus.status#' status, '#request.scookie.user.uid#' requester, '#plandatevalid#' AS plandatevalid
			FROM TEODEMPCOMPANY EC INNER JOIN TEOMEMPPERSONAL EP ON EP.emp_id = EC.emp_id
			WHERE EC.emp_id = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar"> AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer">
        </cfquery>
		<cfset REQUEST.KeyFields="reviewee_empid=#empid#">
    	<cfreturn qGetFormDetail>
    </cffunction>
	
	<cffunction name="InsertRequestRecord">
				<cfargument name="strckFormData" type="Struct" required="Yes">
				<cfset LOCAL.structAppData = StructNew() />
				<cfset LOCAL.structListApprover = StructNew() />
				<cfquery name="LOCAL.qGetPosIdUser" datasource="#REQUEST.SDSN#">
					select position_id, emp_no from teodempcompany where emp_id = '#REQUEST.SCookie.User.empid#' and company_id = #REQUEST.SCOOKIE.COID#
				</cfquery>
				<cfquery name="LOCAL.qGetName" datasource="#REQUEST.SDSN#">
				select TEOMEMPPERSONAL.first_name, TEOMEMPPERSONAL.middle_name, TEOMEMPPERSONAL.last_name from TEOMEMPPERSONAL where emp_id = '#REQUEST.SCookie.User.empid#'
				</cfquery>
				<cfset LOCAL.arrApprover1 = ArrayNew(1) />
				<cfset structAppData['primary_approver'] =  val(request.scookie.user.uid)>
				<cfset structAppData['step_required'] = true />
				<cfset structAppData['required'] = true />
				<cfset structAppData['approvedby'] =  val(request.scookie.user.uid)>
				<cfset LOCAL.arrAllApprover =  ArrayNew(1) />
				<cfset LOCAL.structResultStep = StructNew() />
				<cfset structResultStep['user_id'] = val(request.scookie.user.uid)>
				<cfset structResultStep['user_name'] = request.scookie.user.uname>
				<cfset structResultStep['emp_id'] = REQUEST.SCookie.User.empid>
				<cfset structResultStep['first_name'] = qGetName.first_name>
				<cfset structResultStep['middle_name'] = qGetName.middle_name>
				<cfset structResultStep['last_name'] = qGetName.last_name>
				<cfset structResultStep['emp_no'] = qGetPosIdUser.emp_no>
				<cfset structResultStep['position_id'] =  val(qGetPosIdUser.position_id)/> 
				<cfset ArrayAppend(arrAllApprover, structResultStep) />
				<cfset LOCAL.arrayForApprover =  ArrayNew(1) />
				<cfset ArrayAppend(arrayForApprover, arrAllApprover) />
				<cfset structAppData['approver'] =arrayForApprover>
				<cfset ArrayAppend(arrApprover1, structAppData) />
				<cfset LOCAL.jsonApprovedData = '{"#val(request.scookie.user.uid)#":{"DECISION":1,"NOTES":"Performance Planning Upload","DTIME":"#Now()#"}}'>
				<!---<cfset LOCAL.jsonApprovedData = '{"01_#val(request.scookie.user.uid)#":{"DECISION":1,"NOTES":"Performance Planning Upload","DTIME":"#Now()#"}}'>--->
				 <cfset LOCAL.wddxApprovalData=SFReqFormat(arrApprover1,"W")>
				<cfquery name="LOCAL.qInsertReq" datasource="#REQUEST.SDSN#" >
					INSERT INTO TCLTREQUEST ( sfobject, company_id, company_code, req_type, req_mode, req_no, req_date, requester, reqemp, req_data, key_data, status, isoutstanding, isexpired, isselectable_approver, outstanding_list, approved_list, approval_list, approval_data, approved_data, created_date, created_by, modified_date, modified_by )
						VALUES ('#strckFormData.sfobject#',
						<cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">, 
						'PERFORMANCE.PLAN', 
						'3',
						'#strckFormData.req_no#',
						#strckFormData.req_date#,
						'#strckFormData.requester#',
						'#strckFormData.reqemp#',
						'#strckFormData.reqdata#',
						'#strckFormData.key_data#',
						'#strckFormData.status#',
						'#strckFormData.isoutstanding#',
						'#strckFormData.isexpired#',
						'#strckFormData.isselectable_approver#',
						'#strckFormData.outstanding_list#',
						'#strckFormData.approved_list#',
						'#strckFormData.approval_list#',
						'#wddxApprovalData#',
						'#jsonApprovedData#',
						#strckFormData.created_date#,
						'#strckFormData.created_by#',
						#strckFormData.modified_date#,
						'#strckFormData.modified_by#'
						)
				</cfquery>
	</cffunction>
	<cffunction name="UpdateRequestRecord">
				<cfargument name="strckFormData" type="Struct" required="Yes">
				<cfset LOCAL.structAppData = StructNew() />
				<cfset LOCAL.structListApprover = StructNew() />
				<cfquery name="LOCAL.qGetPosIdUser" datasource="#REQUEST.SDSN#">
					select position_id, emp_no from teodempcompany where emp_id = '#REQUEST.SCookie.User.empid#' and company_id = #REQUEST.SCOOKIE.COID#
				</cfquery>
				<cfquery name="LOCAL.qGetName" datasource="#REQUEST.SDSN#">
				select TEOMEMPPERSONAL.first_name, TEOMEMPPERSONAL.middle_name, TEOMEMPPERSONAL.last_name from TEOMEMPPERSONAL where emp_id = '#REQUEST.SCookie.User.empid#'
				</cfquery>
				<cfset LOCAL.arrApprover1 = ArrayNew(1) />
				<cfset structAppData['primary_approver'] =  val(request.scookie.user.uid)>
				<cfset structAppData['step_required'] = true />
				<cfset structAppData['required'] = true />
				<cfset structAppData['approvedby'] =  val(request.scookie.user.uid)>
				<cfset LOCAL.arrAllApprover =  ArrayNew(1) />
				
				<cfset LOCAL.structResultStep = StructNew() />
				<cfset structResultStep['user_id'] = val(request.scookie.user.uid)>
				<cfset structResultStep['user_name'] = request.scookie.user.uname>
				<cfset structResultStep['emp_id'] = REQUEST.SCookie.User.empid>
				<cfset structResultStep['first_name'] = qGetName.first_name>
				<cfset structResultStep['middle_name'] = qGetName.middle_name>
				<cfset structResultStep['last_name'] = qGetName.last_name>
				<cfset structResultStep['emp_no'] = qGetPosIdUser.emp_no>
				<cfset structResultStep['position_id'] =  val(qGetPosIdUser.position_id)/> 
				<cfset ArrayAppend(arrAllApprover, structResultStep) />
				<cfset LOCAL.arrayForApprover =  ArrayNew(1) />
				<cfset ArrayAppend(arrayForApprover, arrAllApprover) />
				<cfset structAppData['approver'] =arrayForApprover>
				<cfset ArrayAppend(arrApprover1, structAppData) />
				<cfset LOCAL.jsonApprovedData = '{"#val(request.scookie.user.uid)#":{"DECISION":1,"NOTES":"Performance Planning Upload","DTIME":"#Now()#"}}'>
				<!---<cfset LOCAL.jsonApprovedData = '{"01_#val(request.scookie.user.uid)#":{"DECISION":1,"NOTES":"Performance Planning Upload","DTIME":"#Now()#"}}'>---->
				 <cfset LOCAL.wddxApprovalData=SFReqFormat(arrApprover1,"W")>
				
				<cfquery name="LOCAL.qUpdRequest" datasource="#request.sdsn#">
					UPDATE TCLTREQUEST SET
					approved_data = <cfqueryparam value="#jsonApprovedData#" cfsqltype="cf_sql_varchar">,
					approval_data = <cfqueryparam value="#wddxApprovalData#" cfsqltype="cf_sql_varchar">,
					approved_list = <cfqueryparam value="#strckFormData.approved_list#" cfsqltype="cf_sql_varchar">,
					outstanding_list = <cfqueryparam value="#strckFormData.outstanding_list#" cfsqltype="cf_sql_varchar">,
					modified_date = #CreateODBCDateTime(Now())#,
					created_date = #CreateODBCDateTime(Now())#,
					modified_by =  <cfqueryparam value="#REQUEST.SCOOKIE.USER.UNAME#" cfsqltype="cf_sql_varchar">,
					created_by = <cfqueryparam value="#REQUEST.SCOOKIE.USER.UNAME#" cfsqltype="cf_sql_varchar">,
					status = 3
					WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
					AND UPPER(req_type) = 'PERFORMANCE.PLAN'
					AND req_no = <cfqueryparam value="#strckFormData.req_no#" cfsqltype="cf_sql_varchar">
					AND reqemp = <cfqueryparam value="#strckFormData.reqemp#" cfsqltype="cf_sql_varchar">
				</cfquery>
            
	</cffunction>
	<cffunction name="ValidateHeaderUploadPlanning">
		<cfargument name="definedheaderlst" required="Yes">
		<cfargument name="lstHeaderColumn" required="Yes">
		 <cfset local.missedColumn = "">
		 <cfset local.alertMessageUpload = "">
		 <cfloop list="#lstHeaderColumn#" index="LOCAL.idxcolcs">
			<cfif ListFindNoCase(arguments.definedheaderlst,idxcolcs) EQ 0>
				 <cfset missedColumn = ListAppend(missedColumn,idxcolcs)>
			</cfif>
		 </cfloop>
		 <cfset missedColumn = listRemoveDuplicates(missedColumn)>
			<cfif ListLen(missedColumn) eq 1>
				<cfset LOCAL.alertMessageUpload=Application.SFParser.TransMLang("JSInvalid Excel template, column #missedColumn# is not found",true)>
			<cfelseif ListLen(missedColumn) gt 1>
				<cfset LOCAL.alertMessageUpload=Application.SFParser.TransMLang("JSInvalid Excel template, column #missedColumn# are not found",true)>
			</cfif>
		 <cfreturn alertMessageUpload>
	</cffunction>
	<cffunction name="InsertWDDXTemp">
		<cfargument name="tempid" required="Yes">
		<cfargument name="TRANS_ID" required="Yes">
		<cfargument name="query_wddx" required="Yes">
		<cfargument name="qDataRecordCount" required="Yes">
		
		<cfquery name="LOCAL.qInsPlanningWDDX" datasource="#REQUEST.SDSN#">
			<cfif request.dbdriver eq "MYSQL">
				INSERT INTO TPMDWDDXTEMP (id,trans_code,wddx,status,created_by,created_date,modified_by,modified_date,current_row,total) 
				VALUES(<cfqueryparam value="#arguments.tempid#" cfsqltype="CF_SQL_INTEGER">,
					<cfqueryparam value="#arguments.TRANS_ID#" cfsqltype="CF_SQL_VARCHAR">
					,<cfqueryparam value="#arguments.query_wddx#" cfsqltype="CF_SQL_VARCHAR">
					,1
					,'#request.scookie.user.uname#'
					,#CreateODBCDateTime(Now())#
					,'#request.scookie.user.uname#'
					,#CreateODBCDateTime(Now())#
					,1
					,<cfqueryparam value="#arguments.qDataRecordCount#" cfsqltype="cf_sql_integer">
					)
			<cfelse>
				INSERT INTO TPMDWDDXTEMP (trans_code,wddx,status,created_by,created_date,modified_by,modified_date,current_row,total) 
				VALUES(
					<cfqueryparam value="#arguments.TRANS_ID#" cfsqltype="CF_SQL_VARCHAR">
					,<cfqueryparam value="#arguments.query_wddx#" cfsqltype="CF_SQL_VARCHAR">
					,1
					,'#request.scookie.user.uname#'
					,#CreateODBCDateTime(Now())#
					,'#request.scookie.user.uname#'
					,#CreateODBCDateTime(Now())#
					,1
					,<cfqueryparam value="#arguments.qDataRecordCount#" cfsqltype="cf_sql_integer">
					)
			</cfif>
		</cfquery>
	</cffunction>
	<cffunction name="DefineFormNoReqNo">
		<cfparam name="period_code" default="" >
		<cfparam name="reviewee_empid" default="">
		<cfset local.form_no = "">
		<cfset local.req_no = "">
		<cfquery name="LOCAL.qCheckPlanGen" datasource="#request.sdsn#">
			SELECT <cfif request.dbdriver eq "MSSQL"> top 1 </cfif> form_no,req_no from TPMDPERFORMANCE_PLANGEN where 
				period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar">
				AND company_id = <cfqueryparam value="#REQUEST.Scookie.COID#" cfsqltype="cf_sql_varchar"> AND reviewee_empid = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar"> order by modified_date desc  <cfif request.dbdriver eq "MYSQL">limit 1</cfif>
		</cfquery>
		<cfif qCheckPlanGen.recordcount neq 0 and REQUEST.SHOWCOLUMNGENERATEPERIOD eq true >
			<cfset form_no = '#qCheckPlanGen.form_no#'>
			<cfset req_no = '#qCheckPlanGen.req_no#'> 
		</cfif>
		<cfquery name="LOCAL.qCheckPlanH" datasource="#request.sdsn#">
			SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> request_no, reviewer_empid  FROM TPMDPERFORMANCE_PLANH where period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar">
			AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			AND reviewee_empid = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">
			ORDER BY created_date desc <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
		</cfquery>
		<cfquery name="LOCAL.qCheckPlanKpi" datasource="#request.sdsn#">
			SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> form_no, request_no FROM TPMDPERFORMANCE_PLANKPI
			WHERE  request_no = <cfqueryparam value="#qCheckPlanH.request_no#" cfsqltype="cf_sql_varchar">
			AND  period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar"> <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
		</cfquery>
		
		<cfset structFormNoReqNo = StructNew() />
		<cfset structFormNoReqNo['form_no'] = form_no>
		<cfset structFormNoReqNo['req_no'] = req_no>
		<cfset structFormNoReqNo['qCheckPlanGen'] = qCheckPlanGen>
		<cfset structFormNoReqNo['qCheckPlanKpi'] = qCheckPlanKpi>
		<cfset structFormNoReqNo['qCheckPlanH'] = qCheckPlanH>
		<cfset structFormNoReqNo['lastReviewerEmpid'] = qCheckPlanH.reviewer_empid >
		<cfreturn structFormNoReqNo>
	</cffunction>
	<cffunction name="InsertPLANH">
		<cfargument name="form_no" default="" required="yes">
		<cfargument name="request_no" default="" required="yes">
		<cfargument name="form_order" default="" required="yes">
		<cfargument name="reference_date" default="" required="yes">
		<cfargument name="period_code" default="" required="yes">
		<cfargument name="reviewee_empid" default="" required="yes">
		<cfargument name="reviewee_posid" default="" required="yes">
		<cfargument name="reviewee_grade" default="" required="yes">
		<cfargument name="reviewee_employcode" default="" required="yes">
		<cfargument name="reviewee_unitpath" default="" required="yes">
		<cfargument name="reviewer_empid" default="" required="yes">
		<cfargument name="reviewer_posid" default="" required="yes">
		<cfargument name="review_step" default="" required="yes">
		<cfargument name="head_status" default="" required="yes">
		<cfargument name="lastreviewer_empid" default="" required="yes">
		<cfargument name="isfinal" default="" required="yes">
		<cfargument name="isfinal_requestno" default="" required="yes">
		<cfquery name="LOCAL.qInsertPlanH" datasource="#request.sdsn#">
			INSERT INTO TPMDPERFORMANCE_PLANH (form_no,company_code,request_no,form_order,reference_date,period_code,reviewee_empid
			,reviewee_posid,reviewee_grade,reviewee_employcode,reviewee_unitpath
			,reviewer_empid,reviewer_posid,review_step,head_status,lastreviewer_empid
			,created_by,created_date,modified_by,modified_date,isfinal,isfinal_requestno
			)
				VALUES(
					<cfqueryparam value="#arguments.form_no#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.company_code#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.request_no#" cfsqltype="cf_sql_varchar">,1,
					<cfqueryparam value="#CreateODBCDate(arguments.reference_date)#" cfsqltype="cf_sql_timestamp">,
					<cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewee_posid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewee_grade#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewee_employcode#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewee_unitpath#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewer_empid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.reviewer_posid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.review_step#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.head_status#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.lastreviewer_empid#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#REQUEST.SCOOKIE.USER.UNAME#" cfsqltype="cf_sql_varchar">,
					<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
					<cfqueryparam value="#REQUEST.SCOOKIE.USER.UNAME#" cfsqltype="cf_sql_varchar">,
					<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
					<cfqueryparam value="#arguments.isfinal#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.isfinal_requestno#" cfsqltype="cf_sql_varchar">
					)
		</cfquery>
    </cffunction>
  <cffunction name="updatePLANHFinal">
		<cfargument name="strRequestNo" type="string" required="yes">
		<cfargument name="emp_idreviewer" type="string" required="yes">
		<cfquery name="LOCAL.qUpdatePMReqForm" datasource="#request.sdsn#">
			UPDATE TPMDPERFORMANCE_PLANH
			SET isfinal = 1, head_status = 1, isfinal_requestno = 1,modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>, modified_by = '#REQUEST.SCOOKIE.USER.UNAME#'
			WHERE request_no = <cfqueryparam value="#arguments.strRequestNo#" cfsqltype="cf_sql_varchar">
			AND reviewer_empid = <cfqueryparam value="#arguments.emp_idreviewer#" cfsqltype="cf_sql_varchar">
			and company_code = '#REQUEST.SCOOKIE.COCODE#'
		</cfquery>
	</cffunction>

	<!--- <cffunction name="Listing">
        <cfset LOCAL.sdate = DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),1),"yyyy-mm-dd")>
    	<cfset LOCAL.edate = DATEFORMAT(CreateDate(Datepart("yyyy",now()),12,31),"yyyy-mm-dd")>
    	 <cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),Datepart("d",now())),"yyyy-mm-dd")>
		
        <cfparam name="inp_startdt" default="#nowdate#">
        <cfparam name="inp_enddt" default="#nowdate#">
		<cfset LOCAL.scParam=paramRequest()>
        <cfset Local.StrckTemp = listingFilter(inp_startdt=inp_startdt,inp_enddt=inp_enddt)>
		<cfparam name="status" default="">
		<cfif status neq ""> <cfset scParam['status']= '%#status#%' ><cfelse><cfset scParam['status']= '' ></cfif>	
	    <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false >  <!--- Not Using Pre-generate--->
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsField="  E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#' AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )  )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'  AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )     )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, CONVERT (VARCHAR(10), PER.reference_date, 120) AS refdate,  (    SELECT       TOP 1 req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planH eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS reqno, CASE    WHEN       ( SELECT  TOP 1  CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus           FROM             tcltrequest req              INNER JOIN                tpmdperformance_planH eh                 ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code           WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC        )       IS NULL     THEN       'Not Requested'     ELSE (        SELECT     TOP 1    CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus  FROM          tcltrequest req           INNER JOIN             tpmdperformance_planH eh       ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'           INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC)  END AS status,  (    SELECT       TOP 1 p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'        INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       TOP 1 eh.form_no     FROM       tpmdperformance_PLANH eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS formno, per.company_code, (    SELECT       TOP 1 eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS isfinal, (    SELECT       TOP 1 eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no  ) AS row_number   ">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN      (  SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, date_format(per.reference_date, '%Y-%c-%d') AS refdate,  (    SELECT       req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planH eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'   inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid   WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS reqno, CASE    WHEN       (          SELECT   CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus         FROM             tcltrequest req              INNER JOIN                tpmdperformance_planH eh                 ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code    inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid        WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC limit 1        )       IS NULL     THEN       'Not Requested'     ELSE (        SELECT    CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus   FROM          tcltrequest req           INNER JOIN             tpmdperformance_planH eh              ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'      inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid      INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC limit 1 )  END AS status,  (    SELECT       p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'    inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid    INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC limit 1  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       eh.form_no     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS formno, per.company_code, (    SELECT       eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS isfinal, (    SELECT       eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no     where       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code  ) AS row_number  ">
                </cfif>
        		<cfset LOCAL.lsTable="TEODEMPCOMPANY E INNER JOIN TEOMEMPPERSONAL P ON P.emp_id = E.emp_id  INNER JOIN TEOMPOSITION POS ON POS.position_id = E.position_id AND POS.company_id = E.company_id LEFT JOIN TEOMPOSITION DEP ON DEP.position_id = POS.parent_id AND DEP.company_id = POS.company_id LEFT JOIN TEOMEMPLOYMENTSTATUS ES ON ES.employmentstatus_code = E.employ_code LEFT JOIN TPMMPERIOD PER ON PER.company_code = '#request.scookie.cocode#' LEFT JOIN TPMRPERIODFILTEREMPLOYCODE FEC ON PER.PERIOD_CODE = FEC.period_code AND FEC.employmentstatus_code = E.employ_code LEFT JOIN TPMRPERIODFILTERJOBSTATUSCODE FJS ON FJS.PERIOD_CODE = PER.period_code AND FJS.jobstatuscode = E.job_status_code LEFT JOIN view_jfl JFL ON JFL.period_code = PER.period_code and JFL.EMP_ID = E.EMP_ID and JFL.position_id = E.position_id">
            
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsFilter="company_id =#request.scookie.coid# AND ( plan_startdate <= '#inp_enddt#'  AND plan_enddate >= '#inp_startdt#')AND (( JFL_PER <> '-'  AND JFL = EMP_ID)  OR  (  JFL_PER = '-'   ))AND ((EMCOD_PER <> '-'  AND EMCOD = employ_code) OR ( EMCOD_PER = '-'   ))AND ((FJS_PER <> '-'    AND FJS = job_status_code)  OR  (   FJS_PER = '-'   ))">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                </cfif>
               
		<cfelse>  <!--- Pre-generate--->
				
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'    AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )   )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, CONVERT (VARCHAR(10), PER.reference_date, 120) AS refdate,  (    SELECT       TOP 1 req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_plangen eh           ON eh.req_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS reqno, CASE    WHEN       (    SELECT    TOP 1   CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus          FROM             tcltrequest req              INNER JOIN                tpmdperformance_planh eh                 ON eh.request_no = req.req_no                 AND UPPER(req.req_type) = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code           WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC        )       IS NULL     THEN       'Unverified'     ELSE (        SELECT          TOP 1     CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus    FROM          tcltrequest req     INNER JOIN             tpmdperformance_planh eh   ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'           INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC)  END AS status,  (    SELECT       TOP 1 p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'        INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       TOP 1 eh.form_no     FROM       tpmdperformance_plangen eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS formno, per.company_code, (    SELECT       TOP 1 eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS isfinal, (    SELECT       TOP 1 eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS modified_date, (    SELECT        count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no       where b.reviewee_empid = E.emp_id 	and per.period_code = b.period_code  ) AS row_number ">
                <cfelseif request.dbdriver eq "MYSQL">
        	         <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'     AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )  )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'  AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )     )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, date_format(per.reference_date, '%Y-%c-%d') AS refdate,  (    SELECT       req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_plangen eh           ON eh.req_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS reqno, CASE    WHEN       (          SELECT     CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus            FROM             tcltrequest req              INNER JOIN                tpmdperformance_planh eh         ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code           WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC limit 1        )       IS NULL     THEN    'Unverified'    ELSE (        SELECT          CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus         FROM          tcltrequest req           INNER JOIN             tpmdperformance_planh eh              ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'           INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC limit 1 )  END AS status,  (    SELECT       p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'        INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC limit 1  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       eh.form_no     FROM       tpmdperformance_plangen eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS formno, per.company_code, (    SELECT       eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS isfinal, (    SELECT       eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no  where b.reviewee_empid = E.emp_id 	and per.period_code = b.period_code ) AS row_number  ">
        	    </cfif>

        		<cfset LOCAL.lsTable="TEODEMPCOMPANY E INNER JOIN TEOMEMPPERSONAL P ON P.emp_id = E.emp_id  INNER JOIN TEOMPOSITION POS ON POS.position_id = E.position_id AND POS.company_id = E.company_id LEFT JOIN TEOMPOSITION DEP ON DEP.position_id = POS.parent_id AND DEP.company_id = POS.company_id LEFT JOIN TEOMEMPLOYMENTSTATUS ES ON ES.employmentstatus_code = E.employ_code LEFT JOIN TPMMPERIOD PER ON PER.company_code = '#request.scookie.cocode#' LEFT JOIN TPMRPERIODFILTEREMPLOYCODE FEC ON PER.PERIOD_CODE = FEC.period_code AND FEC.employmentstatus_code = E.employ_code LEFT JOIN TPMRPERIODFILTERJOBSTATUSCODE FJS ON FJS.PERIOD_CODE = PER.period_code AND FJS.jobstatuscode = E.job_status_code LEFT JOIN view_jfl JFL ON JFL.period_code = PER.period_code and JFL.EMP_ID = E.EMP_ID and JFL.position_id = E.position_id">
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# and emp_id IN (select reviewee_empid from tpmdperformance_plangen where tpmdperformance_plangen.period_code = periodcode group by reviewee_empid) AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# and emp_id IN (select reviewee_empid from tpmdperformance_plangen where tpmdperformance_plangen.period_code = periodcode group by reviewee_empid) AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                </cfif>
		</cfif>
				<cfif not isStruct(StrckTemp)>
					<cfelse>
						<cfset LOCAL.qTemp = StrckTemp.qLookup>
						<cfif qTemp.recordcount>
							<cfset lsFilter=lsFilter & " AND emp_id IN (#quotedvaluelist(qTemp.nval)#)">
						<cfelse>
							<cfset lsFilter=lsFilter & " AND emp_id IN ('')">
						</cfif>
                </cfif>
               	<cfset lsFilter=lsFilter & " and  (isfinal=1 or isfinal is null or isfinal <> 1 or isfinal =0 and modified_date =(select max(modified_date) from TPMDPERFORMANCE_PLANH b where form_no=b.form_no and periodcode=b.period_code ))">
                <cfset lsFilter=lsFilter & " AND row_number = 0 AND upper(status) <> 'REJECTED' ">
                
                <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD NEQ false >
                    <cfset lsFilter=lsFilter & " AND FORMNO <> '' ">
                </cfif>
                <cfif not isStruct(StrckTemp)>
        		<cfelse>
					 <cfif len(StrckTemp.filterTambahan)><cfset lsFilter=lsFilter & " #StrckTemp.filterTambahan#"></cfif>
				</cfif>
                <cfset ListingData(scParam,{fsort='emp_name,emp_no, formdate ,formname',lsField=lsField,lsTable=lsTable,lsFilter=lsFilter,pid="E.emp_id"})>
				<cfoutput>
					<cfdump var = '#qData#'>
				</cfoutput>
				<!---<cfif request.scookie.cocode eq "hypernet">
					<cf_sfwritelog dump="sqlquery,qdata" prefix="testlg" type="sferr">
				</cfif>   ----->
	</cffunction> --->
	<cffunction name="Listing">
        <cfset LOCAL.sdate = DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),1),"yyyy-mm-dd")>
    	<cfset LOCAL.edate = DATEFORMAT(CreateDate(Datepart("yyyy",now()),12,31),"yyyy-mm-dd")>
    	 <cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),Datepart("d",now())),"yyyy-mm-dd")>
		
        <cfparam name="inp_startdt" default="#nowdate#">
        <cfparam name="inp_enddt" default="#nowdate#">
        
        <cfif request.dbdriver eq "MYSQL">
            <cfset inp_startdt = Dateformat(inp_startdt,"yyyy-mm-dd")>
            <cfset inp_enddt = Dateformat(inp_enddt,"yyyy-mm-dd")>
        </cfif>
        
		<cfset LOCAL.scParam=paramRequest()>
        <cfset Local.StrckTemp = listingFilter(inp_startdt=inp_startdt,inp_enddt=inp_enddt)>
		<cfparam name="status" default="">
		<cfif status neq ""> <cfset scParam['status']= '%#status#%' ><cfelse><cfset scParam['status']= '' ></cfif>	
	    <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false >  <!--- Not Using Pre-generate--->
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsField="  E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#' AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )  )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'  AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )     )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, CONVERT (VARCHAR(10), PER.reference_date, 120) AS refdate,  (    SELECT       TOP 1 req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planH eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'  inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid   WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS reqno, CASE    WHEN       ( SELECT  TOP 1  CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus           FROM             tcltrequest req              INNER JOIN                tpmdperformance_planH eh                 ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code        inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid   WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC        )       IS NULL     THEN       'Not Requested'     ELSE (        SELECT     TOP 1    CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus  FROM          tcltrequest req           INNER JOIN             tpmdperformance_planH eh       ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'     inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid      INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC)  END AS status,  (    SELECT       TOP 1 p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid   INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       TOP 1 eh.form_no     FROM       tpmdperformance_PLANH eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS formno, per.company_code, (    SELECT       TOP 1 eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS isfinal, (    SELECT       TOP 1 eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no  ) AS row_number   ">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN      (  SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, date_format(per.reference_date, '%Y-%c-%d') AS refdate,  (    SELECT       req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planH eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'   inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid   WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS reqno, CASE    WHEN       (          SELECT   CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus         FROM             tcltrequest req              INNER JOIN                tpmdperformance_planH eh                 ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code    inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid        WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC limit 1        )       IS NULL     THEN       'Not Requested'     ELSE (        SELECT    CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE CASE WHEN req.req_no IS NOT NULL and eh.head_status = 0 AND eh.modified_by <> '#REQUEST.SCOOKIE.USER.UNAME#' THEN reqsts.name_#request.scookie.lang# ELSE 'Not Requested' END END END reqstatus   FROM          tcltrequest req           INNER JOIN             tpmdperformance_planH eh              ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'      inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid      INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC limit 1 )  END AS status,  (    SELECT       p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'    inner join teodempcompany empcomp ON empcomp.emp_id = eh.reviewee_empid AND empcomp.position_id = reviewee_posid    INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC limit 1  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       eh.form_no     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS formno, per.company_code, (    SELECT       eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS isfinal, (    SELECT       eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no     where       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code  ) AS row_number  ">
                </cfif>
        		<cfset LOCAL.lsTable="TEODEMPCOMPANY E INNER JOIN TEOMEMPPERSONAL P ON P.emp_id = E.emp_id  INNER JOIN TEOMPOSITION POS ON POS.position_id = E.position_id AND POS.company_id = E.company_id LEFT JOIN TEOMPOSITION DEP ON DEP.position_id = POS.parent_id AND DEP.company_id = POS.company_id LEFT JOIN TEOMEMPLOYMENTSTATUS ES ON ES.employmentstatus_code = E.employ_code LEFT JOIN TPMMPERIOD PER ON PER.company_code = '#request.scookie.cocode#' LEFT JOIN TPMRPERIODFILTEREMPLOYCODE FEC ON PER.PERIOD_CODE = FEC.period_code AND FEC.employmentstatus_code = E.employ_code LEFT JOIN TPMRPERIODFILTERJOBSTATUSCODE FJS ON FJS.PERIOD_CODE = PER.period_code AND FJS.jobstatuscode = E.job_status_code LEFT JOIN view_jfl JFL ON JFL.period_code = PER.period_code and JFL.EMP_ID = E.EMP_ID and JFL.position_id = E.position_id">
            
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsFilter="company_id =#request.scookie.coid# AND ( plan_startdate <= '#inp_enddt#'  AND plan_enddate >= '#inp_startdt#')AND (( JFL_PER <> '-'  AND JFL = EMP_ID)  OR  (  JFL_PER = '-'   ))AND ((EMCOD_PER <> '-'  AND EMCOD = employ_code) OR ( EMCOD_PER = '-'   ))AND ((FJS_PER <> '-'    AND FJS = job_status_code)  OR  (   FJS_PER = '-'   ))">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                </cfif>
               
		<cfelse>  <!--- Pre-generate--->
				
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'    AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )   )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, CONVERT (VARCHAR(10), PER.reference_date, 120) AS refdate,  (    SELECT       TOP 1 req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_plangen eh           ON eh.req_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS reqno, CASE    WHEN       (    SELECT    TOP 1   CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0 AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus          FROM             tcltrequest req              INNER JOIN                tpmdperformance_planh eh                 ON eh.request_no = req.req_no                 AND UPPER(req.req_type) = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code           WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC        )       IS NULL     THEN       'Unverified'     ELSE (        SELECT          TOP 1     CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus    FROM          tcltrequest req     INNER JOIN             tpmdperformance_planh eh   ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'           INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC)  END AS status,  (    SELECT       TOP 1 p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'        INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       TOP 1 eh.form_no     FROM       tpmdperformance_plangen eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC  ) AS formno, per.company_code, (    SELECT       TOP 1 eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS isfinal, (    SELECT       TOP 1 eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC  ) AS modified_date, (    SELECT        count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no       where b.reviewee_empid = E.emp_id 	and per.period_code = b.period_code  ) AS row_number ">
                <cfelseif request.dbdriver eq "MYSQL">
        	         <cfset LOCAL.lsField="   E.company_id, p.full_name AS emp_name, e.emp_id, e.emp_no, '-' AS reqapporder, pos.pos_name_#request.scookie.lang# AS emp_pos, dep.pos_name_#request.scookie.lang# dept, es.employmentstatus_name_#request.scookie.lang# AS employmentstatus, per.period_code, per.period_code AS periodcode, e.employ_code, e.job_status_code,  CASE    WHEN       jfl.period_code IS NULL        AND per.period_code = jfl.period_code        OR jfl.emp_id IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjflcode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'   AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )    )    THEN       '-'     ELSE       per.period_code  END jfl_per,  CASE    WHEN       jfl.emp_id IS NOT NULL        AND jfl.emp_id = e.emp_id     THEN       jfl.emp_id     ELSE       '-'  END jfl,  CASE    WHEN       fec.period_code IS NULL        AND per.period_code = fec.period_code        OR fec.employmentstatus_code IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilteremploycode aa on p.period_code = aa.period_code             WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'     AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )  )    THEN       '-'     ELSE       per.period_code  END emcod_per,  CASE    WHEN       fec.employmentstatus_code IS NOT NULL        AND fec.employmentstatus_code = e.employ_code     THEN       fec.employmentstatus_code     ELSE       '-'  END emcod,  CASE    WHEN       fjs.period_code IS NULL        AND per.period_code = fjs.period_code        OR fjs.jobstatuscode IS NULL        AND per.period_code NOT IN        (          SELECT             p.period_code           FROM             tpmmperiod p          INNER JOIN tpmrperiodfilterjobstatuscode aa on p.period_code = aa.period_code         WHERE  aa.company_code = '#REQUEST.SCOOKIE.COCODE#'  AND ( p.plan_startdate <= '#inp_enddt#' AND p.plan_enddate >= '#inp_startdt#' )     )    THEN       '-'     ELSE       per.period_code  END fjs_per,  CASE    WHEN       fjs.jobstatuscode IS NOT NULL        AND fjs.jobstatuscode = e.job_status_code     THEN       fjs.jobstatuscode     ELSE       '-'  END fjs, per.period_name_#request.scookie.lang# AS formname, per.reference_date AS formdate:date, date_format(per.reference_date, '%Y-%c-%d') AS refdate,  (    SELECT       req.req_no     FROM       tcltrequest req        INNER JOIN          tpmdperformance_plangen eh           ON eh.req_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'     WHERE       req.reqemp = e.emp_id        AND req.company_id = #request.scookie.coid#        AND req.reqemp = eh.reviewee_empid        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS reqno, CASE    WHEN       (          SELECT     CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus            FROM             tcltrequest req              INNER JOIN                tpmdperformance_planh eh         ON eh.request_no = req.req_no                 AND req.req_type = 'PERFORMANCE.PLAN'              INNER JOIN                tgemreqstatus reqsts                 ON req.status = reqsts.code           WHERE             req.reqemp = e.emp_id              AND req.reqemp = e.emp_id              AND req.company_id = #request.scookie.coid#              AND req.reqemp = eh.reviewee_empid              AND eh.period_code = per.period_code           ORDER BY             eh.modified_date DESC limit 1        )       IS NULL     THEN    'Unverified'    ELSE (        SELECT          CASE WHEN req.req_no IS NOT NULL and eh.head_status = 1 THEN reqsts.name_#request.scookie.lang# ELSE CASE WHEN req.req_no IS NOT NULL  and eh.head_status = 0  AND eh.modified_by = '#REQUEST.SCOOKIE.USER.UNAME#' THEN 'Draft' ELSE 'Unverified' END END reqstatus         FROM          tcltrequest req           INNER JOIN             tpmdperformance_planh eh              ON eh.request_no = req.req_no              AND req.req_type = 'PERFORMANCE.PLAN'           INNER JOIN             tgemreqstatus reqsts              ON req.status = reqsts.code        WHERE          req.reqemp = e.emp_id           AND req.company_id = #request.scookie.coid#           AND req.reqemp = eh.reviewee_empid           AND eh.period_code = per.period_code        ORDER BY          eh.modified_date DESC limit 1 )  END AS status,  (    SELECT       p2.full_name     FROM       tcltrequest req        INNER JOIN          tpmdperformance_planh eh           ON eh.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'        INNER JOIN          teomemppersonal p2           ON p2.emp_id = eh.lastreviewer_empid     WHERE       eh.period_code = per.period_code        AND req.reqemp = e.emp_id     ORDER BY       eh.modified_date DESC limit 1  ) AS lastreviewer, per.plan_startdate, per.plan_enddate, (    SELECT       eh.form_no     FROM       tpmdperformance_plangen eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code     ORDER BY       eh.modified_date DESC limit 1  ) AS formno, per.company_code, (    SELECT       eh.isfinal     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS isfinal, (    SELECT       eh.modified_date     FROM       tpmdperformance_planh eh     WHERE       eh.reviewee_empid = e.emp_id        AND eh.period_code = per.period_code        AND eh.company_code = per.company_code     ORDER BY       eh.modified_date DESC limit 1  ) AS modified_date, (    SELECT       count(b.form_no)     FROM       tpmdperformance_planh b        INNER JOIN          tcltrequest req           ON b.request_no = req.req_no           AND req.req_type = 'PERFORMANCE.PLAN'           AND req.company_id = #request.scookie.coid#           AND req.reqemp = b.reviewee_empid           AND req.status <> 5        INNER JOIN          tpmdperformance_evalh eh           ON eh.form_no = b.form_no           AND eh.modified_date < b.modified_date           AND eh.form_no = b.form_no  where b.reviewee_empid = E.emp_id 	and per.period_code = b.period_code ) AS row_number  ">
        	    </cfif>

        		<cfset LOCAL.lsTable="TEODEMPCOMPANY E INNER JOIN TEOMEMPPERSONAL P ON P.emp_id = E.emp_id  INNER JOIN TEOMPOSITION POS ON POS.position_id = E.position_id AND POS.company_id = E.company_id LEFT JOIN TEOMPOSITION DEP ON DEP.position_id = POS.parent_id AND DEP.company_id = POS.company_id LEFT JOIN TEOMEMPLOYMENTSTATUS ES ON ES.employmentstatus_code = E.employ_code LEFT JOIN TPMMPERIOD PER ON PER.company_code = '#request.scookie.cocode#' LEFT JOIN TPMRPERIODFILTEREMPLOYCODE FEC ON PER.PERIOD_CODE = FEC.period_code AND FEC.employmentstatus_code = E.employ_code LEFT JOIN TPMRPERIODFILTERJOBSTATUSCODE FJS ON FJS.PERIOD_CODE = PER.period_code AND FJS.jobstatuscode = E.job_status_code LEFT JOIN view_jfl JFL ON JFL.period_code = PER.period_code and JFL.EMP_ID = E.EMP_ID and JFL.position_id = E.position_id">
                <cfif request.dbdriver eq "MSSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# and emp_id IN (select reviewee_empid from tpmdperformance_plangen INNER JOIN TEODEMPCOMPANY ON TEODEMPCOMPANY.emp_id = reviewee_empid AND TEODEMPCOMPANY.position_id = reviewee_posid AND TEODEMPCOMPANY.company_id = tpmdperformance_plangen.company_id where tpmdperformance_plangen.period_code = periodcode group by reviewee_empid) AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                <cfelseif request.dbdriver eq "MYSQL">
        	        <cfset LOCAL.lsFilter="company_id=#request.scookie.coid# and emp_id IN (select reviewee_empid from tpmdperformance_plangen INNER JOIN TEODEMPCOMPANY ON TEODEMPCOMPANY.emp_id = reviewee_empid AND TEODEMPCOMPANY.position_id = reviewee_posid AND TEODEMPCOMPANY.company_id = tpmdperformance_plangen.company_id where tpmdperformance_plangen.period_code = periodcode group by reviewee_empid) AND (plan_startdate <= '#inp_enddt#' AND plan_enddate >= '#inp_startdt#') AND (( JFL_PER <> '-' AND JFL = EMP_ID) OR (JFL_PER = '-'))  AND ((EMCOD_PER <> '-' AND EMCOD = employ_code) OR (EMCOD_PER ='-'))  AND ((FJS_PER <> '-' AND FJS = job_status_code) OR (FJS_PER ='-'))">
                </cfif>
		</cfif>
				<cfif not isStruct(StrckTemp)>
					<cfelse>
						<cfset LOCAL.qTemp = StrckTemp.qLookup>
						<cfif qTemp.recordcount>
							<cfset lsFilter=lsFilter & " AND emp_id IN (#quotedvaluelist(qTemp.nval)#)">
						<cfelse>
							<cfset lsFilter=lsFilter & " AND emp_id IN ('')">
						</cfif>
                </cfif>
               	<cfset lsFilter=lsFilter & " and  (isfinal=1 or isfinal is null or isfinal <> 1 or isfinal =0 and modified_date =(select max(modified_date) from TPMDPERFORMANCE_PLANH b where form_no=b.form_no and periodcode=b.period_code ))">
                <cfset lsFilter=lsFilter & " AND row_number = 0 AND upper(status) <> 'REJECTED' ">
                
                <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD NEQ false >
                    <cfset lsFilter=lsFilter & " AND FORMNO <> '' ">
                </cfif>
                <cfif not isStruct(StrckTemp)>
        		<cfelse>
					 <cfif len(StrckTemp.filterTambahan)><cfset lsFilter=lsFilter & " #StrckTemp.filterTambahan#"></cfif>
				</cfif>
                <cfset ListingData(scParam,{fsort='emp_name,emp_no, formdate ,formname',lsField=lsField,lsTable=lsTable,lsFilter=lsFilter,pid="E.emp_id"})>
				<cfoutput>
				</cfoutput>	
				<!---<cfif request.scookie.cocode eq "hypernet">
					<cf_sfwritelog dump="sqlquery,qdata" prefix="testlg" type="sferr">
				</cfif>   ----->
	</cffunction>
			<!--- <cffunction name="listingFilter">
				<cfargument name="inp_startdt" default="">
				<cfargument name="inp_enddt" default="">
				<cfparam name="search" default="">
				<cfparam name="getval" default="id">
				<cfparam name="autopick" default="">
				<cfparam name="jsfunc" default="null">
				
				 <cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart('yyyy',now()),Datepart('m',now()),Datepart('d',now())),'yyyy-mm-dd')>
				<cfif inp_startdt eq "">
					 <cfset inp_startdt= DATEFORMAT(CreateDate(Datepart("yyyy",nowdate),Datepart("m",nowdate),Datepart("d",nowdate)),"yyyy-mm-dd")>
				</cfif>
				<cfif inp_enddt eq "">
					 <cfset inp_enddt= DATEFORMAT(CreateDate(Datepart("yyyy",nowdate),Datepart("m",nowdate),Datepart("d",nowdate)),"yyyy-mm-dd")>
				</cfif>
				<cftry>
					<cfset LOCAL.searchText=trim(search)>
					<cfset LOCAL.ObjectApproval="PERFORMANCE.Plan">
					<cfset LOCAL.company_code = REQUEST.SCOOKIE.COCODE>
					<cfset LOCAL.objRequestApproval = CreateObject("component","SFRequestApproval").init(false) />
					<cfset LOCAL.lsValidEmp_id = "">
					<cfset LOCAL.ReqAppOrder = "-">
					<cfset LOCAL.retType = "lsempid">
					<cfset LOCAL.strFilterReqFor = "">
					<cfset LOCAL.arrSqlReqFor= ArrayNew(1) /> 
					<cfset LOCAL.arrsubsql = ArrayNew(1) />
					<cfset LOCAL.arrRevWrd = ArrayNew(1) />
					<cfset LOCAL.isFltEndDt=true />
					<cfset local.strckReturn = structnew()>
					<cfset strckReturn.filterTambahan = "">
					<cfquery name="local.qPeriod" datasource="#request.sdsn#">
						select period_code from tpmmperiod where plan_enddate >= '#inp_startdt#' AND plan_startdate <= '#inp_enddt#' and company_code = '#REQUEST.SCOOKIE.COCODE#'
					</cfquery>
				<cfif autopick eq "" OR autopick eq "yes"><!---Lookup onSearch or onBlur.--->
					<cfquery name="LOCAL.qReqUSelf" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
						SELECT field_name,field_value FROM TCLCAPPCOMPANY WHERE module='Workflow' AND (field_code = 'exrequself' AND ',' #REQUEST.DBSTRCONCAT# field_value #REQUEST.DBSTRCONCAT# ',' like '%,#LOCAL.ObjectApproval#,%')
						AND company_id = <cfqueryparam value="#REQUEST.scookie.COID#" cfsqltype="CF_SQL_INTEGER"/>
					</cfquery>
					<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
							<cfset ReqAppOrder = "-">
							<cfquery name="local.qGetFromPlanGen" datasource="#request.sdsn#">
								select distinct reviewee_empid from tpmdperformance_plangen where reviewer_empid = '#REQUEST.SCookie.User.empid#'
								<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
									AND period_code IN (<cfqueryparam value="#ValueList(qPeriod.period_code)#" list="yes" cfsqltype="cf_sql_varchar">)
								</cfif>
							</cfquery>
							<cfif qGetFromPlanGen.recordcount gt 0 >
								<cfset lsValidEmp_id = ValueList(qGetFromPlanGen.reviewee_empid)>
							</cfif>
					<cfelse>
							<cfquery name="local.qCheckTable1" datasource="#REQUEST.SDSN#">
								select DISTINCT table_name from information_schema.tables where UPPER(table_name) = 'TCALNEWASSIGNMENT' 
							</cfquery>
							<cfif UCASE(qCheckTable1.table_name) eq "TCALNEWASSIGNMENT">
								<cfquery name="qnewassig" datasource="#request.sdsn#">
									SELECT emp_id, position_code, position_id FROM TCALNEWASSIGNMENT WHERE emp_id = '#REQUEST.SCOOKIE.USER.EMPID#'
								</cfquery>
							</cfif>
							<cfset LOCAL.Requester = Application.SFDB.RunQuery("SELECT * FROM VIEW_EMPLOYEE WHERE emp_id = ? AND company_id = ?", [[REQUEST.SCookie.User.EMPID, "CF_SQL_VARCHAR"],[REQUEST.scookie.COID, "CF_SQL_INTEGER"]]).QueryRecords/>
							<cfif APPLICATION.CFMLENGINE neq "Railo">
								<cfif not cacheRegionExists("inpRequestFor")>
									<cfset cacheRegionNew("inpRequestFor")>
								</cfif>
								<cfset LOCAL.scQAttr={cacheregion="inpRequestFor"}>
							<cfelse>
								<cfset LOCAL.scQAttr={}>
							</cfif>
							<cfset LOCAL.strUdrScr=(request.dbdriver eq "MYSQL"?"\_":"_")>
							<cfset LOCAL.filterFrmlSet="request_approval_formula like '%"&replacenocase("EMP_"&requester.emp_no,"_",strUdrScr,"ALL")& "%' ">
							<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase("EMP_CUSTOMFIELD","_",strUdrScr,"ALL")& "%' ">
							<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase("POS_CUSTOMFIELD","_",strUdrScr,"ALL")& "%' ">
							<cfif len(requester.pos_code)>
								<cfset filterFrmlSet &= "OR request_approval_formula like '%"&replacenocase("POS_"&requester.pos_code,"_",strUdrScr,"ALL")& "%' ">
							</cfif>
								<cftry> 
									<cfif qnewassig.recordcount gt 0>
										<cfset filterFrmlSet &= "OR request_approval_formula like '%"&replacenocase("POS_"&qnewassig.position_code,"_",strUdrScr,"ALL")& "%' ">
									</cfif>
									<cfcatch></cfcatch>
								</cftry>
								<cfloop list="spv,mgr" index="LOCAL.idxspvmgr">
									<cfloop list="'',/,+" index="LOCAL.idxprefrm">
										<cfset filterFrmlSet &= " OR request_approval_formula like '%"&idxprefrm&idxspvmgr&"%'">
									</cfloop>
								</cfloop>
								<cfquery name="LOCAL.qReserveWordSet" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
									SELECT reserve_word_code FROM TSFMREQAPPRSRVWORD
								</cfquery>
							<cfloop query="qReserveWordSet">
								<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase(qReserveWordSet.reserve_word_code,"_",strUdrScr,"ALL")&"%'">
							</cfloop>
								<cfloop condition="ListLen(LOCAL.ObjectApproval, '.') GT 0">
									<cfquery name="LOCAL.qRequestApprovalOrder" datasource="#REQUEST.SDSN#" >
										SELECT seq_id,req_order,request_approval_name,request_approval_formula,
												requester fltrequester,requestee fltrequestee FROM	TCLCReqAppSetting
										WHERE	company_id = <cfqueryparam value="#REQUEST.scookie.COID#" cfsqltype="CF_SQL_INTEGER"/>
											AND request_approval_code = <cfqueryparam value="#LOCAL.ObjectApproval#" cfsqltype="CF_SQL_VARCHAR">
											<cfif request.dbdriver eq "ORACLE">
												AND (requester IS not NULL OR requestee is not null)
											<cfelse>
												AND (requester <> '' OR requestee <> '')
											</cfif>
											<cfif len(filterFrmlSet)>AND (#PreserveSingleQuotes(filterFrmlSet)#) </cfif>
										ORDER BY req_order DESC
									</cfquery>
									<cfloop query="qRequestApprovalOrder">
										<cftry>
										<cfset LOCAL.lstRequestee = "" />
										<cfset LOCAL.sqlRequestee = "" />
										<cfset LOCAL.sqlRequester = "" />
										<cfset LOCAL.fltrRequesteeTemp = "" />
										<cfif qRequestApprovalOrder.fltrequestee neq "" AND qRequestApprovalOrder.fltrequestee neq "[GENERAL]">
											<cfset LOCAL.sqlRequestee = REReplace(REReplace(qRequestApprovalOrder.fltrequestee, "'male'",1, "ALL"), "'female'",0, "ALL") />
											<cftry>
												<cfset fltrRequesteeTemp = "SELECT VE.emp_id FROM VIEW_EMPLOYEE VE WHERE " & LOCAL.sqlRequestee />
												<cfset LOCAL.sqlRequestee = Evaluate(DE(LOCAL.sqlRequestee)) />
												<cfquery name="LOCAL.qCekRequestee" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#" attributeCollection=#scQAttr#>
													SELECT emp_id FROM VIEW_EMPLOYEE WHERE (#PreserveSingleQuotes(LOCAL.sqlRequestee)#)
												</cfquery>
												<cfset lstRequestee = ValueList(qCekRequestee.emp_id) />
											<cfcatch>
												<cfset LOCAL.sqlRequestee = ""/>
												<cfset fltrRequesteeTemp = ""/>
												<cfcontinue>
											</cfcatch>
											</cftry>
										</cfif>
										<cfset LOCAL.procValidEmp_id=false />
										<cfif qRequestApprovalOrder.fltrequester neq "" AND qRequestApprovalOrder.fltrequester neq "[GENERAL]">
											<cfset LOCAL.sqlRequester = REReplace(REReplace(qRequestApprovalOrder.fltrequester, "'male'",1, "ALL"), "'female'",0, "ALL") />
											<cftry>
												<cfset LOCAL.sqlRequester = Evaluate(DE(LOCAL.sqlRequester)) />
												<cfquery name="LOCAL.qCekRequester" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#" maxrows="1" attributeCollection=#scQAttr#>
													SELECT emp_id FROM VIEW_EMPLOYEE WHERE emp_id = <cfqueryparam value="#REQUEST.SCookie.User.EMPID#" cfsqltype="CF_SQL_VARCHAR"> AND (#PreserveSingleQuotes(LOCAL.sqlRequester)#)
												</cfquery>
												<cfif qCekRequester.RecordCount>
													<cfset procValidEmp_id=true />
												<cfelse>
													<cfcontinue>
												</cfif>
												<cfcatch>
													
													<cfcontinue>
												</cfcatch>
											</cftry>
										<cfelse>
											<cfset procValidEmp_id=true />
										</cfif>
										<cfif procValidEmp_id>
											<cfset LOCAL.arrEmployee = objRequestApproval.GetEmployeeFromFormula(qRequestApprovalOrder.request_approval_formula, REQUEST.SCookie.User.EMPID, 1, isFltEndDt, -1, retType,requester, requester) />
											<cfif arrayLen(arrEmployee)>
												<cfset LOCAL.idxEmployee = "">
												<cfloop array="#arrEmployee#" index="idxEmployee">
													
													<cfif ListFind(lstRequestee, idxEmployee['emp_id'])>
														<cfif (qRequestApprovalOrder.fltrequestee eq "" or qRequestApprovalOrder.fltrequestee eq "[GENERAL]")>
															<cfif ListFind(lsValidEmp_id, idxEmployee['emp_id']) lt 1>
																<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, idxEmployee['emp_id']) />
															</cfif>
														<cfelseif qRequestApprovalOrder.fltrequestee neq "">
															<cfif ListFind(lsValidEmp_id, idxEmployee['emp_id']) lt 1>
																<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, idxEmployee['emp_id']) />
															</cfif>
														</cfif>
														
													</cfif>
												</cfloop>
											</cfif>
										</cfif>
										
										<cfif Len(lsValidEmp_id)>
											<cfset ReqAppOrder = qRequestApprovalOrder.req_order>
											
										</cfif>
										<cfcatch></cfcatch>
										</cftry>
									</cfloop>
									<cfbreak>
								</cfloop>
							</cfif>
							
							<cfif ListFindNoCase(lsValidEmp_id, REQUEST.SCookie.User.empid) lt 1>
								<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, REQUEST.SCookie.User.empid)/>
							</cfif>
							<cfquery name="local.qTempYan" datasource="#request.sdsn#">
								SELECT EC.emp_id, EH.period_code, REQ.req_no, EH.period_code FROM TCLTREQUEST REQ
								<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
									LEFT JOIN TPMDPERFORMANCE_PLANGEN
								<cfelse>
									LEFT JOIN TPMDPERFORMANCE_PLANH
								</cfif>
								 EH ON  EH.reviewee_empid = REQ.reqemp 
								 <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
									 AND EH.req_no = REQ.req_no
								<cfelse>
									 AND EH.request_no = REQ.req_no
								</cfif>
								
								LEFT JOIN TEODEMPCOMPANY EC ON EC.emp_id = REQ.reqemp AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer"> WHERE UPPER(REQ.req_type) = 'PERFORMANCE.PLAN'
									AND REQ.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
									AND (
										REQ.approval_list LIKE <cfqueryparam value="#request.scookie.user.uid#,%" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list LIKE <cfqueryparam value="%,#request.scookie.user.uid#,%" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list LIKE <cfqueryparam value="%,#request.scookie.user.uid#" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list = <cfqueryparam value="#request.scookie.user.uid#" cfsqltype="cf_sql_varchar">
									)
									<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
										AND EH.period_code IN (<cfqueryparam value="#ValueList(qPeriod.period_code)#" list="yes" cfsqltype="cf_sql_varchar">)
									</cfif>
							</cfquery>
						
							<cfset local.caseDiffAppr = "">
							<cfset local.lstEmpDiffAppr = "">
							<cfset local.lstEmpCaseWhenCond = "">
							<cfset local.lstFilteredPeriod = ValueList(qTempYan.period_code)>
						       <!--- <cfoutput>
										<cfdump var = '#qTempYan#'>		

								</cfoutput>--->
							<cfloop query="qTempYan">
								<cfif ListFind(lsValidEmp_id, qTempYan.emp_id) lt 1 AND qTempYan.emp_id NEQ ''>
									<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, qTempYan.emp_id)/>
								</cfif>
								<cfif ListFind(lstEmpCaseWhenCond, qTempYan.emp_id) lt 1 AND qTempYan.emp_id NEQ ''>
									<cfset lstEmpCaseWhenCond = ListAppend(lstEmpCaseWhenCond, qTempYan.emp_id)/>
									<cfset lstEmpDiffAppr = ListAppend(lstEmpDiffAppr,qTempYan.emp_id)>
									<cfquery name="LOCAL.getPeriodCodeEmpReq" dbtype="query"> <!---Tambahan replace approver--->
										SELECT distinct period_code,req_no FROM qTempYan WHERE EMP_ID = <cfqueryparam value="#qTempYan.emp_id#" cfsqltype="CF_SQL_VARCHAR"/>
									</cfquery>
									<cfset caseDiffAppr = caseDiffAppr & "WHEN emp_id IN ('#qTempYan.emp_id#') AND period_code IN (#getPeriodCodeEmpReq.recordcount neq 0 ? quotedvaluelist(getPeriodCodeEmpReq.period_code) : "'-'"#) THEN 1 ">
								</cfif>
							</cfloop>
							
							<cfif listlen(lstEmpDiffAppr)>
								<cfset LOCAL.filteredReqNo = listRemoveDuplicates(ValueList(qTempYan.req_no))>
								<cfquery name="local.qTempForGetListDiffAppr" datasource="#request.sdsn#">
									SELECT EC.emp_id, EH.period_code, REQ.req_no FROM TCLTREQUEST REQ
									LEFT JOIN TPMDPERFORMANCE_PLANH EH ON  EH.reviewee_empid = REQ.reqemp AND EH.request_no = REQ.req_no
									LEFT JOIN TEODEMPCOMPANY EC ON EC.emp_id = REQ.reqemp AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer"> WHERE UPPER(REQ.req_type) = 'PERFORMANCE.PLAN'
										AND REQ.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
										<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
											AND EH.period_code IN (<cfqueryparam value="#listRemoveDuplicates(ValueList(qPeriod.period_code))#" list="yes" cfsqltype="cf_sql_varchar">)
										</cfif>
										<cfif filteredReqNo NEQ ''>
											AND (#Application.SFUtil.CutList(ListQualify(filteredReqNo,"'")," REQ.req_no NOT IN  ","AND",2)#)
										<cfelse>
											AND 1 = 0
										</cfif>
								</cfquery>
								<cfset LOCAL.lstFilterReq = ValueList(qTempForGetListDiffAppr.req_no)>
								<cfset lstFilterReq = lstFilterReq NEQ '' ? ListQualify(lstFilterReq,"'",",") : "'-'" >
								<cfset lstEmpDiffAppr = lstEmpDiffAppr NEQ '' ? ListQualify(lstEmpDiffAppr,"'",",") : "'-'">
								<cfset lstFilteredPeriod = lstFilteredPeriod NEQ '' ? ListQualify(lstFilteredPeriod,"'",",") : "'-'">
								<!----<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN reqno IN (#lstFilterReq#) AND emp_id <> '#REQUEST.SCookie.User.EMPID#' THEN 0 WHEN emp_id = '#REQUEST.SCookie.User.EMPID#' THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 ELSE 0 END">--->
								<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN emp_id IN (#lstEmpDiffAppr#)  AND period_code NOT IN (#lstFilteredPeriod#)  THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 WHEN reqno is null then 1 WHEN reqno = '' then 1 ELSE 0 END">  
					
								<!---	<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN emp_id IN (#lstEmpDiffAppr#)  AND period_code NOT IN (#lstFilteredPeriod#)  THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 ELSE 0 END">  
							--->
							</cfif>
							<!---<cfdump var='#lstEmpDiffAppr#'>
							<cfdump var='#lstFilteredPeriod#'>--->

		
							<cfset local.strckReturn = structnew()>
							<cfset strckReturn.filterTambahan = caseDiffAppr>
		
							<cfset LOCAL.arrValue = ArrayNew(1)/>
							<cfsavecontent variable="LOCAL.sqlQuery">
								<cfoutput>
								SELECT DISTINCT E.emp_id nval, #Application.SFUtil.DBConcat(["E.full_name","' ['","EC.emp_no","']'"])# ntitle 
								FROM TEOMEmpPersonal E INNER JOIN TEODEmpCompany EC ON E.emp_id= EC.emp_id 
								WHERE 
									<cfif REQUEST.Scookie.User.UTYPE neq 9>
										EC.company_id = ? <cfset ArrayAppend(arrValue, [REQUEST.SCookie.COID, "cf_sql_integer"])/> 
										AND (EC.end_date >= ? <cfset ArrayAppend(arrValue, [CreateODBCDate(Now()), "CF_SQL_TIMESTAMP"])/> OR EC.end_date IS NULL) 
										<cfif len(searchText) AND searchText neq "???">
											AND (
												E.full_name LIKE ? <cfset ArrayAppend(arrValue, ["%#searchText#%", "CF_SQL_VARCHAR"])/> 
												OR EC.emp_no = ? <cfset ArrayAppend(arrValue, ["#searchText#", "CF_SQL_VARCHAR"])/>
											) 
										</cfif>
										<cfif len(lsValidEmp_id)>
											AND ( 
												<cfset LOCAL.arrValidEmp_id = listToArray(lsValidEmp_id,",") />
												<cfset LOCAL.lsLimit = 1000 />
												<cfloop index="LOCAL.idx" from="1" to="#arrayLen(arrValidEmp_id)#" step="#lsLimit#">
													<cfif idx gt 1>OR</cfif> E.emp_id IN (<cfloop index="LOCAL.sub" from="#idx#" to="#idx+(lsLimit-1)#" step="1"><cfif not arrayisdefined(arrValidEmp_id,sub)><cfbreak></cfif><cfif sub gt idx>,</cfif>'#arrValidEmp_id[sub]#'</cfloop>)
												</cfloop>
											)
										</cfif>
										<cfif qReqUSelf.recordcount>
											AND (E.emp_id != ? <cfset ArrayAppend(arrValue, [REQUEST.SCookie.User.EMPID, "CF_SQL_VARCHAR"])/>)
										</cfif>
									<cfelse>
										1=0
									</cfif>
								ORDER BY ntitle
								</cfoutput>
							</cfsavecontent>
				</cfif>
				
				<cfset LOCAL.qLookup = queryNew("nval,ntitle","Varchar,Varchar")>
				<cfset LOCAL.resultQuery = Application.SFDB.RunQuery(sqlQuery, arrValue)/>
				<cfif resultQuery.QueryResult>
					<cfset qLookup = resultQuery.QueryRecords/>
					<cfset LOCAL.vSQL = resultQuery.QueryStruck/>
					<cfset strckReturn.qLookup = qLookup>
					<cfset strckReturn.ReqAppOrder = ReqAppOrder>
					<cfreturn strckReturn>
				<cfelse>
					<cfreturn 0>
				</cfif>
				<cfcatch>
					<cfreturn 0>
				</cfcatch>
				</cftry>
			</cffunction> --->
			<cffunction name="listingFilter">
				<cfargument name="inp_startdt" default="">
				<cfargument name="inp_enddt" default="">
				<cfparam name="search" default="">
				<cfparam name="getval" default="id">
				<cfparam name="autopick" default="">
				<cfparam name="jsfunc" default="null">
				
				 <cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart('yyyy',now()),Datepart('m',now()),Datepart('d',now())),'yyyy-mm-dd')>
				<cfif inp_startdt eq "">
					 <cfset inp_startdt= DATEFORMAT(CreateDate(Datepart("yyyy",nowdate),Datepart("m",nowdate),Datepart("d",nowdate)),"yyyy-mm-dd")>
				</cfif>
				<cfif inp_enddt eq "">
					 <cfset inp_enddt= DATEFORMAT(CreateDate(Datepart("yyyy",nowdate),Datepart("m",nowdate),Datepart("d",nowdate)),"yyyy-mm-dd")>
				</cfif>
				<cftry>
					<cfset LOCAL.searchText=trim(search)>
					<cfset LOCAL.ObjectApproval="PERFORMANCE.Plan">
					<cfset LOCAL.company_code = REQUEST.SCOOKIE.COCODE>
					<cfset LOCAL.objRequestApproval = CreateObject("component","SFRequestApproval").init(false) />
					<cfset LOCAL.lsValidEmp_id = "">
					<cfset LOCAL.ReqAppOrder = "-">
					<cfset LOCAL.retType = "lsempid">
					<cfset LOCAL.strFilterReqFor = "">
					<cfset LOCAL.arrSqlReqFor= ArrayNew(1) /> 
					<cfset LOCAL.arrsubsql = ArrayNew(1) />
					<cfset LOCAL.arrRevWrd = ArrayNew(1) />
					<cfset LOCAL.isFltEndDt=true />
					<cfset local.strckReturn = structnew()>
					<cfset strckReturn.filterTambahan = "">
					<cfquery name="local.qPeriod" datasource="#request.sdsn#">
						select period_code from tpmmperiod where plan_enddate >= '#inp_startdt#' AND plan_startdate <= '#inp_enddt#' and company_code = '#REQUEST.SCOOKIE.COCODE#'
					</cfquery>
				<cfif autopick eq "" OR autopick eq "yes"><!---Lookup onSearch or onBlur.--->
					<cfquery name="LOCAL.qReqUSelf" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
						SELECT field_name,field_value FROM TCLCAPPCOMPANY WHERE module='Workflow' AND (field_code = 'exrequself' AND ',' #REQUEST.DBSTRCONCAT# field_value #REQUEST.DBSTRCONCAT# ',' like '%,#LOCAL.ObjectApproval#,%')
						AND company_id = <cfqueryparam value="#REQUEST.scookie.COID#" cfsqltype="CF_SQL_INTEGER"/>
					</cfquery>
					<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
							<cfset ReqAppOrder = "-">
							<cfquery name="local.qGetFromPlanGen" datasource="#request.sdsn#">
								select distinct reviewee_empid from tpmdperformance_plangen where reviewer_empid = '#REQUEST.SCookie.User.empid#'
								<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
									AND period_code IN (<cfqueryparam value="#ValueList(qPeriod.period_code)#" list="yes" cfsqltype="cf_sql_varchar">)
								</cfif>
							</cfquery>
							<cfif qGetFromPlanGen.recordcount gt 0 >
								<cfset lsValidEmp_id = ValueList(qGetFromPlanGen.reviewee_empid)>
							</cfif>
					<cfelse>
							<cfquery name="local.qCheckTable1" datasource="#REQUEST.SDSN#">
								select DISTINCT table_name from information_schema.tables where UPPER(table_name) = 'TCALNEWASSIGNMENT' 
							</cfquery>
							<cfif UCASE(qCheckTable1.table_name) eq "TCALNEWASSIGNMENT">
								<cfquery name="qnewassig" datasource="#request.sdsn#">
									SELECT emp_id, position_code, position_id FROM TCALNEWASSIGNMENT WHERE emp_id = '#REQUEST.SCOOKIE.USER.EMPID#'
								</cfquery>
							</cfif>
							<cfset LOCAL.Requester = Application.SFDB.RunQuery("SELECT * FROM VIEW_EMPLOYEE WHERE emp_id = ? AND company_id = ?", [[REQUEST.SCookie.User.EMPID, "CF_SQL_VARCHAR"],[REQUEST.scookie.COID, "CF_SQL_INTEGER"]]).QueryRecords/>
							<cfif APPLICATION.CFMLENGINE neq "Railo">
								<cfif not cacheRegionExists("inpRequestFor")>
									<cfset cacheRegionNew("inpRequestFor")>
								</cfif>
								<cfset LOCAL.scQAttr={cacheregion="inpRequestFor"}>
							<cfelse>
								<cfset LOCAL.scQAttr={}>
							</cfif>
							<cfset LOCAL.strUdrScr=(request.dbdriver eq "MYSQL"?"\_":"_")>
							<cfset LOCAL.filterFrmlSet="request_approval_formula like '%"&replacenocase("EMP_"&requester.emp_no,"_",strUdrScr,"ALL")& "%' ">
							<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase("EMP_CUSTOMFIELD","_",strUdrScr,"ALL")& "%' ">
							<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase("POS_CUSTOMFIELD","_",strUdrScr,"ALL")& "%' ">
							<cfif len(requester.pos_code)>
								<cfset filterFrmlSet &= "OR request_approval_formula like '%"&replacenocase("POS_"&requester.pos_code,"_",strUdrScr,"ALL")& "%' ">
							</cfif>
								<cftry> 
									<cfif qnewassig.recordcount gt 0>
										<cfset filterFrmlSet &= "OR request_approval_formula like '%"&replacenocase("POS_"&qnewassig.position_code,"_",strUdrScr,"ALL")& "%' ">
									</cfif>
									<cfcatch></cfcatch>
								</cftry>
								<cfloop list="spv,mgr" index="LOCAL.idxspvmgr">
									<cfloop list="'',/,+" index="LOCAL.idxprefrm">
										<cfset filterFrmlSet &= " OR request_approval_formula like '%"&idxprefrm&idxspvmgr&"%'">
									</cfloop>
								</cfloop>
								<cfquery name="LOCAL.qReserveWordSet" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
									SELECT reserve_word_code FROM TSFMREQAPPRSRVWORD
								</cfquery>
							<cfloop query="qReserveWordSet">
								<cfset filterFrmlSet &= " OR request_approval_formula like '%"&replacenocase(qReserveWordSet.reserve_word_code,"_",strUdrScr,"ALL")&"%'">
							</cfloop>
								<cfloop condition="ListLen(LOCAL.ObjectApproval, '.') GT 0">
									<cfquery name="LOCAL.qRequestApprovalOrder" datasource="#REQUEST.SDSN#" >
										SELECT seq_id,req_order,request_approval_name,request_approval_formula,
												requester fltrequester,requestee fltrequestee FROM	TCLCReqAppSetting
										WHERE	company_id = <cfqueryparam value="#REQUEST.scookie.COID#" cfsqltype="CF_SQL_INTEGER"/>
											AND request_approval_code = <cfqueryparam value="#LOCAL.ObjectApproval#" cfsqltype="CF_SQL_VARCHAR">
											<cfif request.dbdriver eq "ORACLE">
												AND (requester IS not NULL OR requestee is not null)
											<cfelse>
												AND (requester <> '' OR requestee <> '')
											</cfif>
											<cfif len(filterFrmlSet)>AND (#PreserveSingleQuotes(filterFrmlSet)#) </cfif>
										ORDER BY req_order DESC
									</cfquery>
									<cfloop query="qRequestApprovalOrder">
										<cftry>
										<cfset LOCAL.lstRequestee = "" />
										<cfset LOCAL.sqlRequestee = "" />
										<cfset LOCAL.sqlRequester = "" />
										<cfset LOCAL.fltrRequesteeTemp = "" />
										<cfif qRequestApprovalOrder.fltrequestee neq "" AND qRequestApprovalOrder.fltrequestee neq "[GENERAL]">
											<cfset LOCAL.sqlRequestee = REReplace(REReplace(qRequestApprovalOrder.fltrequestee, "'male'",1, "ALL"), "'female'",0, "ALL") />
											<cftry>
												<cfset fltrRequesteeTemp = "SELECT VE.emp_id FROM VIEW_EMPLOYEE VE WHERE " & LOCAL.sqlRequestee />
												<cfset LOCAL.sqlRequestee = Evaluate(DE(LOCAL.sqlRequestee)) />
												<cfquery name="LOCAL.qCekRequestee" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#" attributeCollection=#scQAttr#>
													SELECT emp_id FROM VIEW_EMPLOYEE WHERE (#PreserveSingleQuotes(LOCAL.sqlRequestee)#)
												</cfquery>
												<cfset lstRequestee = ValueList(qCekRequestee.emp_id) />
											<cfcatch>
												<cfset LOCAL.sqlRequestee = ""/>
												<cfset fltrRequesteeTemp = ""/>
												<cfcontinue>
											</cfcatch>
											</cftry>
										</cfif>
										<cfset LOCAL.procValidEmp_id=false />
										<cfif qRequestApprovalOrder.fltrequester neq "" AND qRequestApprovalOrder.fltrequester neq "[GENERAL]">
											<cfset LOCAL.sqlRequester = REReplace(REReplace(qRequestApprovalOrder.fltrequester, "'male'",1, "ALL"), "'female'",0, "ALL") />
											<cftry>
												<cfset LOCAL.sqlRequester = Evaluate(DE(LOCAL.sqlRequester)) />
												<cfquery name="LOCAL.qCekRequester" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#" maxrows="1" attributeCollection=#scQAttr#>
													SELECT emp_id FROM VIEW_EMPLOYEE WHERE emp_id = <cfqueryparam value="#REQUEST.SCookie.User.EMPID#" cfsqltype="CF_SQL_VARCHAR"> AND (#PreserveSingleQuotes(LOCAL.sqlRequester)#)
												</cfquery>
												<cfif qCekRequester.RecordCount>
													<cfset procValidEmp_id=true />
												<cfelse>
													<cfcontinue>
												</cfif>
												<cfcatch>
													
													<cfcontinue>
												</cfcatch>
											</cftry>
										<cfelse>
											<cfset procValidEmp_id=true />
										</cfif>
										<cfif procValidEmp_id>
											<cfset LOCAL.arrEmployee = objRequestApproval.GetEmployeeFromFormula(qRequestApprovalOrder.request_approval_formula, REQUEST.SCookie.User.EMPID, 1, isFltEndDt, -1, retType,requester, requester) />
											<cfif arrayLen(arrEmployee)>
												<cfset LOCAL.idxEmployee = "">
												<cfloop array="#arrEmployee#" index="idxEmployee">
													
													<cfif ListFind(lstRequestee, idxEmployee['emp_id'])>
														<cfif (qRequestApprovalOrder.fltrequestee eq "" or qRequestApprovalOrder.fltrequestee eq "[GENERAL]")>
															<cfif ListFind(lsValidEmp_id, idxEmployee['emp_id']) lt 1>
																<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, idxEmployee['emp_id']) />
															</cfif>
														<cfelseif qRequestApprovalOrder.fltrequestee neq "">
															<cfif ListFind(lsValidEmp_id, idxEmployee['emp_id']) lt 1>
																<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, idxEmployee['emp_id']) />
															</cfif>
														</cfif>
														
													</cfif>
												</cfloop>
											</cfif>
										</cfif>
										
										<cfif Len(lsValidEmp_id)>
											<cfset ReqAppOrder = qRequestApprovalOrder.req_order>
											
										</cfif>
										<cfcatch></cfcatch>
										</cftry>
									</cfloop>
									<cfbreak>
								</cfloop>
							</cfif>
							
							<cfif ListFindNoCase(lsValidEmp_id, REQUEST.SCookie.User.empid) lt 1>
								<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, REQUEST.SCookie.User.empid)/>
							</cfif>
							<cfquery name="local.qTempYan" datasource="#request.sdsn#">
								SELECT EC.emp_id, EH.period_code, REQ.req_no, EH.period_code FROM TCLTREQUEST REQ
								<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
									LEFT JOIN TPMDPERFORMANCE_PLANGEN
								<cfelse>
									LEFT JOIN TPMDPERFORMANCE_PLANH
								</cfif>
								 EH ON  EH.reviewee_empid = REQ.reqemp 
								 <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
									 AND EH.req_no = REQ.req_no
								<cfelse>
									 AND EH.request_no = REQ.req_no
								</cfif>
								
								LEFT JOIN TEODEMPCOMPANY EC ON EC.emp_id = REQ.reqemp AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer"> WHERE UPPER(REQ.req_type) = 'PERFORMANCE.PLAN'
									AND REQ.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
									AND (
										REQ.approval_list LIKE <cfqueryparam value="#request.scookie.user.uid#,%" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list LIKE <cfqueryparam value="%,#request.scookie.user.uid#,%" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list LIKE <cfqueryparam value="%,#request.scookie.user.uid#" cfsqltype="cf_sql_varchar">
										OR
										REQ.approval_list = <cfqueryparam value="#request.scookie.user.uid#" cfsqltype="cf_sql_varchar">
									)
									<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
										AND EH.period_code IN (<cfqueryparam value="#ValueList(qPeriod.period_code)#" list="yes" cfsqltype="cf_sql_varchar">)
									</cfif>
							</cfquery>
						
							<cfset local.caseDiffAppr = "">
							<cfset local.lstEmpDiffAppr = "">
							<cfset local.lstEmpCaseWhenCond = "">
							<cfset local.lstFilteredPeriod = ValueList(qTempYan.period_code)>
						
							<cfloop query="qTempYan">
								<cfif ListFind(lsValidEmp_id, qTempYan.emp_id) lt 1 AND qTempYan.emp_id NEQ ''>
									<cfset lsValidEmp_id = ListAppend(lsValidEmp_id, qTempYan.emp_id)/>
								</cfif>
								<cfif ListFind(lstEmpCaseWhenCond, qTempYan.emp_id) lt 1 AND qTempYan.emp_id NEQ ''>
									<cfset lstEmpCaseWhenCond = ListAppend(lstEmpCaseWhenCond, qTempYan.emp_id)/>
									<cfset lstEmpDiffAppr = ListAppend(lstEmpDiffAppr,qTempYan.emp_id)>
									<cfquery name="LOCAL.getPeriodCodeEmpReq" dbtype="query"> <!---Tambahan replace approver--->
										SELECT distinct period_code,req_no FROM qTempYan WHERE EMP_ID = <cfqueryparam value="#qTempYan.emp_id#" cfsqltype="CF_SQL_VARCHAR"/>
									</cfquery>
									<cfset caseDiffAppr = caseDiffAppr & "WHEN emp_id IN ('#qTempYan.emp_id#') AND period_code IN (#getPeriodCodeEmpReq.recordcount neq 0 ? quotedvaluelist(getPeriodCodeEmpReq.period_code) : "'-'"#) THEN 1 ">
								</cfif>
							</cfloop>
							
							<cfif listlen(lstEmpDiffAppr)>
								<cfset LOCAL.filteredReqNo = listRemoveDuplicates(ValueList(qTempYan.req_no))>
								<cfquery name="local.qTempForGetListDiffAppr" datasource="#request.sdsn#">
									SELECT EC.emp_id, EH.period_code, REQ.req_no FROM TCLTREQUEST REQ
									LEFT JOIN TPMDPERFORMANCE_PLANH EH ON  EH.reviewee_empid = REQ.reqemp AND EH.request_no = REQ.req_no
									LEFT JOIN TEODEMPCOMPANY EC ON EC.emp_id = REQ.reqemp AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer"> WHERE UPPER(REQ.req_type) = 'PERFORMANCE.PLAN'
										AND REQ.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
										<cfif qPeriod.recordcount gt 0 and qPeriod.period_code neq "">
											AND EH.period_code IN (<cfqueryparam value="#listRemoveDuplicates(ValueList(qPeriod.period_code))#" list="yes" cfsqltype="cf_sql_varchar">)
										</cfif>
										<cfif filteredReqNo NEQ ''>
											AND (#Application.SFUtil.CutList(ListQualify(filteredReqNo,"'")," REQ.req_no NOT IN  ","AND",2)#)
										<cfelse>
											AND 1 = 0
										</cfif>
								</cfquery>
								<cfset LOCAL.lstFilterReq = ValueList(qTempForGetListDiffAppr.req_no)>
								<cfset lstFilterReq = lstFilterReq NEQ '' ? ListQualify(lstFilterReq,"'",",") : "'-'" >
								<cfset lstEmpDiffAppr = lstEmpDiffAppr NEQ '' ? ListQualify(lstEmpDiffAppr,"'",",") : "'-'">
								<cfset lstFilteredPeriod = lstFilteredPeriod NEQ '' ? ListQualify(lstFilteredPeriod,"'",",") : "'-'">
								<!----<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN reqno IN (#lstFilterReq#) AND emp_id <> '#REQUEST.SCookie.User.EMPID#' THEN 0 WHEN emp_id = '#REQUEST.SCookie.User.EMPID#' THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 ELSE 0 END">--->
								<!---	<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN emp_id IN (#lstEmpDiffAppr#)  AND period_code NOT IN (#lstFilteredPeriod#)  THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 ELSE 0 END">  
							    --->
								<cfset caseDiffAppr = "AND 1 = CASE " & caseDiffAppr & " WHEN emp_id IN (#lstEmpDiffAppr#)  AND period_code NOT IN (#lstFilteredPeriod#)  THEN 1 WHEN emp_id NOT IN (#lstEmpDiffAppr#) THEN 1 WHEN reqno is null then 1 WHEN reqno = ''  then 1  when status <> '' then 1 ELSE 0 END">  
					
								</cfif>
		
		
							<cfset local.strckReturn = structnew()>
							<cfset strckReturn.filterTambahan = caseDiffAppr>
		
							<cfset LOCAL.arrValue = ArrayNew(1)/>
							<cfsavecontent variable="LOCAL.sqlQuery">
								<cfoutput>
								SELECT DISTINCT E.emp_id nval, #Application.SFUtil.DBConcat(["E.full_name","' ['","EC.emp_no","']'"])# ntitle 
								FROM TEOMEmpPersonal E INNER JOIN TEODEmpCompany EC ON E.emp_id= EC.emp_id 
								WHERE 
									<cfif REQUEST.Scookie.User.UTYPE neq 9>
										EC.company_id = ? <cfset ArrayAppend(arrValue, [REQUEST.SCookie.COID, "cf_sql_integer"])/> 
										AND (EC.end_date >= ? <cfset ArrayAppend(arrValue, [CreateODBCDate(Now()), "CF_SQL_TIMESTAMP"])/> OR EC.end_date IS NULL) 
										<cfif len(searchText) AND searchText neq "???">
											AND (
												E.full_name LIKE ? <cfset ArrayAppend(arrValue, ["%#searchText#%", "CF_SQL_VARCHAR"])/> 
												OR EC.emp_no = ? <cfset ArrayAppend(arrValue, ["#searchText#", "CF_SQL_VARCHAR"])/>
											) 
										</cfif>
										<cfif len(lsValidEmp_id)>
											AND ( 
												<cfset LOCAL.arrValidEmp_id = listToArray(lsValidEmp_id,",") />
												<cfset LOCAL.lsLimit = 1000 />
												<cfloop index="LOCAL.idx" from="1" to="#arrayLen(arrValidEmp_id)#" step="#lsLimit#">
													<cfif idx gt 1>OR</cfif> E.emp_id IN (<cfloop index="LOCAL.sub" from="#idx#" to="#idx+(lsLimit-1)#" step="1"><cfif not arrayisdefined(arrValidEmp_id,sub)><cfbreak></cfif><cfif sub gt idx>,</cfif>'#arrValidEmp_id[sub]#'</cfloop>)
												</cfloop>
											)
										</cfif>
										<cfif qReqUSelf.recordcount>
											AND (E.emp_id != ? <cfset ArrayAppend(arrValue, [REQUEST.SCookie.User.EMPID, "CF_SQL_VARCHAR"])/>)
										</cfif>
									<cfelse>
										1=0
									</cfif>
								ORDER BY ntitle
								</cfoutput>
							</cfsavecontent>
				</cfif>
				
				<cfset LOCAL.qLookup = queryNew("nval,ntitle","Varchar,Varchar")>
				<cfset LOCAL.resultQuery = Application.SFDB.RunQuery(sqlQuery, arrValue)/>
				<cfif resultQuery.QueryResult>
					<cfset qLookup = resultQuery.QueryRecords/>
					<cfset LOCAL.vSQL = resultQuery.QueryStruck/>
					<cfset strckReturn.qLookup = qLookup>
					<cfset strckReturn.ReqAppOrder = ReqAppOrder>
					<cfreturn strckReturn>
				<cfelse>
					<cfreturn 0>
				</cfif>
				<cfcatch>
					<cfreturn 0>
				</cfcatch>
				</cftry>
			</cffunction>	
	<cffunction name="getApprovalOrder">
	    <cfargument name="reviewee" default="">
	    <cfargument name="reviewer" default="">
		<cfset LOCAL.ObjectApproval="PERFORMANCE.PLAN">
		<cfset LOCAL.company_code = REQUEST.SCOOKIE.COCODE>
		<cfset LOCAL.objRequestApproval = CreateObject("component","SFRequestApproval").init(false) />
	    <cfset Local.reqorder = "-">
		<cfquery name="LOCAL.qRequestApprovalOrder" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
			SELECT seq_id,req_order,request_approval_name,request_approval_formula,requester,requestee
			FROM	TCLCReqAppSetting WHERE	company_id = <cfqueryparam value="#REQUEST.scookie.COID#" cfsqltype="CF_SQL_INTEGER"/>
				AND request_approval_code = <cfqueryparam value="#LOCAL.ObjectApproval#" cfsqltype="CF_SQL_VARCHAR">
				AND (requester <> '' OR requestee <> '')
			ORDER BY request_approval_code DESC, req_order DESC, requester DESC, requestee DESC
		</cfquery>
		
		<cfloop query="qRequestApprovalOrder">
		    <cfset LOCAL.isValidReviewee = false>
		    <cfset LOCAL.isValidReviewer = false>
			<cfset LOCAL.lstRequestee = "" />
			<cfif qRequestApprovalOrder.requestee neq "" AND qRequestApprovalOrder.requestee neq "[GENERAL]">
				<cfset qRequestApprovalOrder.requestee = REReplace(qRequestApprovalOrder.requestee, "'male'",1, "ALL") />
				<cfset qRequestApprovalOrder.requestee = REReplace(qRequestApprovalOrder.requestee, "'female'",0, "ALL") />
				<cfquery name="LOCAL.qCekRequestee" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
					SELECT	emp_id FROM	VIEW_EMPLOYEE WHERE	#PreserveSingleQuotes(qRequestApprovalOrder.requestee)#
				</cfquery>
				<cfset lstRequestee = ValueList(qCekRequestee.emp_id) />
			<cfelse>
				<cfset LOCAL.arrEmployee = objRequestApproval.GetEmployeeFromFormula(strRequestApprovalFormula=qRequestApprovalOrder.request_approval_formula, strEmpId=arguments.reviewer, iEmpType=1,retType="lsempid") />
				<cfset LOCAL.idxEmployee = "">
				<cfloop array="#arrEmployee#" index="idxEmployee">
					<cfif not ListFindNoCase(lstRequestee, idxEmployee['emp_id'])>
						<cfset lstRequestee = ListAppend(lstRequestee, idxEmployee['emp_id']) />
					</cfif>
				</cfloop>
			</cfif>
            <cfset LOCAL.procValidEmp_id=false />
			<cfif qRequestApprovalOrder.requester neq "" AND qRequestApprovalOrder.requester neq "[GENERAL]">
				<cfset qRequestApprovalOrder.requester = REReplace(qRequestApprovalOrder.requester, "'male'",1, "ALL") />
				<cfset qRequestApprovalOrder.requester = REReplace(qRequestApprovalOrder.requester, "'female'",0, "ALL") />
				<cfquery name="LOCAL.qCekRequester" datasource="#REQUEST.SDSN#" debug="#REQUEST.ISDEBUG#">
					SELECT	emp_id FROM	VIEW_EMPLOYEE WHERE	emp_id = <cfqueryparam value="#REQUEST.SCookie.User.EMPID#" cfsqltype="CF_SQL_VARCHAR"> AND #PreserveSingleQuotes(qRequestApprovalOrder.requester)#
				</cfquery>
				<cfif qCekRequester.RecordCount>
					<cfset procValidEmp_id=true />
				</cfif>
			<cfelse>
				<cfset procValidEmp_id=true />
			</cfif>
            <cfset LOCAL.IsValidRequester=false />
			<cfif procValidEmp_id>
			    <cfset LOCAL.arrEmployee = objRequestApproval.GetEmployeeFromFormula(strRequestApprovalFormula=qRequestApprovalOrder.request_approval_formula, strEmpId=REQUEST.SCookie.User.EMPID, iEmpType=1,retType="lsempid") />
			    <cfif ArrayLen(arrEmployee)>
                    <cfset IsValidRequester=true />
			    </cfif>
			</cfif>
			<cfif listfindnocase(lstRequestee,arguments.reviewee) AND (IsValidRequester OR arguments.reviewee EQ arguments.reviewer)> <!--- (TCK0918-196855 Cek apakah requester ada | IsValidRequester) (TCK1018-197363 - Jika requester sebagai requestee maka ambil workflow terakhir) --->
			    <cfset LOCAL.reqorder = qRequestApprovalOrder.req_order>
			    <cfbreak>
			</cfif>
		</cfloop>
	    <cfreturn reqorder>
	</cffunction>
	<cffunction name="getEmpFormData">
    	<cfargument name="empid" default="">
        <cfargument name="periodcode" default="">
        <cfargument name="refdate" default="">
        <cfargument name="compcode" default="">
        <cfargument name="reqno" default="">
        <cfargument name="formno" default="">
        <cfargument name="reviewerempid" default="">
        <cfargument name="flagparent" default=""> <!---riz--->
        <cfargument name="posid" default="">
        <cfargument name="varcoid" default="#request.scookie.coid#" required="No">
        <cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
        <cfquery name="Local.qGetEmpAttr" datasource="#request.sdsn#">
        	SELECT EC.position_id AS posid, POS.dept_id AS deptid, POS.jobtitle_code AS jtcode
			FROM TEODEMPCOMPANY EC LEFT JOIN TEOMPOSITION POS ON POS.position_id = EC.position_id AND POS.company_id = EC.company_id
			WHERE EC.emp_id = <cfqueryparam value="#arguments.empid#" cfsqltype="cf_sql_varchar">
				AND EC.company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfif ucase(compcode) eq "ORGKPI">
	        <cfset local.empposid = qGetEmpAttr.deptid>
        <cfelse>
	        <cfset local.empposid = qGetEmpAttr.posid>
        </cfif>
        <cfif len(empposid) eq 0>
            <cfset empposid = -1>
        </cfif>
        
        <cfif request.dbdriver eq "MSSQL">
       	<cfquery name="Local.qGetKPIDefault" datasource="#request.sdsn#">
           	WITH KPILibHier (kpilib_code,parent_code,kpi_name, depth, iscategory,order_no,lib_order,libdesc,is_definded_lib, lookup_code, isnew,notes)
			AS ( SELECT K.kpilib_code, K.parent_code, K.kpi_name_#request.scookie.lang#, K.kpi_depth, K.iscategory, K.order_no, K.order_no lib_order,K.kpi_desc_#request.scookie.lang# libdesc,'' is_definded_lib, '' lookup_code ,'N' isnew,'' notes 
				FROM TPMDPERIODKPILIB K INNER JOIN TPMDPERIODKPI PK
					ON PK.period_code = K.period_code
					AND PK.company_code =K.company_code
					AND PK.reference_date = K.reference_date
					<cfif arguments.flagparent eq 1> <!---riz--->
					AND PK.position_id = <cfqueryparam value="#arguments.posid#" cfsqltype="cf_sql_integer">
					<cfelse>
					AND PK.position_id = <cfqueryparam value="#empposid#" cfsqltype="cf_sql_integer">
					</cfif>
					AND PK.kpilib_code = K.kpilib_code
				WHERE PK.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
					AND PK.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
					AND PK.reference_date = <cfqueryparam value="#arguments.refdate#" cfsqltype="cf_sql_timestamp">
                       <cfif ucase(compcode) eq "PERSKPI">
                        AND UPPER(PK.kpi_type) = 'PERSONAL'
                       <cfelse>
                        AND UPPER(PK.kpi_type) = 'ORGUNIT'
                       </cfif>
				UNION ALL
				SELECT A.kpilib_code, A.parent_code, A.kpi_name_#request.scookie.lang#, A.kpi_depth, A.iscategory , A.order_no, A.order_no lib_order,A.kpi_desc_#request.scookie.lang# libdesc,'' is_definded_lib, '' lookup_code,'N' isnew,'' notes 
				FROM TPMDPERIODKPILIB A INNER JOIN KPILibHier AS B ON A.kpilib_code = B.parent_code
                WHERE  A.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
                    AND A.company_code =  <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
				
			)
			SELECT DISTINCT Z.kpi_name AS libname, Z.kpilib_code AS libcode, Z.parent_code AS pcode, Z.depth, Z.iscategory,
					PK.target,null achievement,'' score,
					CASE WHEN PK.weight IS NOT NULL THEN ROUND(PK.weight,#REQUEST.InitVarCountDeC#) 
							WHEN KPI.weight IS NOT NULL THEN ROUND(KPI.weight,#REQUEST.InitVarCountDeC#)
							ELSE '0'
					END weight,
			   		'0' weightedscore,
		   		CASE 
		   			WHEN PK.achievement_type IS NOT NULL THEN PK.achievement_type
		   			ELSE KPI.achievement_type
		   		END achscoretype,
		   		PK.lookup_code AS lookupscoretype,
		   		PK.editable_weight AS weightedit,
		   		PK.editable_target AS targetedit,
				Z.order_no,Z.order_no lib_order, Z.libdesc,'' is_definded_lib, '' lookup_code,'N' isnew, Z.parent_code,'' notes 
  		
		   	FROM KPILibHier Z 	LEFT JOIN TPMDPERIODKPILIB KPI
		   		ON KPI.kpilib_code = Z.kpilib_code
		   		AND KPI.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
				AND KPI.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
				AND KPI.reference_date = <cfqueryparam value="#arguments.refdate#" cfsqltype="cf_sql_timestamp">
			LEFT JOIN TPMDPERIODKPI PK
				ON PK.period_code = KPI.period_code
				AND PK.company_code =KPI.company_code
				AND PK.reference_date = KPI.reference_date
				<cfif arguments.flagparent eq 1> <!---riz--->
					AND PK.position_id = <cfqueryparam value="#arguments.posid#" cfsqltype="cf_sql_integer">
				<cfelse>
					AND PK.position_id = <cfqueryparam value="#empposid#" cfsqltype="cf_sql_integer">
				</cfif>
				AND PK.kpilib_code = KPI.kpilib_code
                   <cfif ucase(compcode) eq "PERSKPI">
                    AND UPPER(PK.kpi_type) = 'PERSONAL'
                   <cfelse>
                    AND UPPER(PK.kpi_type) = 'ORGUNIT'
                   </cfif>
			ORDER BY  Z.depth,Z.order_no, Z.kpi_name
		</cfquery>
		
		<cfelse> <!---riz--->
		<cfquery name="Local.qGetKPIDefault" datasource="#request.sdsn#">
			
			SELECT DISTINCT Z.kpi_name AS libname, Z.kpilib_code AS libcode, Z.parent_code AS pcode, Z.depth, Z.iscategory,
					PK.target, null achievement,
      	                '' score,
					CASE WHEN PK.weight IS NOT NULL THEN ROUND(PK.weight,#REQUEST.InitVarCountDeC#) 
							WHEN KPI.weight IS NOT NULL THEN ROUND(KPI.weight,#REQUEST.InitVarCountDeC#)
							ELSE '0'
					END weight,
			   		'0' weightedscore,
		   		CASE WHEN PK.achievement_type IS NOT NULL THEN PK.achievement_type
		   			ELSE KPI.achievement_type
		   		END achscoretype, PK.lookup_code AS lookupscoretype,PK.editable_weight AS weightedit,PK.editable_target AS targetedit,
				Z.order_no,Z.order_no lib_order, Z.libdesc,'' is_definded_lib, '' lookup_code,'N' isnew,Z.parent_code,'' notes 
		   	FROM 
		   	    (
    				SELECT K.kpilib_code, K.parent_code, K.kpi_name_#request.scookie.lang# kpi_name, K.kpi_depth depth, K.iscategory, K.ORDER_NO, K.order_no lib_order, K.kpi_desc_#request.scookie.lang# libdesc, K.period_code
    				FROM TPMDPERIODKPILIB K
    				INNER JOIN TPMDPERIODKPI PK
    					ON PK.period_code = K.period_code AND PK.company_code =K.company_code AND PK.reference_date = K.reference_date
    					<cfif arguments.flagparent eq 1> <!---riz--->
    					AND PK.position_id = <cfqueryparam value="#arguments.posid#" cfsqltype="cf_sql_integer">
    					<cfelse>
    					AND PK.position_id = <cfqueryparam value="#empposid#" cfsqltype="cf_sql_integer">
    					</cfif>
    					AND PK.kpilib_code = K.kpilib_code
    				WHERE PK.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
    					AND PK.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
    					AND PK.reference_date = <cfqueryparam value="#arguments.refdate#" cfsqltype="cf_sql_timestamp">
                           <cfif ucase(compcode) eq "PERSKPI">
                            AND UPPER(PK.kpi_type) = 'PERSONAL'
                           <cfelse>
                            AND UPPER(PK.kpi_type) = 'ORGUNIT'
                           </cfif>
    
    				UNION ALL
    	
    				SELECT A.kpilib_code, A.parent_code, A.kpi_name_#request.scookie.lang# , A.kpi_depth, A.iscategory,A.order_no,A.order_no lib_order, A.kpi_desc_#request.scookie.lang# libdesc,A.period_code
    				FROM TPMDPERIODKPILIB A
    				INNER JOIN (
    				    SELECT K.kpilib_code, K.parent_code, K.kpi_name_#request.scookie.lang#, K.kpi_depth, K.iscategory, K.order_no,K.order_no lib_order, K.kpi_desc_#request.scookie.lang# libdesc, K.company_code, K.period_code
        				FROM TPMDPERIODKPILIB K
        				INNER JOIN TPMDPERIODKPI PK
        					ON PK.period_code = K.period_code AND PK.company_code =K.company_code
        					AND PK.reference_date = K.reference_date
        					<cfif arguments.flagparent eq 1> <!---riz--->
        					AND PK.position_id = <cfqueryparam value="#arguments.posid#" cfsqltype="cf_sql_integer">
        					<cfelse>
        					AND PK.position_id = <cfqueryparam value="#empposid#" cfsqltype="cf_sql_integer">
        					</cfif>
        					AND PK.kpilib_code = K.kpilib_code
        				WHERE PK.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
        					AND PK.company_code =<cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
        					AND PK.reference_date = <cfqueryparam value="#arguments.refdate#" cfsqltype="cf_sql_timestamp">
                               <cfif ucase(compcode) eq "PERSKPI">
                                AND UPPER(PK.kpi_type) = 'PERSONAL'
                               <cfelse>
                                AND UPPER(PK.kpi_type) = 'ORGUNIT'
                               </cfif>
    				) AS B ON A.kpilib_code = B.parent_code AND A.company_code = B.company_code AND A.period_code = B.period_code
    			
    			) Z
		   	LEFT JOIN TPMDPERIODKPILIB KPI ON KPI.kpilib_code = Z.kpilib_code
		   		AND KPI.period_code = <cfqueryparam value="#arguments.periodcode#" cfsqltype="cf_sql_varchar">
				AND KPI.company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
				AND KPI.reference_date = <cfqueryparam value="#arguments.refdate#" cfsqltype="cf_sql_timestamp">
			LEFT JOIN TPMDPERIODKPI PK ON PK.period_code = KPI.period_code
				AND PK.company_code =KPI.company_code AND PK.reference_date = KPI.reference_date
				<cfif arguments.flagparent eq 1> 
					AND PK.position_id = <cfqueryparam value="#arguments.posid#" cfsqltype="cf_sql_integer">
				<cfelse>
					AND PK.position_id = <cfqueryparam value="#empposid#" cfsqltype="cf_sql_integer">
				</cfif>
				AND PK.kpilib_code = KPI.kpilib_code
                   <cfif ucase(compcode) eq "PERSKPI">
                    AND UPPER(PK.kpi_type) = 'PERSONAL'
                   <cfelse>
                    AND  UPPER(PK.kpi_type) = 'ORGUNIT'
                   </cfif>
			ORDER BY  Z.depth,Z.order_no, Z.kpi_name
			
		</cfquery>
		</cfif>
		<cfquery name="LOCAL.qGetCategoryFormData" dbtype="query">
			SELECT * FROM qGetKPIDefault where pcode = 0 OR iscategory = 'Y' order by depth, order_no, libname
		</cfquery>
		<cfif qGetCategoryFormData.recordcount gt 0>
			<cfset local.clDataNew = qGetKPIDefault.ColumnList >
			<cfset LOCAL.qEmpFormDataNew = queryNew(clDataNew)> 
			<cfloop query="#qGetCategoryFormData#">
				<cfset LOCAL.temp = QueryAddRow(qEmpFormDataNew)>
				<cfloop list="#clDataNew#" index="idxColName">
					<cfset temp = QuerySetCell(qEmpFormDataNew,idxColName,evaluate("qGetCategoryFormData.#idxColName#"))/>
				</cfloop>
				<cfquery name="LOCAL.qGetSubFormData" dbtype="query">
					SELECT * FROM qGetKPIDefault where pcode = '#qGetCategoryFormData.libcode#' and (iscategory = 'N' OR iscategory is null OR iscategory = '')
					order by depth, order_no, libname
				</cfquery>
				<cfif qGetSubFormData.recordcount gt 0>
					<cfloop query="#qGetSubFormData#">
						<cfset LOCAL.temp = QueryAddRow(qEmpFormDataNew)>
						<cfloop list="#clDataNew#" index="idxColName">
							<cfset temp = QuerySetCell(qEmpFormDataNew,idxColName,evaluate("qGetSubFormData.#idxColName#"))/>
						</cfloop>
					</cfloop>
				</cfif>
			</cfloop>
			<cfreturn qEmpFormDataNew>
		<cfelse>
			<cfreturn qGetKPIDefault>
		</cfif>
														  
																								 
			  
  
		<cfreturn qGetKPIDefault>
    </cffunction>
	
	<cffunction name="getAllReviewerData">
    	<cfargument name="reqno" default="">
        <cfargument name="empid" default="">
        <cfargument name="periodcode" default="">
        <cfargument name="reviewer" default="">
        <cfargument name="step" default="">
        <cfargument name="libtype" default="APPRAISAL">
        <cfargument name="libcode" default="">
		<cfargument name="notes" default="">
		<cfargument name="varcoid" default="#request.scookie.coid#" required="No">
        <cfargument name="varcocode" default="#request.scookie.cocode#" required="No">
        
		<cfif libtype eq 'APPRAISAL'>	
			<cfquery name="LOCAL.qGetParent" datasource="#request.sdsn#">
				SELECT parent_path, APP.apprlib_code, APP.position_id FROM TPMDPERIODAPPRAISAL APP, TEODEMPCOMPANY COMP
				WHERE COMP.position_id = APP.position_id AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
				AND COMP.emp_id = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
				ORDER BY apprlib_code
			</cfquery>
			<cfquery name="LOCAL.qCheck" datasource="#request.sdsn#">
				SELECT EVALH.form_no FROM TPMDPERFORMANCE_EVALH EVALH 
				WHERE EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewer_empid = <cfqueryparam value="#reviewer#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset LOCAL.parentpath = ValueList(qGetParent.parent_path)>
			<cfset LOCAL.parentpath = ListAppend(parentpath,ValueList(qGetParent.apprlib_code))>
			<cfquery name="local.qComponentData" datasource="#request.sdsn#">
					SELECT DISTINCT 
					<cfif request.dbdriver eq "MSSQL"> 
					    isnull(APPR.apprlib_code,APPLIB.apprlib_code) lib_code, isnull(APPR.appraisal_name_en,APPLIB.appraisal_name_en) lib_name,
						isnull(APPR.parent_code,APPLIB.parent_code) parent_code, isnull(APPR.iscategory,APPLIB.iscategory) iscategory, 
						isnull(APPR.parent_path,APPLIB.parent_path) parent_path, isnull(APPR.appraisal_depth,APPLIB.appraisal_depth) lib_depth, 
						isnull(EVALD.weight,APPR.weight) weight, isnull(EVALD.target,APPR.target) target, isnull(EVALD.achievement,0) achievement, isnull(EVALD.achievement,0) achievement
					<cfelse>
					    ifnull(APPR.apprlib_code,APPLIB.apprlib_code) lib_code, ifnull(APPR.appraisal_name_en,APPLIB.appraisal_name_en) lib_name,
						ifnull(APPR.parent_code,APPLIB.parent_code) parent_code, ifnull(APPR.iscategory,APPLIB.iscategory) iscategory, 
						ifnull(APPR.parent_path,APPLIB.parent_path) parent_path, ifnull(APPR.appraisal_depth,APPLIB.appraisal_depth) lib_depth, 
						ifnull(EVALD.weight,APPR.weight) weight, ifnull(EVALD.target,APPR.target) target, ifnull(EVALD.achievement,0) achievement, ifnull(EVALD.achievement,0) achievement
					</cfif>
					FROM TPMDPERIODAPPRLIB APPLIB 
					LEFT JOIN TPMDPERIODAPPRAISAL APPR ON APPLIB.period_code = APPR.period_code AND APPLIB.company_code = APPR.company_code AND APPLIB.apprlib_code = APPR.apprlib_code AND APPLIB.reference_date = APPR.reference_date
					LEFT JOIN TPMDPERFORMANCE_EVALD EVALD ON APPLIB.apprlib_code = EVALD.lib_code AND APPLIB.company_code = EVALD.company_code and EVALD.lib_code = APPR.apprlib_code
					LEFT JOIN TPMDPERFORMANCE_EVALH EVALH ON EVALD.form_no = EVALH.form_no AND EVALD.company_code = EVALH.company_code AND EVALH.period_code = APPR.period_code
					WHERE (APPR.position_id = '#qGetParent.position_id#' or APPR.position_id IS NULL)
					<cfif parentpath neq "">
						AND APPLIB.apprlib_code IN (#ListQualify(parentpath,"'")#)
					<cfelse>
						AND 1 = 0
					</cfif>
					<cfif qCheck.recordcount>
						AND (EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewer_empid = <cfqueryparam value="#reviewer#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
						OR (APPLIB.iscategory='Y' AND EVALH.request_no IS NULL AND APPLIB.period_code =<cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
					<cfelse>
						AND (EVALH.request_no IS NULL AND APPLIB.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
					</cfif>	
					order by lib_depth,lib_code asc 
			</cfquery>
		<cfelseif libtype eq 'OBJECTIVE'>
			<cfquery name="LOCAL.qGetParent" datasource="#request.sdsn#">
				SELECT parent_path,kpilib_code,KPI.position_id FROM TPMDPERIODKPI KPI, TEODEMPCOMPANY COMP
				WHERE KPI.position_id = COMP.position_id
				AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
				AND COMP.emp_id = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#varcocode#" cfsqltype="cf_sql_varchar">
				ORDER BY kpilib_code
			</cfquery>
			<cfset LOCAL.parentpath = ValueList(qGetParent.parent_path)>
			<cfset LOCAL.parentpath = ListAppend(parentpath,ValueList(qGetParent.kpilib_code))>
			<cfquery name="local.qComponentData" datasource="#request.sdsn#">
				SELECT DISTINCT 
				    <cfif request.dbdriver eq "MSSQL"> 
				        isnull(KPI.kpilib_code,KPILIB.kpilib_code) lib_code, isnull(KPI.kpi_name_en,KPILIB.kpi_name_en) lib_name,
						isnull(KPI.parent_code,KPILIB.parent_code) parent_code, isnull(KPI.iscategory,KPILIB.iscategory) iscategory, 
						isnull(KPI.parent_path,KPILIB.parent_path) parent_path, isnull(KPI.kpi_depth,KPILIB.kpi_depth) lib_depth, 
						isnull(EVALD.weight,KPI.weight) weight, isnull(EVALD.target,KPI.target) target, isnull(EVALD.achievement,0) achievement, isnull(EVALD.achievement,0) achievement
					<cfelse>
					    ifnull(KPI.kpilib_code,KPILIB.kpilib_code) lib_code, ifnull(KPI.kpi_name_en,KPILIB.kpi_name_en) lib_name,
						ifnull(KPI.parent_code,KPILIB.parent_code) parent_code, ifnull(KPI.iscategory,KPILIB.iscategory) iscategory, 
						ifnull(KPI.parent_path,KPILIB.parent_path) parent_path, ifnull(KPI.kpi_depth,KPILIB.kpi_depth) lib_depth, 
						ifnull(EVALD.weight,KPI.weight) weight, ifnull(EVALD.target,KPI.target) target, ifnull(EVALD.achievement,0) achievement, ifnull(EVALD.achievement,0) achievement
					</cfif>
					FROM TPMDPERIODKPILIB KPILIB 
					LEFT JOIN TPMDPERIODKPI KPI ON KPILIB.period_code = KPI.period_code AND KPILIB.company_code = KPI.company_code AND KPILIB.kpilib_code = KPI.kpilib_code AND KPILIB.reference_date = KPI.reference_date
					LEFT JOIN TPMDPERFORMANCE_EVALD EVALD ON KPILIB.kpilib_code = EVALD.lib_code AND KPILIB.company_code = EVALD.company_code
					LEFT JOIN TPMDPERFORMANCE_EVALH EVALH ON EVALD.form_no = EVALH.form_no AND EVALD.company_code = EVALH.company_code	
					WHERE (KPI.position_id = '#qGetParent.position_id#' or KPI.position_id IS NULL)
					<cfif parentpath neq "">
						AND KPILIB.kpilib_code IN (#ListQualify(parentpath,"'")#)
					<cfelse>
						AND 1 = 0
					</cfif>
						AND ((EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewer_empid = <cfqueryparam value="#reviewer#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
						OR EVALH.request_no IS NULL AND KPILIB.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
					order by lib_depth,lib_code asc 
			</cfquery>		
		<cfelseif libtype eq 'OBJECTIVEORG'>
			<cfquery name="LOCAL.qGetParent" datasource="#request.sdsn#">
				SELECT parent_path,kpilib_code,KPI.position_id FROM TPMDPERIODKPI KPI, TEODEMPCOMPANY COMP
				WHERE KPI.position_id = COMP.position_id
				AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
				AND COMP.emp_id = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
				ORDER BY kpilib_code
			</cfquery>
			<cfquery name="LOCAL.qGetHeadDivKPI" datasource="#request.sdsn#">
				SELECT DEPT.head_div  FROM TEOMPOSITION POS	  
					LEFT JOIN TEOMPOSITION DEPT ON POS.dept_id = DEPT.position_id AND POS.company_id = DEPT.company_id 	
					WHERE POS.position_id = <cfqueryparam value="#qGetParent.position_id#" cfsqltype="cf_sql_varchar">
					AND POS.company_id = <cfqueryparam value="#varcoid#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfquery name="LOCAL.qGetPosLogin" datasource="#request.sdsn#">
				SELECT POS.position_id FROM TEODEMPCOMPANY COMPA INNER JOIN TEOMPOSITION POS ON COMPA.position_id = pos.position_id AND COMPA.company_id = pos.company_id WHERE COMPA.emp_id = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
					AND COMPA.company_id = <cfqueryparam value="#varcoid#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset LOCAL.parentpath = ValueList(qGetParent.parent_path)>
			<cfset LOCAL.parentpath = ListAppend(parentpath,ValueList(qGetParent.kpilib_code))>
			<cfif qGetHeadDivKPI.head_div eq qGetPosLogin.position_id>
				<cfset LOCAL.editable = 1>
			<cfelse>
				<cfset LOCAL.editable = 0>
			</cfif>
			<cfquery name="local.qComponentData" datasource="#request.sdsn#">
				SELECT DISTINCT 
				<cfif request.dbdriver eq "MSSQL"> 
				    isnull(KPI.kpilib_code,KPILIB.kpilib_code) lib_code, isnull(KPI.kpi_name_en,KPILIB.kpi_name_en) lib_name,
					isnull(KPI.parent_code,KPILIB.parent_code) parent_code, isnull(KPI.iscategory,KPILIB.iscategory) iscategory, 
					isnull(KPI.parent_path,KPILIB.parent_path) parent_path, isnull(KPI.kpi_depth,KPILIB.kpi_depth) lib_depth, 
					isnull(EVALD.weight,KPI.weight) weight, isnull(EVALD.target,KPI.target) target, isnull(EVALD.achievement,0) achievement, isnull(EVALD.achievement,0) achievement,
				<cfelse>
				    ifnull(KPI.kpilib_code,KPILIB.kpilib_code) lib_code, ifnull(KPI.kpi_name_en,KPILIB.kpi_name_en) lib_name,
					ifnull(KPI.parent_code,KPILIB.parent_code) parent_code, ifnull(KPI.iscategory,KPILIB.iscategory) iscategory, 
					ifnull(KPI.parent_path,KPILIB.parent_path) parent_path, ifnull(KPI.kpi_depth,KPILIB.kpi_depth) lib_depth, 
					ifnull(EVALD.weight,KPI.weight) weight, ifnull(EVALD.target,KPI.target) target, ifnull(EVALD.achievement,0) achievement, ifnull(EVALD.achievement,0) achievement,
				</cfif>
					'#editable#' editable
					FROM TPMDPERIODKPILIB KPILIB 
					LEFT JOIN TPMDPERIODKPI KPI ON KPILIB.period_code = KPI.period_code AND KPILIB.company_code = KPI.company_code AND KPILIB.kpilib_code = KPI.kpilib_code AND KPILIB.reference_date = KPI.reference_date
					LEFT JOIN TPMDPERFORMANCE_EVALD EVALD ON KPILIB.kpilib_code = EVALD.lib_code AND KPILIB.company_code = EVALD.company_code
					LEFT JOIN TPMDPERFORMANCE_EVALH EVALH ON EVALD.form_no = EVALH.form_no AND EVALD.company_code = EVALH.company_code	
					WHERE (KPI.position_id = '#qGetParent.position_id#' or KPI.position_id IS NULL)
					<cfif parentpath neq "">
						AND KPILIB.kpilib_code IN (#ListQualify(parentpath,"'")#)
					<cfelse>
						AND 1 = 0
					</cfif>
						AND ((EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewer_empid = <cfqueryparam value="#reviewer#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
						OR EVALH.request_no IS NULL AND KPILIB.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
					order by lib_depth,lib_code asc 
			</cfquery>
		<cfelseif libtype eq 'COMPETENCY'>
			<cfquery name="LOCAL.qGetParent" datasource="#request.sdsn#">
				SELECT COM.parent_path,JT.competence_code
				FROM TEODEMPCOMPANY COMPA INNER JOIN TEOMPOSITION POS ON COMPA.position_id = pos.position_id AND COMPA.company_id = pos.company_id
					INNER JOIN TPMRCOMPETENCEJT JT ON POS.jobtitle_code = JT.jobtitle_code
					INNER JOIN TPMMCOMPETENCE COM ON JT.competence_code = COM.competence_code
					WHERE COMPA.emp_id = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
					AND COMPA.company_id = <cfqueryparam value="#varcoid#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfquery name="LOCAL.qCheck" datasource="#request.sdsn#">
				SELECT EVALH.form_no FROM TPMDPERFORMANCE_EVALH EVALH WHERE EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewer_empid = <cfqueryparam value="#reviewer#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset parentpath = ValueList(qGetParent.parent_path)>
			<cfset parentpath = ListAppend(parentpath,ValueList(qGetParent.competence_code))>
			<cfquery name="local.qComponentData" datasource="#request.sdsn#">
				SELECT competence_code lib_code, COMPLIB.competence_name_en lib_name,order_no,
						COMPLIB.parent_code, COMPLIB.iscategory, 
						COMPLIB.parent_path,COMPLIB.competence_depth lib_depth,
						<cfif request.dbdriver eq "MSSQL"> 
						isnull(EVALD.weight,0) weight, isnull(EVALD.target,0) target, isnull(EVALD.achievement,0) achievement, isnull(EVALD.achievement,0) achievement,isnull(EVALD.score,0) score,
						<cfelse>
						ifnull(EVALD.weight,0) weight, ifnull(EVALD.target,0) target, ifnull(EVALD.achievement,0) achievement, ifnull(EVALD.achievement,0) achievement,ifnull(EVALD.score,0) score, 
						</cfif>
						 EVALD.notes,EVALD.reviewer_empid
					FROM TPMMCOMPETENCE COMPLIB 
					LEFT JOIN TPMDPERFORMANCE_EVALD EVALD ON COMPLIB.competence_code = EVALD.lib_code	
					LEFT JOIN TPMDPERFORMANCE_EVALH EVALH ON EVALD.form_no = EVALH.form_no AND EVALD.company_code = EVALH.company_code	AND EVALD.reviewer_empid = EVALH.reviewer_empid		
					<cfif parentpath neq "">
						WHERE COMPLIB.competence_code IN (#ListQualify(parentpath,"'")#)
					<cfelse>
						WHERE 1 = 0
					</cfif>
						AND ((EVALH.request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
						AND EVALH.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
						AND EVALH.period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">)
						OR EVALH.request_no IS NULL)
					order by lib_depth,order_no asc 
			</cfquery>	
		<cfelse>
			<cfset LOCAL.qComponentData = 0>
		</cfif>
        <cfreturn qComponentData>
    </cffunction>
	<cffunction name="isHaveEvalData">
		<cfargument name="reviewee_empid" required="yes">
		<cfargument name="period_code" required="yes">
		<cfargument name="reviewee_posid" required="yes">
		<cfset isHaveData = 0>
		<cfquery name="LOCAL.qGetEvalData" datasource="#request.sdsn#">
			SELECT form_no FROM TPMDPERFORMANCE_EVALH  WHERE company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
			AND period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar">
			AND reviewee_empid = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">
			AND reviewee_posid = <cfqueryparam value="#arguments.reviewee_posid#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="LOCAL.qGetFinalData" datasource="#request.sdsn#">
			SELECT form_no FROM TPMDPERFORMANCE_FINAL
			WHERE company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
			AND period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar">
			AND reviewee_empid = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">
			AND reviewee_posid = <cfqueryparam value="#arguments.reviewee_posid#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif qGetEvalData.recordCount gt 0 or qGetFinalData.recordcount gt 0 >
			<cfset isHaveData = 1>
		</cfif>
		<cfreturn isHaveData>
	</cffunction>
	<cffunction name="updateGoalCascade">
		<cfargument name="form_no"  required="yes">
		<cfargument name="modified_by"  required="yes">
		<cfargument name="lib_code"  required="yes">
		<cfargument name="cascadefrom_empid"  required="yes">
		<cfargument name="cascadefrom_formno"  required="yes">
		<cfargument name="reviewee_empid"  required="yes">
		<cfquery name="local.qupdateformnocascade" datasource="#request.sdsn#">
			UPDATE TPMDGOALCASCADING
			SET cascadeto_formno = 	<cfqueryparam value="#arguments.form_no#" cfsqltype="cf_sql_varchar">
			,modified_by=	<cfqueryparam value="#arguments.modified_by#" cfsqltype="cf_sql_varchar">
			,modified_date= <cfqueryparam value="#CreateODBCDate(now())#" cfsqltype="cf_sql_timestamp">
			WHERE lib_code = 	<cfqueryparam value="#arguments.lib_code#" cfsqltype="cf_sql_varchar">
			AND cascadefrom_empid = <cfqueryparam value="#arguments.cascadefrom_empid#" cfsqltype="cf_sql_varchar">
			AND cascadefrom_formno = <cfqueryparam value="#arguments.cascadefrom_formno#" cfsqltype="cf_sql_varchar">
			AND cascadeto_empid = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">
		</cfquery>
	</cffunction>
    <cffunction name="SaveTransaction">
		<cfargument name="iAction" type="numeric" required="yes">
    	<cfargument name="strckFormData" type="struct" required="yes">
		<cfparam name="action" default="0">
    	<cfparam name="sendtype" default="0">
		<cfparam name="reqno" default="">
		<cfparam name="formno" default="">
		<cfparam name="period_code" default="">
		<cfparam name="refdate" default="">
		<cfparam name="empid" default="">
		<cfparam name="hdn_totalrowpers" default="">
		<cfparam name="flagrevs" default="">
		
		<cfparam name="listPeriodComponentUsed" default="">
		
		<cftransaction>
		<cfoutput>
	  
		<cfset LOCAL.errorEval = "tidak">
		<cfset LOCAL.qEmpInfo = getEmpDetail(empid=strckFormData.empid)>
		<cfset LOCAL.qLoginInfo = getEmpDetail(empid=request.scookie.user.empid)>
		<cfset callisHaveEvalData = isHaveEvalData(reviewee_empid=strckFormData.empid,period_code=period_code,reviewee_posid=qEmpInfo.posid)>
		<cfif val(callisHaveEvalData) eq 1 >
			<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSave Data is failed, Already Had Evaluation Data", true)>
			<cfset LOCAL.errorEval = "ada">
			<cfoutput>
				<script>
					alert("#strMessage#");
					parent.refreshPage();
					parent.popClose();
				</script>
			</cfoutput>
			<CF_SFABORT>
		</cfif>
	
		<cfif sendtype eq 'directfinal'>
        	<cfset strckFormData.isfinal = 1/>
        	<cfset strckFormData.head_status = 1/>
        	<cfset strckFormData.isfinal_requestno = 1/>
        <cfelseif action eq 'sendtoapprover' or sendtype eq 'next'>
			<cfset strckFormData.isfinal = 0/>
        	<cfset strckFormData.head_status = 1/>
        	<cfset strckFormData.isfinal_requestno = 0/>
        </cfif>

        <cfif not structkeyexists(strckFormData,"isfinal")>
			<cfset strckFormData.isfinal = 0/>
        </cfif>
        <cfif not structkeyexists(strckFormData,"head_status")>
        	<cfset strckFormData.head_status = 0/>
        </cfif>
        <cfif not structkeyexists(strckFormData,"isfinal_requestno")>
        	<cfset strckFormData.isfinal_requestno = 0/>
        </cfif>

		<cfset LOCAL.request_no = reqno>
		<cfset LOCAL.form_no = formno>
	
			<cfif len(trim(form_no)) eq 0 OR flagrevs eq 1> <!--- belum ada req_no --->
			   
			    <cfset LOCAL.strckListApprover = GetApproverList(reqno='',empid=empid,reqorder=strckFormData.reqformulaorder,varcoid=varcoid,varcocode=varcocode)>
			    <cfif flagrevs EQ 1 AND IsDefined('strckFormData.UserInReviewStep') >
			        <cfset strckFormData.UserInReviewStep = strckListApprover.index>
			    </cfif>
			   
				<cfquery name="local.qUnitPath" datasource="#request.sdsn#">
					SELECT parent_path FROM TEOMPOSITION WHERE position_id = <cfqueryparam value="#qEmpInfo.dept_id#" cfsqltype="cf_sql_integer">
				</cfquery>
				
				<cfset LOCAL.lstunitpath = "">
				<cfset lstunitpath = listappend(lstunitpath,"#qUnitPath.parent_path#")>
				<cfset lstunitpath = listappend(lstunitpath,"#qEmpInfo.dept_id#")>
				<cfif flagrevs eq 1>
				    <cfset form_no = formno>
				<cfelse>
				    <cfset strckFormData["form_no"] = trim(Application.SFUtil.getCode("PERFEVALFORM",'no','true'))><!--- Rangga --->
				    <cfset form_no = strckFormData["form_no"]>
				</cfif>
				<cfset request_no = strckFormData.request_no>
				
		        <cfquery name="LOCAL.qPlan" datasource="#request.sdsn#">
		    	    select form_no,company_code,reviewee_empid,reviewee_posid,request_no,period_code,head_status from TPMDPERFORMANCE_PLANH 
		    	    where period_code =  <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
		     	    AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
		     	    AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
		     	    AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
		     	    ORDER BY modified_date
		       </cfquery>	
	
				<cfset LOCAL.company_code = strckFormData.varcocode>
				<cfset LOCAL.form_order = 1>
				<cfset LOCAL.reference_date = refdate>
				<cfset LOCAL.period_code = period_code>
				<cfset LOCAL.reviewee_empid = empid>
				<cfset LOCAL.reviewee_posid = qEmpInfo.position_id>
				<cfset LOCAL.reviewee_grade = qEmpInfo.grade_code>
				<cfset LOCAL.reviewee_employ_code = qEmpInfo.employ_code>
				<cfset LOCAL.reviewee_unitpath = lstunitpath>
				
    			<cfset LOCAL.reviewer_empid = request.scookie.user.empid>
    			<cfset LOCAL.reviewer_posid = qLoginInfo.position_id>
    			<cfset LOCAL.review_step = strckFormData.UserInReviewStep>	<!--- rangga ---> 
			
				<cfif action eq 'draft'><!--- draft:0; sent to approver:1; revise:2 --->
					<cfset LOCAL.head_status = 0>
				<cfelseif action eq 'sendtoapprover'>
					<cfset LOCAL.head_status = 1> 
				</cfif>
				<cfset LOCAL.lastreviewer_empid = request.scookie.user.empid>
				<cfset LOCAL.created_by = request.scookie.user.uname>
				<cfset LOCAL.created_date = now()>
				<cfset LOCAL.modified_by = request.scookie.user.uname>
				<cfset LOCAL.modified_date = now()>
                
                <cfif structkeyexists(strckFormData,"isFinal")>
					<cfset LOCAL.isfinal = strckFormData.isFinal>
                <cfelse>
					<cfset LOCAL.isfinal = 0>
                </cfif>
                <cfif structkeyexists(strckFormData,"isfinal_requestno")>
					<cfset LOCAL.isfinal_requestno = strckFormData.isfinal_requestno>
                <cfelse>
					<cfset LOCAL.isfinal_requestno = 0>
                </cfif>
                
                <cfset LOCAL.tempLstQPlanReqNo = valuelist(qPlan.request_no)>
                <cfset LOCAL.tempQplan_request_no = qPlan.request_no>
                <cfset LOCAL.tempQplan_head_status = qPlan.head_status>
                <cfloop query="qPlan">
                    <cfif request_no EQ qPlan.request_no>
                        <cfset LOCAL.tempQplan_request_no = qPlan.request_no>
                        <cfset LOCAL.tempQplan_head_status = qPlan.head_status>
                    </cfif>
                </cfloop>
                
		        <cfif qPlan.recordCount gt 0>
	               <cfif head_status eq tempQplan_head_status AND request_no EQ tempQplan_request_no>
	                    <cfoutput>
	                    	<script>
							alert("Performance Planning Form Already Submit 1");
							alert("#head_status# eq #tempQplan_head_status# AND #request_no# EQ #tempQplan_request_no#");
							parent.refreshPage();
					        parent.popClose();
							</script>
						</cfoutput>	
				        <CF_SFABORT>
	                <cfelse>
	                    <cfif request_no neq qPlan.request_no and formno neq qPlan.form_no and flagcopy eq 0>
	                         <cfoutput>
	                    	<script>
							alert("Performance Planning Form Already Submit 2");
							alert("#request_no# neq #qPlan.request_no# and #formno# neq #qPlan.form_no# and #flagcopy# eq 0");
							parent.refreshPage();
					        parent.popClose();
							</script>
						</cfoutput>	
				        <CF_SFABORT>
	                    </cfif>
	               </cfif>
	           <cfelse>
			   
	           </cfif>    
				<cfif action neq 'draft' or sendtype eq 'directfinal' or sendtype neq 'draft'>
					<cfquery name="LOCAL.qUpdateRequestBefore" datasource="#request.sdsn#">
						UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0,modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
						WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
						and request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
						AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
						AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
					</cfquery>
            	</cfif>
				<cfset callInsertPLANH = InsertPLANH(form_no=form_no,company_code=REQUEST.SCOOKIE.COCODE,request_no=request_no,form_order=form_order,reference_date=reference_date,period_code=period_code,reviewee_empid=reviewee_empid,reviewee_posid = reviewee_posid,reviewee_grade=reviewee_grade,reviewee_employcode=reviewee_employ_code,reviewee_unitpath=reviewee_unitpath,reviewer_empid=reviewer_empid,reviewer_posid=reviewer_posid,review_step=review_step, head_status=head_status,lastreviewer_empid=lastreviewer_empid,isfinal=isfinal,isfinal_requestno=isfinal_requestno)>
				
			    <cfif listfindnocase(listPeriodComponentUsed,"persKPI")>
    				<cfset LOCAL.stringJSON = FORM["persKPIArray"]> <!--- kalo kosong isinya cuma {} --->
    				<cfif stringJSON eq '{}'>
    					<cfset LOCAL.qEmpFormData = getEmpFormData(reviewee_empid, period_code, reference_date, 'PERSKPI', '', '', reviewer_empid)>
    					
						<cfset LOCAL.libcode = "">
    					<cfloop list="#valuelist(qEmpFormData.libcode)#" index="libcode">
    						<cfset LOCAL.lib_code = libcode>
    						<cfset LOCAL.isnew = 'N'>
    						<cfset LOCAL.lib_type = "PERSKPI">
    						<cfquery name="local.qGetData" datasource="#request.sdsn#">
    							SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc, iscategory, kpi_depth, parent_code, parent_path, achievement_type
    							FROM TPMMKPI WHERE kpi_code = <cfqueryparam value="#libcode#" cfsqltype="cf_sql_varchar">
    						</cfquery>
							<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
							
    						<cfset LOCAL.lib_name = qGetData.kpi_name>
    						<cfset LOCAL.desc = qGetData.kpi_desc>
    						<cfset LOCAL.iscategory = qGetData.iscategory>
    						<cfset LOCAL.kpi_depth = qGetData.kpi_depth>
    						<cfset LOCAL.parent_code = qGetData.parent_code>
    						<cfset LOCAL.parent_path = qGetData.parent_path>
    						
    						<cfquery name="local.qGetWT" datasource="#request.sdsn#">
    							SELECT round(weight,#REQUEST.InitVarCountDeC#) weight, target FROM TPMDPERIODKPI
    							WHERE period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    							AND reference_date = <cfqueryparam value="#reference_date#" cfsqltype="cf_sql_timestamp">
    							AND kpilib_code = <cfqueryparam value="#libcode#" cfsqltype="cf_sql_varchar">
    							AND kpi_type = 'PERSONAL'
    						</cfquery>
    						
    						<cfset LOCAL.weight = val(qGetWT.weight)>
    						<cfset LOCAL.target = qGetWT.target>
    						<cfset LOCAL.notes = "">
    						
    						<cfquery name="local.qComponentData" datasource="#request.sdsn#">
    							INSERT INTO TPMDPERFORMANCE_PLAND 
    							(form_no,company_code,lib_code,lib_type,reviewer_empid,reviewer_posid,weight,target,notes,lib_name_en,lib_name_id
    							,lib_name_my,lib_name_th,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th,iscategory,lib_depth,parent_code,parent_path
    							,achievement_type,isnew,created_by,created_date,modified_by,modified_date,request_no,iscascade)
    							VALUES(
    								<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#company_code#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="PERSKPI" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#reviewer_posid#" cfsqltype="cf_sql_integer">,
    								<cfqueryparam value="#weight#" cfsqltype="cf_sql_float">,
    								<cfqueryparam value="#target#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#notes#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#iscategory#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#val(kpi_depth)#" cfsqltype="cf_sql_integer">,
    								<cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#parent_path#" cfsqltype="cf_sql_varchar">,
    								<cfif achievement neq "">
										<cfqueryparam value="#achievement#" cfsqltype="cf_sql_varchar">,
									<cfelse>
										NULL,
									</cfif>
    								<cfqueryparam value="#isnew#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    								<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    								<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    								<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    								<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">,
    								<cfqueryparam value="#iscascade#" cfsqltype="cf_sql_varchar">
    							)
    						</cfquery>	
    				            <cfif iscascade gt 0>
									<cfset callupdateGoalCascade = updateGoalCascade(form_no=form_no,modified_by=modified_by,lib_code=lib_code,cascadefrom_empid=cascadefrom_empid,cascadefrom_formno=cascadefrom_formno,reviewee_empid=reviewee_empid)>
    				                
    				            </cfif>
    					</cfloop>
                  
    				<cfelse>	
    					
    					<cfset local.objJSON = deserializeJSON(stringJSON)>
    					<cfset LOCAL.hdntotalrowpers = objJSON["hdn_totalrowpers"]>
                		<cfset local.objPerfLookup = createobject("component","SMPerfLookup")/>
                		<cfset local.objPerfLookupDetail = createobject("component","SMPerfLookupDetail")/>
						<cfset LOCAL.strckKPILookUp = StructNew()>
						<cfset strckKPILookUp.period_code = strckFormData.period_code>
						<cfset strckKPILookUp.company_code = strckFormData.varcocode>
                        <cfif structkeyexists(objJSON,"hdnchkCopyPers")>
    						<cfset LOCAL.copyplanpers = objJSON["hdnchkCopyPers"]>
    					<cfelse>
    					    <cfset LOCAL.copyplanpers = "0" >
    					</cfif> 
    					<cfif copyplanpers eq 1>
    						<cfquery name="LOCAL.qCekLastPeriodPers" datasource="#request.sdsn#">
                                SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> ph.period_code,ph.form_no,ph.reference_date,ph.request_no,ph.reviewee_posid, ph.reviewee_empid FROM tpmdperformance_planh ph
                                inner join TPMMPERIOD p on ph.period_code = p.period_code
                                WHERE ph.reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar"> 
                                AND ph.reference_date < <cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp"> 
                                AND ph.isfinal = 1 ORDER BY ph.reference_date DESC, ph.modified_date DESC
                                <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
                            </cfquery>
                            
                            <cfquery name="LOCAL.qUpdateCopyPers" datasource="#request.sdsn#">
                        		UPDATE TPMDPERFORMANCE_PLANH set form_lastperiod = <cfqueryparam value="#qCekLastPeriodPers.form_no#" cfsqltype="cf_sql_varchar">
                        		WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
                                AND company_code = <cfqueryparam value="#strckFormData.varcocode#" cfsqltype="cf_sql_varchar">
                        	</cfquery>
    					</cfif>
    					
						<cfset LOCAL.idx = "">
						<cfset local.penambahIdx = 0>
    					<cfloop from="1" to="#hdntotalrowpers#" index="idx">
    					    <cfif structkeyexists(objJSON,"ispersnew_#idx#")>
    							<cfset LOCAL.isnew = objJSON["ispersnew_#idx#"]>
    						<cfelse>
    							<cfset LOCAL.isnew = 'N'>
    						</cfif>
							
    						<cfif structkeyexists(objJSON,"perslibcode_#idx#") or structkeyexists(objJSON,"perschk_kpi_#idx#") or structkeyexists(objJSON,"persselkpi_#idx#")>
								
    							<cfif structkeyexists(objJSON,"perslibcode_#idx#") AND isnew EQ 'N'>
    								<cfset lib_code = objJSON["perslibcode_#idx#"]>
    								<cfset isnew = 'N'>
    								<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, kpi_depth, parent_code, parent_path, achievement_type
    									FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								<cfset lib_name = qGetData.kpi_name>
    								<cfset desc = qGetData.kpi_desc>
    								<cfset iscategory = qGetData.iscategory>
    								<cfset kpi_depth = qGetData.kpi_depth>
    								<cfset parent_code = qGetData.parent_code>
    								<cfset parent_path = qGetData.parent_path>
									<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
							<cfelseif structkeyexists(objJSON,"perslibcode_#idx#") AND isnew EQ 'Y'>
    								<cfset lib_code = objJSON["perslibcode_#idx#"]>
									<cfset isnew = 'Y'>
									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT lib_name_#request.scookie.lang# kpi_name, lib_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, lib_depth, parent_code, parent_path, achievement_type
    									FROM tpmdperformance_pland
    									WHERE lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar"> order by created_date desc
    								</cfquery>
									<cfset iscategory = 'N'>
    								<cfset achievement = qGetData.achievement_type>
									<cfif structkeyexists(objJSON,"perstxtkpi_#idx#")>
										<cfset lib_name = objJSON["perstxtkpi_#idx#"]>
									<cfelse>
										<cfset lib_name = "">
									</cfif>

									<cfif structkeyexists(objJSON,"perstxtdesc_#idx#")>
										<cfset desc = objJSON["perstxtdesc_#idx#"]>
									<cfelse>
										<cfset desc = "">
									</cfif>
									<cfif structkeyexists(objJSON,"txtprcodepers_#idx#")>
    									<cfset parent_code = objJSON["txtprcodepers_#idx#"]>
    								<cfelse>
    									<cfset parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								
    								<cfset kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset parent_path = "">
    								<cfset parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset parent_path = listappend(parent_path,"#parent_code#")>	
									
									<cfif lib_name eq ""><cfset lib_name = qGetData.kpi_name></cfif>
									<cfif desc eq ""><cfset desc = qGetData.kpi_desc></cfif>
									
									<cfif kpi_depth eq ""><cfset kpi_depth = qGetData.lib_depth></cfif>
									<cfif parent_code eq ""><cfset parent_code = qGetData.parent_code></cfif>
									<cfif parent_path eq ""><cfset parent_path = qGetData.parent_path></cfif>
									<cfif structkeyexists(objJSON,"persseldesckpi_#idx#")>
    									<cfset achievement = objJSON["persseldesckpi_#idx#"]>
    								<cfelse>
    									<cfset achievement = "">
    								</cfif>
									<cfif achievement eq "">
										<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
									</cfif>
		 
    							<cfelseif not structkeyexists(objJSON,"perslibcode_#idx#")>	
									
    								<cfif structkeyexists(objJSON,"perschk_kpi_#idx#")>					
    									<cfset lib_code = form_no&idx>
										
    									<cfif structkeyexists(objJSON,"perstxtkpi_#idx#")>
    										<cfset lib_name = objJSON["perstxtkpi_#idx#"]>
    									<cfelse>
    										<cfset lib_name = "">
    									</cfif>
        								<cfif structkeyexists(objJSON,"perstxtdesc_#idx#")>
        									<cfset desc = objJSON["perstxtdesc_#idx#"]>
        								<cfelse>
        									<cfset desc = "">
        								</cfif>
    								<cfelse>
    									<cfset lib_code = objJSON["persselkpi_#idx#"]>
    									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    										SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc
    										FROM TPMMKPI
    										WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    									</cfquery>
    									<cfset lib_name = qGetData.kpi_name>					
    									<cfset desc = qGetData.kpi_desc>
    								</cfif>				
    								
									<cfquery name="local.qCeklibcode" datasource="#request.sdsn#">
										SELECT lib_code FROM TPMDPERFORMANCE_PLAND
										WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
										AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
										AND reviewer_empid = <cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">
										AND lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										and UPPER(lib_type) = 'PERSKPI'
										AND request_no = <cfqueryparam value="#strckFormData.request_no#" cfsqltype="cf_sql_varchar">
									</cfquery>
									
									<cfif qCeklibcode.recordcount AND structkeyexists(objJSON,"perschk_kpi_#idx#")>
										<cfset local.penambahIdx = penambahIdx + 1>
										<cfset lib_code = form_no&(idx+hdntotalrowpers+penambahIdx)>
									</cfif>
    								
									
									<cfif lib_name eq "">
										<cfif structkeyexists(objJSON,"persselkpi_#idx#")>
    										<cfset varlibcode = objJSON["persselkpi_#idx#"]>
											<cfquery name="local.qGetDataLib" datasource="#request.sdsn#">
												SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> lib_name_#request.scookie.lang# lib_name
												FROM tpmdperformance_pland
												WHERE lib_code = <cfqueryparam value="#varlibcode#" cfsqltype="cf_sql_varchar">
												<cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
											</cfquery>
											<cfset lib_name = qGetDataLib.lib_name>
    									</cfif>
									</cfif>
    								<cfif lib_name eq "">
										<cfif structkeyexists(objJSON,"perstxtkpi_#idx#")>
    										<cfset lib_name = objJSON["perstxtkpi_#idx#"]>
    									<cfelse>
    										<cfset lib_name = "">
    									</cfif>
									</cfif>
    								<cfset isnew = 'Y'>
    								<cfset iscategory = 'N'>
    								<cfif structkeyexists(objJSON,"persseldesckpi_#idx#")>
    									<cfset achievement = objJSON["persseldesckpi_#idx#"]>
    								<cfelse>
    									<cfset achievement = "">
    								</cfif>
									<cfif achievement eq "">
										<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
									</cfif>
    								<cfif structkeyexists(objJSON,"txtprcodepers_#idx#")>
    									<cfset parent_code = objJSON["txtprcodepers_#idx#"]>
    								<cfelse>
    									<cfset parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								
    								<cfset kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset parent_path = "">
    								<cfset parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset parent_path = listappend(parent_path,"#parent_code#")>				
    							</cfif>
    							
    							<cfset lib_type = "PERSKPI">
    							<cfif structkeyexists(objJSON,"pers_target_#idx#")>
    								<cfset target = objJSON["pers_target_#idx#"]>
    							<cfelse>
    								<cfset target = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"pers_weight_#idx#")>
    								<cfset weight = objJSON["pers_weight_#idx#"]>
    							<cfelse>
    								<cfset weight = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"txtnote_#idx#")>
    								<cfset notes = objJSON["txtnote_#idx#"]>
    							<cfelse>
    								<cfset notes = "">
    							</cfif>
    							<cfif structkeyexists(objJSON,"persliborder_#idx#")>
    								<cfset LOCAL.liborder = objJSON["persliborder_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.iborder = 0>
    							</cfif>
    						
    							
    							
    							<!--- ENC - Add Lookup Achievement --->
    							<cfset LOCAL.kpilookupcode = "">
    							<cfif structkeyexists(objJSON,"persislookup_#idx#")>
    							<cfif objJSON["persislookup_#idx#"] eq 1>
            						<cfset strckKPILookUp.lookup_code = trim(Application.SFUtil.getCode("PERFLOOKUP",'no','true'))>
            						<cfset strckKPILookUp.method = objJSON["persmethod_#idx#"]>
            						<cfset strckKPILookUp.symbol = objJSON["perssymbol_#idx#"]>
            						
            						<cfif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
            						<cfset objPerfLookup.Insert(strckKPILookUp)>
            						<cfset LOCAL.idx2 = "">
            						<cfloop index="idx2" from="1" to="#objJSON['lookupitemtotal_#idx#']#">
            						    <cfset strckKPILookUp.lookup_value = objJSON["lookupval_#idx#_#idx2#"]>
            						    <cfset strckKPILookUp.lookup_score = objJSON["lookupscore_#idx#_#idx2#"]>
            						    
                						<cfset objPerfLookupDetail.Insert(strckKPILookUp)>
            						</cfloop>
            						</cfif>
            						<cfset kpilookupcode = strckKPILookUp.lookup_code>
    							</cfif>
                                </cfif>
                                
                                <cfif structkeyexists(objJSON,"iscascade_#idx#")>
                                    <cfset iscascade = objJSON["iscascade_#idx#"]>
                                <cfelse>
                                    <cfset iscascade = "0">
                                </cfif>
                                
                                <cfif structkeyexists(objJSON,"cascadefrom_empid_#idx#")>
                                    <cfset cascadefrom_empid = objJSON["cascadefrom_empid_#idx#"]>
                                <cfelse>
                                    <cfset cascadefrom_empid = "">
                                </cfif>
                                
                                <cfif structkeyexists(objJSON,"cascadefrom_formno_#idx#")>
                                    <cfset cascadefrom_formno = objJSON["cascadefrom_formno_#idx#"]>
                                <cfelse>
                                    <cfset cascadefrom_formno = "">
                                </cfif>
    						
    							<cfquery name="local.qComponentData" datasource="#request.sdsn#">
    								INSERT INTO TPMDPERFORMANCE_PLAND 
    								(form_no,company_code,lib_code,lib_type,reviewer_empid,reviewer_posid,weight,target,notes,lib_name_en,lib_name_id
    								,lib_name_my,lib_name_th,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th,iscategory,lib_depth,parent_code,parent_path
    								,achievement_type,isnew,created_by,created_date,modified_by,modified_date,lib_order,lookup_code,request_no,iscascade)
    								VALUES
    								(
    									<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="PERSKPI" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#reviewer_posid#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#weight#" cfsqltype="cf_sql_float">,
    									<cfqueryparam value="#target#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#notes#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#iscategory#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#val(kpi_depth)#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#parent_path#" cfsqltype="cf_sql_varchar">,
										<cfif achievement neq "">
											<cfqueryparam value="#achievement#" cfsqltype="cf_sql_varchar">,
										<cfelse>
											NULL,
										</cfif>
    									<cfqueryparam value="#isnew#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#liborder#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#kpilookupcode#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#iscascade#" cfsqltype="cf_sql_varchar">
    								)
    							</cfquery>
    							
    							<!--- [cascading] update cascadeto formno to TPMDGOALCASCADING for each cascade kpi--->
    				            <cfif iscascade gt 0>
									<cfset callupdateGoalCascade = updateGoalCascade(form_no=form_no,modified_by=modified_by,lib_code=lib_code,cascadefrom_empid=cascadefrom_empid,cascadefrom_formno=cascadefrom_formno,reviewee_empid=reviewee_empid)>
    				            </cfif>
    						    <!--- [cascading] --->
    						</cfif>
    					</cfloop>
    				</cfif>
			    </cfif>
				
			    <cfif listfindnocase(listPeriodComponentUsed,"OrgKPI")>
    				<cfset stringJSON = FORM["orgKPIArray"]>
    				<cfset local.objJSON = deserializeJSON(stringJSON)>
    				<cfif structkeyexists(objJSON,"hdn_flagdepthead")>
    				    <cfset LOCAL.hdnflagdepthead = objJSON["hdn_flagdepthead"]>
                    <cfelse>
                        <cfset LOCAL.hdnflagdepthead = 0>
                    </cfif>
                    <cfif structkeyexists(objJSON,"hdnchkCopyOrg")>
    					<cfset LOCAL.copyplanorg = objJSON["hdnchkCopyOrg"]>
    				<cfelse>
    				    <cfset LOCAL.copyplanorg = "0" >
    				</cfif> 
    				<cfif copyplanorg eq 1>
                        <cfquery name="LOCAL.qCekLastPeriodOrg" datasource="#request.sdsn#">
                        	SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> ph.period_code,ph.form_no,ph.reference_date,ph.request_no,ph.reviewee_posid, ph.reviewee_empid,kpi.orgunit_id
                        	FROM tpmdperformance_planh ph
                        	inner join TPMMPERIOD p on ph.period_code = p.period_code
                    		left join TPMDPERFORMANCE_PLANKPI kpi on kpi.form_no = ph.form_no
                    		WHERE  kpi.orgunit_id = <cfqueryparam value="#qEmpInfo.dept_id#" cfsqltype="cf_sql_varchar">
                        	AND ph.reference_date < <cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp">
                        	AND ph.isfinal = 1
                            ORDER BY ph.reference_date DESC, ph.modified_date DESC
                            <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
                        </cfquery>
    				</cfif>
    				<!---end : ENC50116-80092 : RS--->			
    				<cfif hdnflagdepthead eq 1>
    					
    					<!--- insert TPMDPERFORMANCE_PLANKPI --->
    					<cfset LOCAL.hdntotalrow = objJSON["hdn_totalrow"]>

                		<cfset local.objPerfLookup = createobject("component","SMPerfLookup")/>
                		<cfset local.objPerfLookupDetail = createobject("component","SMPerfLookupDetail")/>

						<cfset strckKPILookUp = StructNew()>
						<cfset strckKPILookUp.period_code = strckFormData.period_code>
						<cfset strckKPILookUp.company_code = strckFormData.varcocode>
        				
    					<cfloop from=1 to=#hdntotalrow# index="idx">
    					    <cfif structkeyexists(objJSON,"isnew_#idx#")>
    							<cfset LOCAL.isnew = objJSON["isnew_#idx#"]>
    						<cfelse>
    							<cfset LOCAL.isnew = 'N'>
    						</cfif>
    						
    						<cfif structkeyexists(objJSON,"libcode_#idx#") or structkeyexists(objJSON,"chk_kpi_#idx#") or structkeyexists(objJSON,"selkpi_#idx#")>
    							<cfquery name="local.qGetOrgUnitID" datasource="#request.sdsn#">
    								SELECT dept_id FROM TEOMPOSITION WHERE position_id = <cfqueryparam value="#reviewee_posid#" cfsqltype="cf_sql_integer">
    							</cfquery>
    							<cfset LOCAL.orgunitid = val(qGetOrgUnitID.dept_id)>
    							<cfif structkeyexists(objJSON,"libcode_#idx#") and isnew eq 'N'>
    								<cfset LOCAL.lib_code = objJSON["libcode_#idx#"]>
    								<cfset LOCAL.isnew = 'N'>
    								<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, kpi_depth, parent_code, parent_path, achievement_type
    									FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
                                    
									<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
										SELECT achievement_type
										FROM TPMDPERIODKPILIB 
										WHERE kpilib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										AND period_code = <cfqueryparam value="#strckFormData.period_code#" cfsqltype="cf_sql_varchar">
										AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
									</cfquery>

									<cfif qGetDataACH.achievement_type neq "">
										<cfset local.achievement = qGetDataACH.achievement_type>
									<cfelse>
										<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
											SELECT achievement_type
											FROM tpmdperiodkpi
											WHERE  period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    										AND UPPER(kpi_type) = 'ORGUNIT'
    										AND reference_date = <cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp">
    										AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    										AND position_id = <cfqueryparam value="#orgunitid#" cfsqltype="cf_sql_integer">
    										AND kpilib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										</cfquery>
										<cfif qGetDataACH.achievement_type neq "">
											<cfset local.achievement = qGetDataACH.achievement_type>
										<cfelse>
											<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
												SELECT actual_type as achievement_type
												FROM TPMDPERIODCOMPONENT
												WHERE component_code = 'orgKPI'
												AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
												AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
											</cfquery>
											<cfset local.achievement = qGetDataACH.achievement_type>
										</cfif>
										
									</cfif>
    								<cfset LOCAL.lib_name = qGetData.kpi_name>
    								<cfset LOCAL.desc = qGetData.kpi_desc>
    								<cfset LOCAL.iscategory = qGetData.iscategory>
    								<cfset LOCAL.kpi_depth = qGetData.kpi_depth>
    								<cfset LOCAL.parent_code = qGetData.parent_code>
    								<cfset LOCAL.parent_path = qGetData.parent_path>
    								
    							<cfelse>	
    								<cfif structkeyexists(objJSON,"chk_kpi_#idx#")>					
    									<cfset LOCAL.lib_code = form_no&idx>
    									<cfif structkeyexists(objJSON,"txtkpi_#idx#")>
    										<cfset LOCAL.lib_name = objJSON["txtkpi_#idx#"]>
    									<cfelse>
    										<cfset LOCAL.lib_name = "">
    									</cfif>
        								<cfif structkeyexists(objJSON,"txtdesc_#idx#")>
        									<cfset LOCAL.desc = objJSON["txtdesc_#idx#"]>
        								<cfelse>
        									<cfset LOCAL.desc = "">
        								</cfif>
    								<cfelse>
    									<cfset LOCAL.lib_code = objJSON["selkpi_#idx#"]>
    									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    										SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc
    										FROM TPMMKPI
    										WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    									</cfquery>
    									<cfset LOCAL.lib_name = qGetData.kpi_name>					
    									<cfset LOCAL.desc = qGetData.kpi_desc>
    								</cfif>				
    								
    								<cfset LOCAL.isnew = 'Y'>
    								<cfset LOCAL.iscategory = 'N'>
    								<cfif structkeyexists(objJSON,"seldesckpi_#idx#")>
    									<cfset LOCAL.achievement = objJSON["seldesckpi_#idx#"]>
    								<cfelse>
    									<cfset LOCAL.achievement = "">
    								</cfif>
    								<cfif structkeyexists(objJSON,"txtprcode_#idx#")>
    									<cfset LOCAL.parent_code = objJSON["txtprcode_#idx#"]>
    								<cfelse>
    									<cfset LOCAL.parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								
    								<cfset LOCAL.kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset LOCAL.parent_path = "">
    								<cfset LOCAL.parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset LOCAL.parent_path = listappend(parent_path,"#parent_code#")>				
    							</cfif>
    							
    							<cfif structkeyexists(objJSON,"org_target_#idx#")>
    								<cfset LOCAL.target = objJSON["org_target_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.target = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"org_weight_#idx#")>
    								<cfset LOCAL.weight = objJSON["org_weight_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.weight = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"liborder_#idx#")>
    								<cfset LOCAL.liborder = objJSON["liborder_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.liborder = 0>
    							</cfif>
    							
    							<cfquery name="local.qCeklibcode" datasource="#request.sdsn#">
    								SELECT lib_code FROM TPMDPERFORMANCE_PLANKPI
    								WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
    								AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    								AND reference_date = <cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp">
    								AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    								AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    								AND lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    							</cfquery>
    							
    							<cfif qCeklibcode.recordcount>
    								<script>alert("Cannot Insert Same KPI");maskButton(false);</script><CF_SFABORT>
    							</cfif>
    							
    							<!--- ENC - Add Lookup Achievement --->
    							<cfset LOCAL.kpilookupcode = "">
    							<cfif structkeyexists(objJSON,"orgislookup_#idx#")>
    							<cfif objJSON["orgislookup_#idx#"] eq 1>
            						<cfset strckKPILookUp.lookup_code = trim(Application.SFUtil.getCode("PERFLOOKUP",'no','true'))>
            						<cfset strckKPILookUp.method = objJSON["orgmethod_#idx#"]>
            						<cfset strckKPILookUp.symbol = objJSON["orgsymbol_#idx#"]>
            						<cfif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
            						<cfset objPerfLookup.Insert(strckKPILookUp)>
            						
            						<cfloop index="idx2" from="1" to="#objJSON['lookupitemtotal_#idx#']#">
            						    <cfset strckKPILookUp.lookup_value = objJSON["lookupval_#idx#_#idx2#"]>
            						    <cfset strckKPILookUp.lookup_score = objJSON["lookupscore_#idx#_#idx2#"]>
            						    
                						<cfset objPerfLookupDetail.Insert(strckKPILookUp)>
            						</cfloop>
            						</cfif>
            						<cfset LOCAL.kpilookupcode = strckKPILookUp.lookup_code>
    							</cfif>
                                </cfif>
								
    							<cfquery name="local.qComponentData" datasource="#request.sdsn#">
    								INSERT INTO TPMDPERFORMANCE_PLANKPI 
    								(form_no,request_no,reference_date,period_code,company_code,orgunit_id,lib_code,weight,target
    								,lib_name_en,lib_name_id,lib_name_my,lib_name_th,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th
    								,iscategory,lib_depth,parent_code,parent_path,achievement_type,isnew
    								,created_by,created_date,modified_by,modified_date
    								,lib_order
    								,lookup_code
    								<cfif copyplanorg eq 1 and qCekLastPeriodOrg.recordcount>,form_lastperiod</cfif>
    								)
    								VALUES(
    									<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#reference_date#" cfsqltype="cf_sql_timestamp">,
    									<cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#orgunitid#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#weight#" cfsqltype="cf_sql_float">,
    									<cfqueryparam value="#target#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#iscategory#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#val(kpi_depth)#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#parent_path#" cfsqltype="cf_sql_varchar">,
										<cfif achievement neq "">
											<cfqueryparam value="#achievement#" cfsqltype="cf_sql_varchar">,
										<cfelse>
											NULL,
										</cfif>
    									<cfqueryparam value="#isnew#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    									<!---<cfqueryparam value="#created_date#" cfsqltype="cf_sql_timestamp">,--->
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    									<!---<cfqueryparam value="#modified_date#" cfsqltype="cf_sql_timestamp">,--->
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#liborder#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#kpilookupcode#" cfsqltype="cf_sql_varchar">
    									<cfif copyplanorg eq 1 and qCekLastPeriodOrg.recordcount>,<cfqueryparam value="#qCekLastPeriodOrg.form_no#" cfsqltype="cf_sql_varchar"></cfif>
    								)
    							</cfquery>
    						</cfif>
    					</cfloop>				
    				</cfif>

                    
				</cfif>
				<cfif (flagcopy eq 1 or flagcopy eq 2) and len(trim(lastform)) neq 0  >
			     
			        <cfset local.delform = DeleteForm(lastform)>
			  
			    </cfif>
			<cfelse>
				
				<!---riz--->
				<cfset LOCAL.qEmpInfo = getEmpDetail(empid=empid)>
				<cfset LOCAL.qLoginInfo = getEmpDetail(empid=request.scookie.user.empid)>
				
				<cfquery name="local.qUnitPath" datasource="#request.sdsn#">
					SELECT parent_path FROM TEOMPOSITION WHERE position_id = <cfqueryparam value="#qEmpInfo.dept_id#" cfsqltype="cf_sql_integer">
				</cfquery>
				<cfset LOCAL.form_no = strckFormData.formno>
				<cfset LOCAL.request_no = strckFormData.request_no>
				
				
				<cfquery name="local.qSelRev" datasource="#request.sdsn#">
                   	SELECT form_no FROM TPMDPERFORMANCE_PLANH
                    WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
                       	AND reviewee_empid = <cfqueryparam value="#reviewee_empid#" cfsqltype="cf_sql_varchar">
                        AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
                        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                        AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
				</cfquery>
				<cfif qSelRev.recordcount eq 0>
					<cfset LOCAL.lstunitpath = qUnitPath.parent_path>
					<cfset LOCAL.lstunitpath = listappend(lstunitpath,"#qEmpInfo.dept_id#")>
					<cfset LOCAL.request_no = strckFormData.request_no>
					<cfset LOCAL.company_code = strckFormData.varcocode>
					<cfset LOCAL.form_order = 1>
					<cfset LOCAL.reference_date = refdate>
					<cfset LOCAL.period_code = period_code>
					<cfset LOCAL.reviewee_empid = empid>
					<cfset LOCAL.reviewee_posid = qEmpInfo.position_id>
					<cfset LOCAL.reviewee_grade = qEmpInfo.grade_code>
					<cfset LOCAL.reviewee_employ_code = qEmpInfo.employ_code>
					<cfset LOCAL.reviewee_unitpath = lstunitpath>
				
        			<cfset LOCAL.reviewer_empid = request.scookie.user.empid>
        			<cfset LOCAL.reviewer_posid = qLoginInfo.position_id>
        			<cfset LOCAL.review_step = strckFormData.UserInReviewStep>	<!--- rangga ---> 
				
					<cfset LOCAL.lastreviewer_empid = request.scookie.user.empid>
					<cfset LOCAL.created_by = request.scookie.user.uname>
					<cfset LOCAL.created_date = now()>
					<cfset LOCAL.modified_by = request.scookie.user.uname>
					<cfset LOCAL.modified_date = now()>
                        <cfif action neq 'draft' or sendtype eq 'directfinal' or sendtype neq 'draft'>
							<cfquery name="LOCAL.qUpdateRequestBefore" datasource="#request.sdsn#">
								UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0,modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
								WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
								and request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
								AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
								AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
							</cfquery>
                    	</cfif>
						<cfquery name="local.qComponentData" datasource="#request.sdsn#">
							INSERT INTO TPMDPERFORMANCE_PLANH
							(form_no,company_code,request_no,form_order,reference_date,period_code,reviewee_empid
							,reviewee_posid,reviewee_grade,reviewee_employcode,reviewee_unitpath
							,reviewer_empid,reviewer_posid,review_step,head_status,lastreviewer_empid
							,created_by,created_date,modified_by,modified_date,isfinal,isfinal_requestno
							)
							VALUES(
							<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#form_order#" cfsqltype="cf_sql_integer">,
							<cfqueryparam value="#reference_date#" cfsqltype="cf_sql_timestamp">,
							<cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewee_empid#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewee_posid#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewee_grade#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewee_employ_code#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewee_unitpath#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#reviewer_posid#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#review_step#" cfsqltype="cf_sql_integer">,
							<cfqueryparam value="#strckFormData.head_status#" cfsqltype="cf_sql_integer">,
							<cfqueryparam value="#lastreviewer_empid#" cfsqltype="cf_sql_varchar">,
							<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
							<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
							<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
							<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
							<cfqueryparam value="#strckFormData.isfinal#" cfsqltype="cf_sql_integer">,
							<cfqueryparam value="#strckFormData.isfinal_requestno#" cfsqltype="cf_sql_integer">
							)
						</cfquery>
						
						
						
                <cfelse>
	                <cfquery name="Local.qUpdatePlanH" datasource="#request.sdsn#">
		              	UPDATE TPMDPERFORMANCE_PLANH
	                    SET head_status = <cfqueryparam value="#strckFormData.head_status#" cfsqltype="cf_sql_integer">,
	                        modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
    	                WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
        	               	AND reviewee_empid = <cfqueryparam value="#reviewee_empid#" cfsqltype="cf_sql_varchar">
            	            AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
                	        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                	        AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
	                </cfquery>
				</cfif>
				
				<cfif listfindnocase(listPeriodComponentUsed,"OrgKPI")>
    				<cfset stringJSON = FORM["orgKPIArray"]>
    				<cfset local.objJSON = deserializeJSON(stringJSON)>
    				<cfif structkeyexists(objJSON,"hdn_flagdepthead")>
    				    <cfset LOCAL.hdnflagdepthead = objJSON["hdn_flagdepthead"]>
                    <cfelse>
                        <cfset LOCAL.hdnflagdepthead = 0>
                    </cfif>

    				<cfif hdnflagdepthead  eq 1> 
    			    	<cfset local.objPerfLookup = createobject("component","SMPerfLookup")/>
                		<cfset local.objPerfLookupDetail = createobject("component","SMPerfLookupDetail")/>

						<cfset LOCAL.strckKPILookUp = StructNew()>
						<cfset strckKPILookUp.period_code = strckFormData.period_code>
						<cfset strckKPILookUp.company_code = strckFormData.varcocode>
    			
                        <cfset LOCAL.request_no = strckFormData.request_no>
    					
    					<!--- Delete Insert tabel TPMDPERFORMANCE_PLANKPI --->
    					<cfquery name="local.qDelete" datasource="#request.sdsn#">
    						DELETE FROM TPMDPERFORMANCE_PLANKPI
    						WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
    						AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    						AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    						AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    					</cfquery>
    					
    					<!--- insert TPMDPERFORMANCE_PLANKPI --->
    					<cfset LOCAL.hdntotalrow = objJSON["hdn_totalrow"]>
						<cfset LOCAL.idx = "">
    					<cfloop from=1 to=#hdntotalrow# index="idx">
    						<cfif structkeyexists(objJSON,"isnew_#idx#")>
    							<cfset LOCAL.isnew = objJSON["isnew_#idx#"]>
    						<cfelse>
    							<cfset LOCAL.isnew = 'N'>
    						</cfif>
    						
    						<cfif structkeyexists(objJSON,"libcode_#idx#") or structkeyexists(objJSON,"chk_kpi_#idx#") or structkeyexists(objJSON,"selkpi_#idx#")>
    							<cfset LOCAL.reviewee_posid = qEmpInfo.position_id>
    							<cfquery name="local.qGetOrgUnitID" datasource="#request.sdsn#">
    								SELECT dept_id FROM TEOMPOSITION
    								WHERE position_id = <cfqueryparam value="#reviewee_posid#" cfsqltype="cf_sql_integer">
    							</cfquery>
    							<cfset LOCAL.orgunitid = val(qGetOrgUnitID.dept_id)>
    							
    							<cfif structkeyexists(objJSON,"libcode_#idx#") and isnew eq 'N'>
    								<cfset LOCAL.lib_code = objJSON["libcode_#idx#"]>
    								<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, kpi_depth, parent_code, parent_path, achievement_type
    									FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
									<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
										SELECT achievement_type
										FROM TPMDPERIODKPILIB  WHERE kpilib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										AND period_code = <cfqueryparam value="#strckFormData.period_code#" cfsqltype="cf_sql_varchar">
										AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
									</cfquery>

									<cfif qGetDataACH.achievement_type neq "">
										<cfset local.achievement = qGetDataACH.achievement_type>
									<cfelse>
										<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
											SELECT achievement_type
											FROM tpmdperiodkpi WHERE  period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    										AND UPPER(kpi_type) = 'ORGUNIT'
    										AND reference_date = <cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp">
    										AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    										AND position_id = <cfqueryparam value="#orgunitid#" cfsqltype="cf_sql_integer">
    										AND kpilib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										</cfquery>
										<cfif qGetDataACH.achievement_type neq "">
											<cfset local.achievement = qGetDataACH.achievement_type>
										<cfelse>
											<cfquery name="local.qGetDataACH" datasource="#request.sdsn#">
												SELECT actual_type as achievement_type
												FROM TPMDPERIODCOMPONENT WHERE UPPER(component_code) = 'ORGKPI'
												AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
												AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
											</cfquery>
											<cfset local.achievement = qGetDataACH.achievement_type>
										</cfif>
										
									</cfif>
									
    								<cfset LOCAL.lib_name = qGetData.kpi_name>
    								<cfset LOCAL.desc = qGetData.kpi_desc>
    								<cfset LOCAL.iscategory = qGetData.iscategory>
    								<cfset LOCAL.kpi_depth = qGetData.kpi_depth>
    								<cfset LOCAL.parent_code = qGetData.parent_code>
    								<cfset LOCAL.parent_path = qGetData.parent_path>
    								
    							<cfelse>	
    								<cfif structkeyexists(objJSON,"chk_kpi_#idx#")>					
    									<cfset LOCAL.lib_code = form_no&idx>
    									<cfif structkeyexists(objJSON,"txtkpi_#idx#")>
    										<cfset LOCAL.lib_name = objJSON["txtkpi_#idx#"]>
    									<cfelse>
    										<cfset LOCAL.lib_name = "">
    									</cfif>
        								<cfif structkeyexists(objJSON,"txtdesc_#idx#")>
        									<cfset LOCAL.desc = objJSON["txtdesc_#idx#"]>
        								<cfelse>
        									<cfset LOCAL.desc = "">
        								</cfif>
    								<cfelse>
    									<cfset LOCAL.lib_code = objJSON["selkpi_#idx#"]>
    									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    										SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc
    										FROM TPMMKPI WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    									</cfquery>
    									<cfset LOCAL.lib_name = qGetData.kpi_name>					
        								<cfset LOCAL.desc = qGetData.kpi_desc>
    								</cfif>				
    								
    								<cfset LOCAL.iscategory = 'N'>
    								<cfif structkeyexists(objJSON,"seldesckpi_#idx#")>
    									<cfset LOCAL.achievement = objJSON["seldesckpi_#idx#"]>
    								<cfelse>
    									<cfset LOCAL.achievement = "">
    								</cfif>
    								<cfif structkeyexists(objJSON,"txtprcode_#idx#")>
    									<cfset LOCAL.parent_code = objJSON["txtprcode_#idx#"]>
    								<cfelse>
    									<cfset LOCAL.parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								
    								<cfset LOCAL.kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset LOCAL.parent_path = "">
    								<cfset LOCAL.parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset LOCAL.parent_path = listappend(parent_path,"#parent_code#")>				
    							</cfif>
    							
    							<cfif structkeyexists(objJSON,"org_target_#idx#")>
    								<cfset LOCAL.target = objJSON["org_target_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.target = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"org_weight_#idx#")>
    								<cfset LOCAL.weight = objJSON["org_weight_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.weight = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"liborder_#idx#")>
    								<cfset LOCAL.liborder = objJSON["liborder_#idx#"]>
    							<cfelse>
    								<cfset LOCAL.iborder = 0>
    							</cfif>
    							
    							<cfset LOCAL.company_code = strckFormData.varcocode>
    							<cfset LOCAL.created_by = request.scookie.user.uname>
    							<cfset LOCAL.created_date = now()>
    							<cfset LOCAL.modified_by = request.scookie.user.uname>
    							<cfset LOCAL.modified_date = now()>
    							
    							<cfquery name="local.qCeklibcode" datasource="#request.sdsn#">
    								SELECT lib_code FROM TPMDPERFORMANCE_PLANKPI
    								WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
    								AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    								AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    								AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    								AND lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    							</cfquery>
    						
    							<cfif qCeklibcode.recordcount>
    								<script>alert("Cannot Insert Same KPI");maskButton(false);</script><CF_SFABORT>
    							</cfif>
    							
    							<!--- ENC - Add Lookup Achievement --->
    							
    							<cfset LOCAL.kpilookupcode = "">
    							<cfif structkeyexists(objJSON,"orgislookup_#idx#")>
        						<cfset strckKPILookUp.lookup_code = objJSON["orglookupcode_#idx#"]>
    							<cfif objJSON["orgislookup_#idx#"] eq 1>
            						<cfset strckKPILookUp.method = objJSON["orgmethod_#idx#"]>
            						<cfset strckKPILookUp.symbol = objJSON["orgsymbol_#idx#"]>
            						<cfif strckKPILookUp.lookup_code eq "">
                						<cfset strckKPILookUp.lookup_code = trim(Application.SFUtil.getCode("PERFLOOKUP",'no','true'))>
                					<cfelseif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
                						<cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
                						    DELETE FROM TPMDLOOKUP WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar">
                						        AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
                						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                						</cfquery>
                                        <cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
                						    DELETE FROM TPMMLOOKUP
                						    WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar">
                						        AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
                						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                						</cfquery>
            						</cfif>
            						
            						<cfif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
                						<cfset objPerfLookup.Insert(strckKPILookUp)>
                						
                						<cfloop index="idx2" from="1" to="#objJSON['lookupitemtotal_#idx#']#">
                						    <cfset strckKPILookUp.lookup_value = objJSON["lookupval_#idx#_#idx2#"]>
                						    <cfset strckKPILookUp.lookup_score = objJSON["lookupscore_#idx#_#idx2#"]>
                    						<cfset objPerfLookupDetail.Insert(strckKPILookUp)>
                						</cfloop>
            						</cfif>

            						<cfset kpilookupcode = strckKPILookUp.lookup_code>
            					<cfelse>
            						<cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
            						    DELETE FROM TPMDLOOKUP
            						    WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar">
            						        AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
            						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            						</cfquery>
                                    <cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
                                        DELETE FROM TPMMLOOKUP
            						    WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar">
            						        AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
            						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            						</cfquery>
    							</cfif>
                                </cfif>
    							<cfquery name="local.qComponentData" datasource="#request.sdsn#">
    								INSERT INTO TPMDPERFORMANCE_PLANKPI 
    								(form_no,request_no,reference_date,period_code,company_code,orgunit_id,lib_code,weight,target
    								,lib_name_en,lib_name_id,lib_name_my,lib_name_th,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th
    								,iscategory,lib_depth,parent_code,parent_path,achievement_type,isnew
    								,created_by,created_date,modified_by,modified_date,lib_order,lookup_code
    								)
    								VALUES(
    									<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#refdate#" cfsqltype="cf_sql_timestamp">,
    									<cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#company_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#val(orgunitid)#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#weight#" cfsqltype="cf_sql_float">,
    									<cfqueryparam value="#target#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#iscategory#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#val(kpi_depth)#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#parent_path#" cfsqltype="cf_sql_varchar">,
										<cfif achievement neq "">
											<cfqueryparam value="#achievement#" cfsqltype="cf_sql_varchar">,
										<cfelse>
											NULL,
										</cfif>
    									<cfqueryparam value="#isnew#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#liborder#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#kpilookupcode#" cfsqltype="cf_sql_varchar">
    								)
    							</cfquery>
    						</cfif>			
    					</cfloop>
    				</cfif>
    			</cfif>
    			
    			<cfif listfindnocase(listPeriodComponentUsed,"persKPI")>
    			    <cfset reviewer_empid = request.scookie.user.empid>
        			<cfset reviewer_posid = qLoginInfo.position_id>
				    <cfset review_step = strckFormData.UserInReviewStep>	<!--- rangga ---> 
    				<cfset stringJSON = FORM["persKPIArray"]> <!--- kalo kosong isinya cuma {} --->
					
    				<cfif stringJSON eq '{}'>
    			        <cfquery name="local.qGetLastReviewer" datasource="#request.sdsn#">
    			            SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> reviewer_empid,request_no
    			            FROM TPMDPERFORMANCE_PLANH
    			            WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
    			                AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    			                AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
    			                AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    			                AND review_step < #review_step#
    			            ORDER BY review_step DESC
    			            <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
    			        </cfquery>
    			        <cfquery name="local.qCekLastReviewer" datasource="#request.sdsn#">
    			            SELECT form_no FROM TPMDPERFORMANCE_PLAND
        			        WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
        			        AND reviewer_empid = <cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">
        			        AND request_no = <cfqueryparam value="#qGetLastReviewer.request_no#" cfsqltype="cf_sql_varchar">
    			        </cfquery>
    			        
    			        <cfif qCekLastReviewer.recordcount eq 0>
        			        <cfquery name="local.qGetSelectInsert" datasource="#request.sdsn#">
        			            INSERT INTO TPMDPERFORMANCE_PLAND
        			            SELECT form_no, company_code, lib_code, lib_type, '#reviewer_empid#' AS reviewer_empid, #reviewer_posid# AS reviewer_posid, weight, target, notes, 
                                	'#request.scookie.user.uname#' AS created_by, <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif> AS created_date, '#request.scookie.user.uname#' AS modified_by,
                                	<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif> AS modified_date, 
                                	lib_name_en, lib_name_id, lib_name_my, lib_name_th,
                                	lib_desc_en, lib_desc_id, lib_desc_my, lib_desc_th,
                                	iscategory, lib_depth, parent_code, parent_path, achievement_type, isnew, lib_order,lookup_code, request_no
        			                ,iscascade
        			            FROM TPMDPERFORMANCE_PLAND
        			            WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
        			            AND reviewer_empid = <cfqueryparam value="#qGetLastReviewer.reviewer_empid#" cfsqltype="cf_sql_varchar">
        			            AND request_no = <cfqueryparam value="#qGetLastReviewer.request_no#" cfsqltype="cf_sql_varchar">
        			        </cfquery>
    			        </cfif>
    				<cfelse>
    					<cfset created_by = request.scookie.user.uname>
    					<cfset created_date = now()>
    					<cfset modified_by = request.scookie.user.uname>
    					<cfset modified_date = now()>
    					
                		<cfset local.objPerfLookup = createobject("component","SMPerfLookup")/>
                		<cfset local.objPerfLookupDetail = createobject("component","SMPerfLookupDetail")/>

						<cfset strckKPILookUp = StructNew()>
						<cfset strckKPILookUp.period_code = strckFormData.period_code>
						<cfset strckKPILookUp.company_code = strckFormData.varcocode>
    					
    				<!--- Delete Insert tabel TPMDPERFORMANCE_PLAND --->
    					<cfquery name="local.qDelete" datasource="#request.sdsn#">
    						DELETE FROM TPMDPERFORMANCE_PLAND
    						WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
    						AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    						AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
    						AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    					</cfquery>
							
    					<cfset local.objJSON = deserializeJSON(stringJSON)>
		       
    					<cfset hdntotalrowpers = objJSON["hdn_totalrowpers"]>
						<cfset local.penambahIdx = 0>
    					<cfloop from=1 to=#hdntotalrowpers# index="idx">
    						<cfif structkeyexists(objJSON,"ispersnew_#idx#")>
    							<cfset isnew = objJSON["ispersnew_#idx#"]>
    						<cfelse>
    							<cfset isnew = 'N'>
    						</cfif>
    						<cfif structkeyexists(objJSON,"perslibcode_#idx#") or structkeyexists(objJSON,"perschk_kpi_#idx#") or structkeyexists(objJSON,"persselkpi_#idx#")>
		
    							<cfif structkeyexists(objJSON,"perslibcode_#idx#") and isnew eq 'N'>
    								<cfset lib_code = objJSON["perslibcode_#idx#"]>
    								<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, kpi_depth, parent_code, parent_path, achievement_type
    									FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
										
    								</cfquery>
    								<cfset lib_name = qGetData.kpi_name>
    								<cfset desc = qGetData.kpi_desc>
    								<cfset iscategory = qGetData.iscategory>
    								<cfset kpi_depth = qGetData.kpi_depth>
    								<cfset parent_code = qGetData.parent_code>
    								<cfset parent_path = qGetData.parent_path>
									<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
									
    					  	<cfelseif structkeyexists(objJSON,"perslibcode_#idx#") AND isnew EQ 'Y'>
    								<cfset lib_code = objJSON["perslibcode_#idx#"]>
									<cfset isnew = 'Y'>
									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    									SELECT lib_name_#request.scookie.lang# kpi_name, lib_desc_#request.scookie.lang# kpi_desc, 
    									iscategory, lib_depth, parent_code, parent_path, achievement_type
    									FROM tpmdperformance_pland
    									WHERE lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar"> order by created_date desc
    								</cfquery>
									<cfset iscategory = 'N'>
    								<cfset achievement = qGetData.achievement_type>
									<cfif structkeyexists(objJSON,"perstxtkpi_#idx#")>
										<cfset lib_name = objJSON["perstxtkpi_#idx#"]>
									<cfelse>
										<cfset lib_name = "">
									</cfif>

									<cfif structkeyexists(objJSON,"perstxtdesc_#idx#")>
										<cfset desc = objJSON["perstxtdesc_#idx#"]>
									<cfelse>
										<cfset desc = "">
									</cfif>
									<cfif structkeyexists(objJSON,"txtprcodepers_#idx#")>
    									<cfset parent_code = objJSON["txtprcodepers_#idx#"]>
    								<cfelse>
    									<cfset parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI
    									WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								
    								<cfset kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset parent_path = "">
    								<cfset parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset parent_path = listappend(parent_path,"#parent_code#")>	
									
									<cfif lib_name eq ""><cfset lib_name = qGetData.kpi_name></cfif>
									<cfif desc eq ""><cfset desc = qGetData.kpi_desc></cfif>
									
									<cfif kpi_depth eq ""><cfset kpi_depth = qGetData.lib_depth></cfif>
									<cfif parent_code eq ""><cfset parent_code = qGetData.parent_code></cfif>
									<cfif parent_path eq ""><cfset parent_path = qGetData.parent_path></cfif>
									<cfif structkeyexists(objJSON,"persseldesckpi_#idx#")>
    									<cfset achievement = objJSON["persseldesckpi_#idx#"]>
    								<cfelse>
    									<cfset achievement = "">
    								</cfif>
									<cfif achievement eq "">
										<cfset achievement = getAchType(lib_code=lib_code,lib_type='PERSONAL',period_code=period_code,component_code='PERSKPI',position_id=qEmpInfo.position_id)>
									</cfif>
									
    							<cfelseif not structkeyexists(objJSON,"perslibcode_#idx#")>	
										
									
    								<cfif structkeyexists(objJSON,"perschk_kpi_#idx#")>		
										<cfif structkeyexists(objJSON,"perslibcode_#idx#")>
                                            <cfset lib_code = objJSON["perslibcode_#idx#"]>
                                        <cfelse>
                                            <cfset lib_code = form_no&idx> 
                                        </cfif> 
    									<cfif structkeyexists(objJSON,"perstxtkpi_#idx#")>
    										<cfset lib_name = objJSON["perstxtkpi_#idx#"]>
    									<cfelse>
    										<cfset lib_name = "">
    									</cfif>
        								<cfif structkeyexists(objJSON,"perstxtdesc_#idx#")>
        									<cfset desc = objJSON["perstxtdesc_#idx#"]>
        								<cfelse>
        									<cfset desc = "">
        								</cfif>
    								<cfelse>
    									<cfset lib_code = objJSON["persselkpi_#idx#"]>
    									<cfquery name="local.qGetData" datasource="#request.sdsn#">
    										SELECT kpi_name_#request.scookie.lang# kpi_name, kpi_desc_#request.scookie.lang# kpi_desc FROM TPMMKPI WHERE kpi_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
    									</cfquery>
    									<cfset lib_name = qGetData.kpi_name>					
    									<cfset desc = qGetData.kpi_desc>
									</cfif>
    								
    								<cfset iscategory = 'N'>
    								<cfif structkeyexists(objJSON,"persseldesckpi_#idx#")>
    									<cfset achievement = objJSON["persseldesckpi_#idx#"]>
    								<cfelse>
    									<cfset achievement = "">
    								</cfif>
    								<cfif structkeyexists(objJSON,"txtprcodepers_#idx#")>
    									<cfset parent_code = objJSON["txtprcodepers_#idx#"]>
    								<cfelse>
    									<cfset parent_code = "">
    								</cfif>
    								<cfquery name="local.qGetParent" datasource="#request.sdsn#">
    									SELECT kpi_depth, parent_path FROM TPMMKPI WHERE kpi_code = <cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">
    								</cfquery>
    								<cfset kpi_depth = val(qGetParent.kpi_depth)+1>
    								<cfset parent_path = "">
    								<cfset parent_path = listappend(parent_path,"#qGetParent.parent_path#")>
    								<cfset parent_path = listappend(parent_path,"#parent_code#")>				
    							</cfif>
    							
    							<cfset lib_type = "PERSKPI">
    							<cfif structkeyexists(objJSON,"pers_target_#idx#")>
    								<cfset target = objJSON["pers_target_#idx#"]>
    							<cfelse>
    								<cfset target = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"pers_weight_#idx#")>
    								<cfset weight = objJSON["pers_weight_#idx#"]>
    							<cfelse>
    								<cfset weight = 0>
    							</cfif>
    							<cfif structkeyexists(objJSON,"txtnote_#idx#")>
    								<cfset notes = objJSON["txtnote_#idx#"]>
    							<cfelse>
    								<cfset notes = "">
    							</cfif>
    							<cfif structkeyexists(objJSON,"persliborder_#idx#")>
    								<cfset liborder = objJSON["persliborder_#idx#"]>
    							<cfelse>
    								<cfset liborder = 0>
    							</cfif>
    							
    							 <cfif structkeyexists(objJSON,"iscascade_#idx#")>
                                    <cfset iscascade = objJSON["iscascade_#idx#"]>
                                <cfelse>
                                    <cfset iscascade = "0">
                                </cfif>
                                
                                <cfif structkeyexists(objJSON,"cascadefrom_empid_#idx#")>
                                    <cfset cascadefrom_empid = objJSON["cascadefrom_empid_#idx#"]>
                                <cfelse>
                                    <cfset cascadefrom_empid = "">
                                </cfif>
                                
                                <cfif structkeyexists(objJSON,"cascadefrom_formno_#idx#")>
                                    <cfset cascadefrom_formno = objJSON["cascadefrom_formno_#idx#"]>
                                <cfelse>
                                    <cfset cascadefrom_formno = "">
                                </cfif>
    							<cfset reviewer_empid = request.scookie.user.empid>
    							<cfset reviewer_posid = qLoginInfo.position_id>
								<cfquery name="local.qCeklibcode" datasource="#request.sdsn#">
									SELECT lib_code FROM TPMDPERFORMANCE_PLAND
									WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
									AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
									AND reviewer_empid = <cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">
									AND lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
									and UPPER(lib_type) = 'PERSKPI'
									AND request_no = <cfqueryparam value="#strckFormData.request_no#" cfsqltype="cf_sql_varchar">
								</cfquery>

								<cfif qCeklibcode.recordcount AND structkeyexists(objJSON,"perschk_kpi_#idx#")>
									<cfset penambahIdx = penambahIdx + 1>
									<cfset lib_code = form_no&(idx+hdntotalrowpers+penambahIdx)>
								</cfif>
									
    							
    							<cfset kpilookupcode = "">
    							<cfif structkeyexists(objJSON,"perslookupcode_#idx#")>
									<cfset strckKPILookUp.lookup_code = objJSON["perslookupcode_#idx#"]>
        						</cfif>
        						<cfif structkeyexists(objJSON,"persislookup_#idx#")>
    							<cfif objJSON["persislookup_#idx#"] eq 1>
            						<cfset strckKPILookUp.method = objJSON["persmethod_#idx#"]>
            						<cfset strckKPILookUp.symbol = objJSON["perssymbol_#idx#"]>
            						<cfif strckKPILookUp.lookup_code eq "">
                						<cfset strckKPILookUp.lookup_code = trim(Application.SFUtil.getCode("PERFLOOKUP",'no','true'))>
                					<cfelseif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
                						<cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
                						    DELETE FROM TPMDLOOKUP  WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar">  AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
                						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                                        </cfquery>
                                        <cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
                						    DELETE FROM TPMMLOOKUP WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar"> AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
                						        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                						</cfquery>
            						</cfif>
            						
            						<cfif structkeyexists(objJSON,"lookupitemtotal_#idx#")>
                						<cfset objPerfLookup.Insert(strckKPILookUp)>
                						<cfloop index="idx2" from="1" to="#objJSON['lookupitemtotal_#idx#']#">
                						    <cfset strckKPILookUp.lookup_value = objJSON["lookupval_#idx#_#idx2#"]>
                						    <cfset strckKPILookUp.lookup_score = objJSON["lookupscore_#idx#_#idx2#"]>
                    						<cfset objPerfLookupDetail.Insert(strckKPILookUp)>
                						</cfloop>
            						</cfif>
										<cfset kpilookupcode = strckKPILookUp.lookup_code>
										<cfelse>
											<cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
												DELETE FROM TPMDLOOKUP WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar"> AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
												AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
											</cfquery>
											<cfquery name="local.qDelLookUpData" datasource="#request.sdsn#">
												DELETE FROM TPMMLOOKUP WHERE lookup_code = <cfqueryparam value="#strckKPILookUp.lookup_code#" cfsqltype="cf_sql_varchar"> AND period_code = <cfqueryparam value="#strckKPILookUp.period_code#" cfsqltype="cf_sql_varchar">
												AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
											</cfquery>
										</cfif>
    							</cfif>

    							<cfquery name="local.qComponentData" datasource="#request.sdsn#">
    								INSERT INTO TPMDPERFORMANCE_PLAND (form_no,company_code,lib_code,lib_type,reviewer_empid,reviewer_posid,weight,target,notes,lib_name_en,lib_name_id ,lib_name_my,lib_name_th,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th,iscategory,lib_depth,parent_code,parent_path ,achievement_type,isnew,created_by,created_date,modified_by,modified_date,lib_order,lookup_code,request_no,iscascade)
    								VALUES(
    									<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#form.varcocode#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="PERSKPI" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#reviewer_posid#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#weight#" cfsqltype="cf_sql_float">,
    									<cfqueryparam value="#target#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#notes#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#lib_name#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#desc#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#iscategory#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#val(kpi_depth)#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#parent_code#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#parent_path#" cfsqltype="cf_sql_varchar">,
										<cfif achievement neq "">
											<cfqueryparam value="#achievement#" cfsqltype="cf_sql_varchar">,
										<cfelse>
											NULL,
										</cfif>
    									<cfqueryparam value="#isnew#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    									<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    									<cfqueryparam value="#liborder#" cfsqltype="cf_sql_integer">,
    									<cfqueryparam value="#kpilookupcode#" cfsqltype="cf_sql_varchar">,
    									<cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
    									<cfif isDefined('iscascade')>,<cfqueryparam value="#iscascade#" cfsqltype="cf_sql_varchar"><cfelse>,NULL</cfif>
    										
    								)
    							</cfquery>
    							
    							 <cfif iscascade gt 0>
									<cfset callupdateGoalCascade = updateGoalCascade(form_no=form_no,modified_by=modified_by,lib_code=lib_code,cascadefrom_empid=cascadefrom_empid,cascadefrom_formno=cascadefrom_formno,reviewee_empid=reviewee_empid)>
    				            </cfif>
    						</cfif>			
    					</cfloop>
    					
    				</cfif>
    			</cfif>
			</cfif>

	        <cfif structkeyexists(FORM,"plannoterecords")>
			<cfset qLoginInfo = getEmpDetail(empid=request.scookie.user.empid)>
	      	<cfquery name="LOCAL.qDelDataBefore" datasource="#request.sdsn#">
	           	DELETE FROM TPMDPERFORMANCE_PLANNOTE WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">  AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">  AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
	        </cfquery>
			<cfset LOCAL.idx = "">
			<cfloop from="1" to="#FORM.plannoterecords#" index="idx">
				<cfset LOCAL.note_name = FORM["plannotename_#idx#"]>
				<cfset LOCAL.note_answer = FORM["plannote_#idx#"]>
				<cfquery name="local.qInsertAddNotes" datasource="#request.sdsn#">
					INSERT INTO TPMDPERFORMANCE_PLANNOTE (form_no,company_code,reviewer_empid,reviewer_posid,note_name,note_answer,note_order,created_by,created_date,modified_by,modified_date) VALUES (
						<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#varcocode#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#reviewer_empid#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#qLoginInfo.position_id#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#note_name#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#note_answer#" cfsqltype="cf_sql_varchar">,
						<cfqueryparam value="#idx#" cfsqltype="cf_sql_integer">,
						<cfqueryparam value="#request.scookie.user.uname#" cfsqltype="cf_sql_varchar">,
						<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
						<cfqueryparam value="#request.scookie.user.uname#" cfsqltype="cf_sql_varchar">,
						<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
					)
				</cfquery>
			</cfloop>
	        </cfif>
        <cfif strckFormData.head_status eq 1 and (strckFormData.RevieweeAsApprover neq 1 or (strckFormData.RevieweeAsApprover eq 1 and strckFormData.requestfor neq request.scookie.user.empid))>
            <cfquery name="LOCAL.qGetApprovedDataFromReq" datasource="#request.sdsn#">
            	SELECT approved_data FROM TCLTREQUEST WHERE UPPER(req_type) = 'PERFORMANCE.PLAN'
					AND req_no = <cfqueryparam value="#strckFormData.request_no#" cfsqltype="cf_sql_varchar">
					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfset LOCAL.strckApprovedData=SFReqFormat(qGetApprovedDataFromReq.approved_data,"R")>
			<cfset strckFormInbox = StructNew() />
			<cfset strckFormInbox['DTIME'] = Now() />
			<cfset strckFormInbox['DECISION'] = 1 />
			<cfset strckFormInbox['NOTES'] = "" />
			<cfset LOCAL.apvdDataKey = request.scookie.user.uid >
			<cfif trim(qGetApprovedDataFromReq.approved_data) eq '' OR (isStruct(strckApprovedData) AND REFind('_', ListFirst(StructKeyList(strckApprovedData)) ) ) >
				<cfset LOCAL.cntStrckApprovedData = StructCount(strckApprovedData)+1 />
				<cfset apvdDataKey = NumberFormat(cntStrckApprovedData,'00')&'_'&apvdDataKey >
			</cfif>
			<cfset strckApprovedData[apvdDataKey] = strckFormInbox />
			<cfset LOCAL.wddxApprovedData=SFReqFormat(strckApprovedData,"W")>
   	       	<cfquery name="LOCAL.qUpdApprovedData" datasource="#request.sdsn#">
				UPDATE TCLTREQUEST SET approved_data = <cfqueryparam value="#wddxApprovedData#" cfsqltype="cf_sql_varchar">
				WHERE UPPER(req_type) = 'PERFORMANCE.PLAN' AND req_no = <cfqueryparam value="#strckFormData.request_no#" cfsqltype="cf_sql_varchar">
					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer"> AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
        </cfif>
        <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
            <cfquery name="LOCAL.qUpdatePlanGen"  datasource="#request.sdsn#">
            	UPDATE TPMDPERFORMANCE_PLANGEN SET req_no = <cfqueryparam value="#strckFormData.request_no#" cfsqltype="cf_sql_varchar">
            	WHERE form_no =<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfif>
		</cfoutput>
		</cftransaction>
	</cffunction>
	
    <cffunction name="Approve">
        <cfreturn true>
    </cffunction>
	
    <cffunction name="FullyApprovedProcess" access="public">
		<cfargument name="strRequestNo" type="string" required="yes">
		<cfargument name="iApproverUserId" type="string" required="yes">
		<cfargument name="strckFormApprove" type="struct" required="no">
		<cftransaction>
			<cfquery name="local.qUpdateRequestBefore" datasource="#request.sdsn#">
				UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0
				WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
			</cfquery>

			<cfquery name="Local.qCheckIfRequestHasBeenApproved" datasource="#request.sdsn#">
				SELECT reviewer_empid, isfinal, reviewee_empid, head_status, form_no FROM TPMDPERFORMANCE_PLANH
				WHERE request_no = <cfqueryparam value="#strRequestNo#" cfsqltype="cf_sql_varchar"> AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
			
			<cfif qCheckIfRequestHasBeenApproved.recordcount>
				<cfquery name="LOCAL.qGetFinalRecord" dbtype="query">
					SELECT isfinal FROM qCheckIfRequestHasBeenApproved
					WHERE reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
				</cfquery>
				<cfif qGetFinalRecord.recordcount and qGetFinalRecord.isfinal eq 0>
					<cfquery name="LOCAL.qUpdatePMReqForm" datasource="#request.sdsn#">
						UPDATE TPMDPERFORMANCE_PLANH
						SET isfinal = 1, head_status = 1, isfinal_requestno = 1,modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
						WHERE request_no = <cfqueryparam value="#strRequestNo#" cfsqltype="cf_sql_varchar">
							AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
					</cfquery>
				</cfif>
				<cfquery name="LOCAL.qGetSkipRecord" dbtype="query">
					SELECT reviewer_empid FROM qCheckIfRequestHasBeenApproved WHERE head_status = 0
				</cfquery>
				<cfset Local.LstReviewerSkipped = valuelist(qGetSkipRecord.reviewer_empid)>
			</cfif>
        </cftransaction>
		<cfreturn true>
	</cffunction>
									 
															   
																								 
																									   
							   
																																																									  
																								
																									
			
			  

	<cffunction name="GetEmpDraftRevised">
	    <cfparam name="reqno" default="">
        <cfparam name="formno" default="">
        <cfparam name="varcocode" default="#request.scookie.cocode#">
	    <cfset LOCAL.discExist=false>
        <cfquery name="LOCAL.qCheckDraftRevised" datasource="#request.sdsn#">
        	SELECT request_no FROM  TPMDPERFORMANCE_PLAND 
        	WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
        	AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
        	AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
        	AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        	group by request_no
        </cfquery>
        
        <cfif qCheckDraftRevised.recordcount neq 0>
           <cfset LOCAL.discExist = true>
        </cfif>
    
        <cfoutput>
			 {"discExist":false}
        </cfoutput>
	</cffunction>
	
    <cffunction name="Revise">
        <cfset LOCAL.reqno = FORM.REQUEST_NO/>
        <cfset LOCAL.requestfor = FORM.requestfor/>
        <cfset LOCAL.periodcode = FORM.period_code/>
        <cfset LOCAL.refdate = FORM.reference_date/>
  
        <cfset LOCAL.formno = FORM.formno/>
        <cfset LOCAL.stringJSON = FORM["persKPIArray"]>
    	<cfset local.objJSON = deserializeJSON(stringJSON)>
		    <cfset allowskipCompParam = "Y">
        <cfset requireselfassessment = "Y">
        <cfquery name="qCompParam" datasource="#request.sdsn#">
	        SELECT field_value, UPPER(field_code) field_code from tclcappcompany where UPPER(field_code) IN ('ALLOW_SKIP_REVIEWER', 'REQUIRESELFASSESSMENT') and company_id = '#REQUEST.SCookie.COID#'
        </cfquery>
        <cfloop query="qCompParam">
            <cfif TRIM(qCompParam.field_code) eq "ALLOW_SKIP_REVIEWER" AND TRIM(qCompParam.field_value) NEQ ''>
    	        <cfset allowskipCompParam = TRIM(qCompParam.field_value)>
            <cfelseif TRIM(qCompParam.field_code) eq "REQUIRESELFASSESSMENT" AND TRIM(qCompParam.field_value) NEQ '' >
    	        <cfset requireselfassessment = TRIM(qCompParam.field_value)> <!---Bypass self assesment--->
            </cfif>
        </cfloop>
    	<cfif not structkeyexists(objJSON,"hdn_totalrowpers")>
			<cfset LOCAL.hdntotalrowpers = 0>
		<cfelse>
			<cfset LOCAL.hdntotalrowpers = objJSON["hdn_totalrowpers"]>
        </cfif>
    	<cfquery name="local.qCheckDraftRevised" datasource="#request.sdsn#">
        	SELECT request_no FROM  TPMDPERFORMANCE_PLAND 
        	WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
        	AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
        	AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
        	AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
    	<cfif qCheckDraftRevised.recordcount>
    	
    	    <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
        	    DELETE FROM  TPMDPERFORMANCE_PLAND 
        		WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
        		AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
        		AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
        	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
            
            <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
        	    DELETE FROM  TPMDPERFORMANCE_PLANH 
        		WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
        		AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
        		AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
        	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
			
    	</cfif>
    	<cfset LOCAL.idx = "">
		<cfquery name="local.qDelNotesRevise" datasource="#request.sdsn#">
			DELETE FROM  TPMDPERFORMANCE_PLANREVISED 
			WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
			AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
			AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
			AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
		</cfquery>
  
        <cfloop from="1" to="#hdntotalrowpers#" index="idx">
            <cfif structkeyexists(objJSON,"ispersnew_#idx#")>
    			<cfset LOCAL.isnew = objJSON["ispersnew_#idx#"]>
    	    <cfelse>
    		    <cfset LOCAL.isnew = 'N'>
    	    </cfif>
    		<cfif structkeyexists(objJSON,"perslibcode_#idx#") or structkeyexists(objJSON,"perschk_kpi_#idx#") or structkeyexists(objJSON,"persselkpi_#idx#")>
    							
    			<cfif structkeyexists(objJSON,"perslibcode_#idx#")>
    				<cfset lib_code = objJSON["perslibcode_#idx#"]>
    				<cfset isnew = 'N'>
    			<cfelse>	
    				<cfif structkeyexists(objJSON,"perschk_kpi_#idx#")>					
    						
							<cfif structkeyexists(objJSON,"perslibcode_#idx#")>
								<cfset lib_code = objJSON["perslibcode_#idx#"]>
							<cfelse>
								<cfset lib_code = formno&idx>
							</cfif>
    				<cfelse>
    					<cfset lib_code = objJSON["persselkpi_#idx#"]>
    					<cfset isnew = 'Y'>
    			    </cfif>
    			 </cfif>
            </cfif>
			<cfif structkeyexists(objJSON,"txtnote_#idx#")>
					<cfset LOCAL.notes = objJSON["txtnote_#idx#"]>
				<cfelse>
					<cfset LOCAL.notes = "">
				</cfif>
			
    		<cfset LOCAL.company_code = REQUEST.SCOOKIE.COCODE>
    		<cfset LOCAL.created_by = request.scookie.user.uname>
			<cfset LOCAL.created_date = now()>
			<cfset LOCAL.modified_by = request.scookie.user.uname>
			<cfset LOCAL.modified_date = now()>
			<cfquery name="local.qDelNotesRevise" datasource="#request.sdsn#">
				DELETE FROM  TPMDPERFORMANCE_PLANREVISED 
				WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
				AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
				AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				and  lib_code = <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfquery name="local.qInsertNotesRevise" datasource="#request.sdsn#">
    		    INSERT INTO TPMDPERFORMANCE_PLANREVISED (form_no,request_no,reviewer_empid,lib_code,company_code,notes,created_by,created_date,modified_by,modified_date) 
    		    VALUES(
    		        <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">,
    		        <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">,
    		        <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">,
    		        <cfqueryparam value="#lib_code#" cfsqltype="cf_sql_varchar">,
    		        <cfqueryparam value="#company_code#" cfsqltype="cf_sql_varchar">,
    		        <cfqueryparam value="#notes#" cfsqltype="cf_sql_varchar">,
        		    <cfqueryparam value="#created_by#" cfsqltype="cf_sql_varchar">,
    				<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>,
    				<cfqueryparam value="#modified_by#" cfsqltype="cf_sql_varchar">,
    				<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
				)
    		</cfquery>
            
    	</cfloop>	
    
       <cfquery name="LOCAL.qCheckRequest" datasource="#request.sdsn#">
        	SELECT approval_data, approval_list, approved_list, outstanding_list, approved_data FROM TCLTREQUEST
            WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
            AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            AND req_type = 'PERFORMANCE.PLAN'
            AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
            AND reqemp = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
		
        </cfquery>
     
    	<cfset LOCAL.strckData = FORM/>
      
    	<cfquery name="local.qSelStepHigher" datasource="#request.sdsn#">
        	SELECT reviewer_empid FROM TPMDPERFORMANCE_PLANH 
        	WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
        	AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
        	AND review_step > <cfqueryparam value="#strckData.USERINREVIEWSTEP#" cfsqltype="cf_sql_varchar">
        	AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfloop query="qSelStepHigher">
    	    <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
        	    DELETE FROM  TPMDPERFORMANCE_PLAND 
        		WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
        		AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
        		AND reviewer_empid = <cfqueryparam value="#qSelStepHigher.reviewer_empid#" cfsqltype="cf_sql_varchar">
        	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
            
            <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
        	    DELETE FROM  TPMDPERFORMANCE_PLANH 
        		WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
        		AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
        		AND reviewer_empid = <cfqueryparam value="#qSelStepHigher.reviewer_empid#" cfsqltype="cf_sql_varchar">
        	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
        
        
        <cfquery name="LOCAL.qGetSPMH" datasource="#request.sdsn#">
        	SELECT reviewer_empid, review_step FROM TPMDPERFORMANCE_PLANH
            WHERE request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
            AND reviewee_empid = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
            AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            AND head_status = 1
            ORDER BY review_step ASC
        </cfquery>
        
        <cfset LOCAL.new_outstanding =  qCheckRequest.outstanding_list/>
        <cfset LOCAL.new_approved =  qCheckRequest.approved_list/>

		<cfset LOCAL.arr_approvaldata=SFReqFormat(qCheckRequest.approval_data,"R",[])>
		<cfset LOCAL.strckAppr = ApprovalLoop(arr_approvaldata,request.scookie.user.empid)/>
        <cfset LOCAL.userindbstep = strckAppr.empinstep>

		<cfif not listfindnocase(strckAppr.fullapproverlist,requestfor) and listfindnocase(valuelist(qGetSPMH.reviewer_empid),requestfor)>
			<cfset userindbstep++>
        </cfif>
		<cfset LOCAL.steptosetrevised = 0>
        <cfif listfindnocase(valuelist(qGetSPMH.review_step),userindbstep) gt 1>
	        <cfset steptosetrevised = listgetat(valuelist(qGetSPMH.review_step),listfindnocase(valuelist(qGetSPMH.review_step),userindbstep)-1)>
        <cfelseif listlen(valuelist(qGetSPMH.review_step)) gt 0>
        	<cfset steptosetrevised = listlast(valuelist(qGetSPMH.review_step))>
        </cfif>
        <cfif userindbstep - strckAppr.empinstep eq 1 and steptosetrevised eq 1>
        	<cfset steptosetrevised = 0>
        <cfelseif userindbstep - strckAppr.empinstep eq 1>
	        <cfset --steptosetrevised>
        </cfif>
    	<cfset variables.sendtype = 'next'>
    	<cfset strckData.isfinal = 0/>
    	<cfset strckData.head_status = 1/>
    	<cfset strckData.isfinal_requestno = 1/>
  

        <cfset SaveTransaction(50,strckData)/>
        <cfif steptosetrevised neq 0>
            <cfquery name="LOCAL.qUpdHeadStatus" datasource="#request.sdsn#">
            	UPDATE TPMDPERFORMANCE_PLANH
                SET modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
				WHERE request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND reviewee_empid = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
            </cfquery>

        	<cfset LOCAL.uidtorevised = arr_approvaldata[steptosetrevised].approvedby>
            
			<cfset arr_approvaldata[steptosetrevised].approvedby = ""/>
			<cfset LOCAL.new_approvaldata=SFReqFormat(arr_approvaldata,"W")>
            
	        <cfset LOCAL.new_outstanding =  uidtorevised&","&new_outstanding/>
            <cfif listlen(new_approved)>
    	    	<cfset LOCAL.new_approved =  listdeleteat(new_approved,listfindnocase(new_approved,uidtorevised))/>
            </cfif>
            
        <cfelse>
            <cfquery name="LOCAL.qGetUserId" datasource="#request.sdsn#">
            	SELECT user_id FROM TEOMEMPPERSONAL
				WHERE emp_id = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
            </cfquery>
            
	        <cfset LOCAL.new_outstanding =  qGetUserId.user_id&","&new_outstanding/>
        </cfif>
		<cfset LOCAL.strckApprovedData=SFReqFormat(qCheckRequest.approved_data,"R")>
		<cfset strckFormInbox = StructNew() />
		<cfset strckFormInbox['DTIME'] = Now() />
		<cfset strckFormInbox['DECISION'] = 3 />
        <cfif structkeyexists(FORM,"revisingNotes")>
			<cfset strckFormInbox['NOTES'] = Form.revisingNotes />
        <cfelse>
			<cfset strckFormInbox['NOTES'] = "-" />
        </cfif>
		
		<cfset LOCAL.apvdDataKey = request.scookie.user.uid >
		<cfif trim(qCheckRequest.approved_data) eq '' OR (isStruct(strckApprovedData) AND REFind('_', ListFirst(StructKeyList(strckApprovedData)) ) ) >
			<cfset LOCAL.cntStrckApprovedData = StructCount(strckApprovedData)+1 />
			<cfset apvdDataKey = NumberFormat(cntStrckApprovedData,'00')&'_'&apvdDataKey >
		</cfif>

		<cfset strckApprovedData[apvdDataKey] = strckFormInbox />
		<cfset LOCAL.wddxApprovedData=SFReqFormat(strckApprovedData,"W")>

        <!----
        <cfquery name="LOCAL.qUpdRequest" datasource="#request.sdsn#"> 
   	    	UPDATE TCLTREQUEST SET
            <!---TW:<cfif isWDDX(wddxApprovedData)></cfif>--->
    			approved_data = <cfqueryparam value="#wddxApprovedData#" cfsqltype="cf_sql_varchar">,
	        <cfif steptosetrevised neq 0>
        	    approval_data = <cfqueryparam value="#new_approvaldata#" cfsqltype="cf_sql_varchar">,
            	approved_list = <cfqueryparam value="#new_approved#" cfsqltype="cf_sql_varchar">,
            <cfelse>
               	approved_list = '',
            </cfif>
            outstanding_list = <cfqueryparam value="#new_outstanding#" cfsqltype="cf_sql_varchar">,
   	        status = 4
       	    WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
    	        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
   		        AND UPPER(req_type) = 'PERFORMANCE.PLAN'
       		    AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
           		AND reqemp = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
			
   	    </cfquery> ---->
		<cfquery name="LOCAL.qCheckReq" datasource="#request.sdsn#"> 
			select outstanding_list,approval_list from tcltrequest where req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
			AND reqemp = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">  AND UPPER(req_type) = 'PERFORMANCE.PLAN'
		</cfquery>
		<cfset new_outstanding =  qCheckReq.outstanding_list>
		<cfif ListLast(new_outstanding) eq REQUEST.SCOOKIE.USER.UID>
			<cfquery name="LOCAL.qGetUserId" datasource="#request.sdsn#">
            	SELECT user_id FROM TEOMEMPPERSONAL WHERE emp_id = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
            </cfquery>
			<cfif ListFindNoCase(qCheckReq.approval_list,qGetUserId.user_id) gt 0>
				<cfset new_outstanding = ListDeleteAt(qCheckReq.approval_list,ListFindNoCase(qCheckReq.approval_list,qGetUserId.user_id))/>
			<cfelse>
				<cfset new_outstanding = qCheckReq.approval_list>
			</cfif>
			
		<cfelse>
			<cfif ListFindNoCase(new_outstanding,REQUEST.SCOOKIE.USER.UID) eq 0>
				<cfset new_outstanding = ListInsertAt(new_outstanding, "1", REQUEST.SCOOKIE.USER.UID)>
			</cfif>
		</cfif>
		
		<cfset LOCAL.valret = objRequestApproval.ReviseRequest(reqno, REQUEST.SCookie.User.uid, strckApprovedData) />
		
		<cfquery name="LOCAL.qUpdRequest" datasource="#request.sdsn#"> 
			UPDATE TCLTREQUEST SET
			outstanding_list = <cfqueryparam value="#new_outstanding#" cfsqltype="cf_sql_varchar">,
			email_list = <cfqueryparam value="#new_outstanding#" cfsqltype="cf_sql_varchar">
			WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND UPPER(req_type) = 'PERFORMANCE.PLAN'
				AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND reqemp = <cfqueryparam value="#requestfor#" cfsqltype="cf_sql_varchar">
		</cfquery>
		
            <cfset local.lstNextApprover = ''>
            <cfset LOCAL.strckListApprover = GetApproverList(reqno=strckData.request_no,empid=strckData.empid,reqorder=strckData.reqformulaorder,varcoid=request.scookie.coid,varcocode=request.scookie.cocode)>
            <cfset LOCAL.lstNextApprover = ListGetAt( strckListApprover.FULLLISTAPPROVER , val(strckData.UserInReviewStep)-1 )>
            <cfif lstNextApprover eq strckData.empid>
                <cfset local.tcode = 'PerformancePlanReviseForReviewee'>
            <cfelse>
                <cfset local.tcode = 'PerformancePlanReviseForApprover'>
            </cfif>
            <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
      
		    <cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSSuccessfully revising request for previous reviewer",true)>
		    <cfif REQUEST.SCOOKIE.MODE eq "SFGO">
    		    <cfset LOCAL.scValid={isvalid=false,message="#SFLANG#",success=true}>
            	<cfreturn scValid>
            <cfelse>
        	    <cfoutput>
            	    <script>
    				    alert("#LOCAL.SFLANG#");
    				    popClose();
    				    refreshPage();
    			    </script>
                </cfoutput>
            </cfif>
    </cffunction>
    <cffunction name="UnfinalPerfEvalForm">
        <cfset Local.empid = FORM.requestfor>
        <cfset Local.reqno = FORM.request_no>
       	<cfset Local.error_found = 0>
        <cftry>
			<cfquery name="LOCAL.qCheckRequest" datasource="#request.sdsn#">
				SELECT approval_data, approval_list, approved_list, outstanding_list, approved_data FROM TCLTREQUEST
				WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND UPPER(req_type) = 'PERFORMANCE.PLAN'
				AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND reqemp = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfquery name="LOCAL.qGetSPMH" datasource="#request.sdsn#">
				SELECT <cfif request.dbdriver EQ "MSSQL">TOP 1</cfif> reviewer_empid, review_step FROM TPMDPERFORMANCE_PLANH
				WHERE request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND head_status = 1
				ORDER BY review_step DESC <cfif request.dbdriver eq "MYSQL">LIMIT 1</cfif>
			</cfquery>
			<cfset LOCAL.new_outstanding =  qCheckRequest.outstanding_list/>
			<cfset LOCAL.new_approved =  qCheckRequest.approved_list/>

		<cfset LOCAL.arr_approvaldata=SFReqFormat(qCheckRequest.approval_data,"R",[])>
        <cfquery name="LOCAL.qUpdHeadStatus" datasource="#request.sdsn#">
           	UPDATE TPMDPERFORMANCE_PLANH
            SET head_status = 0, isfinal = 0, 
            	modified_by = <cfqueryparam value="#request.scookie.user.uname#|UNFINAL" cfsqltype="cf_sql_varchar">,
                modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
			WHERE request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#qGetSPMH.reviewer_empid#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfset LOCAL.uidtorevised = arr_approvaldata[arraylen(arr_approvaldata)].approvedby>
		<cfset arr_approvaldata[arraylen(arr_approvaldata)].approvedby = ""/>
            
		<cfset LOCAL.new_approvaldata=SFReqFormat(arr_approvaldata,"W")>
        <cfif listlen(new_outstanding)>
	        <cfset new_outstanding =  uidtorevised&","&new_outstanding/>
        <cfelse>
	        <cfset new_outstanding =  uidtorevised/>
        </cfif>
        <cfif listlen(new_approved)>
  	    	<cfset new_approved =  listdeleteat(new_approved,listfindnocase(new_approved,uidtorevised))/>
        </cfif>

        <cfquery name="LOCAL.qUpdRequest" datasource="#request.sdsn#">
   	    	UPDATE TCLTREQUEST SET
       	    approval_data = <cfqueryparam value="#new_approvaldata#" cfsqltype="cf_sql_varchar">,
           	approved_list = <cfqueryparam value="#new_approved#" cfsqltype="cf_sql_varchar">,
            outstanding_list = <cfqueryparam value="#new_outstanding#" cfsqltype="cf_sql_varchar">,
   	        status = 2
       	    WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
    	        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
   		        AND UPPER(req_type) = 'PERFORMANCE.PLAN'
       		    AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
           		AND reqemp = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
   	    </cfquery>
        
        <cfcatch><cfset error_found = 1></cfcatch>
        </cftry>
        
		<cfif not error_found>
			<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSSuccessfully opening performance form",true)>
		<cfelse>
			<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSFailed opening performance form",true)>
        </cfif>
        <cfif REQUEST.SCOOKIE.MODE eq "SFGO">
		    <cfset LOCAL.scValid={isvalid=false,message="#SFLANG#",success=true}>
        	<cfreturn scValid>
        <cfelse>
        	<cfoutput>
            	<script>
    				alert("#LOCAL.SFLANG#");
    				popClose();
    				refreshPage();
    			</script>
            </cfoutput>
        </cfif>
    </cffunction>
	
	
      <cffunction name="Inbox">
		<cfargument name="RequestData" type="Struct" required="Yes">
		<cfargument name="ProcData" type="array" required="Yes">
		<cfargument name="RowNumber" type="Numeric" required="Yes">
		<cfargument name="RequestMode" type="String" required="Yes">
		<cfargument name="RequestStatus" type="Numeric" required="Yes">
		<cfargument name="RequestKey" type="String" required="No">
		<cfargument name="varcoid" required="No" default="#request.scookie.coid#">
		<cfargument name="varcocode" required="No" default="#request.scookie.cocode#">
		<!---cfdump var="#RequestData#"---> 
		<cfset LOCAL.SFMLANG=Application.SFParser.TransMLang(listAppend("FDLink|FDRemark|View Performance Plan Form|FDLastReviewer|Previous Step Reviewer",(isdefined("FORMMLANG")?FORMMLANG:""),"|"))>
	    <cfset LOCAL.reqorder = "inbox">
		<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false>
			 <cfif not structkeyexists(Arguments.RequestData,"requestfor")>
				<cfset Local.reqorder = getApprovalOrder(reviewee=Arguments.RequestData.EMP_ID,reviewer=request.scookie.user.empid)> 
			 <cfelse>
				<cfset Local.reqorder = getApprovalOrder(reviewee=Arguments.RequestData.requestfor,reviewer=request.scookie.user.empid)> 
			 </cfif>
		</cfif>
		<cfset LOCAL.scProc=Arguments.ProcData>
        <cfquery name="Local.qGetAllParam" datasource="#request.sdsn#">
        	SELECT p.emp_id, c.grade_code, c.position_id  FROM  TEODEMPCOMPANY c
			INNER JOIN TEOMEMPPERSONAL p ON c.emp_id = p.emp_id
						  
			WHERE 
			<cfif not structkeyexists(Arguments.RequestData,"requestfor")>
				c.emp_id = <cfqueryparam value="#Arguments.RequestData.EMP_ID#" cfsqltype="cf_sql_varchar">
			 <cfelse>
				c.emp_id = <cfqueryparam value="#Arguments.RequestData.requestfor#" cfsqltype="cf_sql_varchar">
			 </cfif>
			
        </cfquery>
        <cfquery name="Local.qGetFormNo" datasource="#request.sdsn#">
        	SELECT form_no,company_code,REVIEWER_EMPID FROM TPMDPERFORMANCE_PLANH
            WHERE request_no = <cfqueryparam value="#Arguments.RequestData.request_no#" cfsqltype="cf_sql_varchar">
			
										
			order by review_step desc
        </cfquery>
		 <cfquery name="Local.qGetReferenceDate" datasource="#request.sdsn#">
        	SELECT reference_date FROM TPMMPERIOD WHERE period_code = <cfqueryparam value="#Arguments.RequestData.PERIOD_CODE#" cfsqltype="cf_sql_varchar">
			AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        </cfquery>
		<cfset local.infoLastReviewer = " : -">
		<cfif qGetFormNo.recordcount eq 0>
			 <cfquery name="Local.qGetFormNo" datasource="#request.sdsn#">
												
				SELECT  form_no FROM TPMDPERFORMANCE_PLANGEN WHERE req_no = <cfqueryparam value="#Arguments.RequestData.request_no#" cfsqltype="cf_sql_varchar">
				AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_varchar">
				group by form_no
			  </cfquery>
		<cfelse>
			 <cfquery name="Local.qGetinfoName" datasource="#request.sdsn#">
        	SELECT p.full_name , c.emp_no  FROM  TEODEMPCOMPANY c
			INNER JOIN TEOMEMPPERSONAL p
				ON c.emp_id = p.emp_id
			WHERE c.emp_id = <cfqueryparam value="#qGetFormNo.REVIEWER_EMPID#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset infoLastReviewer = " : #qGetinfoName.full_name#">
		</cfif>
       
		<cfset LOCAL.ibxlabel="background-color:##e9e9e9;padding:2px 5px;border-bottom: 1px solid black; border-right:0px;">
		<cfset LOCAL.ibxdata="background-color:##fff;padding:2px 5px;border-bottom: 1px solid black; border-right:0px;">
        
		<cfoutput>
			
            <style>
				##linktoperformanceform a span {
					display: inline;
					padding: 8px 9px;
				}
				##linktoperformanceform a{
					color: black;
					font-weight: bold;
					cursor: pointer;
					text-decoration:underline;
				}
			</style>
            <div id="linktoperformanceform">
				#LOCAL.SFMLANG.PreviousStepReviewer##infoLastReviewer#
			    <br/><br>
				<a href="?xfid=hrm.performance.planform.mainload&empid=#Arguments.RequestData.REVIEWEE_EMPID#&periodcode=#Arguments.RequestData.period_code#&refdate=#DateFormat(qGetReferenceDate.reference_date,'yyyy-mm-dd')#&formno=#qGetFormNo.form_no#&amp;reqno=#Arguments.RequestData.request_no#&amp;reqorder=#reqorder#&amp;varcoid=#REQUEST.SCOOKIE.COID#&amp;varcocode=#REQUEST.SCOOKIE.COCODE#"><span>#LOCAL.SFMLANG.ViewPerformancePlanForm#</span></a>
            </div>
			<br />
		</cfoutput>
	
		<cfreturn scProc>
	</cffunction>
	
    <cffunction name="DeleteReqForm">
    	<cfset LOCAL.strckData = structnew()>
        <cfset strckData.reviewee_empid = FORM.requestfor>
        <cfset strckData.request_no = FORM.request_no>
        <cfset strckData.formno = FORM.formno>
        <cfset strckData.period_code = FORM.period_code>
        <cfset strckData.reference_date = FORM.reference_date>
        <cfset strckData.varcoid = REQUEST.SCOOKIE.COID>
        <cfset strckData.varcocode = REQUEST.SCOOKIE.COCODE>
        <cftry>
			<!--- ambil semua lookup yang ada --->
			<cfquery name="local.qGetLookupCode" datasource="#request.sdsn#">
				SELECT lookup_code FROM TPMDPERFORMANCE_PLAND
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
				
				UNION
				
				SELECT lookup_code FROM TPMDPERFORMANCE_PLANKPI
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset LOCAL.existingLookUpCode = valuelist(qGetLookupCode.lookup_code)>
    					
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
        	    DELETE FROM TPMDLOOKUP
        	    WHERE lookup_code IN (<cfqueryparam value="#existingLookUpCode#" list="yes" cfsqltype="cf_sql_varchar">)
        	        AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
        	        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        	</cfquery>
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
        	    DELETE FROM TPMMLOOKUP
        	    WHERE lookup_code IN (<cfqueryparam value="#existingLookUpCode#" list="yes" cfsqltype="cf_sql_varchar">)
        	        AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
        	        AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
				DELETE FROM TPMDPERFORMANCE_PLANNOTE
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
				DELETE FROM TPMDPERFORMANCE_PLANREVISED
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
            </cfquery>
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
				DELETE FROM TPMDPERFORMANCE_PLAND
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
                AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
                AND request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false>
				<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">	
					DELETE FROM TPMDPERFORMANCE_PLANKPI
					WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
					 AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				</cfquery>
			<cfelse>
				<cfquery name="Local.qPMCheck" datasource="#request.sdsn#">
				select head_status from TPMDPERFORMANCE_PLANH
				WHERE request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
                AND form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
                AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
                AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
				</cfquery>
				<cfif qPMCheck.head_status eq 0>
					<cfquery name="Local.qPMCheck2" datasource="#request.sdsn#">
					select head_status from TPMDPERFORMANCE_PLANH
					WHERE request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
					AND form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
					AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
					AND reference_date = <cfqueryparam value="#strckData.reference_date#" cfsqltype="cf_sql_timestamp">
					AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
					AND reviewer_empid <> <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
					</cfquery>
					<cfif qPMCheck2.recordcount eq 0>
						<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">	
							DELETE FROM TPMDPERFORMANCE_PLANKPI
							WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
							 AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
							AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
						</cfquery>
					</cfif>
				</cfif>
			</cfif>
        	
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
            	DELETE FROM TPMDPERFORMANCE_PLANH
				WHERE request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
                AND form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
                AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
                AND reference_date = <cfqueryparam value="#strckData.reference_date#" cfsqltype="cf_sql_timestamp">
                AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
				AND reviewer_empid = <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
            </cfquery>
			
			<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false>
				<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
					DELETE FROM TCLTREQUEST
					WHERE req_type = 'PERFORMANCE.PLAN'
					AND req_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
					AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
				</cfquery>
			<cfelse>
				<cfquery name="Local.qPMCheck2" datasource="#request.sdsn#">
					select request_no from TPMDPERFORMANCE_PLANH
					WHERE request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
					AND form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
					AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
					AND reference_date = <cfqueryparam value="#strckData.reference_date#" cfsqltype="cf_sql_timestamp">
					AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
				</cfquery>
				<cfif qPMCheck2.recordcount eq 0>
					<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
						UPDATE TCLTREQUEST
						SET status = 1
						WHERE req_type = 'PERFORMANCE.PLAN'
						AND req_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
						AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
					</cfquery>
				</cfif>
				
			</cfif>
        	
        	<cfquery name="Local.qGetFormNo" datasource="#request.sdsn#">
            	select <cfif request.dbdriver eq "MSSQL"> TOP 1 </cfif> request_no, reviewer_empid, created_date
				FROM TPMDPERFORMANCE_PLANH
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
                AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
                AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                AND request_no <> <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
				ORDER BY created_date desc
				<cfif request.dbdriver eq "MYSQL"> LIMIT 1 </cfif>
            </cfquery>
        	<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
            	UPDATE TPMDPERFORMANCE_PLANH
				SET isfinal=1, isfinal_requestno = 1
				WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
                AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
                AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                AND request_no = <cfqueryparam value="#qGetFormNo.request_no#" cfsqltype="cf_sql_varchar">
                AND reviewer_empid = <cfqueryparam value="#qGetFormNo.reviewer_empid#" cfsqltype="cf_sql_varchar">
            </cfquery>
			<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true>
				<cfquery name="Local.qPMCheck3" datasource="#request.sdsn#">
					select <cfif request.dbdriver eq "MSSQL"> top 1 </cfif> request_no from TPMDPERFORMANCE_PLANH
					WHERE request_no <> <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
					AND form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
					AND period_code =  <cfqueryparam value="#strckData.period_code#" cfsqltype="cf_sql_varchar">
					AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
					AND isfinal_requestno = 1 ORDER BY created_date desc <cfif request.dbdriver EQ "MYSQL">LIMIT 1</cfif>
				</cfquery>
				<cfif qPMCheck3.recordcount gt 0>
					<cfquery name="Local.qPMDel1" datasource="#request.sdsn#">
						DELETE FROM TCLTREQUEST
						WHERE req_type = 'PERFORMANCE.PLAN'
						AND req_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
						AND company_code = <cfqueryparam value="#strckData.varcocode#" cfsqltype="cf_sql_varchar">
					</cfquery>
					<cfquery name="Local.qUpdatePlanGen" datasource="#request.sdsn#">
						UPDATE TPMDPERFORMANCE_PLANGEN SET req_no = <cfqueryparam value="#qPMCheck3.request_no#" cfsqltype="cf_sql_varchar">
						WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
						AND company_id = <cfqueryparam value="#strckData.varcoid#" cfsqltype="cf_sql_varchar">
					</cfquery>
				</cfif>
			</cfif>
			<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSuccessfully Deleting Performance Form Request", true)>
            <cfif REQUEST.SCOOKIE.MODE eq "SFGO">
    		    <cfset LOCAL.scValid={isvalid=false,message="#strMessage#",success=true}>
            	<cfreturn scValid>
            <cfelse>
                <cfoutput>
    				<script>
    					alert("#strMessage#");
    					
    					try {
    						parent.refreshPage();
    					}
    					catch(err) {
    					}
    					parent.popClose();
    				</script>
    			</cfoutput>
			</cfif>
        <cfcatch>
        	<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSFailed Deleting Performance Form Request", true)>
            <!---cfdump var="#cfcatch#"--->
            <cfif REQUEST.SCOOKIE.MODE eq "SFGO">
    		    <cfset LOCAL.scValid={isvalid=false,message="#strMessage#",success=false}>
            	<cfreturn scValid>
            <cfelse>
                <cfoutput>
    				<script>
    					alert("#strMessage#");
    					try {
    						parent.refreshPage();
    					}
    					catch(err) {
    					}
    					parent.popClose();
    				</script>
    			</cfoutput>
			</cfif>
        </cfcatch>
        </cftry>
    </cffunction>
	
    <cffunction name="SendToNext">
    	<cfparam name="sendtype" default="next">
		<cfparam name="listPeriodComponentUsed" default="">
		<cfparam name="flagrevs" default="">
		<cfset LOCAL.scValid={isvalid=false,message="",success=false}>
    	<cfset LOCAL.strckData = FORM/>
        <cfset allowskipCompParam = "Y">
        <cfset requireselfassessment = "Y">
        <cfquery name="qCompParam" datasource="#request.sdsn#">
	        SELECT field_value, UPPER(field_code) field_code from tclcappcompany where UPPER(field_code) IN ('ALLOW_SKIP_REVIEWER', 'REQUIRESELFASSESSMENT') and company_id = '#REQUEST.SCookie.COID#'
        </cfquery>
        <cfloop query="qCompParam">
            <cfif TRIM(qCompParam.field_code) eq "ALLOW_SKIP_REVIEWER" AND TRIM(qCompParam.field_value) NEQ ''>
    	        <cfset allowskipCompParam = TRIM(qCompParam.field_value)>
            <cfelseif TRIM(qCompParam.field_code) eq "REQUIRESELFASSESSMENT" AND TRIM(qCompParam.field_value) NEQ '' >
    	        <cfset requireselfassessment = TRIM(qCompParam.field_value)> <!---Bypass self assesment--->
            </cfif>
        </cfloop>
        <!---- start : check if reviewee is active employee ---->
        <cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSThis action can not be done, because employee is inactive", true)>
        <cfif strckData.empid neq "" > 
            <cfquery name="LOCAL.qCheckEmployee" datasource="#REQUEST.SDSN#">
                SELECT emp_no from teodempcompany where emp_id = <cfqueryparam value="#strckData.empid#" cfsqltype="cf_sql_varchar">
        		and status = 1
        		<cfif request.dbdriver eq "MSSQL">
        			AND (end_date >= getdate() OR end_date IS NULL)
        		<cfelseif request.dbdriver eq "MYSQL">
        			AND (end_date >= NOW() OR end_date IS NULL)
        		</cfif>
            </cfquery>
            <cfif qCheckEmployee.recordcount eq 0>
        		<cfoutput>
        			<script>
        				alert("#strMessage#");
        				parent.refreshPage();
        				parent.popClose();
        			</script>
        		</cfoutput>
        		<cf_sfabort>
            </cfif>
        </cfif>		
        <!---- end : check if reviewee is active employee ---->
        <cfset checkValidateOrgUnitKPI = ValidateOrgUnitKPI(period_code=FORM.period_code,reviewee_empid=FORM.empid)>
		<cfset LOCAL.flagdepthead = val(checkValidateOrgUnitKPI.isdepthead)>
    	
    	<cfif listfindnocase(listPeriodComponentUsed,"OrgKPI") and flagdepthead eq 1>
			<cfset LOCAL.stringJSON = FORM["orgKPIArray"]>
			<cfset local.objJSON = deserializeJSON(stringJSON)>
			
			<cfif not structkeyexists(objJSON,"hdn_flagdepthead")>
    			<cfif REQUEST.SCOOKIE.MODE eq "SFGO">
        		    <cfset scValid.isvalid = true>
        		    <cfset scValid.success = false>
                    <cfset scValid.message="Form is not fully loaded. Please submit again">
                	<cfreturn scValid>
                <cfelse>
            		<cfoutput>
                    	<script>
                			alert("Form is not fully loaded. Please submit again");
                			maskButton(false);
                		</script>
            		</cfoutput>
            		<CF_SFABORT>
        		</cfif>
    		</cfif>
    	</cfif>
		
		<!---ENC50817-81045 looking for evaluation data --->
		<cfset LOCAL.errorEval = "tidak">
		<cfquery name="LOCAL.qGetPlanData" datasource="#request.sdsn#">
			select form_no,company_code,reviewee_empid,reviewee_posid,period_code from TPMDPERFORMANCE_PLANH 
			where request_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar"> 
			AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
		</cfquery>
	
		<cfquery name="LOCAL.qGetEvalData" datasource="#request.sdsn#">
			SELECT form_no FROM TPMDPERFORMANCE_EVALH  WHERE company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
			AND period_code = <cfqueryparam value="#qGetPlanData.period_code#" cfsqltype="cf_sql_varchar">
			AND reviewee_empid = <cfqueryparam value="#qGetPlanData.reviewee_empid#" cfsqltype="cf_sql_varchar">
			AND reviewee_posid = <cfqueryparam value="#qGetPlanData.reviewee_posid#" cfsqltype="cf_sql_varchar">
		</cfquery>
	
		<cfif qGetEvalData.recordCount gt 0>
			<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSave Data is failed, Already Had Evaluation Data", true)>
			<cfset LOCAL.errorEval = "ada">
			<cfif REQUEST.SCOOKIE.MODE eq "SFGO">
    		    <cfset scValid.isvalid = true>
    		    <cfset scValid.success = false>
                <cfset scValid.message="#strMessage#">
            	<cfreturn scValid>
            <cfelse>
    			<cfoutput>
    				<script>
    					alert("#strMessage#");
    					parent.refreshPage();
    					parent.popClose();
    				</script>
    			</cfoutput>
    			<CF_SFABORT>
			</cfif>
		</cfif>
		
        <cfif sendtype neq 'draft'>
			<cftransaction>
			
			<cfset objRequestApproval = CreateObject("component", "SFRequestApproval").init(true) />
           	<cfset Local.temp_outs_list = "">
           		<cfquery name="LOCAL.qCekPMReqStatus" datasource="#request.sdsn#">
               	SELECT status, approval_list, outstanding_list, reqemp,approval_data FROM TCLTREQUEST
				WHERE UPPER(req_type) = 'PERFORMANCE.PLAN'
					AND req_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
			
            <!--- tujuan : membalikkan status ke unverified --->
           
           <cfif qCekPMReqStatus.recordcount gt 0>
				<!---<cfif qCekPMReqStatus.status eq 4 and listlen(qCekPMReqStatus.outstanding_list) gt listlen(qCekPMReqStatus.approval_list)>--->
				<cfquery name="local.qGetUid" datasource="#request.sdsn#">
					select user_id from teomemppersonal where emp_id = '#qCekPMReqStatus.reqemp#'
				</cfquery>
				<cfset local.checkUidReqemp = ListFindNoCase(qCekPMReqStatus.outstanding_list,qGetUid.user_id)>
				<cfset temp_outs_list = qCekPMReqStatus.outstanding_list>
				<cfif qCekPMReqStatus.status eq 4 AND (qCekPMReqStatus.reqemp eq REQUEST.SCOOKIE.USER.EMPID) AND checkUidReqemp gt 0>
					<cfset temp_outs_list = ListDeleteAt(qCekPMReqStatus.outstanding_list,checkUidReqemp)>
				<cfelseif qCekPMReqStatus.status eq 4 AND (qCekPMReqStatus.reqemp neq REQUEST.SCOOKIE.USER.EMPID)>
					<cfif ListFindNoCase(qCekPMReqStatus.outstanding_list,REQUEST.SCOOKIE.USER.UID)>
						<cfset temp_outs_list = ListDeleteAt(qCekPMReqStatus.outstanding_list,ListFindNoCase(qCekPMReqStatus.outstanding_list,REQUEST.SCOOKIE.USER.UID))>
					</cfif>
				</cfif>
				<cfset LOCAL.arr_approvaldata=SFReqFormat(qCekPMReqStatus.approval_data,"R",[])>
				
				<cfset LOCAL.strckAppr = ApprovalLoop(arr_approvaldata,request.scookie.user.empid)/>
				<cfif val(strckAppr.empinstep) gt 0>
					<cfset local.lstSameStep = ListGetAt(strckAppr.FULLAPPROVERLIST,strckAppr.empinstep,",")>
				<cfelse>
					<cfset local.lstSameStep = "">
				</cfif>
				
				<cfloop list="#lstSameStep#" index="idxLoop" delimiters="|">
					
					<cfquery name="local.qGetUidShare" datasource="#request.sdsn#">
						select user_id from teomemppersonal where emp_id = '#idxLoop#'
					</cfquery>
					<cfif ListFindNoCase(temp_outs_list,qGetUidShare.user_id)>	
						<cfset temp_outs_list = ListDeleteAt(temp_outs_list,ListFindNoCase(temp_outs_list,qGetUidShare.user_id))>
					</cfif>
				</cfloop>
				
				<cfquery name="LOCAL.qUpdApprovedData" datasource="#request.sdsn#">
					UPDATE TCLTREQUEST 
					<cfif qCekPMReqStatus.reqemp eq REQUEST.SCOOKIE.USER.EMPID>
						SET status = 1
					<cfelse>
						SET status = 2
					</cfif>
                	<cfif len(temp_outs_list)>
                    , outstanding_list = <cfqueryparam value="#temp_outs_list#" cfsqltype="cf_sql_varchar">
                    , email_list = <cfqueryparam value="#temp_outs_list#" cfsqltype="cf_sql_varchar">
                    </cfif>
					WHERE UPPER(req_type) = 'PERFORMANCE.PLAN'
					AND req_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">	
				</cfquery>
				

																																						  
																																										
																																												
			  
			</cfif> 
           
			<cfif sendtype eq "sendfromrevise">	
				<cfset LOCAL.valret = true>
			<cfelse>
				<cfset LOCAL.valret = objRequestApproval.ApproveRequest(request_no, REQUEST.SCookie.User.uid, true) />
				
			</cfif> 
			
            <cfif valret>
	           	<cfquery name="LOCAL.qCekPMReqStatus" datasource="#request.sdsn#">
	               	SELECT status, outstanding_list,reqemp , email_list FROM TCLTREQUEST WHERE req_type = 'PERFORMANCE.PLAN'
						AND req_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
						AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
						AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				</cfquery>
				
                <cfif qCekPMReqStatus.status eq 3>
                	<cfset sendtype = 'final'>
			    	<cfset strckData.isfinal = 1/>
		        	<cfset strckData.head_status = 1/>
		        	<cfset strckData.isfinal_requestno = 1/>
				<cfelseif val(qCekPMReqStatus.status) eq 2>
					<cfquery name="local.qGetUid" datasource="#request.sdsn#">
						select user_id from teomemppersonal where emp_id = '#qCekPMReqStatus.reqemp#'
					</cfquery>
					<cfset temp_outs_list = qCekPMReqStatus.outstanding_list>
					<cfif ListFindNoCase(qCekPMReqStatus.outstanding_list,qGetUid.user_id) gt 0>
						<cfset temp_outs_list = ListDeleteAt(qCekPMReqStatus.outstanding_list,ListFindNoCase(qCekPMReqStatus.outstanding_list,qGetUid.user_id))>
					</cfif>
					<cfif ListFindNoCase(temp_outs_list,REQUEST.SCOOKIE.USER.UID) gt 0>
						<cfset temp_outs_list = ListDeleteAt(temp_outs_list,ListFindNoCase(temp_outs_list,REQUEST.SCOOKIE.USER.UID))>
					</cfif>
					<cfquery name="LOCAL.qUpdApprovedData" datasource="#request.sdsn#">
						UPDATE TCLTREQUEST 
						SET outstanding_list = <cfqueryparam value="#temp_outs_list#" cfsqltype="cf_sql_varchar">
						, email_list = <cfqueryparam value="#temp_outs_list#" cfsqltype="cf_sql_varchar">
						WHERE UPPER(req_type) = 'PERFORMANCE.PLAN'
						AND req_no = <cfqueryparam value="#request_no#" cfsqltype="cf_sql_varchar">
						AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
						AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">	
					</cfquery>
				
                </cfif>
            </cfif>
            
     
        	<cfquery name="local.qSelStepHigher" datasource="#request.sdsn#">
            	SELECT reviewer_empid FROM TPMDPERFORMANCE_PLANH 
            	WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
            	AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
            	AND review_step > <cfqueryparam value="#strckData.USERINREVIEWSTEP#" cfsqltype="cf_sql_varchar">
            	AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>
         
            <cfloop query="qSelStepHigher">
        	    <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
            	    DELETE FROM  TPMDPERFORMANCE_PLAND 
            		WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
            		AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
            		AND reviewer_empid = <cfqueryparam value="#qSelStepHigher.reviewer_empid#" cfsqltype="cf_sql_varchar">
            	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                </cfquery>
                
                <cfquery name="local.qDelPlanD" datasource="#request.sdsn#">
            	    DELETE FROM  TPMDPERFORMANCE_PLANH 
            		WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
            		AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
            		AND reviewer_empid = <cfqueryparam value="#qSelStepHigher.reviewer_empid#" cfsqltype="cf_sql_varchar">
            	    AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                </cfquery>
            </cfloop>
        
            </cftransaction>
			
	        <cfset SaveTransaction(50,strckData)/>
        <cfelse> 
			
			<cfquery name="local.qUpdateDraft" datasource="#request.sdsn#">
			<!---UPDATE TPMDPERFORMANCE_PLANH SET modified_date = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">--->
			UPDATE TPMDPERFORMANCE_PLANH SET modified_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
			,modified_by = '#REQUEST.SCOOKIE.USER.UNAME#'
			<!---,created_date = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">--->
			,created_date = <cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
			,created_by = '#REQUEST.SCOOKIE.USER.UNAME#'
			WHERE form_no = <cfqueryparam value="#strckData.formno#" cfsqltype="cf_sql_varchar">
			AND request_no = <cfqueryparam value="#strckData.request_no#" cfsqltype="cf_sql_varchar">
			AND reviewer_empid = <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
			AND company_code =  <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset SaveTransaction(50,strckData)/>
		
		</cfif>
		
	    <cfset LOCAL.lstNextApprover = ''>	
		<cfif errorEval eq 'tidak'>
	        <cfset LOCAL.strckListApprover = GetApproverList(reqno=strckData.request_no,empid=strckData.empid,reqorder=strckData.reqformulaorder,varcoid=request.scookie.coid,varcocode=request.scookie.cocode)>
      
			<cfif sendtype eq 'draft'>
				<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSuccessfully Save Request as Draft", true)>
			<cfelseif sendtype eq 'final'>
			    
			   	<cfset local.tcode = 'PerformancePlanNotifFullyApproved'>
				<cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSuccessfully Save Request as Final Conclusion", true)>
				<cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=strckData.request_no,nextapprover=lstNextApprover,reviewee_empid=strckData.empid)>
			<cfelse>
			   	<cfset local.tcode = 'PerformancePlanSubmitByApprover'>
			   	<cfif allowskipCompParam eq 'N'>
                    <cfset LOCAL.lstNextApprover = ListGetAt( strckListApprover.FULLLISTAPPROVER , val(strckData.UserInReviewStep)+1 )>
                <cfelse>      
                    <cfset i=0>
                    <cfloop list="#StrckListApprover.FULLLISTAPPROVER#" index="idxlist" delimiters=",">
                    <cfset i=i+1>
                        <cfif i gt strckData.UserInReviewStep>
                            <cfset local.lstNextApprover = ListAppend(lstNextApprover,idxlist,",")> 
                        </cfif>
                    </cfloop>

                </cfif>  	 
			    <cfset LOCAL.strMessage = Application.SFParser.TransMLang("JSSuccessfully Send Request to Next Reviewer", true)>
			    <cfif ListLast(StrckListApprover.FULLLISTAPPROVER) eq lstNextApprover>
                    <cfset local.tcode = 'PerformancePlanSubmitToLastApprover'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=strckData.request_no,nextapprover=lstNextApprover,reviewee_empid=strckData.empid)>
                <cfelse>
                    <cfset local.tcode = 'PerformancePlanSubmitByApprover'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=strckData.request_no,nextapprover=lstNextApprover,reviewee_empid=strckData.empid)>
                </cfif>
			   
			</cfif>
			<cfif REQUEST.SCOOKIE.MODE eq "SFGO">
    		    <cfset scValid.isvalid = true>
    		    <cfset scValid.success = true>
                <cfset scValid.message="#strMessage#">
            	<cfreturn scValid>
            <cfelse>
    			<cfoutput>
    				<script>
    					alert("#strMessage#");
    					try {
    							parent.refreshPage();
    						}
    						catch(err) {
    						}
    					parent.popClose();
    				</script>
    			</cfoutput>
			</cfif>
		</cfif>
    </cffunction>
	
   <cffunction name="ApprovalLoop">
    	<cfargument name="wdappr" required="yes">
    	<cfargument name="empid" required="yes">
    	<cfargument name="lstfilledstep" default="" required="no">

        <cfset Local.empinstep = 0>
        <cfset Local.ApproverList = "">
        <cfset Local.ApprovedStepList = "">
        
        <cfset Local.isbreak = false>

        <!--- looping step --->
		<cfset local.idx="">
        <cfloop index="idx" from="1" to="#ArrayLen(wdappr)#">
        	<cfif ArrayLen(wdappr[idx].approver) gt 1>
            	<cfset LOCAL.LstTemp=""/>
		        <!--- looping share approver --->
				<cfset LOCAL.idx2 = "">
            	<cfloop index="idx2" from="1" to="#ArrayLen(wdappr[idx].approver)#">
                    <cfif ArrayLen(wdappr[idx].approver[idx2]) gt 1>
		            	<cfset LOCAL.LstTemp2=""/>
		                <!--- looping share position --->
						<cfset LOCAL.idx3= "">
	                	<cfloop index="idx3" from="1" to="#ArrayLen(wdappr[idx].approver[idx2])#">
			            	<cfset LOCAL.LstTemp2 = ListAppend(LstTemp,wdappr[idx].approver[idx2][idx3].emp_id,"|")/>
                            
                            <cfif empid eq wdappr[idx].approver[idx2][idx3].emp_id <!----and not isbreak---->>
								<cfset LOCAL.empinstep = idx />
								<cfset LOCAL.isbreak = true>	
                            </cfif>
	                    </cfloop>
	            		<cfset LstTemp = ListAppend(LstTemp,LstTemp2,"|")/>
                    <cfelse>
		            	<cfset LstTemp = ListAppend(LstTemp,wdappr[idx].approver[idx2][1].emp_id,"|")/>
                        <cfif empid eq wdappr[idx].approver[idx2][1].emp_id <!---and not isbreak ---->>
									<cfset LOCAL.empinstep = idx />
									<cfset LOCAL.isbreak = true>
                        </cfif>
                    </cfif>
                </cfloop>
            	<cfset LOCAL.ApproverList = ListAppend(ApproverList,LstTemp)/>
            <cfelse>
	        	<cfif ArrayLen(wdappr[idx].approver[1]) gt 1>
	            	<cfset LOCAL.LstTemp=""/>
	                <!--- looping share position --->
					<cfset LOCAL.idx22 = "">
                	<cfloop index="idx22" from="1" to="#ArrayLen(wdappr[idx].approver[1])#">
                       	<cfset LOCAL.LstTemp = ListAppend(LstTemp,wdappr[idx].approver[1][idx22].emp_id,"|")/> <!---";" diganti biar sama--->
                        <cfif empid eq wdappr[idx].approver[1][idx22].emp_id <!----and not isbreak---->>
									<cfset LOCAL.empinstep = idx />
									<cfset LOCAL.isbreak = true>
                        </cfif>
                    </cfloop>
	            	<cfset LOCAL.ApproverList = ListAppend(ApproverList,LstTemp)/>
                <cfelse>
	            	<cfset LOCAL.ApproverList = ListAppend(ApproverList,wdappr[idx].approver[1][1].emp_id)/>
                    <cfif empid eq wdappr[idx].approver[1][1].emp_id <!----and not isbreak---->>
								<cfset LOCAL.empinstep = idx />
								<cfset LOCAL.isbreak = true>
                    </cfif>
                </cfif>
            </cfif>
        </cfloop>
        
        <cfset LOCAL.strckApprCekReturn = structnew()/>
        <cfset strckApprCekReturn.empinstep = empinstep/>
      
        <cfset strckApprCekReturn.fullapproverlist = ApproverList/>
        <cfreturn strckApprCekReturn>
    </cffunction>
	
	
    <cffunction name="GetApproverList">
    	<cfargument name="empid" required="yes">
    	<cfargument name="reqno" default="">
    	<cfargument name="reqorder" default="-">
    	<cfargument name="varcoid" default="#request.scookie.coid#"  required="no">
		<cfargument name="varcocode" default="#request.scookie.cocode#"  required="no">
    	
       	<!--- cek kalo request sudah pernah dibuat --->
        <cfquery name="LOCAL.qCheckRequest" datasource="#request.sdsn#">
        	SELECT requester, approval_data, approval_list, approved_list, outstanding_list, status FROM TCLTREQUEST
            WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
	            AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
	            AND UPPER(req_type) = 'PERFORMANCE.PLAN'
	            AND req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
	            AND reqemp = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <!--- cari yang sudah pernah isi dan statusnya--->
        <cfquery name="Local.qCheckEmpFilled" datasource="#request.sdsn#">
        	SELECT *
            FROM TPMDPERFORMANCE_PLANH
            WHERE company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
            AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
			AND head_status = 1
            ORDER BY review_step ASC
        </cfquery>
        
        <cfset LOCAL.ListFilledEmp = valuelist(qCheckEmpFilled.reviewer_empid)/>
        <cfset LOCAL.ListFilledEmpStep = valuelist(qCheckEmpFilled.review_step)/>
        <cfset LOCAL.ListHeadStatus = valuelist(qCheckEmpFilled.head_status)/>

   		<cfif qCheckRequest.recordcount>
			<cfset Local.strckResultRequestApproval = StructNew() />
            <cfif len(qCheckRequest.approval_data)>
				<cfset LOCAL.wdapproval=SFReqFormat(qCheckRequest.approval_data,"R",[])>
				<cfset strckResultRequestApproval.wdapproval = wdapproval/>
            <cfelse>
				<cfset strckResultRequestApproval = objRequestApproval.Generate("PERFORMANCE.PLAN", request.scookie.user.empid, empid, reqorder) />
            </cfif>
			<cfif not isBoolean(strckResultRequestApproval)>
				
				<cfset strckResultRequestApproval.approval_list = qCheckRequest.approval_list/>
				<cfset strckResultRequestApproval.outstanding_list = qCheckRequest.outstanding_list/>
				<cfset strckResultRequestApproval.requester = qCheckRequest.requester/>
				<cfset strckResultRequestApproval.status = qCheckRequest.status/>
			</cfif>
			
        <cfelse>
			<cfset Local.strckResultRequestApproval = StructNew() />
			<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq false>
				<cfset strckResultRequestApproval = objRequestApproval.Generate("PERFORMANCE.PLAN", request.scookie.user.empid, empid, reqorder) />
			<cfelse>
				<cfset strckResultRequestApproval = objRequestApproval.Generate("PERFORMANCE.PLAN", empid, empid, reqorder) />
			</cfif>
			
			<cfif not isBoolean(strckResultRequestApproval)>
				<cfset strckResultRequestApproval.approval_list = ""/>
				<cfset strckResultRequestApproval.requester = ""/>
				<cfset strckResultRequestApproval.status = ""/>
				<cfset strckResultRequestApproval.outstanding_list = ""/>
			</cfif>
        </cfif>
		
        <cfif not isBoolean(strckResultRequestApproval)>
			<cfset LOCAL.strckAppr = ApprovalLoop(strckResultRequestApproval.wdapproval,request.scookie.user.empid)/>
			<cfif ListFilledEmpStep neq "" >
				<cfset LOCAL.strckAppr = ApprovalLoop(strckResultRequestApproval.wdapproval,request.scookie.user.empid,ListFilledEmpStep)/>	
			</cfif>
			<cfset LOCAL.userinstep = strckAppr.empinstep/>
			<cfset LOCAL.full_list_approver = strckAppr.fullapproverlist/>
			
		<cfelse>
			<cfset LOCAL.userinstep = 0/>
			<cfset LOCAL.full_list_approver = ""/>
		</cfif>
		
        <cfset LOCAL.list_approver = full_list_approver/>
        
       
        <cfset LOCAL.reviewee_in_step = listfindnocase(full_list_approver,empid,",|")>
        <cfif reviewee_in_step gte 1> <!--- sebelumnya gt tanpa e [YAN]--->
            <cfset LOCAL.approver_is_reviewee = 1/>
        <cfelse>
	        <cfset LOCAL.approver_is_reviewee = 0/>
        </cfif>
        
      
        <cfif approver_is_reviewee>
        	<cfset LOCAL.reviewee_as_approver = 0>
        <cfelseif (request.scookie.user.empid eq empid and approver_is_reviewee eq 0) or (listfindnocase(ListFilledEmp,empid))>
        	<cfset LOCAL.reviewee_as_approver = 1>
        	<cfset LOCAL.list_approver = listprepend(full_list_approver,empid)>
            <cfset LOCAL.full_list_approver = list_approver>
            <cfif userinstep neq 0 OR request.scookie.user.empid eq empid> <!---Replace Approver--->
	            <cfset ++userinstep/>
	        </cfif>
        <cfelse>
        	<cfset LOCAL.reviewee_as_approver = 0>
        </cfif>
		<cfset LOCAL.listempinstepno = "">
		<cfset LOCAL.cekidx = "">
        <cfloop list="#list_approver#" index="listempinstepno">
           	<cfloop list="#listempinstepno#" delimiters="|" index="cekidx">
               	<cfif listfindnocase(ListFilledEmp,cekidx)>
                   	<cfset LOCAL.list_approver = listsetat(list_approver,listfindnocase(list_approver,listempinstepno),cekidx)/>
                    <cfbreak>
                <cfelseif cekidx eq request.scookie.user.empid>
		           	<cfset LOCAL.list_approver = listsetat(list_approver,listfindnocase(list_approver,listempinstepno),request.scookie.user.empid)/>
                    <cfbreak>
                </cfif>
            </cfloop>
        </cfloop>
        
        <cfset LOCAL.list_approver_full = list_approver>
        <cfset LOCAL.rmv = "">
       
        <cfif userinstep neq 0 and userinstep neq listlen(list_approver)>
        	<cfloop index="rmv" from="#listlen(list_approver)#" to="#userinstep+1#" step="-1">
            	<cfset LOCAL.list_approver = ListDeleteAt(list_approver,rmv)/>
            </cfloop>
        </cfif>

        <cfset LOCAL.higher_step_is_approving = 0>
        
		<cfset LOCAL.step_to_viewed = "">
		<cfset LOCAL.viewedstep="">
        <cfloop list="#ListFilledEmpStep#" index="viewedstep">
        	<cfif userinstep gt viewedstep>
				<cfset LOCAL.step_to_viewed = listappend(step_to_viewed,viewedstep)>
        	<cfelseif userinstep eq viewedstep>
				<cfset LOCAL.step_to_viewed = listappend(step_to_viewed,viewedstep)>
				<cfset LOCAL.list_approver = listsetat(list_approver,viewedstep,listgetat(ListFilledEmp,listfindnocase(ListFilledEmpStep,viewedstep)))>
            <cfelse>
            	<cfset LOCAL.higher_step_is_approving = 1>
            	<cfbreak>
            </cfif>
        </cfloop>
      
		<cfif not isBoolean(strckResultRequestApproval)>
			<cfif not listfindnocase(step_to_viewed,userinstep) and userinstep neq 0>
				<cfif strckResultRequestApproval.status eq 4 or (strckResultRequestApproval.status neq 3 and not higher_step_is_approving)>
					<cfset LOCAL.step_to_viewed = listappend(step_to_viewed,userinstep)>
				</cfif>
			</cfif>
		</cfif>
        
       	<cfset LOCAL.new_list_approver = "">
        <cfif len(list_approver)>
		<cfset LOCAL.idx = "">
        <cfloop list="#step_to_viewed#" index="idx">
        	<cfset new_list_approver = listappend(new_list_approver,listgetat(list_approver,idx))>
        </cfloop>
        </cfif>
      
        <cfif qCheckRequest.status eq 2>
	        <cfquery name="Local.qCheckAllEmpFilled" datasource="#request.sdsn#">
	        	SELECT *
	            FROM TPMDPERFORMANCE_PLANH
	            WHERE company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
	            AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
	            AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
	            ORDER BY review_step ASC
	        </cfquery>
        	<cfquery name="Local.qLastApproverRecord" dbtype="query">
            	SELECT MAX(review_step) AS stepmax FROM qCheckAllEmpFilled
            </cfquery>
        	<cfquery name="Local.qCekIfRequestIsUnfinal" dbtype="query">
            	SELECT created_by, modified_by FROM qCheckAllEmpFilled
                WHERE review_step = <cfqueryparam value="#val(qLastApproverRecord.stepmax)#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfif qCekIfRequestIsUnfinal.recordcount and listfindnocase(qCekIfRequestIsUnfinal.modified_by,"UNFINAL","|")>
	        	<cfset LOCAL.step_to_viewed = "">
            </cfif>
        </cfif>

       	<cfset LOCAL.approver_headstatus = -1/>
		<cfif listfindnocase(ListFilledEmp,request.scookie.user.empid)>
        	<cfset approver_headstatus = 1>
        </cfif>
        <cfif approver_headstatus eq -1>
			<cfquery name="Local.qCheckEmpFilldraft" datasource="#request.sdsn#">
				SELECT head_status
				FROM TPMDPERFORMANCE_PLANH
				WHERE company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
				AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
				and reviewer_empid = <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
				ORDER BY created_date desc
			</cfquery>
			<cfset approver_headstatus = qCheckEmpFilldraft.head_status>
			
		</cfif>
    	
		<cfset LOCAL.approverbefore_headstatus = 0/>
        
        <cfif listlen(new_list_approver)>
	       	<cfset Local.approverbefore_empid = listlast(listdeleteat(new_list_approver,listlen(new_list_approver)))/>
			<cfif listfindnocase(ListFilledEmp,approverbefore_empid)>
	        	<cfset approverbefore_headstatus = listgetat(ListHeadStatus,listfindnocase(ListFilledEmp,approverbefore_empid))/>
	        </cfif>
        </cfif>
        
        <cfset Local.lastApprover = "">
        <cfif listlen(ListFilledEmp)>
        	<cfset lastApprover = listlast(ListFilledEmp)>
        </cfif>
        
        <cfset Local.revise_list_approver = "">
        <cfset Local.revise_pos_atstep = 0>
	   <cfif not isBoolean(strckResultRequestApproval)>
			<cfif strckResultRequestApproval.status eq 4>
				<cfquery name="LOCAL.qGetListEmpFilled" dbtype="query">
					SELECT * FROM qCheckEmpFilled
					<!--- WHERE head_status = 1 --->
					<!--- harusnya yang draft2 sebelumnya sudah di hapus --->
					ORDER BY review_step ASC
				</cfquery>
				<cfquery name="LOCAL.qGetMaxStepToDraft" dbtype="query">
					SELECT MIN(review_step) AS stepno FROM qGetListEmpFilled
					WHERE head_status = 0
				</cfquery>
				
				<cfset revise_list_approver = valuelist(qGetListEmpFilled.reviewer_empid)>
				<cfset revise_pos_atstep = qGetMaxStepToDraft.stepno>
			</cfif>
		<cfelse>
			 <cfset revise_list_approver = "">
			 <cfset revise_pos_atstep = 0>
		</cfif>
    
        
        <cfset LOCAL.strckReturn = structnew()/>

        <cfquery name="Local.qCheckEmpSelevel" datasource="#request.sdsn#">
        	SELECT *
            FROM TPMDPERFORMANCE_PLANH
            WHERE company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
            AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
            AND head_status = 1
            AND review_step = <cfqueryparam value="#userinstep#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfquery name="Local.qCheckEmpSelevelBelumSend" datasource="#request.sdsn#">
        	SELECT *
            FROM TPMDPERFORMANCE_PLANH
            WHERE company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            AND request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
            AND reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
            AND head_status = 0
            AND review_step = <cfqueryparam value="#userinstep#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfif qCheckEmpSelevel.recordcount and qCheckEmpSelevel.reviewer_empid neq request.scookie.user.empid>
            <cfset strckReturn.samelevel_draftby = qCheckEmpSelevel.reviewer_empid/>
        <cfelseif qCheckEmpSelevelBelumSend.recordcount and qCheckEmpSelevelBelumSend.reviewer_empid neq request.scookie.user.empid>
            <cfset strckReturn.samelevel_draftby = qCheckEmpSelevelBelumSend.reviewer_empid/>
        <cfelse>
            <cfset strckReturn.samelevel_draftby = ""/>
        </cfif>
        
      

        <cfset strckReturn.index = userinstep/>
        <cfset strckReturn.LstApprover = ListRemoveDuplicates(new_list_approver)/>
		
        <cfset strckReturn.FullListApprover = ListRemoveDuplicates(full_list_approver)/>
		<cfset strckReturn.approver_headstatus = approver_headstatus/>
		<cfset strckReturn.approverbefore_headstatus = approverbefore_headstatus/>
		<cfquery name="Local.qCheckStatus" datasource="#request.sdsn#">
			SELECT status
			FROM TCLTREQUEST
			WHERE req_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar">
			
		</cfquery>
		<cfif not isBoolean(strckResultRequestApproval)>
			<cfset strckReturn.status = val(strckResultRequestApproval.status)/>
		<cfelse>
			<cfset strckReturn.status = val(qCheckStatus.status)/>
		</cfif>
		<cfset strckReturn.reviewee_as_approver = reviewee_as_approver/>
		<cfset strckReturn.approver_is_reviewee = approver_is_reviewee/>
		<cfset strckReturn.step_to_viewed = step_to_viewed/>

		<cfset strckReturn.revise_list_approver = ListRemoveDuplicates(revise_list_approver)/>
		<cfset strckReturn.revise_pos_atstep = revise_pos_atstep/>
		<cfset strckReturn.lastApprover = ListRemoveDuplicates(lastApprover)/>
		
		<cfif isdefined('debugdev')>
		    <cfdump var="#strckReturn#">
		</cfif>
		
        <cfreturn strckReturn/>
    </cffunction>
    <!---Save Search--->
    <cffunction name="saveKeyword">
		<cfparam name="pgid" default="">
		<cfparam name="saveSearchName" default="">
		<cfparam name="keyword" default="">
		
		<cfquery name="LOCAL.qSearchName" datasource="#REQUEST.SDSN#">
			SELECT search_name FROM TCLTSavedSearch 
			WHERE search_name = <cfqueryparam value="#saveSearchName#" cfsqltype="CF_SQL_VARCHAR">
				  AND formpage = <cfqueryparam value="#pgid#" cfsqltype="CF_SQL_VARCHAR">
		</cfquery>
	
		<cfif qSearchName.recordCount>
			<cfoutput>
				<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSFailed Save Search",true)>
				<script>
					alert("#SFLANG#");
				</script>
			</cfoutput>			
		<cfelse>
			<cfquery name="LOCAL.qSaveData" datasource="#REQUEST.SDSN#" result="LOCAL.vSQL" debug="#REQUEST.ISDEBUG#">
				INSERT INTO TCLTSavedSearch
				(
					 search_name
					,cruser_id
					,formpage
					,searchpassing
					,created_date
					,created_by
					,modified_date
					,modified_by				
				)
				VALUES
				(
					 <cfqueryparam value="#saveSearchName#" cfsqltype="CF_SQL_VARCHAR">
					,<cfqueryparam value="#REQUEST.SCookie.COID#" cfsqltype="CF_SQL_INTEGER">
					,<cfqueryparam value="#pgid#" cfsqltype="CF_SQL_VARCHAR">
					,<cfqueryparam value="#keyword#" cfsqltype="CF_SQL_VARCHAR">
					<!---,#CreateODBCDateTime(Now())#--->
					,<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
					,<cfqueryparam value="#REQUEST.SCookie.User.uname#" cfsqltype="CF_SQL_VARCHAR">
					<!---,#CreateODBCDateTime(Now())#--->
					,<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
					,<cfqueryparam value="#REQUEST.SCookie.User.uname#" cfsqltype="CF_SQL_VARCHAR">
				)
			</cfquery>
		</cfif>
	</cffunction>
	
	<cffunction name="removeSaveSearch">
		<cfparam name="seq_id" default="">
		<cfparam name="pgid" default="">
	
		<cfquery name="LOCAL.qUser" datasource="#REQUEST.SDSN#">
			SELECT cruser_id FROM TCLTSavedSearch WHERE seq_id=<cfqueryparam value="#seq_id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
	
		<cfoutput>
			<cfif #qUser.cruser_id# eq #val(REQUEST.SCookie.COID)#>		
				<cfquery name="LOCAL.qDelSaveSearch" datasource="#REQUEST.SDSN#">
					DELETE from TCLTSavedSearch
					WHERE seq_id=<cfqueryparam value="#seq_id#" cfsqltype="CF_SQL_INTEGER">		
				</cfquery>
		
				<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSSuccessfully Remove Save Search",true)>
			
				<cfquery name="LOCAL.qDataSaveSearch" datasource="#REQUEST.SDSN#">
					SELECT seq_id, search_name, formpage, searchpassing
					FROM TCLTSavedSearch
					WHERE cruser_id = <cfqueryparam value="#REQUEST.SCookie.COID#" cfsqltype="CF_SQL_INTEGER"> 
						  AND formpage = <cfqueryparam value="#pgid#" cfsqltype="CF_SQL_VARCHAR">
				</cfquery>
				
				<ul>
					<cfif qDataSaveSearch.recordCount>
						<cfloop query="qDataSaveSearch">						
							<li>
								<a href="##" onClick="getSearch('#qDataSaveSearch.searchpassing#&seq_id=#qDataSaveSearch.seq_id#','#qDataSaveSearch.search_name#'); return false;">#htmleditformat(qDataSaveSearch.search_name)#</a>&nbsp;<a href="##" onClick="removeSearch('#qDataSaveSearch.seq_id#','divSearch'); return false;" title="Remove Search Name"><img src="#Application.PATH.LIB##Application.OSSPT#skins#Application.OSSPT#def#Application.OSSPT#images#Application.OSSPT#temp#Application.OSSPT#acssdel.png"></a>
								&nbsp;<a href="##" onClick="getSearch('#qDataSaveSearch.searchpassing#','#qDataSaveSearch.search_name#',true,'#qDataSaveSearch.seq_id#'); return false;" title="Edit Search Name"><img src="#Application.PATH.LIB##Application.OSSPT#skins#Application.OSSPT#def#Application.OSSPT#images#Application.OSSPT#temp#Application.OSSPT#ico-edit.png"></a>
							</li>						
						</cfloop>	
					<cfelse>
						<li>Empty Data</li>
					</cfif>
				</ul>
	
				<script>
					alert("#SFLANG#");
				</script>
			<cfelse>
				<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSFailed Remove Save Search",true)>
				<script>
					alert("#SFLANG#");
				</script>			
			</cfif>
		</cfoutput>
	</cffunction>

	<cffunction name="getListSaveSearch">
		<cfparam name="seq_id" default="">
		<cfparam name="pgid" default="">
		<cfoutput>
			<cfquery name="LOCAL.qDataSaveSearch" datasource="#REQUEST.SDSN#">
				SELECT seq_id, search_name, formpage, searchpassing
				FROM TCLTSavedSearch
				WHERE formpage = <cfqueryparam value="#pgid#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			<ul>
				<cfif qDataSaveSearch.recordCount>
					<cfloop query="qDataSaveSearch">						
						<li>
							<a href="##" onClick="getSearch('#qDataSaveSearch.searchpassing#&seq_id=#qDataSaveSearch.seq_id#','#qDataSaveSearch.search_name#'); return false;">#htmleditformat(qDataSaveSearch.search_name)#</a>&nbsp;<a href="##" onClick="removeSearch('#qDataSaveSearch.seq_id#','divSearch'); return false;" title="Remove Search Name"><img src="#Application.PATH.LIB##Application.OSSPT#skins#Application.OSSPT#def#Application.OSSPT#images#Application.OSSPT#temp#Application.OSSPT#acssdel.png"></a>
							&nbsp;<a href="##" onClick="getSearch('#qDataSaveSearch.searchpassing#','#qDataSaveSearch.search_name#',true,'#qDataSaveSearch.seq_id#'); return false;" title="Edit Search Name"><img src="#Application.PATH.LIB##Application.OSSPT#skins#Application.OSSPT#def#Application.OSSPT#images#Application.OSSPT#temp#Application.OSSPT#ico-edit.png"></a>
						</li>					
					</cfloop>	
				<cfelse>
					<li>Empty Data</li>
				</cfif>
			</ul>
		</cfoutput>
	</cffunction>
	
    
    <cffunction name="Reject">
       <cfreturn true>
    </cffunction>

	<cffunction name="FilterEmployeeFullyApprove">
		<cfparam name="period_code" default="">
		<cfparam name="grade_order" default="">
		<cfparam name="search" default="">
		<cfparam name="nrow" default="50">
		<cfset local.ReturnVarCheckCompParam = REQUEST.SHOWCOLUMNGENERATEPERIOD>
	
		<cfparam name="isformstatus" default="N">
		<cfparam name="hdnSelectedformstatus" default="">
		
		<cfif val(nrow) eq "0">
			<cfset local.nrow="50">
		</cfif>
		<cfset LOCAL.searchText=trim(search)>
		<cfset LOCAL.count = 1/>
		<cfparam name="ftpass" default="">
		<cfset local.lstparams="alldept,work_loc,work_status,cost_center,job_status,job_grade,emp_pos,emp_status,gender,marital,religion,hdnfaoempnolist">
		<cfif ftpass neq "" AND IsJSON(ftpass)>
			<cfset local.params=DeserializeJSON(ftpass)>
			<Cfset local.iidx = "">
			<cfloop list="#lstparams#" index="iidx">
				<cfif StructKeyExists(params,iidx)>
					<cfparam name="#iidx#" default="#params[iidx]#">
				<cfelse>
					<cfparam name="#iidx#" default="">
				</cfif>
			</cfloop>
		</cfif>

		<cfif ftpass neq "" AND IsJSON(ftpass) AND isdefined("alldept") AND alldept eq "false">
			<cfif request.dbdriver eq 'MYSQL'><!--- untuk inclusive --->
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR CONCAT(',',e.parent_path,',') LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			<cfelse>
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR ','#REQUEST.DBSTRCONCAT#e.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			</cfif>
		<cfelse>
			<cfset LOCAL.cond_dept="">
		</cfif>
		<cfset LOCAL.lsGender="Female,Male">
		<cfset LOCAL.lsMarital="Single,Married,Widow,Widower,Divorce">
		<cfset LOCAL.EmpLANG=Application.SFParser.TransMLang(listAppend(lsMarital,lsGender),false,",")>
		<cfset LOCAL.qListEmpFullyApprBase = qGetListPlanFullyApproveAndClosed(period_code=period_code,allstatus=false,isformstatus=isformstatus,hdnSelectedformstatus=hdnSelectedformstatus)> 
		
		<cfquery name="LOCAL.qListEmpFullyAppr" dbtype="query">
		    SELECT * FROM qListEmpFullyApprBase
		    WHERE 1=1
			<cfif len(searchText)>
				AND
				(
					Full_Name LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
					OR emp_no Like <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
					OR req_no LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
					OR form_no LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
				)
			</cfif>
		</cfquery>

		<cfset LOCAL.lstEmpFullAppr = ValueList(qListEmpFullyAppr.reviewee_empid) >
	
				<cfquery name="LOCAL.qData" datasource="#request.sdsn#">
					SELECT distinct a.emp_id, full_name, full_name AS emp_name, b.emp_no
					FROM TEOMEMPPERSONAL a
					LEFT JOIN TEODEMPCOMPANY b ON a.emp_id = b.emp_id
					LEFT JOIN TCLRGroupMember GM on GM.emp_id = b.emp_id

					LEFT JOIN TEODEMPLOYMENTHISTORY d ON a.emp_id = d.emp_id 

					LEFT JOIN TEOMPOSITION e 
						ON e.position_id = b.position_id 
						AND e.company_id = b.company_id
					LEFT JOIN TEODEmppersonal f 
						ON f.emp_id = b.emp_id 

					WHERE b.company_id = #REQUEST.SCookie.COID#
		                <!--- AND a.emp_id IN (<cfqueryparam value="#ValueList(qListEmpFullyAppr.reviewee_empid)#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
		                   --->
		               <cfif len(lstEmpFullAppr)>
	                        AND (#Application.SFUtil.CutList(ListQualify(lstEmpFullAppr,"'")," a.emp_id IN  ","OR",2)#)
	                   <cfelse>
	                        AND 1=0
	                   </cfif>

					<cfif grade_order neq "">
						<cfset grade_order = replace(grade_order,",","','","ALL")/>
						AND b.grade_code IN ('#grade_order#')
					</cfif>

                    <!--- pindah ke QOQ diatas
					<cfif len(searchText)>
						AND
						(
							a.Full_Name LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
							OR b.emp_no Like <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
							OR b.emp_no Like <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
						)
					</cfif>
					--->

					<cfif ftpass neq "" AND IsJSON(ftpass)>
						<cfif isdefined("alldept") AND alldept eq "false"> 
							AND
							<cfif params.inclusive eq "false">
								<cfset local.where_dept="(e.parent_id = " & replace(params.dept,","," OR e.parent_id = ","All") & " OR e.dept_id = " & replace(params.dept,","," OR e.dept_id = ","All") & ")">
								#where_dept#					   
							<cfelse>
								<cfif request.dbdriver eq 'MYSQL'>
									(CONCAT(',',e.parent_path,',') LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
								<cfelse>
									(','#REQUEST.DBSTRCONCAT#e.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
								</cfif>
							</cfif>
							
						</cfif>
						<cfif isdefined("work_loc") AND len(work_loc)>
							AND b.work_location_code in (<cfqueryparam value="#work_loc#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(work_status) and work_status eq "1">
							<cfif request.dbdriver eq "MSSQL">
							 AND (b.end_date >= getdate() OR b.end_date IS NULL)
							 <cfelseif request.dbdriver eq "MYSQL">
							 AND (b.end_date >= NOW() OR b.end_date IS NULL)
							 </cfif>
						<cfelseif len(work_status) and work_status eq "0">
							<cfif request.dbdriver eq "MSSQL">
							 AND (b.end_date < getdate() AND b.end_date IS NOT NULL)
							 <cfelseif request.dbdriver eq "MYSQL">
							 AND (b.end_date < NOW() AND b.end_date IS NOT NULL)
							 </cfif>
						</cfif>
						<cfif isdefined("cost_center") AND len(cost_center)>
							AND b.cost_code IN (<cfqueryparam value="#cost_center#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_status") AND len(job_status)>
							AND b.job_status_code IN (<cfqueryparam value="#job_status#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_grade") AND len(job_grade)>
							AND b.grade_code IN (<cfqueryparam value="#job_grade#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_pos)>
							AND b.position_id IN (<cfqueryparam value="#emp_pos#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_status)>
							AND b.employ_code IN (<cfqueryparam value="#emp_status#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(gender) and gender neq "2">
							#APPLICATION.SFUtil.getLookupQueryPart("gender",gender,"0=Female|1=Male",0,"AND")#
						</cfif>
						<cfif len(marital)>
							AND f.maritalstatus = <cfqueryparam value="#marital#" cfsqltype="CF_SQL_INTEGER">
						</cfif>
						<cfif len(religion)>
							AND f.religion_code IN (<cfqueryparam value="#religion#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(trim(hdnfaoempnolist))>
                            AND (#Application.SFUtil.CutList(ListQualify(hdnfaoempnolist,"'")," b.emp_no IN  ","OR",2)#)
                        </cfif>
                    <cfelse>
                    
                       
					</cfif>
					ORDER BY full_name	
				</cfquery>
			<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSEmployee",true,"+")>
			<cfset LOCAL.vResult="">
			
			<cfloop query="qData">
			    <cfset vResult=vResult & "
				arrEntryList[#currentrow-1#]=""#JSStringFormat(emp_id & "=" & emp_name & " [#emp_no#]")#"";">
			</cfloop>
			<cfoutput>
			    <cfset LOCAL.SFLANG1=Application.SFParser.TransMLang("NotAvailable",true,"+")>
				<script>
				    arrEntryList=new Array();
					document.getElementById('lbl_inp_emp_id').innerHTML  = '#SFLANG# (#qData.recordcount#) <span class=\"required\">*</span>';
					$('[id=tr_inp_period_date] > [id=tdb_1]').html('#SFLANG1#');
    				<cfif len(vResult)>
    					#vResult#
    					document.getElementById('unselinp_emp_id').value = '#valuelist(qData.emp_id)#'; 
    				    $('[id=tr_inp_period_date] > [id=tdb_1]').html('#DateFormat(qListEmpFullyAppr.reference_date,REQUEST.config.DATE_OUTPUT_FORMAT)#');
    				</cfif>
			    </script>
			</cfoutput>
	</cffunction>
	  <!---ENC50618-81669--->
	  <cffunction name="GetChangedPositionInPlanningForm">
		<cfargument name="period_code" default="">
		<cfargument name="empnolist" default="" required="no">
		<cfquery name="LOCAL.qCariData" datasource="#request.sdsn#">
			 SELECT 
            	DISTINCT
            	TPMDPERFORMANCE_PLANH.form_no, 
            	TPMDPERFORMANCE_PLANH.period_code,
            	TPMDPERFORMANCE_PLANH.reviewee_empid,
            	TPMDPERFORMANCE_PLANH.reference_date
            	
            	,TCLTREQUEST.reqemp
            	,TEOMEMPPERSONAL.full_name
            	,TEODEMPCOMPANY.emp_no
            	,TEODEMPCOMPANY.emp_id
            	,TEOMPOSITION.pos_name_#request.scookie.lang# AS pos_name
            	,TEOMPOSITION.position_id AS position_id
            	
            	,ORG.pos_name_#request.scookie.lang# AS orgunit
            	,ORG.position_id as orgunit_id
            	,TEOMJOBGRADE.grade_name
            	
            	,TPMMPERIOD.period_name_#request.scookie.lang# AS period_name
            	
            FROM TPMDPERFORMANCE_PLANH
            INNER JOIN TCLTREQUEST
            	ON TCLTREQUEST.req_no = TPMDPERFORMANCE_PLANH.request_no
            INNER JOIN TEOMEMPPERSONAL
            	ON TEOMEMPPERSONAL.emp_id = TPMDPERFORMANCE_PLANH.reviewee_empid
            INNER JOIN TEODEMPCOMPANY 
                ON TEODEMPCOMPANY.emp_id = TPMDPERFORMANCE_PLANH.reviewee_empid
				AND TEODEMPCOMPANY.position_id <> TPMDPERFORMANCE_PLANH.reviewee_posid 
            INNER JOIN TEOMPOSITION
                ON TEOMPOSITION.position_id = TPMDPERFORMANCE_PLANH.reviewee_posid 
            INNER JOIN TEOMPOSITION ORG 
                ON ORG.position_id = TEOMPOSITION.dept_id
            INNER JOIN TPMMPERIOD 
                ON TPMMPERIOD.period_code = TPMDPERFORMANCE_PLANH.period_code 
            INNER JOIN TEOMJOBGRADE 
                ON TEODEMPCOMPANY.grade_code = TEOMJOBGRADE.grade_code 
                AND TEODEMPCOMPANY.company_id = TEOMJOBGRADE.company_id 
			WHERE TPMDPERFORMANCE_PLANH.isfinal = 1 
			AND  TPMDPERFORMANCE_PLANH.period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="CF_SQL_VARCHAR">
			<cfif period_code neq "">
				and TPMDPERFORMANCE_PLANH.form_no not in (select tpmdperformance_evalh.form_no from tpmdperformance_evalh where 
				tpmdperformance_evalh.period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="CF_SQL_VARCHAR"> 
				and tpmdperformance_evalh.reviewee_empid = tpmdperformance_planh.reviewee_empid
				and tpmdperformance_evalh.company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="CF_SQL_VARCHAR">
				)
			<cfelse>
				and 1=0
			</cfif>
			<cfif empnolist neq "">
				and TPMDPERFORMANCE_PLANH.reviewee_empid not in (select emp_id from teodempcompany where emp_no in (<cfqueryparam value="#empnolist#" cfsqltype="CF_SQL_VARCHAR" list="Yes">) and company_id = #REQUEST.SCOOKIE.COID#)
			</cfif>
		</cfquery>
	
		<cfreturn qCariData>
	  </cffunction>
	 
	 
	<cffunction name="FilterEmployeeReplaceForm">
		<cfparam name="period_code" default="">
		<cfparam name="grade_order" default="">
		<cfparam name="search" default="">
		<cfparam name="nrow" default="100000">
		<cfif val(nrow) eq "0">
			<cfset local.nrow="100000">
		</cfif>
		<cfset LOCAL.searchText=trim(search)>
		<cfset LOCAL.count = 1/>
		<cfparam name="ftpass" default="">
		<cfset local.lstparams="alldept,work_loc,work_status,cost_center,job_status,job_grade,emp_pos,emp_status,gender,marital,religion,hdnfaoempnolist">
		<cfif ftpass neq "" AND IsJSON(ftpass)>
			<cfset local.params=DeserializeJSON(ftpass)>
			<Cfset local.iidx = "">
			<cfloop list="#lstparams#" index="iidx">
				<cfif StructKeyExists(params,iidx)>
					<cfparam name="#iidx#" default="#params[iidx]#">
				<cfelse>
					<cfparam name="#iidx#" default="">
				</cfif>
			</cfloop>
		</cfif>

		<cfif ftpass neq "" AND IsJSON(ftpass) AND isdefined("alldept") AND alldept eq "false">
			<cfif request.dbdriver eq 'MYSQL'><!--- untuk inclusive --->
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR CONCAT(',',e.parent_path,',') LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			<cfelse>
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR ','#REQUEST.DBSTRCONCAT#e.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			</cfif>
		<cfelse>
			<cfset LOCAL.cond_dept="">
		</cfif>
		<cfset LOCAL.lsGender="Female,Male">
		<cfset LOCAL.lsMarital="Single,Married,Widow,Widower,Divorce">
		<cfset LOCAL.EmpLANG=Application.SFParser.TransMLang(listAppend(lsMarital,lsGender),false,",")>
		<cfset LOCAL.qListEmpFullyAppr = GetChangedPositionInPlanningForm(period_code=period_code)>
		<cfset LOCAL.qGetRange = objEnterpriseUser.getPlanStartEndDate(periodcode=period_code)>
		<cfquery name="LOCAL.qChangedEmployee" datasource="#request.sdsn#">
			select emp_id from TEODEMPLOYMENTHISTORY where ( effectivedt >= '#DateFormat(qGetRange.plan_startdate,"yyyy-mm-dd")#'
			OR enddt <= '#DateFormat(qGetRange.plan_startdate,"yyyy-mm-dd")#') and company_id = #REQUEST.SCOOKIE.COID# GROUP BY emp_id 
		</cfquery>

				<cfquery name="LOCAL.qData" datasource="#request.sdsn#">
					SELECT distinct a.emp_id, full_name, full_name AS emp_name, b.emp_no
					FROM TEOMEMPPERSONAL a
					INNER JOIN TEODEMPCOMPANY b ON a.emp_id = b.emp_id
					INNER JOIN TCLRGroupMember GM on GM.emp_id = b.emp_id
					INNER JOIN TEODEMPLOYMENTHISTORY d ON a.emp_id = d.emp_id 
					INNER JOIN TEOMPOSITION e 
						ON e.position_id = b.position_id 
						AND e.company_id = b.company_id
					INNER JOIN TEODEmppersonal f 
						ON f.emp_id = b.emp_id 
					WHERE b.company_id = #REQUEST.SCookie.COID#
		            <cfif len(#ValueList(qListEmpFullyAppr.reviewee_empid)#) gt 0>
		                  AND a.emp_id IN (<cfqueryparam value="#ValueList(qListEmpFullyAppr.reviewee_empid)#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
					<cfelse>
						AND 1=0
		            </cfif>
					<cfif len(#ValueList(qChangedEmployee.emp_id)#) gt 0>
		                  AND a.emp_id IN (<cfqueryparam value="#ValueList(qChangedEmployee.emp_id)#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
					<cfelse>
						AND 1=0
		            </cfif>
					<cfif grade_order neq "">
						<cfset grade_order = replace(grade_order,",","','","ALL")/>
						AND b.grade_code IN ('#grade_order#')
					</cfif>

					<cfif len(searchText)>
						AND
						(
							a.Full_Name LIKE '%#searchText#%'
							OR b.emp_no Like '%#searchText#%'
						)
					</cfif>

					<cfif ftpass neq "" AND IsJSON(ftpass)>
						<cfif isdefined("alldept") AND alldept eq "false"> 
							AND
							<cfif params.inclusive eq "false">
								<cfset local.where_dept="(e.parent_id = " & replace(params.dept,","," OR e.parent_id = ","All") & " OR e.dept_id = " & replace(params.dept,","," OR e.dept_id = ","All") & ")">
								#where_dept#					   
							<cfelse>
								<cfif request.dbdriver eq 'MYSQL'>
									(CONCAT(',',e.parent_path,',') LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
								<cfelse>
									(','#REQUEST.DBSTRCONCAT#e.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
								</cfif>
							</cfif>
							
						</cfif>
						<cfif isdefined("work_loc") AND len(work_loc)>
							AND b.work_location_code in (<cfqueryparam value="#work_loc#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(work_status) and work_status eq "1">
							<cfif request.dbdriver eq "MSSQL">
							 AND (b.end_date >= getdate() OR b.end_date IS NULL)
							 <cfelseif request.dbdriver eq "MYSQL">
							 AND (b.end_date >= NOW() OR b.end_date IS NULL)
							 </cfif>
						<cfelseif len(work_status) and work_status eq "0">
							<cfif request.dbdriver eq "MSSQL">
							 AND (b.end_date < getdate() AND b.end_date IS NOT NULL)
							 <cfelseif request.dbdriver eq "MYSQL">
							 AND (b.end_date < NOW() AND b.end_date IS NOT NULL)
							 </cfif>
						</cfif>
						<cfif isdefined("cost_center") AND len(cost_center)>
							AND b.cost_code IN (<cfqueryparam value="#cost_center#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_status") AND len(job_status)>
							AND b.job_status_code IN (<cfqueryparam value="#job_status#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_grade") AND len(job_grade)>
							AND b.grade_code IN (<cfqueryparam value="#job_grade#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_pos)>
							AND b.position_id IN (<cfqueryparam value="#emp_pos#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_status)>
							AND b.employ_code IN (<cfqueryparam value="#emp_status#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(gender) and gender neq "2">
							#APPLICATION.SFUtil.getLookupQueryPart("gender",gender,"0=Female|1=Male",0,"AND")#
						</cfif>
						<cfif len(marital)>
							AND f.maritalstatus = <cfqueryparam value="#marital#" cfsqltype="CF_SQL_INTEGER">
						</cfif>
						<cfif len(religion)>
							AND f.religion_code IN (<cfqueryparam value="#religion#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(trim(hdnfaoempnolist))>
                            AND (#Application.SFUtil.CutList(ListQualify(hdnfaoempnolist,"'")," b.emp_no IN  ","OR",2)#)
                        </cfif>
                    <cfelse>
						<cfif request.dbdriver eq "MSSQL">
						 AND (b.end_date >= getdate() OR b.end_date IS NULL)
						 <cfelseif request.dbdriver eq "MYSQL">
						 AND (b.end_date >= NOW() OR b.end_date IS NULL)
						 </cfif>
					</cfif>

					ORDER BY full_name	
				</cfquery>
				
			<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSEmployee",true,"+")>
			<cfset LOCAL.vResult="">
			<cfloop query="qData">
			    <cfset vResult=vResult & "
				arrEntryList[#currentrow-1#]=""#JSStringFormat(emp_id & "=" & emp_name & " [#emp_no#]")#"";">
			</cfloop>
			<cfoutput>
			    <cfset LOCAL.SFLANG1=Application.SFParser.TransMLang("NotAvailable",true,"+")>
				<script>
				    arrEntryList=new Array();
					document.getElementById('lbl_inp_emp_id').innerHTML  = '#SFLANG# (#qData.recordcount#) <span class=\"required\">*</span>';
					$('[id=tr_inp_period_date] > [id=tdb_1]').html('#SFLANG1#');
    				<cfif len(vResult)>
    					#vResult#
    					document.getElementById('unselinp_emp_id').value = '#valuelist(qData.emp_id)#'; 
    				    $('[id=tr_inp_period_date] > [id=tdb_1]').html('#DateFormat(qListEmpFullyAppr.reference_date,REQUEST.config.DATE_OUTPUT_FORMAT)#');
    				</cfif>
			    </script>
			</cfoutput>
	</cffunction>
		
	<cffunction name = "processReplacePregen">
	    <cfparam name="form_no" default="">
  		<cfparam name="period_code" default="">
  		<cfset oldformno = form_no>
  		<cfset LOCAL.appcode = 'PERFORMANCE.PLAN'>
		<!--- <cfset LOCAL.ObjFormType = createobject("component","SFPerformancePlanning")> --->
	    <cfset LOCAL.req_no = Application.SFUtil.getCode("PERFORMANCEPLAN",'no','true','false','true')> 
	    <cfset LOCAL.form_no = Application.SFUtil.getCode("PERFEVALFORM",'no','true')>	
		<cfquery name="LOCAL.qgetFormNo" datasource="#REQUEST.SDSN#">
			SELECT DISTINCT reviewee_empid FROM TPMDPERFORMANCE_PLANGEN
			WHERE form_no = <cfqueryparam value="#oldformno#" cfsqltype="cf_sql_varchar">
			AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
			AND company_id = <cfqueryparam value="#request.scookie.coid#" cfsqltype="cf_sql_integer">
		</cfquery>
	    <cfset local.reviewee_empid =   qgetFormNo.reviewee_empid>

	    <cfset LOCAL.i=0>
		<cfif request.dbdriver eq "MSSQL">
			<cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),Datepart("d",now())),"yyyy-mm-dd")>
		<cfelse>
			<cfset LOCAL.nowdate= DATEFORMAT(CreateDate(Datepart("yyyy",now()),Datepart("m",now()),Datepart("d",now())),"yyyy-mm-dd")>
		</cfif>
        <cfset Local.strctReqApp = listingFilter(inp_startdt=nowdate,inp_enddt=nowdate)>
		<cfset strctApproverData = objRequestApproval.Generate(appcode, reviewee_empid, reviewee_empid, "-") />
		<cfset local.fullListReviewer =reviewee_empid> 
		<cfset local.objWDApproval = strctApproverData.WDAPPROVAL>
		<cfset tempListSharedReviewer = "">
		<cfset fixedLstApp = reviewee_empid>
		<cfloop index="idxLoop1" from="1" to="#ArrayLen(objWDApproval)#">
			<cfset structLoop1 = objWDApproval[idxLoop1]>
			<cfset structLoop1Approver = objWDApproval[idxLoop1].approver>
			<cfif ArrayLen(structLoop1Approver) eq 1>
				<cfset structLoop2Approver = structLoop1Approver[1]>
			    <cfif arraylen(structLoop1Approver[1]) EQ 1>
    				<cfset isiStructAppEmpID = structLoop2Approver[1].emp_id>
    				<cfif ListFindNoCase(fixedLstApp,isiStructAppEmpID,",") eq 0>
    					<cfset fixedLstApp = ListAppend(fixedLstApp,isiStructAppEmpID)>
    				</cfif>
    			<cfelse>
					<cfset tempListSharedReviewer = "">
    				<cfloop index="local.idxLoop3" from="1" to="#ArrayLen(structLoop2Approver)#">
    					<cfset isiStructAppEmpID = structLoop2Approver[idxLoop3].emp_id>
    					<cfif ListFindNoCase(tempListSharedReviewer,isiStructAppEmpID,"|") eq 0>
    						<cfset tempListSharedReviewer = ListAppend(tempListSharedReviewer,isiStructAppEmpID,"|")>		
    					</cfif>	
    				</cfloop>
    				<cfif ListFindNoCase(fixedLstApp,tempListSharedReviewer,",") eq 0 AND ListLen(tempListSharedReviewer,"|") gt 1>
    					<cfset fixedLstApp = ListAppend(fixedLstApp,tempListSharedReviewer,",")>
    				</cfif>  
    			</cfif>

			<cfelse>
				<cfset tempListSharedReviewer = "">
				<cfloop index="local.idxLoop2" from="1" to="#ArrayLen(structLoop1Approver)#">
					<cfset structLoop2Approver = structLoop1Approver[idxLoop2]>	
					<cfloop index="local.idxLoop3" from="1" to="#ArrayLen(structLoop2Approver)#">
						<cfset isiStructAppEmpID = structLoop2Approver[idxLoop3].emp_id>
						<cfif ListFindNoCase(tempListSharedReviewer,isiStructAppEmpID,"|") eq 0>
							<cfset tempListSharedReviewer = ListAppend(tempListSharedReviewer,isiStructAppEmpID,"|")>		
						</cfif>	
					</cfloop>
				</cfloop> 
				<cfif ListFindNoCase(fixedLstApp,tempListSharedReviewer,",") eq 0 AND ListLen(tempListSharedReviewer,"|") gt 1>
					<cfset fixedLstApp = ListAppend(fixedLstApp,tempListSharedReviewer,",")>
				</cfif>  
			</cfif>
		</cfloop>
	    <cfset fullListReviewer = fixedLstApp>
		<cfset local.strctPlanH = StructNew()>
    	<cfset strctPlanH.emp_id = reviewee_empid>
    	<cfset strctPlanH.reviewee_empid = reviewee_empid>
    	<cfset strctPlanH.request_no = req_no>
    	<cfset strctPlanH.period_code = period_code>
    	<cfset strctPlanH.formno = form_no>
    	<cfset strctPlanH.REQUESTFOR = reviewee_empid>
		<cfset LOCAL.qCheckPeriod = objEnterpriseUser.getPlanStartEndDate(periodcode=period_code)>
		<cfset LOCAL.objPeriod = createobject("component","SFPerformancePeriod")>
    	<cfset strctPlanH.reference_date = Dateformat(CreateODBCDATE(qCheckPeriod.reference_date), "yyyy-mm-dd")>
    	<cfset LOCAL.callInsertRequestRecord = objPeriod.insertRequestRecord(idxemp=reviewee_empid,lstapprover=fullListReviewer,req_type=appcode,req_no=req_no,form_no=form_no,strctReqdata=strctPlanH,replacestatus=true)>
		<cfquery name="LOCAL.qCheckPlanH" datasource="#REQUEST.SDSN#">
            Select reviewee_empid from TPMDPERFORMANCE_PLANH where PERIOD_CODE = <cfqueryparam value="#period_code#" cfsqltype="CF_SQL_VARCHAR"> 
			AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
			AND form_no = <cfqueryparam value="#oldformno#" cfsqltype="cf_sql_varchar">
		</cfquery>	
		<cfif qCheckPlanH.recordcount neq 0>
		    <cfquery name="LOCAL.qCheckReviewee" datasource="#REQUEST.SDSN#">
				SELECT EMP_ID, position_id, grade_code, employ_code FROM TEODEMPCOMPANY 
			    WHERE EMP_ID =  <cfqueryparam value="#qCheckPlanH.reviewee_empid#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_id =   <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_varchar">
				AND status = 1
			</cfquery>
			<cfquery name="LOCAL.qCheckReviewer" datasource="#REQUEST.SDSN#">
				SELECT EMP_ID, position_id, grade_code, employ_code FROM TEODEMPCOMPANY 
			    WHERE EMP_ID =  <cfqueryparam value="#request.scookie.user.empid#" cfsqltype="CF_SQL_VARCHAR"> 
			    AND company_id =   <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_varchar">
				AND status = 1
			</cfquery>
		
            <cfset LOCAL.qEmpInfo = getEmpDetail(empid=qCheckReviewee.emp_id)>
			<cfquery name="local.qUnitPath" datasource="#request.sdsn#">
			    SELECT parent_path FROM TEOMPOSITION
				WHERE position_id = <cfqueryparam value="#qEmpInfo.dept_id#" cfsqltype="cf_sql_integer">
		    </cfquery>
		    <cfset strctPlanH.emp_id = qCheckReviewee.EMP_ID>
	        <cfset strctPlanH.reviewee_empid = qCheckReviewee.EMP_ID>
			<cfset strctPlanH.RevieweeAsApprover = 0>
		    <cfset strctPlanH.UserInReviewStep = 1>
		    <cfset strctPlanH.position_id = qCheckReviewee.position_id>
			<cfset strctPlanH.grade_code = qCheckReviewee.grade_code>
			<cfset strctPlanH.employ_code = qCheckReviewee.employ_code>
		    <cfset strctPlanH.lstunitpath = "">
			<cfset strctPlanH.lstunitpath = listappend(strctPlanH.lstunitpath,"#qUnitPath.parent_path#")>
			<cfset callInsertPLANH = InsertPLANH(form_no=form_no,company_code=REQUEST.SCOOKIE.COCODE,request_no=req_no,form_order=1,reference_date=strctPlanH.reference_date,period_code=strctPlanH.period_code,reviewee_empid=strctPlanH.emp_id,reviewee_posid = strctPlanH.position_id,reviewee_grade=strctPlanH.grade_code,reviewee_employcode=strctPlanH.employ_code,reviewee_unitpath=strctPlanH.lstunitpath,reviewer_empid=request.scookie.user.empid,reviewer_posid=qCheckReviewer.position_id,review_step=1, head_status=0,lastreviewer_empid=request.scookie.user.empid,isfinal=0,isfinal_requestno=0)>
            <cfquery name="LOCAL.qCheckPlanD" datasource="#REQUEST.SDSN#">
                SELECT PD.*,PH.review_step from TPMDPERFORMANCE_PLAND PD
                inner  JOIN TPMDPERFORMANCE_PLANH PH ON PD.form_no = PH.form_no  
				and PD.reviewer_empid = PH.reviewer_empid and PD.request_no = PH.request_no 
                WHERE PH.form_no = <cfqueryparam value="#oldformno#" cfsqltype="cf_sql_varchar">
			    AND PH.company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
				AND PH.isfinal = 1
                Order by PH.review_step desc
		    </cfquery>
		    <cfif qCheckPlanD.recordcount gt 0>
				<cfloop query="qCheckPlanD">
					<cfquery name="LOCAL.qInsertPlanD" datasource="#request.sdsn#" >
					INSERT INTO TPMDPERFORMANCE_PLAND 
					(form_no,company_code,lib_code,lib_type,reviewer_empid,reviewer_posid,weight,target,notes
					,lib_name_en,lib_name_id,lib_name_my,lib_name_th
					,lib_desc_en,lib_desc_id,lib_desc_my,lib_desc_th
					,iscategory,lib_depth,parent_code,parent_path,lib_order
					,achievement_type,isnew,created_by,created_date,modified_by,modified_date,request_no)
					VALUES (
					<cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_code#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_type#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#request.scookie.user.empid#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckReviewee.position_id#" cfsqltype="cf_sql_numeric">
					,<cfqueryparam value="#qCheckPlanD.weight#" cfsqltype="cf_sql_numeric">
					,<cfqueryparam value="#qCheckPlanD.target#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_name_en#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_name_id#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_name_my#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_name_th#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_desc_en#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_desc_id#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_desc_my#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_desc_th#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.iscategory#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_depth#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.parent_code#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.parent_path#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.lib_order#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.achievement_type#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#qCheckPlanD.isnew#" cfsqltype="cf_sql_varchar">
					,<cfqueryparam value="#request.scookie.user.uname#" cfsqltype="cf_sql_varchar">
					,<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
					,<cfqueryparam value="#request.scookie.user.uname#" cfsqltype="cf_sql_varchar">
					,<cfif request.dbdriver EQ "MSSQL">getdate()<cfelse>now()</cfif>
					,<cfqueryparam value="#req_no#" cfsqltype="cf_sql_varchar">
					)
					</cfquery>
				</cfloop>
					
		    </cfif>
           <cfquery name="LOCAL.qCheckPlanGEN" datasource="#REQUEST.SDSN#">
                select reviewee_empid from TPMDPERFORMANCE_PLANGEN  WHERE company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_varchar">
			    AND form_no = <cfqueryparam value="#oldformno#" cfsqltype="cf_sql_varchar"> AND period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
		    </cfquery>
			<cfif qCheckPlanGEN.recordcount neq 0>
		        <cfquery name="LOCAL.qDelGen" datasource="#request.sdsn#">
					DELETE FROM TPMDPERFORMANCE_PLANGEN  where period_code = <cfqueryparam value="#period_code#" cfsqltype="cf_sql_varchar">
					and form_no = <cfqueryparam value="#oldformno#" cfsqltype="cf_sql_varchar"> 
				</cfquery>
		    </cfif>
			<cfset LOCAL.ObjPlanGen = createobject("component","SFPerformancePeriod")>
			<cfloop list="#fullListReviewer#" index="idxApp" delimiters=",">	
				<cfset i=i+1>
				<cfif ListLen(idxApp,"|") gt 1>  <!--- shared approver --->
					<cfloop list="#idxApp#" index="idxApp2" delimiters="|">
						 <cfset local.callInsertPlanGen = ObjPlanGen.InsertToPerfPreGenRev(reviewee_empid=strctPlanH.emp_id,reviewer_empid=idxApp2,period_code=period_code,review_step=i,req_type=appcode,req_no=req_no,form_no=form_no)>
					</cfloop>
				<cfelse>
					 <cfset local.callInsertPlanGen = ObjPlanGen.InsertToPerfPreGenRev(reviewee_empid=strctPlanH.emp_id,reviewer_empid=idxApp,period_code=period_code,review_step=i,req_type=appcode,req_no=req_no,form_no=form_no)>
				</cfif>
			</cfloop>
			
			<cfset deleteOldPlan =  DeleteAllPerfPlanByFormNo(form_no=oldformno)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	
	</cffunction>

	<cffunction name="ReplaceForm">
	    <cfparam name="hdnSelectedemp_id" default="">
	    <cfparam name="lstform" default="">
	    <cfparam name = "period_code" default="">
	    <cfset errform="">
	    <cfloop list="#lstform#" index="LOCAL.form_no">
	      	<cfquery name="LOCAL.qGetEvalData" datasource="#request.sdsn#">
			SELECT form_no FROM TPMDPERFORMANCE_EVALH WHERE company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
			AND form_no = <cfqueryparam value="#form_no#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfif qGetEvalData.recordcount gt 0> <!--- jika sudah ada eval , planning form tidak bisa direplace ---->
			   	<cfset errform = ListAppend(errform,form_no)>
			<cfelse>
			    <cfset Local.revar = processReplacePregen(form_no=form_no,period_code=period_code)>
			</cfif>
	    </cfloop>
        <cfoutput>
            
           <cfif len(errform) neq 0>
               <script>
                   alert("Failed to replace performance planning form for form no : #errform#");
               </script>
            <cfelse>
                <script>
                    alert("Successfully to replace selected form");
                    this.reloadPage();
                </script>
           </cfif>
        </cfoutput>    
	</cffunction>
	<cffunction name="DeleteForm">
	    <cfargument name="lstform" default="">
	        <cfset LOCAL.retVarDeleteByFormNo = DeleteAllPerfPlanByFormNo(form_no=lstform)>
        <cfreturn retVarDeleteByFormNo>
	</cffunction>
	<cffunction name="DeletePlan">
	    <cfparam name="lstdelete" default="">
	    <cfloop list="#lstdelete#" index="LOCAL.form_no">
	        <cfset LOCAL.retVarDeleteByFormNo = DeleteAllPerfPlanByFormNo(form_no=form_no)>
	    </cfloop>
        <cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSYou have successfully delete Performance Planning data",true)>
		<cfif retVarDeleteByFormNo eq false>
		    <cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSFailed Delete Performance Planning",true)>
		</cfif>
		<cfif REQUEST.SCOOKIE.MODE eq "SFGO">
		    <cfif retVarDeleteByFormNo eq false>
    		    <cfset LOCAL.scValid={isvalid=false,message="#SFLANG#",success=false}>
		    <cfelse>
		        <cfset LOCAL.scValid={isvalid=false,message="#SFLANG#",success=true}>
		    </cfif>
        	<cfreturn scValid>
        <cfelse>
    		<cfoutput>
    			<script>
    				alert("#SFLANG#");
    				this.reloadPage();
    			</script>
    		</cfoutput>
		</cfif>
	</cffunction>
	
	<cffunction name="DeleteAllPerfPlanByFormNo">
		<cfparam name="form_no" default="">
		<cfparam name="company_id" default="#REQUEST.Scookie.COID#">
		<cfparam name="company_code" default="#REQUEST.Scookie.COCODE#">
		<cftry>	
			<cfquery name="LOCAL.qGetPerfPlanH" datasource="#REQUEST.SDSN#">
				SELECT request_no, period_code, reviewee_empid, reviewee_posid FROM TPMDPERFORMANCE_PLANH
				WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfif qGetPerfPlanH.recordcount eq 0>
    			<cfquery name="LOCAL.qDelPerfPlanGENERATE" datasource="#REQUEST.SDSN#">
    				DELETE FROM TPMDPERFORMANCE_PLANGEN WHERE form_no =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
    				AND company_id = <cfqueryparam value="#REQUEST.Scookie.COID#" cfsqltype="CF_SQL_VARCHAR">
    			</cfquery>
			</cfif>
			
			<cfloop query="qGetPerfPlanH">
    			<cfquery name="LOCAL.qDelPerfPlanREQUEST" datasource="#REQUEST.SDSN#">
    				DELETE FROM TCLTREQUEST WHERE req_no = <cfqueryparam value="#qGetPerfPlanH.request_no#" cfsqltype="CF_SQL_VARCHAR"> 
    				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
    				AND UPPER(req_type) = 'PERFORMANCE.PLAN'
    			</cfquery>
    			<cfquery name="LOCAL.qDelPerfPlanGENERATE" datasource="#REQUEST.SDSN#">
    				DELETE FROM TPMDPERFORMANCE_PLANGEN WHERE req_no = <cfqueryparam value="#qGetPerfPlanH.request_no#" cfsqltype="CF_SQL_VARCHAR"> 
    				AND form_no =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
    				AND company_id = <cfqueryparam value="#REQUEST.Scookie.COID#" cfsqltype="CF_SQL_VARCHAR">
    			</cfquery>
			</cfloop>
		
			<cfquery name="LOCAL.qDelPerfPlanH" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDPERFORMANCE_PLANH WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfquery name="LOCAL.qDelPerfPlanD" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDPERFORMANCE_PLAND WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfquery name="LOCAL.qDelPerfPlanKPI" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDPERFORMANCE_PLANKPI WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfquery name="LOCAL.qDelPerfPlanNote" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDPERFORMANCE_PLANNOTE WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfquery name="LOCAL.qDelPerfPlanRevised" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDPERFORMANCE_PLANREVISED WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<!---Dlete cascade and set pland child iscascade = null--->
			<cfquery name="LOCAL.qGetDataCascade" datasource="#REQUEST.SDSN#">
				SELECT cascadefrom_formno,cascadeto_formno,lib_code,lib_type FROM TPMDGOALCASCADING WHERE 
				    (
				        cascadefrom_formno =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR">
				        OR cascadeto_formno =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR">
				    ) 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfquery name="LOCAL.qDelDataCascade" datasource="#REQUEST.SDSN#">
				DELETE FROM TPMDGOALCASCADING WHERE 
				    (
				        cascadefrom_formno =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR">
				        OR cascadeto_formno =  <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR">
				    ) 
				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
			
			<cfloop query="qGetDataCascade">
    			<cfquery name="LOCAL.qUpdatePlanD" datasource="#request.sdsn#">
    				UPDATE TPMDPERFORMANCE_PLAND 
    				SET iscascade = NULL
    				WHERE form_no = <cfqueryparam value="#qGetDataCascade.cascadeto_formno#" cfsqltype="cf_sql_varchar">
    				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
					AND lib_code = <cfqueryparam value="#qGetDataCascade.lib_code#" cfsqltype="cf_sql_varchar">
    				AND UPPER(lib_type) = <cfqueryparam value="#qGetDataCascade.lib_type#" cfsqltype="cf_sql_varchar">	
    			</cfquery>
    			
    			<cfif qGetDataCascade.cascadefrom_formno NEQ form_no > <!---Hapus parent yg child nya sudah kosong karena di hapus--->
        			<cfquery name="LOCAL.qGetDataCascadeExistParent" datasource="#REQUEST.SDSN#">
        				SELECT cascadefrom_formno,cascadeto_formno,lib_code,lib_type FROM TPMDGOALCASCADING WHERE 
        				    (
        				        cascadefrom_formno =  <cfqueryparam value="#qGetDataCascade.cascadefrom_formno#" cfsqltype="CF_SQL_VARCHAR">
        				    ) 
    					AND lib_code = <cfqueryparam value="#qGetDataCascade.lib_code#" cfsqltype="cf_sql_varchar">
        				AND UPPER(lib_type) = <cfqueryparam value="#qGetDataCascade.lib_type#" cfsqltype="cf_sql_varchar">	
        				AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
        			</cfquery>
        			<cfif qGetDataCascadeExistParent.recordcount eq 0><!---Hapus parent yg child nya sudah kosong karena di hapus--->
            			<cfquery name="LOCAL.qUpdatePlanD" datasource="#request.sdsn#">
            				UPDATE TPMDPERFORMANCE_PLAND 
            				SET iscascade = NULL
            				WHERE form_no = <cfqueryparam value="#qGetDataCascade.cascadefrom_formno#" cfsqltype="cf_sql_varchar">
            				AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
        					AND lib_code = <cfqueryparam value="#qGetDataCascade.lib_code#" cfsqltype="cf_sql_varchar">
            				AND UPPER(lib_type) = <cfqueryparam value="#qGetDataCascade.lib_type#" cfsqltype="cf_sql_varchar">	
            			</cfquery>
        			</cfif>
    			</cfif>
    			
			</cfloop>
			<!---Dlete cascade and set pland child iscascade = null--->
			<cfset LOCAL.retvarDelPerfEval = DeleteAllPerfEvalByFormNo(form_no=form_no)>
			<cfset LOCAL.retvarDelPerfMID = DeleteAllPerfMIDByFormNo(form_no=form_no)>
			
			<cfset LOCAL.retVarReturn=true>
			<cfcatch>
			    <cfset LOCAL.retVarReturn=false>
			</cfcatch>
		</cftry>
        <cfreturn retVarReturn>
	</cffunction>
	
	
	<cffunction name="DeleteAllPerfEvalByFormNo">
		<cfparam name="form_no" default="">
		<cfparam name="company_id" default="#REQUEST.Scookie.COID#">
		<cfparam name="company_code" default="#REQUEST.Scookie.COCODE#">
		
		<cfset LOCAL.objEvaluation = CreateObject("component", "SFPerformanceEvaluation") />
																																						
																																											
			 
   
																								 
																																																																																								  
			 
														  
											   
																						
																																									
																																												  
				 
				   
   
											 
																			  
																																								 
																																											
				 
			 
   
								 
																			 
																																									 
																																												  
													  
				 
	   
																			  
																																																															   
																																																						
				 
	   
																		   
																																																																																						
					   
																				  
																																																												
																																						
																																						  
					   
														
																									
																																																															   
																																						
																																						  
				  
					
			
   
																		 
																																								
																																												 
				
	  
																	  
																																							
																																												 
				
	
        <cfset LOCAL.retVarReturn = objEvaluation.DeleteAllPerfEvalByFormNo(form_no=form_no,company_id=company_id,company_code=company_code)>
																																							
																																												 
				
	  
																	  
																																							
																																												 
				
																			 
																																						 
				
																				   
																																																											  
																																				 
					  
			
												 
																																				
					 

																				
																																											
																																				 
					  
	  
								  
			
									   
			 
				
		
        <cfreturn retVarReturn>
	    
	</cffunction>
	
	<cffunction name="DeleteAllPerfMIDByFormNo"> <!--- Monitoring --->
		<cfparam name="form_no" default="">
		<cfparam name="company_id" default="#REQUEST.Scookie.COID#">
		<cfparam name="company_code" default="#REQUEST.Scookie.COCODE#">
		<cftry>
    		<cfquery name="LOCAL.qDelPerfMIDH" datasource="#REQUEST.SDSN#">
    			DELETE FROM TPMDPERFORMANCE_MIDH WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
    			AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
    		</cfquery>
    		<cfquery name="LOCAL.qDelPerfMIDD" datasource="#REQUEST.SDSN#">
    			DELETE FROM TPMDPERFORMANCE_MIDD WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
    			AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
    		</cfquery>
    		
    		<cfquery name="LOCAL.qDelPerfMIDHistory" datasource="#REQUEST.SDSN#">
    			DELETE FROM TPMDPERFORMANCE_MIDHISTORY WHERE form_no = <cfqueryparam value="#form_no#" cfsqltype="CF_SQL_VARCHAR"> 
    			AND company_code = <cfqueryparam value="#REQUEST.Scookie.COCODE#" cfsqltype="CF_SQL_VARCHAR">
    		</cfquery>
			<cfset LOCAL.retVarReturn=true>
			<cfcatch>
			    <cfset LOCAL.retVarReturn=false>
			</cfcatch>
		</cftry>
	    <cfreturn retVarReturn>
	</cffunction>
    
	<cffunction name="FilterAllEmployee">
		<cfparam name="search" default="">
		<cfparam name="nrow" default="50">
		<cfparam name="member" default="">
		<cfparam name="period_code" default="">
		<cfparam name="ftpass" default="">
		<cfset local.lstparams="alldept,work_loc,work_status,cost_center,job_status,job_grade,emp_pos,emp_status,gender,marital,religion,hdnfaoempnolist"><!--- change dept-to-alldept --->
		<cfif ftpass neq "" AND IsJSON(ftpass)>
			<cfset local.params=DeserializeJSON(ftpass)><!---cf_sfwritelog dump="params" prefix="FORM[2]"--->
			<cfset local.iidx = "">
			<cfloop list="#lstparams#" index="iidx">
				<cfif StructKeyExists(params,iidx)>
					<cfparam name="#iidx#" default="#params[iidx]#">
				<cfelse>
					<cfparam name="#iidx#" default="">
				</cfif>
			</cfloop>
		</cfif>
		<cfif val(nrow) eq "0">
			<cfset nrow="50">
		</cfif>
		<cfif ftpass neq "" AND IsJSON(ftpass) AND isdefined("alldept") AND alldept eq "false">
			<cfif request.dbdriver eq 'MYSQL'><!--- untuk inclusive --->
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR CONCAT(',',P.parent_path,',') LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			<cfelse>
				<cfset LOCAL.cond_dept0=replace(params.dept,",",",%' OR ','#REQUEST.DBSTRCONCAT#P.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,","All")>
				<cfset LOCAL.cond_dept=PreserveSingleQuotes(LOCAL.cond_dept0)>
			</cfif>
		<cfelse>
			<cfset LOCAL.cond_dept="">
		</cfif>
		<cfset LOCAL.searchText=trim(search)>
		<cfset LOCAL.lsGender="Female,Male">
		<cfset LOCAL.lsMarital="Single,Married,Widow,Widower,Divorce">
		<cfset LOCAL.EmpLANG=Application.SFParser.TransMLang(listAppend(lsMarital,lsGender),false,",")>
		<cfset LOCAL.searchText=trim(search)>
		<cfoutput>
		<cf_sfqueryemp name="LOCAL.qdata" dsn="#REQUEST.SDSN#"  ACCESSCODE="hrm.performance">
			SELECT DISTINCT E.emp_id ,E.full_name emp_name,EC.emp_no,EC.status active
				,EC.end_date,EG.terminate_date terminate_date,EC.company_id company_id
			FROM TEOMEmpPersonal E 
				LEFT JOIN TEODEmpPersonal EP ON E.emp_id = EP.emp_id
				LEFT JOIN TEODEmpCompany EC ON E.emp_id=EC.emp_id
				LEFT JOIN TEODEmpCompanyGroup EG ON EG.emp_id = E.emp_id
				LEFT JOIN TEOMPosition P ON EC.position_id=P.position_id
				LEFT JOIN TEOMPosition Dept ON P.dept_id=Dept.position_id
			WHERE 1=1 AND EC.company_id=<cf_sfqparamemp value="#REQUEST.SCookie.COID#" type="CF_SQL_INTEGER">
				<cfif ftpass eq "" >
				  AND (EC.end_date IS NULL OR EC.status = '1' AND EC.end_date >=  #CreateODBCDate(Now())# )
				</cfif>
			<cfif len(searchText)>
				AND (#Application.SFUtil.DBConcat(["E.first_name","' '","E.middle_name","' '","E.last_name"])# LIKE <cf_sfqparamemp value="%#searchText#%" type="CF_SQL_VARCHAR">
				OR EC.emp_no LIKE <cf_sfqparamemp value="%#searchText#%" type="CF_SQL_VARCHAR">)
			</cfif>
			<cfif ftpass neq "" AND IsJSON(ftpass)>
				<cfif isdefined("alldept") AND alldept eq "false"> 
					AND
					<cfif params.inclusive eq "false">
						<cfset local.where_dept="(P.parent_id = " & replace(params.dept,","," OR P.parent_id = ","All") & " OR P.dept_id = " & replace(params.dept,","," OR P.dept_id = ","All") & ")">
						#where_dept#					   
					<cfelse>
						<cfif request.dbdriver eq 'MYSQL'>
							(CONCAT(',',P.parent_path,',') LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
						<cfelse>
							(','#REQUEST.DBSTRCONCAT#P.parent_path#REQUEST.DBSTRCONCAT#',' LIKE '%,#PreserveSingleQuotes(LOCAL.cond_dept)#,%')
						</cfif>
					</cfif>
				</cfif>

				<cfif isdefined("work_loc") AND len(work_loc)>
					AND EC.work_location_code IN (<cf_sfqparamemp value="#work_loc#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif len(work_status) and work_status eq "1">
				    AND (EC.end_date IS NULL OR EC.status = '1' AND EC.end_date >= <cfif request.dbdriver eq "MSSQL">getdate()<cfelse>now()</cfif>)
				<cfelseif len(work_status) and work_status eq "0">
				    AND (EC.end_date < <cfif request.dbdriver eq "MSSQL">getdate()<cfelse>now()</cfif> AND EC.end_date IS NOT NULL OR EC.status = '0')
				</cfif>
				<cfif isdefined("cost_center") AND len(cost_center)>
					AND EC.cost_code IN (<cf_sfqparamemp value="#cost_center#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif isdefined("job_status") AND len(job_status)>
					AND EC.job_status_code IN (<cf_sfqparamemp value="#job_status#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif isdefined("job_grade") AND len(job_grade)>
					AND EC.grade_code IN (<cf_sfqparamemp value="#job_grade#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif len(emp_pos)>
					AND EC.position_id IN (<cf_sfqparamemp value="#emp_pos#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif len(emp_status)>
					AND EC.employ_code IN (<cf_sfqparamemp value="#emp_status#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<!---Personal_Information--->
				<cfif len(gender) and gender neq "2">
					#APPLICATION.SFUtil.getLookupQueryPart("gender",gender,"0=Female|1=Male",0,"AND")#
				</cfif>
				<cfif len(marital)>
					AND EP.maritalstatus = <cf_sfqparamemp value="#marital#" type="cf_sql_integer">
				</cfif>
				<cfif len(religion)>
					AND EP.religion_code IN (<cf_sfqparamemp value="#religion#" type="CF_SQL_VARCHAR" list="Yes">)
				</cfif>
				<cfif len(trim(hdnfaoempnolist))>
					AND (#Application.SFUtil.CutList(ListQualify(hdnfaoempnolist,"'")," EC.emp_no IN  ","OR",2)#)
				</cfif>

			</cfif>
			GROUP BY  E.emp_id,E.full_name,EC.emp_no, EC.status,EC.end_date,EG.terminate_date,EC.company_id
			ORDER BY emp_name
		</cf_sfqueryemp>
		</cfoutput>
		<cfquery name="LOCAL.QdataWithoutMember" dbtype="query">
		    SELECT * FROM qData  WHERE 1=1
			<cfif len(member)>
				AND emp_id NOT IN (<cfqueryparam value="#member#" cfsqltype="CF_SQL_VARCHAR" list="Yes">)
			</cfif>
		    ORDER BY emp_name
		</cfquery>
		<cfset LOCAL.vResult=[]>
		<cfset local.filem = ValueList(qData.emp_id,",")> <!--- BUG50518-92744 --->
		
		<cfloop query="QdataWithoutMember">
			<cfset arrayappend(Local.vResult,"
			arrEntryList[#currentrow-1#]=""#JSStringFormat(emp_id & "=" & emp_name & " " & "(#emp_no#)")#"";" 
			& "arrEmpStat[#currentrow-1#]=""#JSStringFormat(active)#"";"
			& "arrEnddt[#currentrow-1#]=""#DateFormat(end_date,"d/m/yyyy")#"";"
			& "arrTermdt[#currentrow-1#]=""#DateFormat(terminate_date,"d/m/yyyy")#"";"
			& "arrCompid[#currentrow-1#]=""#(company_id)#"";"
			& "arrEmpid[#currentrow-1#]=""#(emp_id)#"";"
			& "arrNamval[#currentrow-1#]=""#JSStringFormat(emp_name & "(#emp_no#)")#"";")>
		</cfloop>
		<cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSEmployee",true,"+")>
		<cfoutput>
			<script>
			    document.getElementById('lbl_inp_emp_id').innerHTML  = '#SFLANG# (#qData.recordcount#)';
			    <cfif ftpass neq "" AND IsJSON(ftpass)>
    			    if($sf("inp_listjson")) { 
    				    $sf("inp_listjson").value = '#ftpass#';
    			    }
    			<cfelse>
    			    if($sf("inp_listjson")) { 
    				    $sf("inp_listjson").value = '';
    			    }
			    </cfif>
				arrEntryList=new Array();
				arrEmpStat=new Array();
				arrEnddt=new Array();
				arrTermdt=new Array();
				arrCompid=new Array();
				arrEmpid=new Array();
				arrNamval=new Array();
				<cfif arraylen(Local.vResult)>
					#arraytolist(Local.vResult,"")#
				</cfif>
			</script>
		</cfoutput>
	</cffunction>
    <!---Filter untuk download template di upload planning--->
    <cffunction name="ValidateOrgUnitKPI">
		<cfargument name="period_code" required="yes">
		<cfargument name="reviewee_empid" required="yes">
		<cfset local.strckReturn = structnew()>
		<cfset strckReturn.isValid = true>
		<cfset strckReturn.alrtMessage = "">
		<cfset strckReturn.isdepthead = 0>
		<cfquery name="local.qCekPos" datasource="#request.sdsn#">
			SELECT emp_id, teodempcompany.position_id FROM TEODEMPCOMPANY, TEOMPOSITION
			WHERE teodempcompany.position_id = TEOMPOSITION.head_div
			AND emp_id = <cfqueryparam value="#arguments.reviewee_empid#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfif len(trim(qCekPos.emp_id))>
			<cfset strckReturn.isdepthead = 1>
		</cfif>
		<cfif val(strckReturn.isdepthead) eq 1>
			<cfquery name="local.qGetOrgUnitID" datasource="#request.sdsn#">
				SELECT dept_id FROM TEOMPOSITION WHERE position_id = <cfqueryparam value="#val(qCekPos.position_id)#" cfsqltype="cf_sql_integer">
			</cfquery>	
			<cfquery name="local.qCheckData" datasource="#request.sdsn#">
				SELECT DISTINCT PLKPI.form_no, PLH.reviewee_empid  FROM TPMDPERFORMANCE_PLANKPI PLKPI LEFT JOIN TPMDPERFORMANCE_PLANH PLH ON PLH.form_no = PLKPI.form_no AND PLH.company_code = PLKPI.company_code AND PLH.request_no = PLKPI.request_no WHERE PLKPI.period_code = <cfqueryparam value="#arguments.period_code#" cfsqltype="cf_sql_varchar"> AND PLKPI.company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar"> AND PLKPI.orgunit_id = <cfqueryparam value="#val(qGetOrgUnitID.dept_id)#" cfsqltype="cf_sql_integer"> 
			</cfquery>	
			<cfif qCheckData.recordcount gt 0 AND qCheckData.reviewee_empid neq arguments.reviewee_empid>
				<cfset strckReturn.isValid = false>
				<cfset strckReturn.alrtMessage=Application.SFParser.TransMLang("JSThis org unit objective planning is already set on another planning form",true)>
			</cfif>
		</cfif> 
		<cfreturn strckReturn>
	</cffunction>
    <cffunction name="ValidateBeforeRevision">
		<cfargument name="form_no" required="yes">
		<cfargument name="request_no" required="yes">
		<cfset local.strckReturn = structnew()>
		<cfset strckReturn.isValidForRevision = true>
		<cfset strckReturn.alrtMessage = "">
		<cfquery name="qCheckData0" datasource="#request.sdsn#">
	        SELECT cascadefrom_formno from TPMDGOALCASCADING where company_code = '#REQUEST.SCOOKIE.COCODE#' and cascadefrom_formno = <cfqueryparam value="#arguments.form_no#" cfsqltype="cf_sql_varchar">
        </cfquery>
		<cfif qCheckData0.recordcount gt 0>
			<cfset strckReturn.isValidForRevision = false>
			<cfset strckReturn.alrtMessage=Application.SFParser.TransMLang("JSObjective in this Planning Form has been cascaded",true)>
		<cfelse>
				<cfquery name="qCheckData2" datasource="#request.sdsn#">
				SELECT form_no from tpmdperformance_evalh where company_code = '#REQUEST.SCOOKIE.COCODE#'
				and form_no = <cfqueryparam value="#arguments.form_no#" cfsqltype="cf_sql_varchar">
				</cfquery>
				<cfif qCheckData2.recordcount gt 0>
					<cfset strckReturn.isValidForRevision = false>
					<cfset strckReturn.alrtMessage=Application.SFParser.TransMLang("JSThis Planning Form already has evaluation form data",true)>
				</cfif>
		</cfif>
		<cfreturn strckReturn>
	</cffunction>
    
	<cffunction name="Add">
	    <cfparam name="formno" default="">
	    <cfparam name="REQUEST_NO" default="">
	    <cfparam name="flagrevs" default="">
        <cfset LOCAL.tempOldReqNo = REQUEST_NO>
        <cfset allowskipCompParam = "Y">
        <cfset requireselfassessment = "Y">
        <cfquery name="qCompParam" datasource="#request.sdsn#">
	        SELECT field_value, UPPER(field_code) field_code from tclcappcompany where UPPER(field_code) IN ('ALLOW_SKIP_REVIEWER', 'REQUIRESELFASSESSMENT') and company_id = '#REQUEST.SCookie.COID#'
        </cfquery>
        <cfloop query="qCompParam">
            <cfif TRIM(qCompParam.field_code) eq "ALLOW_SKIP_REVIEWER" AND TRIM(qCompParam.field_value) NEQ ''>
    	        <cfset allowskipCompParam = TRIM(qCompParam.field_value)>
            <cfelseif TRIM(qCompParam.field_code) eq "REQUIRESELFASSESSMENT" AND TRIM(qCompParam.field_value) NEQ '' >
    	        <cfset requireselfassessment = TRIM(qCompParam.field_value)> <!---Bypass self assesment--->
            </cfif>
        </cfloop>
		
		<cfif flagrevs EQ 1>
			<cfset checkValidateRevision = ValidateBeforeRevision(form_no=formno,REQUEST_NO=REQUEST_NO)>
			<cfif checkValidateRevision.isValidForRevision EQ false>
				<cfoutput>
					<script>
						alert("#checkValidateRevision.alrtMessage# \n Revision Planning Form can't be done");
						parent.popClose();
						parent.refreshPage();	
					</script>
					 <CF_SFABORT>
				</cfoutput>
			</cfif>
		</cfif>
        <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true> <!---Update TCLTREQUEST set approver based on pregenerate--->
            <cfquery name="LOCAL.getOldDataReq"  datasource="#request.sdsn#"> 
            	SELECT approval_list,approval_position_list,APPROVAL_DATA FROM TCLTREQUEST WHERE req_no  = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfquery name="LOCAL.getOldDataPlanH"  datasource="#request.sdsn#"> 
				SELECT review_step,reviewer_empid,reviewee_empid FROM TPMDPERFORMANCE_PLANH
            	INNER JOIN teomemppersonal on teomemppersonal.emp_id =  TPMDPERFORMANCE_PLANH.reviewer_empid
            	WHERE request_no  = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">  AND form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"> ORDER BY review_step
            </cfquery>
            <cfquery name="LOCAL.getOldCurrentApprPlanH" dbtype="query">
                SELECT * FROM getOldDataPlanH WHERE reviewer_empid = '#REQUEST.SCookie.User.empid#' 
            </cfquery>
            <cfset LOCAL.lstApproverOverride = getOldDataReq.approval_list >
            <cfset LOCAL.lstPosidApproverOverride = getOldDataReq.approval_position_list >
            <cfset LOCAL.tempJson=deserializeJson(getOldDataReq.APPROVAL_DATA)>
            <cfloop from="1" to="#ArrayLen(tempJson)#" index="LOCAL.idxTemp">
            	<cfset LOCAL.tempcurrentApprStep = getOldCurrentApprPlanH.review_step>
            	<cfif Listfindnocase(ValueList(getOldDataPlanH.reviewer_empid),getOldCurrentApprPlanH.reviewee_empid) GT 0 AND getOldCurrentApprPlanH.reviewee_empid NEQ REQUEST.SCookie.User.empid >
            		<cfset LOCAL.tempcurrentApprStep = tempcurrentApprStep - 1 >
            	</cfif>
                <cfif tempcurrentApprStep EQ idxTemp AND getOldCurrentApprPlanH.reviewee_empid NEQ REQUEST.SCookie.User.empid>
                    <cfset tempJson[idxTemp].approvedby = request.scookie.user.uid>
                <cfelse>
                    <cfset tempJson[idxTemp].approvedby = ''>
                </cfif>
            </cfloop>
            <cfset LOCAL.tempApprovalData =SerializeJSON(tempJson) >
            <cfset LOCAL.oustandappr = ''>
            <cfset LOCAL.tempfound = false>
            <cfloop list="#lstApproverOverride#" index="LOCAL.idxappr">
                <cfif tempfound EQ false AND idxappr NEQ request.scookie.user.uid> <cfcontinue> </cfif>
                <cfset tempfound = true>
                <cfif idxappr NEQ request.scookie.user.uid>
                    <cfset oustandappr=listappend(oustandappr,idxappr)>
                </cfif>
            </cfloop>
    		<cfset strRequesterEmpId = requestfor />
            <cfset reqformulaorder = '-'>
            <cfset structDataApproverOverride=StructNew()>
            <cfset structDataApproverOverride['APPROVER_LIST']=lstApproverOverride>
            <cfset structDataApproverOverride['APVERPOS_LIST']=lstPosidApproverOverride>
            <cfset structDataApproverOverride['OUTSTAND_LIST']=oustandappr>
            <cfset structDataApproverOverride['REQUIRED_LIST']=ListLast(lstApproverOverride)>
            <cfset structDataApproverOverride['WDAPPROVAL']=tempJson>
			<cfset  AddCustomPlan(false,true)>
            <cfquery name="LOCAL.qGetCUrrentApproverPlanGen"  datasource="#request.sdsn#"> <!---Get List Approver--->
            	SELECT DISTINCT PLANGEN.reviewee_empid, PLANGEN.reviewer_empid, PLANGEN.reviewee_posid, PLANGEN.review_step, PLANGEN.req_no 
            	    ,REVIEWER_PERS.user_id REVIEWER_userid  ,REVIEWER_COMP.position_id REVIEWER_posid
            	FROM TPMDPERFORMANCE_PLANGEN PLANGEN  INNER JOIN TEOMEMPPERSONAL REVIEWER_PERS ON REVIEWER_PERS.emp_id = PLANGEN.reviewer_empid
            	INNER JOIN TEODEMPCOMPANY REVIEWER_COMP ON REVIEWER_COMP.emp_id = REVIEWER_PERS.emp_id AND REVIEWER_COMP.company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
            	WHERE PLANGEN.form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"> ORDER BY PLANGEN.review_step
            </cfquery>
            <cfquery name="LOCAL.qGetCurrStepApprover" dbtype="query">
                SELECT review_step FROM qGetCUrrentApproverPlanGen WHERE reviewer_empid = '#REQUEST.SCookie.User.empid#' ORDER BY review_step
            </cfquery>
            <cfquery name="LOCAL.qGetOutstandingListAPpPm" dbtype="query">
                SELECT REVIEWER_userid FROM qGetCUrrentApproverPlanGen WHERE review_step > #val(qGetCurrStepApprover.review_step)# ORDER BY review_step
            </cfquery>
            <cfquery name="LOCAL.getNewDataReq"  datasource="#request.sdsn#"> 
            	SELECT status FROM TCLTREQUEST WHERE req_no  = <cfqueryparam value="#qGetCUrrentApproverPlanGen.req_no#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfquery name="LOCAL.qGetApprovedDataFromReq" datasource="#request.sdsn#">
            	UPDATE TCLTREQUEST SET approval_list = '#lstApproverOverride#' , approved_list = '#val(request.scookie.user.uid)#', 
            	    outstanding_list = '#ValueList(qGetOutstandingListAPpPm.REVIEWER_userid)#', 
            	    approval_position_list = '#lstPosidApproverOverride#' ,  approval_data = '#tempApprovalData#'
            	    <cfif requestfor NEQ REQUEST.SCookie.User.empid AND getNewDataReq.status EQ 1>
            	        ,status = 2
            	    </cfif>
				WHERE UPPER(req_type) = 'PERFORMANCE.PLAN' AND req_no = <cfqueryparam value="#qGetCUrrentApproverPlanGen.req_no#" cfsqltype="cf_sql_varchar">
					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
            </cfquery>   
            <cfquery name="LOCAL.qUpdatePlanH" datasource="#request.sdsn#">
            	UPDATE TPMDPERFORMANCE_PLANH  SET review_step = '1' <!---Step yg revise selalu 1--->
				WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
					AND request_no = <cfqueryparam value="#qGetCUrrentApproverPlanGen.req_no#" cfsqltype="cf_sql_varchar">
					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
					AND reviewer_empid = <cfqueryparam value="#REQUEST.SCookie.User.empid#" cfsqltype="cf_sql_varchar">
            </cfquery> 
			<cfquery name="LOCAL.qUpdateRequestBefore" datasource="#request.sdsn#">
				UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0, isfinal_requestno = 0 WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
				and request_no <> <cfqueryparam value="#qGetCUrrentApproverPlanGen.req_no#" cfsqltype="cf_sql_varchar">
				AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
			</cfquery>
        <cfelse>   
            <cfif flagrevs EQ 1>
                <cfquery name="LOCAL.getOldDataReq"  datasource="#request.sdsn#"> 
                	SELECT approval_list,approval_position_list,APPROVAL_DATA FROM TCLTREQUEST WHERE req_no  = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
                </cfquery>
           
                <cfquery name="LOCAL.getOldDataPlanH"  datasource="#request.sdsn#"> 
    				SELECT review_step,reviewer_empid,reviewee_empid FROM TPMDPERFORMANCE_PLANH
                	INNER JOIN teomemppersonal on teomemppersonal.emp_id =  TPMDPERFORMANCE_PLANH.reviewer_empid
                	WHERE request_no  = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">  AND form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"> ORDER BY review_step
                </cfquery>
                                 
                <cfquery name="LOCAL.getOldCurrentApprPlanH" dbtype="query">
                    SELECT * FROM getOldDataPlanH WHERE reviewer_empid = '#REQUEST.SCookie.User.empid#' 
                </cfquery>

                <cfset LOCAL.lstApproverOverride = getOldDataReq.approval_list >
                <cfset LOCAL.lstPosidApproverOverride = getOldDataReq.approval_position_list >
                <cfset LOCAL.tempJson=deserializeJson(getOldDataReq.APPROVAL_DATA)>
                <cfloop from="1" to="#ArrayLen(tempJson)#" index="LOCAL.idxTemp">
                	<cfset LOCAL.tempcurrentApprStep = getOldCurrentApprPlanH.review_step>
                	<cfif Listfindnocase(ValueList(getOldDataPlanH.reviewer_empid),getOldCurrentApprPlanH.reviewee_empid) GT 0 AND getOldCurrentApprPlanH.reviewee_empid NEQ REQUEST.SCookie.User.empid >
                		<cfset LOCAL.tempcurrentApprStep = tempcurrentApprStep - 1 >
                	</cfif>
                    <cfif tempcurrentApprStep EQ idxTemp AND getOldCurrentApprPlanH.reviewee_empid NEQ REQUEST.SCookie.User.empid>
                        <cfset tempJson[idxTemp].approvedby = request.scookie.user.uid>
                    <cfelse>
                        <cfset tempJson[idxTemp].approvedby = ''>
                    </cfif>
                </cfloop>
                <cfset LOCAL.tempApprovalData =SerializeJSON(tempJson) >
                <cfset LOCAL.oustandappr = ''>
                <cfset LOCAL.tempfound = false>
                <cfloop list="#lstApproverOverride#" index="LOCAL.idxappr">
                    <cfif tempfound EQ false AND idxappr NEQ request.scookie.user.uid> <cfcontinue> </cfif>
                    <cfset tempfound = true>
                    <cfif idxappr NEQ request.scookie.user.uid>
                        <cfset oustandappr=listappend(oustandappr,idxappr)>
                    </cfif>
                </cfloop>
        		<cfset strRequesterEmpId = requestfor />
                <cfset reqformulaorder = '-'>
                <cfset structDataApproverOverride=StructNew()>
                <cfset structDataApproverOverride['APPROVER_LIST']=lstApproverOverride>
                <cfset structDataApproverOverride['APVERPOS_LIST']=lstPosidApproverOverride>
                <cfset structDataApproverOverride['OUTSTAND_LIST']=oustandappr>
                <cfset structDataApproverOverride['REQUIRED_LIST']=ListLast(lstApproverOverride)>
                <cfset structDataApproverOverride['WDAPPROVAL']=tempJson>
                

    			<cfset  AddCustomPlan(false,true)>

                <cfquery name="LOCAL.qGetCUrrentApproverPlanGen"  datasource="#request.sdsn#"> <!---Get List Approver--->
                	SELECT DISTINCT PLANGEN.reviewee_empid, PLANGEN.reviewer_empid, PLANGEN.reviewee_posid, PLANGEN.review_step, PLANGEN.request_no 
                	    ,REVIEWER_PERS.user_id REVIEWER_userid  ,REVIEWER_COMP.position_id REVIEWER_posid
                	FROM TPMDPERFORMANCE_PLANH PLANGEN  INNER JOIN TEOMEMPPERSONAL REVIEWER_PERS ON REVIEWER_PERS.emp_id = PLANGEN.reviewer_empid
                	INNER JOIN TEODEMPCOMPANY REVIEWER_COMP ON REVIEWER_COMP.emp_id = REVIEWER_PERS.emp_id AND REVIEWER_COMP.company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
                	WHERE PLANGEN.form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"> 
                	    AND PLANGEN.request_no = <cfqueryparam value="#tempOldReqNo#" cfsqltype="cf_sql_varchar"> 
                	ORDER BY PLANGEN.review_step
                </cfquery>
                <cfquery name="LOCAL.qGetCurrStepApprover" dbtype="query">
                    SELECT review_step FROM qGetCUrrentApproverPlanGen WHERE reviewer_empid = '#REQUEST.SCookie.User.empid#' ORDER BY review_step
                </cfquery>
                <cfquery name="LOCAL.qGetOutstandingListAPpPm" dbtype="query">
                    SELECT REVIEWER_userid FROM qGetCUrrentApproverPlanGen WHERE review_step > #val(qGetCurrStepApprover.review_step)# ORDER BY review_step
                </cfquery>
                <cfquery name="LOCAL.getNewDataReq"  datasource="#request.sdsn#"> 
                	SELECT status FROM TCLTREQUEST WHERE req_no  = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
                </cfquery>
                <cfquery name="LOCAL.qGetApprovedDataFromReq" datasource="#request.sdsn#">
                	UPDATE TCLTREQUEST SET approval_list = '#lstApproverOverride#' , approved_list = '#val(request.scookie.user.uid)#', 
                	    outstanding_list = '#ValueList(qGetOutstandingListAPpPm.REVIEWER_userid)#', 
                	    approval_position_list = '#lstPosidApproverOverride#' ,  approval_data = '#tempApprovalData#'
                	    <cfif requestfor NEQ REQUEST.SCookie.User.empid AND getNewDataReq.status EQ 1>
                	        ,status = 2
                	    </cfif>
    				WHERE UPPER(req_type) = 'PERFORMANCE.PLAN' AND req_no = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
    					AND company_id = <cfqueryparam value="#REQUEST.SCOOKIE.COID#" cfsqltype="cf_sql_integer">
    					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
                </cfquery>   
                <cfquery name="LOCAL.qUpdatePlanH" datasource="#request.sdsn#">
                	UPDATE TPMDPERFORMANCE_PLANH  SET review_step = '1' <!---Step yg revise selalu 1--->
    				WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
    					AND request_no = <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
    					AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar">
    					AND reviewer_empid = <cfqueryparam value="#REQUEST.SCookie.User.empid#" cfsqltype="cf_sql_varchar">
                </cfquery> 
    			<cfquery name="LOCAL.qUpdateRequestBefore" datasource="#request.sdsn#">
    				UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0, isfinal_requestno = 0 WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
    				and request_no <> <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
    				AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
    			</cfquery>
    		<cfelse>
    		    <cfset SUPER.Add(false,true)>
			</cfif>
			
        </cfif>
			<cfset local.lstNextApprover = ''>
			<cfset LOCAL.strckListApprover = GetApproverList(reqno=FORM.request_no,empid=FORM.empid,reqorder=FORM.reqformulaorder,varcoid=request.scookie.coid,varcocode=request.scookie.cocode)>
			<cfif  strckListApprover.status eq '3'>
				<cfset lstNextApprover = ''>
			<cfelseif  strckListApprover.status eq '0'>

			<cfelse>
				<cfif allowskipCompParam eq 'N'>
				  <cfset LOCAL.lstNextApprover = ListGetAt( strckListApprover.FULLLISTAPPROVER , val(FORM.UserInReviewStep)+1 )>
				<cfelse>      
					<cfset i=0>
					<cfloop list="#StrckListApprover.FULLLISTAPPROVER#" index="idxlist" delimiters=",">
					<cfset i=i+1>
						<cfif i gt FORM.UserInReviewStep>
							<cfset local.lstNextApprover = ListAppend(lstNextApprover,idxlist,",")> 
						</cfif>
					</cfloop>
				</cfif>  	    
			</cfif>
 	    <cfif flagrevs eq 1>
			<cfquery name="LOCAL.qUpdateRequestBefore" datasource="#request.sdsn#">
        		UPDATE TPMDPERFORMANCE_PLANH set isfinal = 0, isfinal_requestno = 0 WHERE form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar">
				and request_no <> <cfqueryparam value="#REQUEST_NO#" cfsqltype="cf_sql_varchar">
                AND company_code = <cfqueryparam value="#request.scookie.cocode#" cfsqltype="cf_sql_varchar">
        	</cfquery>
             <cfif strckListApprover.status eq '3'>
                <cfset local.tcode = 'PerformancePlanNotifFullyApproved'>
                <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
            <cfelse>
                <cfif ListLast(StrckListApprover.FULLLISTAPPROVER) eq lstNextApprover>
                    <cfset local.tcode = 'PerformancePlanSubmitToLastApprover'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
                <cfelse>
                    <cfset local.tcode = 'PerformancePlanSubmitByReviewee'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
                </cfif>
            </cfif>
        <cfelse>
            <cfif strckListApprover.status eq '3'>
                <cfset local.tcode = 'PerformancePlanNotifFullyApproved'>
                <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
            <cfelse>
                <cfif ListLast(StrckListApprover.FULLLISTAPPROVER) eq lstNextApprover>
                    <cfset local.tcode = 'PerformancePlanSubmitToLastApprover'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
                <cfelse>
                    <cfset local.tcode = 'PerformancePlanSubmitByReviewee'>
                    <cfset sendMail = objEnterpriseUser.sendMailPlan(template_code=tcode,request_no=FORM.request_no,nextapprover=lstNextApprover,reviewee_empid=FORM.empid)>
                </cfif>
            </cfif>
	    </cfif>
	</cffunction>

	<cffunction name="AddCustomPlan">
		<cfargument name="isReturn" type="boolean" required="No" default="false">
		<cfargument name="msgLang" type="boolean" required="No">
		<cfargument name="scDataForm" type="Struct" required="No">
		<cfparam name="strRequesterEmpId" default="#REQUEST.scookie.USER.EMPID#">
		<cfparam name="reqformulaorder" default="-">
		<cfparam name="structDataApproverOverride" default=StructNew()>
		<cfif not StructKeyExists(Arguments,"msgLang")>
			<cfset Arguments.msgLang=not Arguments.isReturn>
		</cfif>
		<cfset Arguments.msgLang=(REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO"?true:Arguments.msgLang)>
		<cfparam name="action" default="submit">
		<cfset LOCAL.isRequest=false>
		<cfset LOCAL.strAction=action/>
		<cfset LOCAL.strLog="">
		<cfset LOCAL.scReturn={result=true,errcode=0,message="",requestno=""}>
		<cfif StructKeyExists(Arguments,"scDataForm")>
			<cfset strckFormData = GetFormRequest(0,Arguments.scDataForm) />
		<cfelse>
			<cfset strckFormData = GetFormRequest(0) />
		</cfif>
		<cfif not StructKeyExists(strckFormData,"modified_date")>
			<cfset strckFormData["modified_date"] = Now()/>
		</cfif>
		<cfif not StructKeyExists(strckFormData,"modified_by")>
			<cfset strckFormData["modified_by"] = REQUEST.SCookie.User.uname />
		</cfif>
		<cfif not StructKeyExists(strckFormData,"created_date")>
			<cfset strckFormData["created_date"] = Now()/>
		</cfif>
		<cfif not StructKeyExists(strckFormData,"created_by")>
			<cfset strckFormData["created_by"] = REQUEST.SCookie.User.uname />
		</cfif>
		
		<cfset LOCAL.strRequestee = "">
		<cfif THIS.ObjectWorkflow eq "EMPLOYEE">
			<cfparam name="strRequesteeEmpId" default="">
			<cfparam name="emp_id" default="">
			<cfif len(THIS.ObjectApproval) and len(THIS.DocApproval)>
				<cfset isRequest=true>
				<cfif StructKeyExists(strckFormData,"requestfor")>
					<cfset strRequestee = strckFormData.requestfor>
				</cfif>
				<cfif StructKeyExists(strckFormData,"strRequesteeEmpId")>
					<cfset strRequestee = strckFormData.strRequesteeEmpId>
				</cfif>
				<cfif strRequestee eq "" and StructKeyExists(strckFormData,"empid")>
					<cfset strRequestee = strckFormData.empid>
				</cfif>
				<cfif strRequestee eq "" and StructKeyExists(strckFormData,"emp_id")>
					<cfset strRequestee = strckFormData.emp_id>
				</cfif>
				<cfif strRequestee eq "" and len(strRequesteeEmpId)>
					<cfset strRequestee = strRequesteeEmpId/>
				</cfif>
				<cfif not THIS.m_bIsTransaction>
					<cfif strRequestee eq "" and len(emp_id)>
						<cfset strRequestee = emp_id>
					</cfif>
				</cfif>
			</cfif>
			<cfif strRequestee eq "">
				<cfif StructKeyExists(strckFormData,"requestfor")>
					<cfset strRequestee = strckFormData.requestfor>
				</cfif>
				<cfif strRequestee eq "" and StructKeyExists(strckFormData,"emp_id")>
					<cfset strRequestee = strckFormData.emp_id>
				</cfif>
			</cfif>
			<cfif strRequestee eq "">
				<cfset strRequestee = REQUEST.scookie.USER.EMPID />
			</cfif>
		<cfelse>
			<cfif len(THIS.ObjectApproval) and len(THIS.DocApproval)>
				<cfset isRequest=true>
			</cfif>
			<cfset strRequestee = REQUEST.scookie.USER.EMPID />
		</cfif>
		<cfset LOCAL.isFormValid=ValidateForm(0, strckFormData)>
		<cfif IsStruct(isFormValid)>
			<cfset strckFormData = isFormValid>
			<cfif IsDefined("isFormValid.isvalid")>
				<cfif isFormValid.isvalid eq false and IsDefined("isFormValid.message")>
					<cfset scReturn.message = isFormValid.message>
					<cfset Arguments.msgLang=(scReturn.message neq ""?(IsDefined("isFormValid.msgmlangsts")?not isFormValid.msgmlangsts:false):Arguments.msgLang)>
				</cfif>
				<cfset isFormValid=isFormValid.isvalid>
			<cfelse>
				<cfset isFormValid=true>
			</cfif>
		</cfif>
		<cfset strLog=listAppend(strLog,isFormValid & "=" & isRequest)>
		<cfif isFormValid eq true>
			<cfset strckFormData = InitFormRequest(0, strckFormData) />
			<cfset bResult = true />
			 
			<cfif isRequest>
				<cfif REQUEST.Scookie.User.UTYPE eq 9>
					<cfif Not THIS.m_bIsTransaction><!---directly insert data--->
						<cfset isRequest=false>
						<cfset strKeyData = "" />
						<cfloop index="LOCAL.idxKeyField" list="#THIS.KeyField#">
							<cfif StructKeyExists(strckFormData, idxKeyField)>
								<cfset strKeyData = listAppend(strKeyData, idxKeyField & "=" & strckFormData[idxKeyField], "|") />
							<cfelseif IsDefined(idxKeyField)>
								<cfset strKeyData = listAppend(strKeyData, idxKeyField & "=" & evaluate('#idxKeyField#'), "|") />
							</cfif>
						</cfloop>
						<cfinvoke component="SF#THIS.ObjectName#" method="APPROVE" RequestData="#strckFormData#" RequestKey="#strKeyData#" RequestMode="0" returnVariable="LOCAL.retVar">
					<cfelse>
						<cfset scReturn.result=false>
						<cfset scReturn.errcode=1>
						<cfset scReturn.message="JSYou're not Authorized to make This Request">
						<cfif Arguments.msgLang>
							<cfset scReturn.message=TransMLang(scReturn.message,true)>
						</cfif>
						<cfif Arguments.isReturn>
							<cfreturn scReturn>
						<cfelse>
							<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
                            	<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
                            	<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
                            		<cfoutput>#URL.callback#(#json#)</cfoutput>
                            	<cfelse>
                            		<cfoutput>#json#</cfoutput>
                            	</cfif>
                            <cfelse>
    							<cfoutput>
    								<script type="text/javascript">
    									parent.sfalert("#scReturn.message#");
    								</script>
    							</cfoutput>
                            </cfif>
    						<cfreturn scReturn.result>
						</cfif>
					</cfif>
				<cfelse>
					<cfif not listFindNoCase(REQUEST.SCookie.validRequest, THIS.ObjectApproval)>
						<cfset scReturn.result=false>
						<cfset scReturn.errcode=2>
						<cfset scReturn.message="JSInvalid Request Approval Setting">
						<cfif Arguments.msgLang>
							<cfset scReturn.message=TransMLang(scReturn.message,true)>
						</cfif>
						<cfif Arguments.isReturn>
							<cfreturn scReturn>
						<cfelse>
							<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
                            	<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
                            	<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
                            		<cfoutput>#URL.callback#(#json#)</cfoutput>
                            	<cfelse>
                            		<cfoutput>#json#</cfoutput>
                            	</cfif>
                            <cfelse>
    							<cfoutput>
    								<script type="text/javascript">
    								 	<!---parent.sfalert("#scReturn.message#");--->
    									alert("#scReturn.message#");
    								</script>
    							</cfoutput>
                            </cfif>
                            <cfreturn scReturn.result>
						</cfif>
					</cfif>
					
					<cfif strRequesterEmpId neq strRequestee and ListFirst(THIS.ObjectApproval,".") eq 'EMPLOYEE'>
					<cf_sfqueryemp name="LOCAL.qchkEmp" datasource="#REQUEST.SDSN#" ACCESSCODE="hrm.employee">
						<cfoutput>
							SELECT emp_id FROM TEOMEMPPERSONAL WHERE emp_id = '#strRequestee#'
						</cfoutput>
					</cf_sfqueryemp>
					<cfif qchkEmp.recordcount eq 0 and ListFirst(THIS.ObjectApproval,".") eq 'EMPLOYEE'>
						<cfset scReturn.result=false>
						<cfset scReturn.errcode=12>
						<cfset scReturn.message="JSYou're not Authorized to make This Request">
						<cfif Arguments.msgLang>
							<cfset scReturn.message=TransMLang(scReturn.message,true)>
						</cfif>
						<cfif Arguments.isReturn>
							<cfreturn scReturn>
						<cfelse>
							<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
                            	<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
                            	<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
                            		<cfoutput>#URL.callback#(#json#)</cfoutput>
                            	<cfelse>
                            		<cfoutput>#json#</cfoutput>
                            	</cfif>
                            <cfelse>
    							<cfoutput>
    								<script type="text/javascript">
    									parent.sfalert("#scReturn.message#");
    								</script>
    							</cfoutput>
    							<cfreturn scReturn.result>
                            </cfif>
						</cfif>
					</cfif>
					</cfif>
					
					<cfset strckResultRequestApproval = StructNew() />
					<cfset strRequestApprovalCode = THIS.ObjectApproval />
					<cfif strAction eq "draft">
						<cfset strckResultRequestApproval.approver_list = '' />
						<cfset strckResultRequestApproval.isSelectableApprover = 0 />
						<cfif isDefined('strckFormData') AND StructKeyExists(strckFormData,"strSelectedSelectableApprover") AND len(strckFormData.strSelectedSelectableApprover) >
							<cfset strckResultRequestApproval.isSelectableApprover = 1 />
						</cfif>
					<cfelse>
						<cfset objRequestApproval = CreateObject("component", "SFRequestApproval").init(false) />
						<cfset strckResultRequestApproval = objRequestApproval.Generate(strRequestApprovalCode, strRequesterEmpId, strRequestee, reqformulaorder) />
					</cfif>
					<cfif isdefined('strckResultRequestApproval.APPROVER_LIST')>
					    <cfset strckResultRequestApproval.APPROVER_LIST = structDataApproverOverride.APPROVER_LIST>
					    <cfset strckResultRequestApproval.APVERPOS_LIST = structDataApproverOverride.APVERPOS_LIST>
					    <cfset strckResultRequestApproval.OUTSTAND_LIST = structDataApproverOverride.OUTSTAND_LIST>
					    <cfset strckResultRequestApproval.REQUIRED_LIST = structDataApproverOverride.REQUIRED_LIST>
					    <cfset strckResultRequestApproval.WDAPPROVAL = structDataApproverOverride.WDAPPROVAL>
					</cfif>
					<cfif ((isStruct(strckResultRequestApproval) 
							and (StructKeyExists(strckResultRequestApproval,"approver_list") 
									and !listlen(strckResultRequestApproval.approver_list) 
									or (StructIsEmpty(strckResultRequestApproval) 
										or !StructKeyExists(strckResultRequestApproval,"approver_list"))
							) 
						) or !isStruct(strckResultRequestApproval)) AND strAction neq "draft">
						<cfset scReturn.result=false>
						<cfset scReturn.errcode=(REQUEST.Scookie.User.UTYPE eq 9?1:3)>
						<cfset scReturn.message=(scReturn.errcode eq 1?"JSYou're not Authorized to make This Request":"JSWrong Request Approval Setting")>
						<cfif Arguments.msgLang>
							<cfset scReturn.message=TransMLang(scReturn.message,true)>
						</cfif>
						<cfif Arguments.isReturn>
							<cfreturn scReturn>
						<cfelse>
							<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
                            	<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
                            	<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
                            		<cfoutput>#URL.callback#(#json#)</cfoutput>
                            	<cfelse>
                            		<cfoutput>#json#</cfoutput>
                            	</cfif>
                            <cfelse>
    							<cfoutput>
    								<script type="text/javascript">
    								    <cfif scReturn.errcode eq 1>
    									    parent.sfalert("#scReturn.message#");
    									<cfelse>
    									    alert("#scReturn.message#");
    									</cfif>
    								</script>
    							</cfoutput>
                            </cfif>
                            <cfreturn scReturn.result>
						</cfif>
					<cfelseif strRequestee neq strRequesterEmpId and not ListFindNoCase(strckResultRequestApproval.approver_list, REQUEST.SCookie.User.uid) AND strAction neq "draft">
						<cfset scReturn.result=false>
						<cfset scReturn.errcode=1>
						<cfset scReturn.message="JSYou're not Authorized to make This Request">
						<cfif Arguments.msgLang>
							<cfset scReturn.message=TransMLang(scReturn.message,true)>
						</cfif>
						<cfif Arguments.isReturn>
							<cfreturn scReturn>
						<cfelse>
							<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
                            	<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
                            	<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
                            		<cfoutput>#URL.callback#(#json#)</cfoutput>
                            	<cfelse>
                            		<cfoutput>#json#</cfoutput>
                            	</cfif>
                            <cfelse>
    							<cfoutput>
    								<script type="text/javascript">
    									parent.sfalert("#scReturn.message#");
    									parent.popClose();
    								</script>
    							</cfoutput>
                            </cfif>
                            <cfreturn scReturn.result>
						</cfif>
					<cfelse>
						<cfset strRequestNo = Application.SFUtil.getCode(THIS.DocApproval, false) />
						<cfif len(trim(strRequestNo))>
    						<cfset strckFormData['request_no'] = strRequestNo />
    						<cfset iRequestMode = 0 />
    						<cfif THIS.m_bIsTransaction>
    							<cfset iRequestMode = 3 />
    						</cfif>
    						<cfif THIS.ReqNewFormat>
    							<cfset LOCAL.wddxFormData=SFReqFormat(strckFormData,"W")>
    						<cfelse>
        						<cfwddx action="CFML2WDDX" input="#strckFormData#" output="LOCAL.wddxFormData">
        					</cfif>
    						<cfset strKeyData = "" />
    					
    						<cfloop index="idxKeyField" list="#THIS.KeyField#">
    							<cfif StructKeyExists(strckFormData, idxKeyField)>
    								<cfset strKeyData = listAppend(strKeyData, idxKeyField & "=" & strckFormData[idxKeyField], "|") />
    							<cfelseif IsDefined(idxKeyField)>
    								<cfset strKeyData = listAppend(strKeyData, idxKeyField & "=" & evaluate('#idxKeyField#'), "|") />
    							</cfif>
    						</cfloop>
    					
    						<cfset arrParam = ArrayNew(1) />
    						<cfset ArrayAppend(arrParam, [THIS.ObjectWorkflow, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [REQUEST.SCookie.COID, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [REQUEST.SCookie.COCODE, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [ucase(THIS.ObjectApproval), "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [iRequestMode, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [strRequestNo, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [CreateODBCDateTime(Now()), "CF_SQL_TIMESTAMP"]) />
    						<cfset ArrayAppend(arrParam, [REQUEST.SCookie.User.uid, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [strRequestee, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [wddxFormData, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [strKeyData, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [0, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [0, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [0, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [strckResultRequestApproval.isSelectableApprover, "CF_SQL_INTEGER"]) />
    						<cfset ArrayAppend(arrParam, [CreateODBCDateTime(Now()), "CF_SQL_TIMESTAMP"]) />
    						<cfset ArrayAppend(arrParam, [REQUEST.SCookie.User.uname, "CF_SQL_VARCHAR"]) />
    						<cfset ArrayAppend(arrParam, [CreateODBCDateTime(Now()), "CF_SQL_TIMESTAMP"]) />
    						<cfset ArrayAppend(arrParam, [REQUEST.SCookie.User.uname, "CF_SQL_VARCHAR"]) />
    				
    						<cfsavecontent variable="LOCAL.sqlInsertRequest">
    							<cfoutput>
    								INSERT INTO TCLTRequest ( sfobject, company_id, company_code, req_type, req_mode, req_no, req_date, requester, reqemp, req_data, key_data, status, isexpired, isselectable_approver, approval_list, created_date, created_by, modified_date, modified_by )
    								VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    							</cfoutput>
    						</cfsavecontent>
    						
    						<cftransaction>
    							<cfset Application.SFDB.RunQuery(sqlInsertRequest, arrParam) />
    							<cfif THIS.m_bIsTransaction>
    								<cfset SaveTransaction(0, strckFormData) />
    							</cfif>
    						</cftransaction>
    						
    						<cfif strAction neq "draft">
    							<cfset bResult = ProcessRequest(strRequestNo, strckResultRequestApproval) />
    							<cfif IsStruct(bResult)>
    								<cfset scReturn.message = (IsDefined("bResult.message")?bResult.message:"")>
    								<cfset scReturn.result = (IsDefined("bResult.result")?bResult.result:true)>
    								<cfset Arguments.msgLang=(bResult.message neq "" and IsDefined("bResult.msgmlangsts") and bResult.result eq false ? not bResult.msgmlangsts:Arguments.msgLang)>
    								<cfset bResult=bResult.result>
    							</cfif>
    						</cfif>
    			
    						<cfset scReturn.requestno=strRequestNo>
						<cfelse>
						    <cfset bResult = false/>
					        <cfset scReturn.message="JSFailed Generate Request Number. Please Setting Document Numbering">
					    </cfif>
					</cfif>
				</cfif>
			<cfelse>
				<cfif THIS.m_bIsTransaction>
					<cfset SaveTransaction(0, strckFormData) />
				<cfelse>
					<cfif SetMObject()><!--- not IsSimpleValue(THIS.MObject) --->
						<cfset THIS.MObject.Insert(strckFormData) />
					<cfelse>
						<cfset Application.SFDB.Insert(THIS.ObjectTable, strckFormData) />
					</cfif>
				</cfif>
			</cfif>
			
			<cfif bResult>
				<cfset scReturn.confirm = TransMLang("JSDo You want to open Review Approver of This Request",true)>
				<cfif not isRequest>
					<cfset scReturn.message = "JSYou have successfully inserted a new record">
				<cfelseif bResult eq 3><!---last request status is fully approved 3--->
					<cfset scReturn.message = "JSYou have successfully inserted a new record, Your Request is Complete">
				<cfelseif strAction eq "draft">
					<cfset scReturn.message = "JSSuccessfully Save Request as Draft">
				<cfelseif strAction eq "sendtoapprover">
					<cfset scReturn.message = "JSSuccessfully Send Request to Approver">
				<cfelse>
					<cfset scReturn.message = "JSSuccessfully Create New Request">
				</cfif>
				<cfset scReturn.result=true>
				<cfset scReturn.errcode=0>
			<cfelse>
				<cfset scReturn.result=false>
				<cfset scReturn.errcode=6>
				<cfif scReturn.message eq "">
					<cfset scReturn.message="JSRequest is failed">
					<cfset Arguments.msgLang=not Arguments.isReturn>
				</cfif>
			</cfif>
			<cfif Arguments.msgLang>
				<cfset scReturn.message=TransMLang(scReturn.message,true)>
			</cfif>
			<cfif Arguments.isReturn>
				<cfreturn scReturn>
			<cfelse>
				<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
					<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#","req_no":"#scReturn.requestno#"}'>
					<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
						<cfoutput>#URL.callback#(#json#)</cfoutput>
					<cfelse>
						<cfoutput>#json#</cfoutput>
					</cfif>
				<cfelse>
					<cfoutput>
						<script>
							<cfif isRequest and strAction neq "draft" and scReturn.requestno neq "" and bResult>
								if (confirm("#scReturn.message# \n#scReturn.confirm#?")) {
									parent.popWindow("?ofid=#THIS.ObjectName#.PreviewReviewApprover&reqno=#scReturn.requestno#", "popWinViewAppr", 700, 600, "scrollbars=yes,resizable=yes");
								}
							<cfelse>
								parent.sfalert("#scReturn.message#");	
							</cfif>
							parent.refreshPage();
							if (parent.opener) parent.opener.refreshPage();	
							parent.popClose();
						</script>
					</cfoutput>
				</cfif>
				<cfreturn scReturn.result>
			</cfif>
		<cfelse>
			<cfset scReturn.result=false>
			<cfset scReturn.errcode=5>
			<cfif Arguments.msgLang and scReturn.message neq "">
				<cfset scReturn.message=TransMLang(scReturn.message,true)>
			</cfif>
		</cfif>
		<cfif Arguments.isReturn>
			<cfreturn scReturn>
		<cfelse>
			<cfif REQUEST.SCOOKIE.MODE eq "mobileapps" OR REQUEST.SCOOKIE.MODE eq "SFGO">
				<cfset LOCAL.json = '{"success":#scReturn.result#,"islog":false,"result":"#scReturn.message#"}'>
				<cfif cgi.request_method eq "get" and isdefined("URL.callback")>
					<cfoutput>#URL.callback#(#json#)</cfoutput>
				<cfelse>
					<cfoutput>#json#</cfoutput>
				</cfif>
			<cfelse>
				<cfif scReturn.message neq "">
					<cfoutput>
						<script type="text/javascript">
							alert("#scReturn.message#");
						</script>
					</cfoutput>
				</cfif>
				<cfreturn scReturn.result>
			</cfif>
		</cfif>
	</cffunction>
    
    <cffunction name="GetApproverListGD">
        <cfset local.lstBtnToShow = "0">
        <cfset local.reqno = FORM.reqno>
        <cfset local.empid = FORM.empid>
        <cfset local.formno = FORM.formno>
        <cfset local.periodcode = FORM.periodcode>
        <cfset local.flagDraftStuck = 0>
        <cfset local.plandatevalid = 1> <!---hardcode--->
		<cfset LOCAL.objEnterprise = CreateObject("component", "SFEnterpriseUser") />
		<cfset REQUEST.SHOWCOLUMNGENERATEPERIOD = objEnterprise.CheckCompanyParamForPerformance()>
        <cftry> 
            <cfset funcAuth=REQUEST.SFSec.AuthAccess(acscode="hrm.performance.evalform",acslist="hrm.performance.evalform.trainingplan:edit,hrm.performance.evalform.devplan:edit,hrm.performance.evalform.careerplan:edit,hrm.performance.evalform.boxanalysis:edit,hrm.performance.evalform.successionplan:edit",isReturn=true)>
            <cfloop collection=#funcAuth# item="key">
                <cfif funcAuth[key]>
                    <cfset local.showPlanningTab = true>
                    <cfbreak>
                </cfif>
            </cfloop>
        <cfcatch> 
        	 <cfset LOCAL.jsonReturn = structNew()>  
            <cfset jsonReturn['message']="List Button Performance Planning">
    		<cfset jsonReturn['lstBtnToShow']= lstBtnToShow>
    		<cfreturn deserializeJSON(SerializeJSON(jsonReturn,"struct"))/>
        </cfcatch> 
        </cftry>
        
        <cfset local.qEmpInfo = getEmpDetail(empid=empid)>
        <cfset local.qListPlanDate = getRevisionDetail(periodcode=periodcode)> 
        <cfif REQUEST.SHOWCOLUMNGENERATEPERIOD EQ true>
            <cfset local.reqorder = "-">
        <cfelse>
            <cfset local.reqorder = getApprovalOrder(reviewee=empid,reviewer=request.scookie.user.empid)>
        </cfif>
        <cfset LOCAL.strckListApprover = GetApproverList(reqno=reqno,empid=empid,reqorder=reqorder,varcoid=FORM.varcoid,varcocode=FORM.varcocode)>
        <cfquery name="local.qCheckPlanHPerReviewer" datasource="#REQUEST.SDSN#" >
        	SELECT head_status from TPMDPERFORMANCE_PLANH where reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
        	AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar"> AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar"> AND reviewer_empid = <cfqueryparam value="#REQUEST.SCOOKIE.USER.EMPID#" cfsqltype="cf_sql_varchar">
        	<cfif formno neq ""> and form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
        	<cfif reqno neq ""> and request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
        </cfquery>
		<cfquery name="local.qCheckSelf" datasource="#REQUEST.SDSN#" >
			SELECT form_no,head_status from TPMDPERFORMANCE_PLANH where reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
			AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar"> AND company_code = <cfqueryparam value="#REQUEST.SCOOKIE.COCODE#" cfsqltype="cf_sql_varchar"> AND reviewer_empid = reviewee_empid
			<cfif formno neq ""> and form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
        	<cfif reqno neq ""> and request_no = <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
		</cfquery>
		<cfquery name="local.qCheckSelfFinal" datasource="#REQUEST.SDSN#">
			SELECT TPMDPERFORMANCE_PLANH.request_no, TCLTREQUEST.created_date requestcreated_date
			FROM TPMDPERFORMANCE_PLANH LEFT JOIN TCLTREQUEST ON TCLTREQUEST.req_no = TPMDPERFORMANCE_PLANH.request_no
			WHERE TPMDPERFORMANCE_PLANH.isfinal = 1 AND TPMDPERFORMANCE_PLANH.isfinal_requestno = 1 AND TPMDPERFORMANCE_PLANH.company_code = '#REQUEST.SCOOKIE.COCODE#'
		</cfquery>
		<cfquery name="local.qCheckOtherNewRequest" datasource="#REQUEST.SDSN#">
			SELECT distinct  TPMDPERFORMANCE_PLANH.request_no  FROM TPMDPERFORMANCE_PLANH 
			LEFT JOIN TCLTREQUEST ON TCLTREQUEST.req_no = TPMDPERFORMANCE_PLANH.request_no
			WHERE TCLTREQUEST.created_date >= <cfqueryparam value="#qCheckSelfFinal.requestcreated_date#" cfsqltype="cf_sql_timestamp">
			<cfif formno neq ""> and TPMDPERFORMANCE_PLANH.form_no = <cfqueryparam value="#formno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
			<cfif reqno neq ""> and TPMDPERFORMANCE_PLANH.request_no <> <cfqueryparam value="#reqno#" cfsqltype="cf_sql_varchar"><cfelse>and 1=0</cfif>
		</cfquery>
        <cfquery name="local.qGetEval" datasource="#request.sdsn#">
    		SELECT form_no FROM TPMDPERFORMANCE_EVALH WHERE reviewee_empid = <cfqueryparam value="#empid#" cfsqltype="cf_sql_varchar">
    		AND period_code = <cfqueryparam value="#periodcode#" cfsqltype="cf_sql_varchar"> AND company_code = <cfqueryparam value="#varcocode#" cfsqltype="cf_sql_varchar"> AND reviewee_posid = <cfqueryparam value="#qEmpInfo.posid#" cfsqltype="cf_sql_integer"> 
    	</cfquery>
    	<cfif qGetEval.recordcount><cfset local.evalstat = 'yes'><cfelse><cfset local.evalstat = 'no'></cfif>
    	
    	<cfif qCheckPlanHPerReviewer.head_status eq 0 AND listfindnocase("2,3,9",strckListApprover.status) AND strckListApprover.APPROVERBEFORE_HEADSTATUS neq "1">
        	<cfset local.flagDraftStuck = 1>
        </cfif>
        
        <cfif len(reqno)>
			<cfif REQUEST.SHOWCOLUMNGENERATEPERIOD eq true> 
			    <cfif flagDraftStuck eq 1>
    			   <cfset local.lstBtnToShow = "0,1,8">
    			<cfelse>
    			    <cfswitch expression="#StrckListApprover.status#"> 
    			        <cfcase value="0">
    						<cfif StrckListApprover.lastapprover eq REQUEST.SCOOKIE.USER.EMPID>
    							<cfset lstBtnToShow = "0,5,6,8">
    						</cfif>
    					</cfcase>
    					
    					<cfcase value="1">
    						<cfif qCheckSelf.recordcount eq 0 >
    							<cfif qCheckPlanHPerReviewer.recordcount gt 0>
    								<cfif qCheckPlanHPerReviewer.head_status eq '0'>
    									<cfset lstBtnToShow = "0,1,3,4,8">
    								</cfif>
    							<cfelse>
    								<cfset lstBtnToShow = "0,3,4,8">
    							</cfif>
    						<cfelse>
    							<cfif qCheckPlanHPerReviewer.recordcount gt 0>
    								<cfif qCheckPlanHPerReviewer.head_status eq '0' AND qCheckSelf.head_status eq 1>
    									<cfset lstBtnToShow = "0,1,2,3,4,8">
                                    <cfelseif qCheckPlanHPerReviewer.head_status eq 1 AND qCheckSelf.head_status eq 1> 
        							    <cfset lstBtnToShow = "0">
    								<cfelse>
    									<cfif qCheckPlanHPerReviewer.head_status neq 1>
    										<cfset lstBtnToShow = "0,1,3,4,8">
    									<cfelse>
    										<cfset lstBtnToShow = "0">
    									</cfif>
    								</cfif>
    							<cfelse>
    								<cfif strckListApprover.lastapprover eq "">
    									<cfset lstBtnToShow = "0,3,4,8">
    								<cfelse>
    									<cfset lstBtnToShow = "0,2,3,4,8">
    								</cfif>
    							</cfif>
    						</cfif>
    					</cfcase>
    					
    					<cfcase value="2">
        					<cfset local.yesIsApprover = 0>
        					<cfloop list="#StrckListApprover.FullListApprover#" delimiters="," index="idxLoop">
        						<cfif Listfindnocase(idxLoop,request.scookie.user.empid,"|") gt 0>
        							<cfset yesIsApprover = 1>
        						<cfelseif idxLoop eq request.scookie.user.empid>
        							<cfset yesIsApprover = 1>
        						</cfif>
        					</cfloop>
        					
        					<cfif StrckListApprover.approver_headstatus eq 1 or (not listfindnocase(StrckListApprover.LstApprover,request.scookie.user.empid) AND yesIsApprover eq 0)>
        						<cfset lstBtnToShow = "0">
        					<cfelse>
        						<cfset lstBtnToShow = "0,3,4,8">
        						<cfif StrckListApprover.approverbefore_headstatus and not listfindnocase(listfirst(StrckListApprover.FullListApprover),request.scookie.user.empid,"|")>
        						    <cfset lstBtnToShow = "0,2,3,4,8"> 
        						</cfif>
        					</cfif>
    					</cfcase>
					    
					    <cfcase value="3">
    					    <cfset local.is_alreadyhavenewrequest = 'N'>
    					    <cfif qCheckSelfFinal.recordcount neq 0>
        					    <cfif qCheckOtherNewRequest.recordcount neq 0>
            					    <cfset is_alreadyhavenewrequest = 'Y'>
        					    </cfif>
        					<cfelse>
        					    <cfset is_alreadyhavenewrequest = 'Y'>
    					    </cfif>
    					    <cfif is_alreadyhavenewrequest eq 'Y'>
    						    <cfset lstBtnToShow = "0">
    						 <cfelse>
    						    <cfset lstBtnToShow = "0,5,6,8">
    						 </cfif>
    					</cfcase>
    					
    					<cfcase value="4">
    						<cfset local.newlistrevise = StrckListApprover.REVISE_LIST_APPROVER>
    						<cfset local.delmulaidari = ListFindNoCase(StrckListApprover.REVISE_LIST_APPROVER,StrckListApprover.LASTAPPROVER,",")>
    						<cfif delmulaidari gt 0 AND val(delmulaidari-1) gt 1 >
    						    <cfset local.tempDelTo = val(listlen(StrckListApprover.REVISE_LIST_APPROVER) - delmulaidari)> 
    							<cfloop from="#delmulaidari#" to="#val(delmulaidari+tempDelTo)#" index="idxdel">
    								<cfset newlistrevise = ListDeleteAt(newlistrevise, "#idxdel#",",")>
    							</cfloop>
    						<cfelse>
    							<cfset newlistrevise = ListDeleteAt(newlistrevise, "#delmulaidari#",",")>
    						</cfif>
    						
    						<cfif ListLen(ListLast(newlistrevise,','),'|') eq 1>
    							<cfif REQUEST.SCOOKIE.USER.EMPID eq ListLast(newlistrevise)>
    									<cfif REQUEST.SCOOKIE.USER.EMPID neq empid>
    										<cfif qCheckSelf.recordcount gt 0>
    											<cfset lstBtnToShow = "0,2,3,4,8">
    										<cfelse>
    											<cfset lstBtnToShow = "0,3,4,8">
    										</cfif>
    										
    									<cfelse>
    										<cfset lstBtnToShow = "0,3,4,8">
    									</cfif>
    							</cfif>
    						<cfelse>
    							<cfloop list="#ListLast(newlistrevise,',')#" delimiters="|" index="idxRevise">
    								<cfif REQUEST.SCOOKIE.USER.EMPID eq idxRevise>
    									<cfif idxRevise neq empid>
    										<cfif qCheckSelf.recordcount gt 0>
    											<cfset lstBtnToShow = "0,2,3,4,8">
    										<cfelse>
    											<cfset lstBtnToShow = "0,3,4,8">
    										</cfif>
    									<cfelse>
    										<cfset lstBtnToShow = "0,3,4,8">
    									</cfif>
    								</cfif>
    							</cfloop>
    						</cfif>
    					</cfcase>
    					
    					<cfcase value="9">
    					    <cfset local.is_alreadyhavenewrequest = 'N'>
    					    <cfif qCheckSelfFinal.recordcount neq 0>
        					    <cfif qCheckOtherNewRequest.recordcount neq 0>
            					    <cfset is_alreadyhavenewrequest = 'Y'>
        					    </cfif>
        					<cfelse>
        					    <cfset is_alreadyhavenewrequest = 'Y'>
    					    </cfif>
    					    <cfif is_alreadyhavenewrequest eq 'Y'>
    						    <cfset lstBtnToShow = "0">
    						 <cfelse>
    						    <cfset lstBtnToShow = "0,5,6,8">
    						 </cfif>
    						 
    					</cfcase>
    					<cfdefaultcase>
    						<cfset lstBtnToShow = "0">
    					</cfdefaultcase> 
    			    </cfswitch>
    			</cfif>
    		<cfelse>
    		    <!--- set display button for case :  system not using pre-generate reviewer ---->
    			<cfif flagDraftStuck eq 1>
    				<cfset lstBtnToShow = "0,1,8">
    			<cfelse>
    			    <cfswitch expression="#StrckListApprover.status#">
    			        <cfcase value="0">
                          <cfif StrckListApprover.approver_headstatus eq 1>
                            <cfset lstBtnToShow = "0">
                          <cfelseif listfindnocase(listlast(StrckListApprover.FullListApprover),request.scookie.user.empid,"|")>
                            <cfset lstBtnToShow = "0,1,3,4,8">
                          <cfelseif StrckListApprover.approver_headstatus eq 0>
                            <cfset lstBtnToShow = "0,1,3,4,8">
                          <cfelse>
                            <cfset lstBtnToShow = "0,1,3,4,8">
                          </cfif>
                        </cfcase>
                        
                        <cfcase value="1">
                          <cfif qCheckSelf.recordcount eq 0 >
                            <cfif qCheckPlanHPerReviewer.recordcount gt 0>
                              <cfif qCheckPlanHPerReviewer.head_status eq '0'>
                                <cfset lstBtnToShow = "0,1,3,4,8">
                              </cfif>
                            <cfelse>
                              <cfset lstBtnToShow = "0,3,4,8">
                            </cfif>
                          <cfelse>
                            <cfif qCheckPlanHPerReviewer.recordcount gt 0>
                              <cfif qCheckPlanHPerReviewer.head_status eq '0' AND qCheckSelf.head_status eq 1>
                                <cfset lstBtnToShow = "0,1,2,3,4,8">
                              <cfelseif qCheckPlanHPerReviewer.head_status eq 1 AND qCheckSelf.head_status eq 1>
                                    <cfset lstBtnToShow = "0">
                              <cfelse>
                                <cfif qCheckPlanHPerReviewer.head_status neq 1>
                                  <cfset lstBtnToShow = "0,1,3,4,8">
                                <cfelse>
                                  <cfset lstBtnToShow = "0">
                                </cfif>
                              </cfif>
                            <cfelse>
                              <cfif strckListApprover.lastapprover eq "">
                                <cfset lstBtnToShow = "0,3,4,8">
                              <cfelse>
                                <cfset lstBtnToShow = "0,2,3,4,8">
                              </cfif>
                            </cfif>
                          </cfif>
                        </cfcase>
                        
                        <cfcase value="2">
                          <cfset local.yesIsApprover = 0>
                          <cfloop list="#StrckListApprover.FullListApprover#" delimiters="," index="idxLoop">
                            <cfif Listfindnocase(idxLoop,request.scookie.user.empid,"|") gt 0>
                              <cfset yesIsApprover = 1>
                            <cfelseif idxLoop eq request.scookie.user.empid>
                              <cfset yesIsApprover = 1>
                            </cfif>
                          </cfloop>
                          <cfif StrckListApprover.approver_headstatus eq 1 or (not listfindnocase(StrckListApprover.LstApprover,request.scookie.user.empid) AND yesIsApprover eq 0)>
                            <cfset lstBtnToShow = "0">
                          <cfelse>
                            <cfset lstBtnToShow = "0,3,4,8">
                            <cfif StrckListApprover.approverbefore_headstatus and not listfindnocase(listfirst(StrckListApprover.FullListApprover),request.scookie.user.empid,"|")>
                                <cfset lstBtnToShow = "0,2,3,4,8">
                            </cfif>
                          </cfif>
                        </cfcase>
                        
                        <cfcase value="3">
                          <cfset local.is_alreadyhavenewrequest = 'N'>
                          <cfif qCheckSelfFinal.recordcount neq 0>
                              <cfif qCheckOtherNewRequest.recordcount neq 0>
                                  <cfset is_alreadyhavenewrequest = 'Y'>
                              </cfif>
                          <cfelse>
                              <cfset is_alreadyhavenewrequest = 'Y'>
                          </cfif>
                          <cfif is_alreadyhavenewrequest eq 'Y'>
                            <cfset lstBtnToShow = "0">
                          <cfelse>
                            <cfset lstBtnToShow = "0,5,6,8">
                          </cfif>
                        </cfcase>
                        <cfcase value="4">
                          <cfset local.newlistrevise = StrckListApprover.REVISE_LIST_APPROVER>
                          <cfset local.delmulaidari = ListFindNoCase(StrckListApprover.REVISE_LIST_APPROVER,StrckListApprover.LASTAPPROVER,",")>
                          <cfif delmulaidari gt 0 AND val(delmulaidari-1) gt 1 >
                              <cfset local.tempDelTo = val(listlen(StrckListApprover.REVISE_LIST_APPROVER) - delmulaidari)> 
                            <cfloop from="#delmulaidari#" to="#val(delmulaidari+tempDelTo)#" index="idxdel">
                              <cfset newlistrevise = ListDeleteAt(newlistrevise, "#idxdel#",",")>
                            </cfloop>
                          <cfelse>
                            <cfset newlistrevise = ListDeleteAt(newlistrevise, "#delmulaidari#",",")>
                          </cfif>
                          <cfset local.varCheckSelfOnReviseList = ListFindNoCase(newlistrevise,REQUEST.SCOOKIE.USER.EMPID) >
                          <cfif varCheckSelfOnReviseList eq 1>
                              <cfset lstBtnToShow = "0,3,4,8">
                          <cfelse>
                              <cfif ListLen(ListLast(newlistrevise,','),'|') eq 1>
                                <cfif REQUEST.SCOOKIE.USER.EMPID eq ListLast(newlistrevise)>
                                    <cfif REQUEST.SCOOKIE.USER.EMPID neq empid>
                                      <cfif qCheckSelf.recordcount gt 0>
                                        <cfset lstBtnToShow = "0,2,3,4,8">
                                      <cfelse>
                                        <cfset lstBtnToShow = "0,3,4,8">
                                      </cfif>
                                    <cfelse>
                                      <cfset lstBtnToShow = "0,3,4,8">
                                    </cfif>
                                </cfif>
                              <cfelse>
                                  <cfloop list="#ListLast(newlistrevise,',')#" delimiters="|" index="idxRevise">
                                    <cfif REQUEST.SCOOKIE.USER.EMPID eq idxRevise>
                                      <cfif idxRevise neq empid>
                                        <cfif qCheckSelf.recordcount gt 0>
                                          <cfset lstBtnToShow = "0,2,3,4,8">
                                        <cfelse>
                                          <cfset lstBtnToShow = "0,3,4,8">
                                        </cfif>
                                      <cfelse>
                                        <cfset lstBtnToShow = "0,3,4,8">
                                      </cfif>
                                    </cfif>
                                  </cfloop>
                              </cfif>
                          </cfif>
                        </cfcase>
                        <cfcase value="9">
                          <cfset local.is_alreadyhavenewrequest = 'N'>
                          <cfif qCheckSelfFinal.recordcount neq 0>
                              <cfif qCheckOtherNewRequest.recordcount neq 0>
                                  <cfset is_alreadyhavenewrequest = 'Y'>
                              </cfif>
                          <cfelse>
                              <cfset is_alreadyhavenewrequest = 'Y'>
                          </cfif>
                          <cfif is_alreadyhavenewrequest eq 'Y'>
                            <cfset lstBtnToShow = "0">
                          <cfelse>
                            <cfset lstBtnToShow = "0,5,6,8">
                          </cfif>
                        </cfcase>
        			    <cfdefaultcase>
                            <cfset lstBtnToShow = "0">
                        </cfdefaultcase> 
                    </cfswitch>
    			</cfif>
			</cfif>
        <cfelseif not len(periodcode)>
        	<cfset lstBtnToShow = "0">
        <cfelseif listlast(StrckListApprover.FullListApprover) eq request.scookie.user.empid>
            <cfset lstBtnToShow = "0,3,4,8">
        <cfelse>
            <cfset lstBtnToShow = "0,3,4,8">
        </cfif>
    	<cfif plandatevalid eq '0'>
			<cfset local.qChkPeriodData = objEnterpriseUser.getPlanStartEndDate(periodcode=periodcode)>
    		<cfif qChkPeriodData.recordcount gt 0 AND qChkPeriodData.plan_startdate neq "">
    			<cfset local.planstrtdt = DateFormat(qChkPeriodData.plan_startdate)>
    			<cfset local.planenddt = DateFormat(qChkPeriodData.plan_enddate)>
    			<cfset local.harini = DateFormat(Now())>
    			<cfset local.dayafterstart = DateDiff('d', planstrtdt, harini)>
    			<cfset local.daybeforeend = DateDiff('d', harini, planenddt)>
    			<cfif dayafterstart lt 0 OR daybeforeend lt 0>
    				<cfset lstBtnToShow = "0">
    			</cfif>
    			<cfif (DateDiff("d", qChkPeriodData.plan_enddate, Now()) gt 0 OR DateDiff("d", qChkPeriodData.plan_startdate, Now()) lt 0)>
    				<cfset lstBtnToShow = "0">
    			</cfif>
    		<cfelse>
    			<cfset lstBtnToShow = "0">
    		</cfif>
    	</cfif>	
    	<cfif evalstat eq 'yes'>
    	   <cfset lstBtnToShow = "0">
    	</cfif>
        <cfset LOCAL.jsonReturn = structNew()>  
        <cfset jsonReturn['message']="List Button Performance Planning">
		<cfset jsonReturn['lstBtnToShow']= lstBtnToShow>
		<cfset jsonReturn['objListApprover']= StrckListApprover>
		<cfreturn deserializeJSON(SerializeJSON(jsonReturn,"struct"))/>
    </cffunction>
	
    <cffunction name="filterPerfPeriodPlanning">
		<cfparam name="search" default="">
		<cfparam name="getval" default="id">
		<cfset LOCAL.searchText=trim(search)>
		<cfset LOCAL.valfield=IIF(getval eq "id","'nval'","'ntitle'")>
		<cfquery name="LOCAL.qLookUp" datasource="#REQUEST.SDSN#">
				SELECT DISTINCT P.period_code AS nval, P.period_name_#request.scookie.lang# AS ntitle
	            FROM TPMMPERIOD P  INNER JOIN TEOMCOMPANY C ON C.company_code = P.company_code WHERE 1=1 AND C.COMPANY_ID='#REQUEST.SCookie.COID#'
	    			<cfif searchText neq "???">
						AND ( #Application.SFUtil.DBConcat(["P.period_name_#request.scookie.lang#","' ['","c.company_name","']'"])#
						LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
						OR P.period_code LIKE <cfqueryparam value="%#searchText#%" cfsqltype="CF_SQL_VARCHAR">
						)
					</cfif>
				AND P.period_code in ( select distinct period_code from tpmdperiodcomponent where 
				    ( UPPER(component_code) = 'PERSKPI' OR UPPER(component_code) = 'ORGKPI' ) and company_code ='#REQUEST.SCookie.COCODE#'
				) ORDER BY ntitle
		</cfquery>
		<cfset LOCAL.valfield=IIF(getval eq "id","'period_code'","'period_name_#request.scookie.lang#'")>
		<cfset Application.SFLookUp.tipLookUp(qLookup,"Parent Code",valfield,"ntitle","ntitle",false,searchText,"onPeriodChange")>
	</cffunction>
	
	
	
</cfcomponent>










