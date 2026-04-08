/**
 * Laboration 1
 */

const express = require("express");
const app = express();
const bodyParser = require("body-parser"); //Möjlighet att läsa in FORM-data
const port = 3000;
const mysql = require("mysql2");

// Skapa anslutningen till min XAMPP-databas
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "cv", // Namnet på databasen
});

// Kontrollera om anslutningen fungerar
db.connect((err) => {
  if (err) {
    console.error("Kunde inte ansluta till databasen: " + err);
    return;
  }
  console.log("Ansluten till databasen som ID " + db.threadId);
});

app.set("view engine", "ejs"); //View engine: EJS
app.use(express.static("public")); //Statiska filer i katalog "public"
app.use(bodyParser.urlencoded({ extended: true }));

//Routing
// 1. Startsidan (Visa kurser)
app.get("/", (req, res) => {
  db.query("SELECT * FROM courses", (err, rows) => {
    if (err) throw err;
    res.render("index", { courses: rows });
  });
});

// 2. Sidan för att lägga till kurs (Visa formulär)
app.get("/courses", (req, res) => {
  res.render("courses");
});

app.post("/courses", (req, res) => {
  let newCourseCode = req.body.courseCode;
  let newCourseName = req.body.courseName;
  let newCoursePlan = req.body.coursePlan;
  let newProgression = req.body.progression;
  let newTerm = req.body.term;
  let newPoints = req.body.points;
  let error = null;
  const sql =
    "INSERT INTO courses (coursecode, coursename, syllabus, progression, term, points) VALUES (?, ?, ?, ?, ?, ?)";

  // Kontrollera att alla fält är ifyllda
  if (
    newCourseCode === "" ||
    newCourseName === "" ||
    newCoursePlan === "" ||
    newProgression === ""
  ) {
    error = "Du måste fylla i samtliga fält!";

    // Skicka tillbaka användaren till formuläret och visa felet
    return res.render("courses", { error: error });
  }

  // Om allt är OK
  //Kör frågan mot databasen

  db.query(
    sql,
    [
      newCourseCode,
      newCourseName,
      newCoursePlan,
      newProgression,
      newTerm,
      newPoints,
    ],
    (err, result) => {
      if (err) {
        console.error("Det blev fel vid lagring:" + err);
        return res.render("courses", {
          error: "Kunde inte spara till databasen.",
        });
      }

      //Om allt gick bra skicka användaren till startsidan
      res.redirect("/");
    }
  );
});

//Radera
app.get("/delete/:id", (req, res) => {
  // Vi hämtar ID som ska raderas från adressfältet
  let id = req.params.id;

  // SQL-frågan
  const sql = "DELETE FROM courses WHERE id = ?";

  //Skicka ordern till databasen
  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error("Kunde inte radera: " + err);
    }

    //Hoppa tillbaka till startsidan
    res.redirect("/");
  });
});

// 3. Om-sidan
app.get("/about", (req, res) => {
  res.render("about");
});

//Starta

app.listen(port, () => {
  console.log("Server started on port: " + port);
});
