<html>
    <head>
        <title>
        AuthorisationPage
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <div class="main">
            <h1>
                Вход
            </h1>
            <cfif isDefined("url.error") >
                <div class="error">
                    <cfoutput >
                        #htmlEditFormat(url.error)#                        
                    </cfoutput>
                </div>
            </cfif>
            <div class="container">
                <form action="/ColdFusionProject/AuthorisationLogic.cfm" method="post">
                    <div class="item">
                        <label for="username"><b>Имя пользователя</b></label>
                        <input type="text" placeholder="Введите имя пользователя" name="username" required>
                    </div>
                    <br>
                    <div class="item">
                        <label for="password"><b>Пароль</b></label>
                        <input type="password" placeholder="Введите пароль" name ="password" required>
                    </div>
                    <br>
                    <div class="item">
                        <button type="submit">Войти</button>
                    </div>
                </form>
                <div class="footerText">
                    <p>
                        Впервые на сайте?
                    </p>
                    <a href="/ColdFusionProject/RegistrationPage.cfm">Зарегистрируйтесь!</a>
                </div>
            </div>
        </div>
    </body>
</html>