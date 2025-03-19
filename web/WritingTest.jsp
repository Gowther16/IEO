<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Writing_Test</title>
    <link rel="stylesheet" href="css/test.css">
    <link rel="stylesheet" href="css/taketest.css">
</head>
<body>
    <div id="container">
        <div id="left-panel">
            <h1>Writing</h1>
            <h3>${writing.getTitle()}</h3>
            <p class="description">
                ${writing.getContent()}
            </p>
        </div>
        <div id="right-panel">
            <h2>Questions</h2>
            <p class="instructions">Choose the correct answer from the list of question below:</p>
            <form class="headings" method="finishTest" method="POST">
                <button type="submit" class="take_test_btn">Submit </button>
            </form>
        </div>
    </div>
</body>
</html>
