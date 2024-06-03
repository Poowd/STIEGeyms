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
  database: "db_stiegeyms",
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
        req.UUID = decoded.UUID;
        req.USERNAME = decoded.USERNAME;
        req.USER_TYPE = decoded.USER_TYPE;
        req.AUTH = decoded.AUTH;
        next();
      }
    });
  }
};

app.get("/", verifyUser, (req, res) => {
  return res.json({
    Status: "Success",
    UUID: req.UUID,
    USERNAME: req.USERNAME,
    USER_TYPE: req.USER_TYPE,
    AUTH: req.AUTH,
  });
});

app.post("/login", (req, res) => {
  const sql =
    "SELECT * FROM user INNER JOIN permission ON user.UUID = permission.UUID WHERE Username = ? AND Password = ?";
  db.query(sql, [req.body.username, req.body.password], (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    if (data.length > 0) {
      const UUID = data[0].UUID;
      const USERNAME = data[0].Username;
      const USER_TYPE = data[0].USER_TYPE;

      const AUTH = data[0].AUTH;

      const token = jwt.sign(
        {
          UUID,
          USERNAME,
          USER_TYPE,
          AUTH,
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

//pull games
app.post("/list-of-games", (req, res) => {
  const sql = "SELECT * FROM games WHERE game_status = 'ACTIVE'";

  db.query(sql, (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});

//pull stores
app.post("/list-of-stores", (req, res) => {
  const sql = "SELECT * FROM store WHERE store_status = 'ACTIVE'";

  db.query(sql, (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});

//pull store items
app.post("/list-of-store-items", (req, res) => {
  const sql =
    "SELECT * FROM store_items INNER JOIN store ON store_items.store_id = store.store_id INNER JOIN games ON store_items.game_id = games.game_id WHERE store_items.item_status = 'ACTIVE'";

  db.query(sql, (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});

//pull tournament
app.post("/list-of-tournament", (req, res) => {
  const sql =
    "SELECT * FROM tournament INNER JOIN games ON tournament.game_id = games.game_id WHERE tournament.tournament_status = 'SCHEDULED'";

  db.query(sql, (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});

//pull user library
app.post("/insert-game", (req, res) => {
  const sql =
    "INSERT INTO games (`game_name`, `game_developer`, `game_publisher`, `game_description`) VALUES (?, ?, ?, ?)";

  db.query(
    sql,
    [
      req.body.name,
      req.body.developer,
      req.body.publisher,
      req.body.description,
    ],
    (err, data) => {
      if (err) return res.json({ Message: "Server Sided Error" });
      return res.json(data);
    }
  );
});

//pull user library
app.post("/edit-game", (req, res) => {
  const sql =
    "UPDATE games SET game_name = ?, game_developer = ?, game_publisher = ?, game_description = ? WHERE game_id = ?";

  db.query(
    sql,
    [
      req.body.name,
      req.body.developer,
      req.body.publisher,
      req.body.description,
      req.body.id,
    ],
    (err, data) => {
      if (err) return res.json({ Message: "Server Sided Error" });
      return res.json(data);
    }
  );
});
app.post("/archive-game", (req, res) => {
  const sql = "UPDATE games SET game_status = 'ARCHIVED' WHERE game_id = ?";

  db.query(sql, [req.body.id], (err, data) => {
    if (err) return res.json({ Message: "Server Sided Error" });
    return res.json(data);
  });
});

//random code generator
app.get("/random-code-generator", (req, res) => {
  let result = "";
  const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  const charactersLength = characters.length;
  let counter = 0;
  const length = 4;
  while (counter < length) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
    counter += 1;
  }
  return res.json(result);
});
