<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <title>Awesome Quiz App | CodingNepal</title> -->
    <link rel="stylesheet" href="css/style_eexam.css">

    <!-- FontAweome CDN Link for Icons -->
</head>

<body>
    <!-- start Quiz button -->


    <!-- Info Box -->
    <div class="info_box">
        <div class="info-title"><span>Some Rules of this Quiz</span></div>
        <div class="info-list">
            <div class="info">1. You will have only <span>20 seconds</span> per each question.</div>
            <div class="info">2. You can skip any question you want.</div>
            <div class="info">3. YYou can't exit from the Quiz while you're playing.</div>
            <div class="info">4. Your skipped question will be result 0 points.</div>
            <div class="info">5. You can't select any option once time goes off.</div><br>
            <div class="info">
                Choose Your Subject.

                <select name="subject" id="subject">
                    <option value="math">Math</option>
                    <option value="english">English</option>
                    <option value="physics">Physics</option>
                    <option value="web">Web Devlopment</option>
                </select>
            </div>


            <div class="buttons">
                <button class="quit"><a href="index.jsp" class="exit">Exit Quiz</a> </button>
                <button class="restart"><a href="questions.jsp" class="start starter"
                        onclick="startQuiz(this)">Continue</a> </button>
            </div>
        </div>
        
</body>

</html>

</html>