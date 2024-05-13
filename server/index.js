import express from "express";
import mysql from "mysql";
import cors from "cors";
import cookieParser from "cookie-parser";
import jwt from "jsonwebtoken";

const app = express();
app.use(express.json());
app.use(cookieParser());
app.use(
  cors({
    origin: ["http://localhost:3000"],
    methods: ["POST, GET"],
    credentials: true,
  })
);

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "db_sticlasskode",
});

//authentication of the account logged in
const verifyUser = (req, res, next) => {
  const token = req.cookies.token;
  if (!token) {
    return res.json({ Message: "Is not Authenticated" });
  } else {
    jwt.verify(token, "our-jsonwebtoken-secret-key", (err, decoded) => {
      if (err) {
        return res.json({ Message: "Authentication Error." });
      } else {
        req.Name = decoded.Name;
        req.UserType = decoded.UserType;
        req.UUID = decoded.UUID;
        req.File_Maintainance = decoded.File_Maintainance;
        req.Access_View = decoded.Access_View;
        req.Access_Edit = decoded.Access_Edit;
        req.Access_Insert = decoded.Access_Insert;
        next();
      }
    });
  }
};

app.get("/", verifyUser, (req, res) => {
  return res.json({
    Status: "Success",
    Name: req.Name,
    UserType: req.UserType,
    UUID: req.UUID,
    File_Maintainance: req.File_Maintainance,
    Access_View: req.Access_View,
    Access_Edit: req.Access_Edit,
    Access_Insert: req.Access_Insert,
  });
});

app.post("/login", (req, res) => {
  const sql =
    "SELECT * FROM tbl_user INNER JOIN tbl_permission ON tbl_user.UUID=tbl_permission.UUID WHERE Email = ? AND Password = ?";
  db.query(sql, [req.body.email, req.body.password], (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    if (data.length > 0) {
      const FirstName = data[0].FirstName;
      const LastName = data[0].LastName;
      const UserType = data[0].UserType;
      const UUID = data[0].UUID;
      const Name = LastName.concat(", ", FirstName);

      const File_Maintainance = data[0].File_Maintainance;
      const Access_View = data[0].Access_View;
      const Access_Edit = data[0].Access_Edit;
      const Access_Insert = data[0].Access_Insert;

      const token = jwt.sign(
        {
          Name,
          UserType,
          UUID,
          File_Maintainance,
          Access_View,
          Access_Edit,
          Access_Insert,
        },
        "our-jsonwebtoken-secret-key",
        { expiresIn: "1d" }
      );
      res.cookie("token", token);
      return res.json({ Status: "Success" });
    } else {
      return res.json({ Message: "No Records Found" });
    }
  });
});

//de-authentication of the account that was logged in
app.post("/logout", (req, res) => {
  res.clearCookie("token");
  return res.json({ Status: "Success" });
});

//checks of the server is running
app.listen(8081, () => {
  console.log("Running");
});

app.get("/status", (req, res) => {
  res.send("server is running");
});

app.use("/css", express.static("./node_modules/bootstrap/dist/css"));
app.use("/js", express.static("./node_modules/bootstrap/dist/js"));

/* ==============================================
    This section pertains to CRUD Operations:
        1. CREATE
        2. READ
        3. UPDATE
        4. DELETE
===============================================*/

/*
    Entity Name: Coach
*/
app.post("/coach-selection", (req, res) => {
  const sql = "SELECT * FROM tbl_coach WHERE Deleted='False'";

  db.query(sql, (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});
