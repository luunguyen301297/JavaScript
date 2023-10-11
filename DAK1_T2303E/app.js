const express = require("express");
const app = express();
const port = process.env.post || 3000;
const conn = require("./models/database/connect_db");
const bodyParser = require("body-parser");
const flash = require("express-flash");
const session = require("express-session");

app.set("view engine", "ejs");
app.use(express.static("public"));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(
  session({
    secret: "123456catr",
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 60000 },
  })
);
app.use(flash());

//[GET home]
app.get("/", function (req, res) {
  conn.query(`select * from product where name like "Car%"`, (err, results) => {
    if (err) throw err;
    res.render("home", {
      product: results,
    });
  });
});

// Paging
let pageLimit = 5;
let totalProducts = 0;
let sqlTotal = "select count(*) as totalRow from product";

conn.query(sqlTotal, function (err, data) {
  totalProducts = data[0].totalRow;
});

// Search
app.get("/tim-kiem", function (req, res) {
  let sql = "select * from product";
  let search = req.query.q;
  let currentPage = req.query.page ? req.query.page : 1;
  let pageStart = (currentPage - 1) * pageLimit;
  let totalPage = Math.ceil(totalProducts / pageLimit);

  if (search !== "" && search !== " ") {
    sql += ` where name like '%${search}%'`;
    sql += " limit " + pageStart + "," + pageLimit;
    conn.query(sql, function (err, results) {
      if (err) throw err;

      res.render("search", {
        title: "Search Results",
        search: search,
        product: results,
        totalProducts: totalProducts,
        pageLimit: pageLimit,
        totalPage: totalPage,
        currentPage: parseInt(currentPage),
      });
    });
  } else {
    res.render("search", {
      title: "Kết quả tìm kiếm",
      search: search,
      product: [],
      totalProducts: 0,
      pageLimit: 0,
      totalPage: 0,
      currentPage: parseInt(currentPage),
    });
  }
});

//insert plan
app.post("/", (req, res) => {
  const flexRadioDefault = req.body._rate

  conn.query("INSERT INTO contact_plan (insurance_pakage) VALUES (`${flexRadioDefault}`)", function (err, result) {
    if (err) throw err;
    res.send("Đăng ký thành công!");
  });
})


app.get("/ke-hoach-bao-hiem", function (req, res) {
  res.render("insurance-plan");
});

app.get("/boi-thuong", function (req, res) {
  res.render("indemnify");
});

app.get("/ve-chung-toi", function (req, res) {
  let sql = `SELECT * FROM company`;
  conn.query(sql, (err, results, fields) => {
    if (err) throw err;
    res.render("about-us", {
      company: results,
    });
  });
});

app.get("/lien-he", function (req, res) {
  res.render("contact-us");
});

app.get("/ke-hoach-bao-hiem", function (req, res) {
  res.render("insurance-plan");
});

//[GET bhot]
app.get("/bao-hiem-o-to", function (req, res) {
  conn.query(`select * from product where name like "%Car%" && id > 1`, (err, results) => {
    if (err) throw err;
    res.render("car-insurance", {
      product: results,
    });
  });
});

app.get("/bao-hiem-xe-may", function (req, res) {
  conn.query(`select * from product where name like "%Motorbike%" && id > 5`, (err, results) => {
    if (err) throw err;
    res.render("motorbike-insurance", {
      product: results,
    });
  });
});

app.get("/bao-hiem-xe-dau-keo", function (req, res) {
  conn.query(`select * from product where name like "%Truck%" && id > 9`, (err, results) => {
    if (err) throw err;
    res.render("truck-insurance", {
      product: results,
    });
  });
});

// Product
// Data Product Page Processing
const get_product_datas = (req, results) => {
  // filter data from db
  let product_datas = results.find((data) => {
    return "/" + data.slug == req._parsedOriginalUrl.pathname;
  });
  // text processing
  let data_edit = [];
  Object.values(product_datas).forEach((element, i) => {
    if (typeof element !== "number") {
      element = element.split(". ");
      element.forEach((convert) => {
        convert += ".";
      });
    }
    data_edit[i] = element;
  });
  // data merge
  let o = 0;
  for (const property in product_datas) {
    if (typeof product_datas[property] != "number") {
      product_datas[property] = data_edit[o];
    }
    o++;
  }
  return product_datas;
};
// End data processing

// Render products page
const get_product_data = "SELECT * FROM product p JOIN product_detail pd ON pd.product_id = p.id JOIN company c ON c.id = p.company_id";
const get_slug = "SELECT slug FROM product";

conn.connect(() => {
  conn.query(get_slug, (err, result) => {
    // array loop
    result.forEach((slug) => {
      // object loop to get value
      for (const property in slug) {
        app.get("/" + slug[property], (req, res) => {
          conn.query(get_product_data, (err, results) => {
            if (err) throw err;
            let p_data = get_product_datas(req, results);
            res.render("product", {
              products: [p_data],
            });
          });
        });
      }
    });
  });
});

app.post("/dang-ky", (req, res) => {
  let name = req.body.userName;
  let phoneNumber = req.body.userPhoneNumber;
  let email = req.body.userEmail;
  let address = req.body.userAddress;
  let message = req.body.userMessage;

  if (message == "undefined") {
    let sql = `INSERT INTO contacts (name, phoneNumber, email, address, from_slug, created_at)
    VALUES ("${name}", "${phoneNumber}", "${email}", "${address}", "${req.headers.referer}", NOW())`;
    conn.connect(function (err) {
      conn.query(sql, function (err, result) {
        if (err) throw err;
        res.send("Đăng ký thành công!");
      });
    });
  } else {
    let sql = `INSERT INTO contacts (name, phoneNumber, email, address, message, from_slug, created_at)
    VALUES ("${name}", "${phoneNumber}", "${email}", "${address}", "${message}", "${req.headers.referer}", NOW())`;
    conn.connect(function (err) {
      conn.query(sql, function (err, result) {
        if (err) throw err;
        res.send("Đăng ký thành công!");
      });
    });
  }
});

// Listen
app.listen(port, () => {
  console.log(`Listening at port ${port} !`);
});
