<!DOCTYPE html>
<html>

<head>
    <title>JS Quiz</title>
    <link rel="stylesheet" type="text/css" href="css/questions.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="quizContainer container-fluid well well-lg">
        <div id="quiz1" class="text-center">
            <!-- <h3>Exam</h3> -->
            <h2 id="e-sub">jQuery Quiz</h2>
            <h4 style="color:#FF0000; text-align:center;">
                <span id="iTimeShow">Time Remaining: </span>
                <span id='timer'></span>
            </h4>
            <!-- <h2 id="e-sub">jQuery Quiz</h2> -->
        </div>

        <div class="question"></div>
        <ul class="choiceList"></ul>
        <div class="quizMessage"></div>
        <div class="result"></div>
        <button class="preButton">Previous Question</button>
        <button class="nextButton">Next Question</button>
    </div>
    <script src="js/questions.js"></script>
</body>

</html>
