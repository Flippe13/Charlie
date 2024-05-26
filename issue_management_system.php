<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Målarfirmans Ärendehanteringssystem</title>
    <link rel="stylesheet" href="styless.css">
</head>
<body>
    <header>
        <h1>Anders Målarsupport</h1>
    </header>
    <main>
        <section class="issue-section">
            <h2>Skapa Nytt Ärende</h2>
            <form action="submit_issue.php" method="post">
                <label for="email">E-postadress:</label>
                <input type="email" id="email" name="email" required><br><br>
                <label for="product_number">Produktnummer:</label>
                <select id="product_number" name="product_number">
                    <option value="123">Färg</option>
                    <option value="456">Spakel</option>
                    <option value="520">Annat</option>
               
                </select><br><br>
                <label for="issue_description">Problembeskrivning:</label><br>
                <textarea id="issue_description" name="issue_description" rows="4" cols="50" required></textarea><br><br>
                <input type="submit" value="Skicka Ärende">
            </form>
        </section>
    </main>
</body>
</html>
