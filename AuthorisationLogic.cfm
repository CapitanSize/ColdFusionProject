<cfquery datasource="ColdFusionProject" name="dbUser" result="resultUser">
            select * from users
            where username = '#Form.username#'
    </cfquery>
    <cfquery datasource="ColdFusionProject" name="qryUsers">
            select * from users
    </cfquery>
    <cfset countOfUsers = qryUsers.RecordCount>

    <cfif resultUser.RecordCount EQ 1>
        <cfif Form.password.hash() EQ dbUser.password>
            <cfcookie name="isAuth"  value="true" expires = 'never'>
            <cfcookie name="username" value="#form.username#" expires = 'never'>
            <cflocation url="/ColdFusionProject/MainPage.cfm" addtoken="false">
        <cfelse>
            <cfset error = "The password is incorrect">
            <cflocation url="/ColdFusionProject/AuthorisationPage.cfm?error=#error#"  addtoken="false">
        </cfif>
    <cfelse>
        <cfset error = "The username is incorrect">
        <cflocation url="/ColdFusionProject/AuthorisationPage.cfm?error=#error#"  addtoken="false">
    </cfif>