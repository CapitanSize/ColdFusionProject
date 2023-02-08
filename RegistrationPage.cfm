<html>
    <head>
        <title>
        RegistrationPage
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <div class="main">
            <h1>
                Регистрация
            </h1>
            <cfif isDefined("url.error") >
                <div class="error">
                    <cfoutput >
                        #htmlEditFormat(url.error)#                        
                    </cfoutput>
                </div>
            </cfif>
            <div class="registrationContainer">
                <form action="/ColdFusionProject/RegistrationLogic.cfm" method="post">
                    <div class="item">
                        <label for="username"><b>Имя пользователя или Email</b></label>
                        <input type="text" placeholder="Ввод..." name="username" required>
                    </div>
                    <br>
                    <div class="item">
                        <label for="name"><b>Имя</b></label>
                        <input type="text" placeholder="Ввод..." name ="name" required>
                    </div>
                    <br>
                    <div class="item">
                        <label for="secondName"><b>Фамилия</b></label>
                        <input type="text" placeholder="Ввод..." name ="secondName" required>
                    </div>
                    <br>
                    <div class="item">
                        <label for="password"><b>Пароль</b></label>
                        <input type="password" placeholder="Ввод..." name ="password" required>
                    </div>
                    <br>
                    <div class="item">
                        <button type="submit">Зарегистрироваться</button>
                    </div>
                </form>
                <div class="footerText">
                    <p>
                        Уже есть аккаунт?
                    </p>
                    <a href="/ColdFusionProject/AuthorisationPage.cfm">Войдите!</a>
                </div>
            </div>
        </div>
    </body>
</html>