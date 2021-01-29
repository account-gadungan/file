<cfcomponent displayname="sfchangeslogreport" hint="SunFish Report Business Process Object">
<!--- ENC51115-79879 : Payroll Data Changes Log Report--->
	<cfsetting showdebugoutput="yes">    
	<cfoutput>
		<cffunction name="filterEmpReportTech">
		<cfparam name="search" default="">
			<cfparam name="nrow" default="50">
			<cfparam name="member" default="">
			<cfparam name="company" default="#REQUEST.SCookie.COID#">
			<cfparam name="startdate" default="#CREATEDATE(year(now()),month(now()),1)#">
			<cfparam name="enddate" default="#CREATEDATE(year(now()),month(now()),daysinmonth(now()))#">
			<cfif len(trim(startdate)) eq 0>
			    <cfset startdate="#CREATEDATE(year(now()),month(now()),1)#">
			</cfif>
			<cfif len(trim(enddate)) eq 0>
			    <cfset enddate = #CREATEDATE(year(now()),month(now()),daysinmonth(now()))#>
			</cfif>
			<cfset startdate = #CREATEODBCDATETIME(startdate)#>
			<cfset enddate = dateadd("d",1,"#enddate#")>
			<!---filter employee--->
			<cfparam name="ftpass" default="">
			<cfset lstparams="dept,work_loc,cost_center,job_status,job_grade,emp_pos,emp_status,gender,marital,religion,work_status">
			<cfif ftpass neq "" AND IsJSON(ftpass)>
				<cfset params=DeserializeJSON(ftpass)><!---cf_sfwritelog dump="params" prefix="FORM[2]"--->
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
			
			<cfset LOCAL.searchText=trim(search)>
			<cfset LOCAL.lsGender="Female,Male">
			<cfset LOCAL.lsMarital="Single,Married,Widow,Widower,Divorce">
			<cfset LOCAL.EmpLANG=Application.SFParser.TransMLang(listAppend(lsMarital,lsGender),false,",")>
			<cfset LOCAL.searchText=trim(search)>
			
			<cfoutput>
				<cf_sfqueryemp name="LOCAL.qData" datasource="#REQUEST.SDSN#" maxrows="#nrow#" ACCESSCODE="hrm.payroll">
					SELECT DISTINCT E.full_name as emp_name,E.emp_id, EC.emp_no,EC.status active,EC.end_date,
                    EG.terminate_date,EC.company_id company_id
                    FROM TEOMEMPPERSONAL E 
                    JOIN TCLLMLOGACTIVITY P ON P.data_id = E.emp_id
                    LEFT JOIN TEODEMPCOMPANY EC ON E.emp_id=EC.emp_id
                    LEFT JOIN TEODEmpPersonal EP ON E.emp_id = EP.emp_id
                    LEFT JOIN TEODEMPCOMPANYGROUP EG ON EG.emp_id = E.emp_id
                    INNER JOIN TEOMPOSITION POS
                    ON EC.position_id=POS.position_id AND POS.company_id=EC.company_id
                    LEFT JOIN TEOMPOSITION DEPT
                    ON POS.dept_id=DEPT.position_id AND DEPT.company_id=POS.company_id 
                    WHERE EC.company_id =  <cf_sfqparamemp value="#company#" CFSQLType="CF_SQL_INTEGER">
                    AND P.table_name IN ('TPYDEMPSALARYPARAM','TPYDEMPBANKPERIOD','TPYREMPPAYPERIOD','TPYDEMPALLOWDEDUCT')
                    AND (P.modified_date >= #startdate# AND P.modified_date <= #enddate#)
                   	<cfif len(searchText)>
                        AND ( E.full_name LIKE
                        <cf_sfqparamemp value="%#searchText#%" CFSQLType="CF_SQL_VARCHAR">
                        OR   EC.emp_no LIKE <cf_sfqparamemp value="%#searchText#%" CFSQLType="CF_SQL_VARCHAR">)
                    </cfif>
					<cfif len(member)>
						AND E.emp_id NOT IN (<cf_sfqparamemp value="#member#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
					</cfif>
					
					<!---Filter:Employee_Information--->
					<cfif ftpass neq "" AND IsJSON(ftpass)>
					    <cfif isdefined("work_status") AND work_status neq '3'> <!--- add work status: BUG50315-39130 --->
							<cfif work_status eq '1'>
                            	AND (EC.end_date >= #CreateODBCDate(Now())# OR EC.end_date IS  NULL)
                            <cfelse>
                            	AND (EC.end_date is not null AND EC.end_date < #createODBCDate(now())#)
                            </cfif>
						</cfif>
						<cfif isdefined("dept") AND len(dept)>
							AND Dept.position_id IN (<cf_sfqparamemp value="#dept#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("work_loc") AND len(work_loc)>
							AND EC.work_location_code = <cf_sfqparamemp value="#work_loc#" CFSQLType="CF_SQL_VARCHAR">
						</cfif>
						<cfif isdefined("cost_center") AND len(cost_center)>
							AND EC.cost_code IN (<cf_sfqparamemp value="#cost_center#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_status") AND len(job_status)>
							AND EC.job_status_code IN (<cf_sfqparamemp value="#job_status#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif isdefined("job_grade") AND len(job_grade)>
							AND EC.grade_code IN (<cf_sfqparamemp value="#job_grade#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_pos)>
							AND EC.position_id IN (<cf_sfqparamemp value="#emp_pos#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<cfif len(emp_status)>
							AND B.employ_code IN (<cf_sfqparamemp value="#emp_status#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
						<!---Personal_Information--->
						<cfif len(gender) and gender neq "2">
							#APPLICATION.SFUtil.getLookupQueryPart("gender",gender,"0=Female|1=Male",0,"AND")#
						</cfif>
						<cfif len(marital)>
							AND EP.maritalstatus = <cf_sfqparamemp value="#marital#" CFSQLType="CF_SQL_NUMERIC">
						</cfif>
						<cfif len(religion)>
							AND EP.religion_code IN (<cf_sfqparamemp value="#religion#" CFSQLType="CF_SQL_VARCHAR" list="Yes">)
						</cfif>
					<cfelse>
					    AND (EC.end_date > #createODBCDate(now())# OR EC.end_date is null)
					</cfif>
					ORDER BY emp_name, active DESC 
				</cf_sfqueryemp>
				<!---<cf_sfwritelog dump="qData" ext="html" prefix="_changeslogreport">--->
			</cfoutput>
            <cfset LOCAL.SFLANG=Application.SFParser.TransMLang("JSEmployee",true,"+")>
			<cfset LOCAL.vResult="">
			<cfloop query="qData">
				<cfset vResult=vResult & "
				arrEntryList[#currentrow-1#]=""#JSStringFormat(emp_id & "=" & emp_name & "(#emp_no#)")#"";" 
				& "arrEmpStat[#currentrow-1#]=""#JSStringFormat(active)#"";"
				& "arrEnddt[#currentrow-1#]=""#DateFormat(end_date,"d/m/yyyy")#"";"
				& "arrTermdt[#currentrow-1#]=""#DateFormat(terminate_date,"d/m/yyyy")#"";"
				& "arrCompid[#currentrow-1#]=""#(company_id)#"";"
				& "arrEmpid[#currentrow-1#]=""#(emp_id)#"";"
				& "arrNamval[#currentrow-1#]=""#(emp_name & "(#emp_no#)")#"";">
			</cfloop>
			<cfoutput>
				<script>
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
					document.getElementById('lbl_inp_filteremp').innerHTML  = '#SFLANG# (#qData.recordcount#) <span class=\"required\">*</span>' ; 
					<cfif len(vResult)>
						#vResult#
					</cfif>
				</script>
			</cfoutput>
		</cffunction>
		
		<cffunction name="GetDisplay">
			<cfargument name="hdn_display" required="yes">
			<cfargument name="listEmp" required="yes">
			<cfargument name="startdate" required="yes">
			<cfargument name="enddate" required="yes">
			<cfparam name="company_id" default="#REQUEST.SCookie.COID#">
		    <cfparam name="lstSalary" default="">
	        <cfparam name="lstPayComp" default="">
	        <cfparam name="lstPayPeriod" default="">
	        <cfparam name="lstPayMethod" default="">
	        <cfparam name="lstTax" default="">
	        <cfparam name="lstPayField" default="">
	        <!--- BUG50216-59719 : passing startdate and enddate from report content--->
	        
	        <!--- 	<cfparam name="startdate" default="#CREATEDATE(year(now()),month(now()),1)#">
			<cfparam name="enddate" default="#CREATEDATE(year(now()),month(now()),daysinmonth(now()))#">--->
	      
	      	<cfif len(trim(startdate)) eq 0>
			    <cfset startdate="#CREATEDATE(year(now()),month(now()),1)#">
			</cfif>
			<cfif len(trim(enddate)) eq 0>
			    <cfset enddate = #CREATEDATE(year(now()),month(now()),daysinmonth(now()))#>
			</cfif>
			<cfset startdate = #CREATEODBCDATETIME(startdate)#>
			<cfset enddate = dateadd("d",1,"#enddate#")>
			<cfset listTable = "">
			<cfset listField = "">
            <cfloop from="1" to="#listlen(hdn_display)#" index="idx">
                <cfset display = listgetat(hdn_display,idx)>
                <cfif display eq "Salary" OR display eq "Tax Setting" >
                    <cfset table_name = "TPYDEMPSALARYPARAM">
                    <cfset listTable = listAppend(listTable, table_name)>
                    <cfif display eq "Salary">
                        <cfset listField = listAppend(listField, lstSalary)>
                    <cfelse>
                        <cfset listField = listAppend(listField, lstTax)>
                    </cfif>
                </cfif>
                <cfif display eq "Payroll Period">
                    <cfset table_name ="TPYREMPPAYPERIOD">
                    <cfset listTable = listAppend(listTable, table_name)>
                    <cfset listField = listAppend(listField, lstPayPeriod)>
                </cfif>
                <cfif display eq "Payroll Field">
                    <cfset table_name ="TPYDEMPPAYFIELD">
                    <cfset listTable = listAppend(listTable, table_name)>
                    <cfset listField = listAppend(listField, lstPayField)>
                    <cfset field = ListLast(listField,"~")>
                </cfif>
                <cfif display eq "Payroll Component">
                    <cfset table_name = "TPYDEMPALLOWDEDUCT">
                    <cfset listTable = listAppend(listTable, table_name)>
                    <cfset listField = listAppend(listField, lstPayComp)>
                </cfif>
                <cfif display eq "Payment Method">
                    <cfset table_name = "TPYDEMPBANKPERIOD">
                    <cfset listTable = listAppend(listTable, table_name)>
                    <cfset listField = listAppend(listField, lstPayMethod)>
                </cfif>
            </cfloop>		
            
            <cfset lenDisp = listlen(hdn_display,",")>
            <cfset lenlistField =  listlen(listField,"~")>
            <cfset field = "">
               
            <!---<cfset listFieldSal = "currency_code,effective_date,formula,payfrequency,salary">
            <cfset listFieldtax = "taxed,salnet,taxlocation_code,taxfilenumber,taxfiledate,taxbornebycomp_dec,taxpenaltybornebycomp_dec,
            tax_type,taxstatus,numpdependent">
            <cfset listFieldPayF = "value,effective_date">
            <cfset fieldComp = "currency_code,effective_date,end_date,taxed,allowdeduct_formula,net,taxclass,allowdeduct_value,formula_result,formula_status">
            <cfset listFieldbank= "currency_code,allocation_type,allocation_value,rounding,rounding_type,compbank_account
            ,bank_account,bank_code,compbank_code,paycomp,priority_order">
            --->
            <cfset LOCAL.lstCutEmp=Application.SFUtil.CutList(ListQualify(listEmp,"'")," TCLLMLOGACTIVITY.data_id IN ","OR",2)>
            
            <cfquery name="qData" datasource="#REQUEST.SDSN#">
                SELECT TCLLMLOGACTIVITY.table_name, TCLLMLOGACTIVITY.data_id, TCLLMLOGACTIVITY.activity_type, VIEW_EMPLOYEE.company_id,VIEW_EMPLOYEE.emp_id,
                TCLLMLOGACTIVITY.log_header_id,TCLLMLOGACTIVITY.data_id, TCLLDLOGACTIVITY.field_name, 
                CASE 
        			WHEN TCLLDLOGACTIVITY.field_name = 'effective_date' THEN 'Effective date'
        			WHEN TCLLDLOGACTIVITY.field_name = 'currency_code' THEN 'Currency' 
        			WHEN TCLLDLOGACTIVITY.field_name =  'formula' 
        			     OR TCLLDLOGACTIVITY.field_name = 'allowdeduct_formula' THEN 'Formula'
        			WHEN TCLLDLOGACTIVITY.field_name = 'payfrequency' THEN 'Pay Frequency' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'salary' THEN 'Salary' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxed' THEN 'Taxed' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'salnet' THEN 'Salary Received' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxlocation_code' THEN 'Tax Location' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxfilenumber' THEN 'Gov Tax File No' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxfiledate' THEN 'Gov Tax File No Date'
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxbornebycomp_dec' THEN 'Tax Borne by Company' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxpenaltybornebycomp_dec' THEN 'Tax Penalty Borne by Company' 
        			WHEN TCLLDLOGACTIVITY.field_name = 'tax_type' THEN 'Tax Type'
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxstatus' THEN 'Tax Status'
        			WHEN TCLLDLOGACTIVITY.field_name = 'numdependent' THEN 'Total Dependent'
        			WHEN TCLLDLOGACTIVITY.field_name = 'value' THEN 'Value'
        			WHEN TCLLDLOGACTIVITY.field_name = 'end_date' THEN 'End Date'
        			WHEN TCLLDLOGACTIVITY.field_name = 'net' THEN 'Received'
        			WHEN TCLLDLOGACTIVITY.field_name = 'taxclass' THEN 'Tax Class'
        			WHEN TCLLDLOGACTIVITY.field_name = 'allowdeduct_value' THEN 'Default Value'
        			WHEN TCLLDLOGACTIVITY.field_name = 'formula_result' THEN 'Component Value'
        			WHEN TCLLDLOGACTIVITY.field_name = 'formula_status' THEN 'Ignore Formula'
        			WHEN TCLLDLOGACTIVITY.field_name = 'allocation_type' THEN 'Allocation Type'
        			WHEN TCLLDLOGACTIVITY.field_name = 'allocation_value' THEN 'Allocation Value'
        			WHEN TCLLDLOGACTIVITY.field_name = 'rounding' THEN 'Rounding'
        			WHEN TCLLDLOGACTIVITY.field_name = 'rounding_type' THEN 'Rounding Type'
        			WHEN TCLLDLOGACTIVITY.field_name = 'compbank_account' THEN 'Company Bank Account'  
        			WHEN TCLLDLOGACTIVITY.field_name = 'bank_account' THEN 'Employee Bank Account'
        			WHEN TCLLDLOGACTIVITY.field_name = 'bank_code' THEN 'Bank Code'
        			WHEN TCLLDLOGACTIVITY.field_name = 'compbank_code' THEN 'Company bank code'
        			WHEN TCLLDLOGACTIVITY.field_name = 'paycomp' THEN 'Payroll Component'
        			WHEN TCLLDLOGACTIVITY.field_name = 'priority_order' THEN 'Order No'
			    END as fieldname,
                TCLLDLOGACTIVITY.old_value, 
                TCLLDLOGACTIVITY.new_value,
                TCLLMLOGACTIVITY.modified_date,TCLLMLOGACTIVITY.modified_by, VIEW_EMPLOYEE.full_name, VIEW_EMPLOYEE.emp_no
                FROM VIEW_EMPLOYEE,TCLLMLOGACTIVITY, TCLLDLOGACTIVITY 
                WHERE 
                TCLLMLOGACTIVITY.data_id = VIEW_EMPLOYEE.emp_id
                AND VIEW_EMPLOYEE.company_id = <cfqueryparam value="#company_id#" CFSQLType="CF_SQL_INTEGER">
                AND TCLLMLOGACTIVITY.log_header_id = TCLLDLOGACTIVITY.log_header_id
                <!--- AND TCLLMLOGACTIVITY.data_id IN (<cfqueryparam value="#listEmp#" list="yes" cfsqltype="CF_SQL_VARCHAR">) BUG51117-85951 --->
                <cfif listlen(listEmp) >
                    AND (#PreserveSingleQuotes(lstCutEmp)#)
                <cfelse>
                    AND TCLLMLOGACTIVITY.data_id IN (<cfqueryparam value="#listEmp#" list="yes" cfsqltype="CF_SQL_VARCHAR">)
                </cfif>
                AND (TCLLMLOGACTIVITY.modified_date >= #startdate# AND TCLLMLOGACTIVITY.modified_date <= #enddate#)
                <cfif lenDisp eq 1>
                    <cfset field = "">
                    <cfloop index = "idx_field" list = "#listField#" delimiters = ",">  
                        <cfset field = listAppend(field,listlast(idx_field,"~"))>
                    </cfloop>
                    AND (TCLLMLOGACTIVITY.table_name IN (<cfqueryparam value="#listTable#" list="yes" cfsqltype="CF_SQL_VARCHAR">) 
            		AND TCLLDLOGACTIVITY.field_name IN (<cfqueryparam value="#field#" list="yes" cfsqltype="CF_SQL_VARCHAR">) )
            	<cfelse>
            	     <cfset idx = 0>
            	    	AND (
            				<cfloop index = "tab_name" list = "#listField#" delimiters = ",">  
            			        <cfset idx ++>
            				    <cfset getTable = listfirst(tab_name,"~")>
            					<cfset getField = listlast(tab_name,"~")>
            						(TCLLMLOGACTIVITY.table_name IN ('#getTable#') AND TCLLDLOGACTIVITY.field_name = '#getField#')
            						<cfif idx neq #listlen(listField)#>
            							OR
            						</cfif>
            				</cfloop>
            			)
            	</cfif>
                <!---AND TCLLMLOGACTIVITY.table_name IN (<cfqueryparam value="#listTable#" list="yes" cfsqltype="CF_SQL_VARCHAR">)
                AND TCLLDLOGACTIVITY.field_name IN (<cfqueryparam value="#listField#" list="yes" cfsqltype="CF_SQL_VARCHAR">)--->
                ORDER BY TCLLMLOGACTIVITY.table_name, VIEW_EMPLOYEE.Full_Name, TCLLMLOGACTIVITY.modified_date desc
            </cfquery>
            <cf_sfwritelog dump="qData" prefix="_qDatachanges">
            <cfreturn qData>
 		</cffunction>
 		
 		<cffunction name="GetPayFieldNo">
		    <cfargument name="emp_id" required="yes">
            <cfargument name="log_header_id" required="yes">
            <cfargument name="field_name" required="yes">
			<cfargument name="table_name" required="yes">
			<cfparam name="company_id" default="#REQUEST.SCookie.COID#">    
	  	    <cfset request.doctype="xml">
	  	    <cfquery name="qData" datasource="#REQUEST.SDSN#">
	  	        SELECT *
                FROM TCLLDLOGACTIVITY,TCLLMLOGACTIVITY
                WHERE TCLLDLOGACTIVITY.field_name = <cfqueryparam value="#field_name#" CFSQLType="CF_SQL_VARCHAR">
                AND TCLLDLOGACTIVITY.log_header_id = <cfqueryparam value="#log_header_id#" CFSQLType="CF_SQL_INTEGER">
                AND TCLLMLOGACTIVITY.log_header_id = TCLLDLOGACTIVITY.log_header_id
                AND TCLLMLOGACTIVITY.data_id = <cfqueryparam value="#emp_id#" CFSQLType="CF_SQL_VARCHAR">
                AND TCLLMLOGACTIVITY.table_name = <cfqueryparam value="#table_name#" CFSQLType="CF_SQL_VARCHAR">
	  	    </cfquery>
	  	   
	  	   <cfif qData.recordcount>
	  	        <cfset key_dataxml = #xmlparse(qData.record_key)#>
	  	        <cfset strckPayField = "#ConvertXmlToStruct(ToString(key_dataxml), structnew())#">
	  	        <cfset payfieldno = #strckPayField['payfield_no']# >
	  	        <cfquery name="qGetPayfieldno" datasource="#REQUEST.SDSN#">
	  	            SELECT payfield_no, payfield_name_#REQUEST.Scookie.LANG# payfieldname
                    FROM TPYCPAYFIELD
                    WHERE payfield_no = <cfqueryparam value="#payfieldno#" CFSQLType="CF_SQL_VARCHAR">
	  	        </cfquery>
	  	        <cfset fieldno = qGetPayfieldno.payfieldname>
	  	        <!---<cfset getData = findnocase("RECORDKEY",qData.record_key)>
	  	        <cfif getData neq 0>
	  	            <cfset repkey =  #replace(qData.record_key,"RECORDKEY","data","All")# >
	  	             <cfset packet="<wddxPacket version='1.0'><header></header>#repkey#</wddxPacket>">
	  	        </cfif>
	  	       <cfwddx action = "wddx2cfml" input = "#packet#" output = "qPayFieldNo">--->
            <cfelse>
                <cfset fieldno = 0>
            </cfif>
           <cfreturn fieldno>
	  	</cffunction>
 		
 		<cffunction name="GetPeriod">
		    <cfargument name="emp_id" required="yes">
            <cfargument name="log_header_id" required="yes">
          	<cfargument name="table_name" required="yes">
			<cfparam name="company_id" default="#REQUEST.SCookie.COID#">    
	  	   
	  	    <cfquery name="qData" datasource="#REQUEST.SDSN#">
                SELECT TCLLMLOGACTIVITY.log_header_id, TCLLMLOGACTIVITY.record_key,TCLLMLOGACTIVITY.data_id,
                TCLLDLOGACTIVITY.field_name
                FROM TCLLDLOGACTIVITY,TCLLMLOGACTIVITY
                WHERE TCLLDLOGACTIVITY.log_header_id = <cfqueryparam value="#log_header_id#" CFSQLType="CF_SQL_INTEGER">
                AND TCLLMLOGACTIVITY.log_header_id = TCLLDLOGACTIVITY.log_header_id
                AND TCLLMLOGACTIVITY.data_id = <cfqueryparam value="#emp_id#" CFSQLType="CF_SQL_VARCHAR">
                AND TCLLMLOGACTIVITY.table_name = <cfqueryparam value="#table_name#" CFSQLType="CF_SQL_VARCHAR">
	  	    </cfquery>
  	        <cfset key_dataxml = #xmlparse(qData.record_key)#>
  	        <cfset strckPeriod = "#ConvertXmlToStruct(ToString(key_dataxml), structnew())#">
  	        <cfset period = #strckPeriod['period_code']# >
  	        <cfset component = #strckPeriod['allowdeduct_code']# >
  	        <cfquery name="qData" datasource="#REQUEST.SDSN#">
  	            SELECT '#period#' as period, '#component#' as component
  	        </cfquery>
	  	   <cfreturn qData>
	  	</cffunction>
     		
        <cffunction name="ConvertXmlToStruct" access="public" returntype="struct" output="false"
        	hint="Parse raw XML response body into ColdFusion structs and arrays and return it.">
        	<!--- this function from : http://www.anujgakhar.com/2007/11/05/coldfusion-xml-to-struct/ --->
        	<cfargument name="xmlNode" type="string" required="true" />
        	<cfargument name="str" type="struct" required="true" />
        	<!---Setup local variables for recurse: --->
        	<cfset var i = 0 />
        	<cfset var axml = arguments.xmlNode />
        	<cfset var astr = arguments.str />
        	<cfset var n = "" />
        	<cfset var tmpContainer = "" />
        	
        	<cfset axml = XmlSearch(XmlParse(arguments.xmlNode),"/node()")>
        	<cfset axml = axml[1] />
        	
        	<!--- For each children of context node: --->
        	<cfloop from="1" to="#arrayLen(axml.XmlChildren)#" index="i">
        		<!--- Read XML node name without namespace: --->
        		<cfset n = replace(axml.XmlChildren[i].XmlName, axml.XmlChildren[i].XmlNsPrefix&":", "") />
        		<!--- If key with that name exists within output struct ... --->
        		<cfif structKeyExists(astr, n)>
        			<!--- ... and is not an array... --->
        			<cfif not isArray(astr[n])>
        				<!--- ... get this item into temp variable, ... --->
        				<cfset tmpContainer = astr[n] />
        				<!--- ... setup array for this item beacuse we have multiple items with same name, ... --->
        				<cfset astr[n] = arrayNew(1) />
        				<!--- ... and reassing temp item as a first element of new array: --->
        				<cfset astr[n][1] = tmpContainer />
        			<cfelse>
        				<!--- Item is already an array: --->
        				
        			</cfif>
        			<cfif arrayLen(axml.XmlChildren[i].XmlChildren) gt 0>
        					<!--- recurse call: get complex item: --->
        					<cfset astr[n][arrayLen(astr[n])+1] = ConvertXmlToStruct(axml.XmlChildren[i], structNew()) />
        				<cfelse>
        					<!--- else: assign node value as last element of array: --->
        					<cfset astr[n][arrayLen(astr[n])+1] = axml.XmlChildren[i].XmlText />
        			</cfif>
        		<cfelse>
        			<!---
        				This is not a struct. This may be first tag with some name.
        				This may also be one and only tag with this name.
        			--->
        			<!---
        					If context child node has child nodes (which means it will be complex type): --->
        			<cfif arrayLen(axml.XmlChildren[i].XmlChildren) gt 0>
        				<!--- recurse call: get complex item: --->
        				<cfset astr[n] = ConvertXmlToStruct(axml.XmlChildren[i], structNew()) />
        			<cfelse>
        				<!--- else: assign node value as last element of array: --->
        				<!--- if there are any attributes on this element--->
        				<cfif IsStruct(aXml.XmlChildren[i].XmlAttributes) AND StructCount(aXml.XmlChildren[i].XmlAttributes) GT 0>
        					<!--- assign the text --->
        					<cfset astr[n] = axml.XmlChildren[i].XmlText />
        						<!--- check if there are no attributes with xmlns: , we dont want namespaces to be in the response--->
        					 <cfset attrib_list = StructKeylist(axml.XmlChildren[i].XmlAttributes) />
        					 <cfloop from="1" to="#listLen(attrib_list)#" index="attrib">
        						 <cfif ListgetAt(attrib_list,attrib) CONTAINS "xmlns:">
        							 <!--- remove any namespace attributes--->
        							<cfset Structdelete(axml.XmlChildren[i].XmlAttributes, listgetAt(attrib_list,attrib))>
        						 </cfif>
        					 </cfloop>
        					 <!--- if there are any atributes left, append them to the response--->
        					 <cfif StructCount(axml.XmlChildren[i].XmlAttributes) GT 0>
        						 <cfset astr[n&'_attributes'] = axml.XmlChildren[i].XmlAttributes />
        					</cfif>
        				<cfelse>
        					 <cfset astr[n] = axml.XmlChildren[i].XmlText />
        				</cfif>
        			</cfif>
        		</cfif>
        	</cfloop>
        	<!--- return struct: --->
        	<cfreturn astr />
        </cffunction>
 		
</cfoutput>
</cfcomponent>