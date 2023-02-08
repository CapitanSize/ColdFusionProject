<cfquery datasource="ColdFusionProject" name="dbUsername" result="resultUser">
        select * from users
        where username = '#Form.username#'
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUsers">
        select * from users
</cfquery>
<cfset countOfUsers = qryUsers.RecordCount>

<cfif resultUser.RecordCount EQ 0>
    <cfquery datasource="ColdFusionProject">
        insert into users (id, username, name, secondName, password) 
        values (#countOfUsers# + 1, '#Form.username#', '#Form.name#', '#Form.secondName#', '#Form.password.hash()#')
    </cfquery>
    <cflocation url="/ColdFusionProject/MainPage.cfm" >
    <cfcookie name="isAuth"  value="true" expires = 'never'>
    <cfcookie name="username" value="#form.username#" expires = 'never'>
    <cfelse>
    <cfset error = "The username is already exists">
    <cflocation url="/ColdFusionProject/RegistrationPage.cfm?error=#error#"  addtoken="false">
</cfif>