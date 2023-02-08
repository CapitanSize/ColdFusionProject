<cfquery datasource="ColdFusionProject" name="qryCurrentUser">
    select * from users
    where username = '#cookie.username#'
</cfquery>
<html>
    <head>
        <title>
        Редактирование пользователя
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <cfinclude template = "/ColdFusionProject/Header.cfm">
        <div class="main">
            <h2>
                Редактирование пользователя
            </h2>
            <div class="editUserContainer"> 
                <form action="/ColdFusionProject/EditUserLogic.cfm" method="post" class="formWrapper">
                <div class="editUserForm">
                    <div class='errorItemTop'>
                        <div>
                            <p>Имя пользователя: <cfoutput>#qryCurrentUser.username#</cfoutput></p>
                        </div>
                        <br>
                        <div class="item">
                        <label for="username"><b>Введите новое имя пользователя</b></label>
                        <input type="text" placeholder="Ввод..." name ="username">
                        </div>
                    <br>
                    </div>
                    <div class='errorItemBottom'>
                        <div>
                        <p>Имя: <cfoutput>#qryCurrentUser.name#</cfoutput></p>
                        </div>
                        <br>
                        <div class="item">
                        <label for="name"><b>Введите новое имя</b></label>
                        <input type="text" placeholder="Ввод..." name ="name">
                        </div>
                    <br>
                        <div>
                        <p>Фамилия: <cfoutput>#qryCurrentUser.secondName#</cfoutput></p>
                        </div>
                        <br>
                        <div class="item">
                        <label for="secondName"><b>Введите новую фамилию</b></label>
                        <input type="text" placeholder="Ввод..." name ="secondName">
                        </div>
                    <br>
                    </div>
                </div>
                    <br>
                    <div class="item">
                        <button type="submit">Сохранить изменения</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>