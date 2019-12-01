module.exports = function (app, connection, session, bodyParser) {
    app.use(bodyParser.urlencoded({ extended: false }));
    app.use(bodyParser.json());
    app.use(session({
        key: 'sid', //세션의 키 값
        secret: 'secret', //세션의 비밀 키, 쿠키값의 변조를 막기 위해서 이 값을 통해 세션을 암호화 하여 저장
        resave: false, //세션을 항상 저장할 지 여부 (false를 권장)
        saveUninitialized: true, //세션이 저장되기전에 uninitialize 상태로 만들어 저장
        cookie: { //쿠키 설정
            maxAge: 24000 * 60 * 60 // 쿠키 유효기간 24시간
        }
    }));

    app.get('/city', function (req, res) {
        var sql = "select a.id,b.city,b.name,b.ticket,b.phone_num,b.holiday,b.website,b.open_closed from CITY as a LEFT JOIN TOUR as b on a.name=b.city order by a.id";
        connection.query(sql, function (error, results, fields) {
            if (error) {
                console.log(error);
            }
            //console.log(results);
            res.render('city.ejs', { results: results });
        });

    });
    app.post('/manager', function (req, res, next) {

        manager = req.session.key;
        console.log(manager);

        var tour_name = req.body.tour_name;
        var resName = req.body.resName;
        var address = req.body.address;
        var foodtype = req.body.foodtype;
        var price = req.body.price;
        var reviewNum = req.body.reviewNum;

        connection.query('START TRANSACTION; select * from Restaurant where name=?', [manager], function (err, rows, fields) {
            console.log('1')
            if (!err) {
                if (rows[0] != undefined) {
                    connection.query('update restaurant set tour_name=? , name=?,address=?,foodtype=?,price=?,reviewNum=? where name=? ; ', [tour_name, resName, address, foodtype, price, reviewNum, manager], function (err, rows, fields) {
                        if (!err) {
                            //res.send('nickname change success');
                            console.log('2')
                            connection.query('COMMIT;');
                            res.redirect('/manager')
                        } else {
                            connection.query('ROLLBACK;');
                            console.log('3')
                            res.redirect('/manager')
                            //res.send('error : ' + err);
                        }
                    });
                } else {
                    res.send('no data');
                }

            } else {
                res.send('error : ' + err);
            }
        });
    });

    app.get("/home", function (req, res) {
        var sql0 = 'select city, name, ticket, phone_num, holiday, website, open_closed from tour;';
        var sql1 = 'select tourcomment.user_id, tour.name, tourcomment.comment, tourcomment.score From tourcomment JOIN tour ON tourcomment.tour_id = tour.id;';
        var sql2 = 'select tour.city as name, round(avg(tourcomment.score)) as avgScore From tourcomment JOIN tour ON tourcomment.tour_id = tour.id group by tour.city;';

        connection.query(sql0 + sql1 + sql2, function (err, rows, fields) {

            var r0 = rows[0];
            var r1 = rows[1];
            var r2 = rows[2];

            if (!req.session.name)
                return res.redirect('/login');
            else
                res.render('home', { name: req.session.name, row: r0, rows: r1, rows2: r2 });

        });
    });
    app.get('/agency', function (req, res) {

        res.render('agency.ejs');
    })
    app.get("/login", function (req, res) {
        let session = req.session;
        //req.session.email =
        //console.log(req.session.key)
        console.log("login");
        res.render("login", {});
    });
    app.get("/register", function (req, res) {
        res.render("register", {
        });
    });
    app.get("/edit", function (req, res) {
        res.render("edit", {});
    });

    app.get("/delete", function (req, res) {
        res.render("delete", {});
    });


    app.get("/manager", function (req, res) {

        var manager = req.session.key;

        connection.query('select * from restaurant where name= ?', [manager], function (err, rows, fields) {

            console.log(rows);

            if (req.session.role == '관리자')
                res.render('manager', { name: req.session.name, tour_name: rows[0].tour_name, resName: rows[0].name, address: rows[0].address, foodtype: rows[0].foodtype, price: rows[0].price, reviewNum: rows[0].reviewNum });
            else {
                return res.redirect('/login');
            }
        });

    });
    app.post('/register', function (req, res) {
        var nickname = req.body.nickname;
        var id = req.body.email;
        var pw = req.body.password;
        var confirm_pw = req.body.confirm_password;
        var num = req.body.phone_number;
        console.log(id);
        console.log(pw);
        console.log(confirm_pw);

        if (pw == confirm_pw) {
            connection.query('insert into user values(?,?,?,?,?)', [id, pw, nickname,'일반인',num], function (err, rows, fields) {
                console.log(id);
                console.log(pw);
                if (!err) {

                    res.redirect("/login");
                } else {
                    res.send('There is already a user with this email. Please try another one')
                }
            });
        } else {
            res.send('password not match!');
        }
    });
    app.post('/home', function (req, res) {
        var place = req.body.place;


        var tourSite = req.body.review_place;
        console.log(tourSite);
        var sql0 = 'select city, name, ticket, phone_num, holiday, website, open_closed from tour where tour.name = \'' + place + '\';';
        var sql1 = 'select tourcomment.user_id, tour.name, tourcomment.comment, tourcomment.score From tourcomment JOIN tour ON tourcomment.tour_id = tour.id;';
        var sql2 = 'select tour.city as name, round(avg(tourcomment.score)) as avgScore From tourcomment JOIN tour ON tourcomment.tour_id = tour.id group by tour.city;';

        connection.query(sql0 + sql1 + sql2, function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    var r0 = rows[0];
                    var r1 = rows[1];
                    var r2 = rows[2];

                    console.log(rows[1]);

                    //res.redirect("");
                    res.render("home", { name: req.session.name, row: r0, rows: r1, rows2: r2 });

                } else {
                    res.send('해당 관광지에 대한 후기가 없습니다.');
                }

            } else {
                //res.send('error : ' + err);
                res.send('관광지 명을 다시 입력해주세요.');
            }

        });

    });
    app.post('/home1', function (req, res) {
        var place = req.body.place;


        var tourSite = req.body.review_place;
        console.log(tourSite);
        var sql0 = 'select city, name, ticket, phone_num, holiday, website, open_closed from tour;';

        var sql1 = 'select tourcomment.user_id, tour.name, tourcomment.comment, tourcomment.score From tourcomment JOIN tour ON tourcomment.tour_id = tour.id where tour.name = \'' + tourSite + '\';';
        var sql2 = 'select tour.name as name, round(avg(tourcomment.score)) as avgScore From tourcomment JOIN tour ON tourcomment.tour_id = tour.id where tour.name = \'' + tourSite + '\';';


        connection.query(sql0 + sql1 + sql2, function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    var r0 = rows[0];
                    var r1 = rows[1];
                    var r2 = rows[2];

                    console.log(rows[1]);

                    //res.redirect("");
                    res.render("home2.ejs", { name: req.session.name, row: r0, rows: r1, rows2: r2 });

                } else {
                    res.send('해당 관광지에 대한 후기가 없습니다.');
                }

            } else {
                //res.send('error : ' + err);
                res.send('관광지 명을 다시 입력해주세요.');
            }

        });

    });

    app.post('/edit', function (req, res, next) {
        var id = req.body.email;
        var pw = req.body.password;
        var nickname = req.body.nickname;
        var phone = req.body.phone;
        connection.query('select * from User where id=? and pw=?', [id, pw], function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    connection.query('update User set nickname=? where id=?', [nickname, id], function (err, rows, fields) {
                        if (!err) {
                            //res.send('nickname change success');
                              connection.query('update User set phone=? where id=?', [phone, id], function(err,rows,fields){
                              if(!err){
                                res.redirect('/login')
                              }
                              else{
                                res.send('error : ' + err);
                              }
                            })

                        } else {
                            res.send('error : ' + err);
                        }
                    });

                } else {
                    res.send('no data');
                }

            } else {
                res.send('error : ' + err);
            }
        });
    });

    app.post('/delete', function (req, res) {
        var id = req.body.email;
        var pw = req.body.password;
        connection.query('select * from User where id=? and pw=?', [id, pw], function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    connection.query('delete from User where id=?', [id], function (err, rows, fields) {
                        if (!err) {
                            //res.send('delete success');
                            res.redirect('/login')
                        } else {
                            res.send('error : ' + err);
                        }
                    });
                } else {
                    res.send('no data');
                }

            } else {
                res.send('error : ' + err);
            }
        });
    });

    app.post('/restaurant', function (req, res) {

        var restSite = req.body.rest_place;
        console.log(restSite);

        var sql1 = 'select tour.city, restaurant.tour_name, restaurant.name, restaurant.foodtype, restaurant.price, restaurant.address, restaurant.reviewNum From restaurant INNER JOIN tour ON restaurant.tour_name = tour.name where restaurant.tour_name = \'' + restSite + '\';';
        var sql2 = 'select tour.name as name, sum(restaurant.reviewNum) as reviewNum From restaurant JOIN tour ON restaurant.tour_name = tour.name where tour.name = \'' + restSite + '\';';


        console.log(req.session.role)
        connection.query(sql1 + sql2, function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {

                    var r1 = rows[0];
                    var r2 = rows[1];
                    //res.redirect("");
                    res.render("restaurant", { name: req.session.name, rows: r1, rows2: r2 });
                    console.log(rows[0])
                } else {
                    res.send('해당 관광지 주변에 음식점이 없습니다.');
                }

            } else {
                //res.send('error : ' + err);
                res.send('관광지 명을 다시 입력해주세요.');
            }

        });

    });

    app.post('/festival', function (req, res) {

        var festSite = req.body.fest_place;
        console.log(festSite);

        connection.query('select festival.fest_name, city.name, festival.date, festival.price, festival.exp From festival INNER JOIN city ON festival.city_id = city.id where city.name = \'' + festSite + '\'', function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    //res.redirect("");
                    res.render("festival", { name: req.session.name, rows: rows });
                    console.log(rows[0])
                } else {
                    res.send('해당 도/시 주변에 음식점이 없습니다.');
                }

            } else {
                //res.send('error : ' + err);
                res.send('도/시 명을 다시 입력해주세요.');
            }

        });

    });




    app.get("/restaurant", function (req, res) {


        var sql = "select tour.city, restaurant.tour_name, restaurant.name, restaurant.foodtype, restaurant.price, restaurant.address, restaurant.reviewNum From restaurant INNER JOIN tour ON restaurant.tour_name = tour.name;";
        var sql2 = "select tour_name as name, sum(reviewNum) as reviewNum from restaurant group by tour_name;"

        connection.query(sql + sql2, function (error, result, fields) {

            var r1 = result[0];
            var r2 = result[1];

            if (!req.session.name)
                return res.redirect('/login');
            else
                res.render('restaurant', { name: req.session.key, rows: r1, rows2: r2 });
        });


    });

    app.get("/festival", function (req, res) {

        connection.query('select festival.fest_name, city.name, festival.date, festival.price, festival.exp From festival INNER JOIN city ON festival.city_id = city.id;', function (err, rows, fields) {
            if (!req.session.name)
                return res.redirect('/login');
            else
                console.log(rows);
            //res.render('festival', {name:req.session.name, rows: rows});
            res.render('festival', { name: req.session.name, rows: rows });
        });
    });


    app.post('/login', function (req, res) {
        var id = req.body.email;
        var pw = req.body.password;
        console.log(id);
        console.log(pw);

        connection.query('select * from user where id=\'' + id + '\' and pw=\'' + pw + '\'', function (err, rows, fields) {
            if (!err) {
                if (rows[0] != undefined) {
                    user = rows[0];
                    req.session.name = user.nickname;
                    req.session.key = user.id;
                    req.session.role = user.role;
                    req.session.save(function () {
                        return res.redirect('/home');
                    });
                } else {
                    res.send('please check your password.');
                }

            } else {
                //res.send('error : ' + err);
            }
        });
    });
    app.post("/hotel_del", function (req, res) {
        var hotel_name = req.body.n1;
        var user = req.body.n2;
        var comment = req.body.n3;
        var score = req.body.n4;
        var sql = "delete from hotelcomment where comment = '" + comment + "'";
        connection.query(sql, function (error, results, fields) {
            if (error) {
                console.log(error);
            }
            console.log(results);
        });
    });

    app.post('/managerDelete', function (req, res, next) {

        manager = req.session.key;
        console.log(manager);

        connection.query('select * from Restaurant where name=?', [manager], function (err, rows, fields) {
            console.log('1')
            if (!err) {
                if (rows[0] != undefined) {
                    connection.query('delete from restaurant where name=?', [manager], function (err, rows, fields) {
                        if (!err) {
                            //res.send('nickname change success');
                            console.log('2')
                            res.redirect('/restaurant')
                        } else {
                            console.log('3')
                            res.redirect('/restaurant')
                            //res.send('error : ' + err);
                        }
                    });
                } else {
                    res.send('no data');
                }

            } else {
                res.send('error : ' + err);
            }
        });
    });


        app.get("/managerDelete", function (req, res) {

            var manager = req.session.key;

            connection.query('select * from restaurant where name= ?', [manager], function (err, rows, fields) {

                console.log(rows);

                if (req.session.role == '관리자')
                    res.render('managerDelete', { name: req.session.nametype });
                else {
                    return res.redirect('/login');
                }
            });

        });




        app.get('/hotel', function (req, res) {
            var sql = "select a.id, a.name as city_name, b.name,b.address,b.website,b.tel from CITY as a LEFT JOIN Hotels as b on a.id=b.city_id;";
            var sql2 = "select c.name, d.user_id, d.comment, d.score from Hotels as c LEFT JOIN hotelcomment as d on c.id=d.hotel_id where d.comment is not null order by d.score desc;";

            connection.query(sql + sql2, function (error, result, fields) {

                var r1 = result[0];
                var r2 = result[1];

                if (!req.session.name)
                    return res.redirect('/login');
                else
                    res.render('hotel.ejs', { name: req.session.key, results: r1, results2: r2 });
            });

        });
        app.post('/hotel1', function (req, res) {
            var sql = "select a.id, a.name as city_name, b.name,b.address,b.website,b.tel from CITY as a LEFT JOIN Hotels as b on a.id=b.city_id;";
            var q2 = req.body.search_comment;
            var sql_rq2 = "select c.name, d.user_id, d.comment, d.score from Hotels as c LEFT JOIN hotelcomment as d on c.id=d.hotel_id where d.comment is not null and c.name = '" + q2 + "' order by d.score desc;";
            connection.query(sql + sql_rq2, function (error, result, fields) {
                if (error) {
                    console.log(error);
                }
                res.render('hotel_2.ejs', { name: req.session.key, results: result[0], results2: result[1] });
            });
        });
        app.post('/hotel2', function (req, res) {
            var q2 = req.body.search_comment;
            var sql = "select a.id, a.name as city_name, b.name,b.address,b.website,b.tel from CITY as a LEFT JOIN Hotels as b on a.id=b.city_id where b.name = '" + q2 + "';";

            var sql2 = "select c.name, d.user_id, d.comment, d.score from Hotels as c LEFT JOIN hotelcomment as d on c.id=d.hotel_id where d.comment is not null order by d.score desc;";

            connection.query(sql + sql2, function (error, result, fields) {
                if (error) {
                    console.log(error);
                }
                console.log(result[0]);
                res.render('hotel.ejs', { name: req.session.key, results: result[0], results2: result[1] });
            });
        });
        app.post('/hotel3', function (req, res) {
            var v1 = req.session.key;
            var v2 = req.body.hotelname;
            var v3 = req.body.score;
            var v4 = req.body.comment;
            var v5;
            var sql = "select id from Hotels where name = '" + v2 + "';";

            connection.query(sql, function (error, result, fields) {
                if (error) {
                    console.log(error);
                }
                console.log(result[0].id);
                console.log(v1);
                v5 = result[0].id;
                var sql2 = "insert into hotelcomment(hotel_id, user_id, comment, score) values (" + v5 + ",'" + v1 + "','" + v4 + "'," + v3 + ")";
                connection.query(sql2, function (error, result, fields) {
                    if (error) {
                        console.log(error);
                    }
                });
            });

            var sql1 = "select a.id, a.name as city_name, b.name,b.address,b.website,b.tel from CITY as a LEFT JOIN Hotels as b on a.id=b.city_id;";
            var sql2 = "select c.name, d.user_id, d.comment, d.score from Hotels as c LEFT JOIN hotelcomment as d on c.id=d.hotel_id where d.comment is not null order by d.score desc;";

            connection.query(sql1 + sql2, function (error, result, fields) {
                var r1 = result[0];
                var r2 = result[1];
                console.log(r2);
                res.render('hotel_2.ejs', { name: req.session.key, results: r1, results2: r2 });
            });


        });
        app.post('/tour_comment_insert', function (req, res) {
            var v1 = req.session.key;
            var v2 = req.body.hotelname;
            var v3 = req.body.score;
            var v4 = req.body.comment;
            var v5;
            var sql = "select id from TOUR where name = '" + v2 + "';";

            connection.query(sql, function (error, result, fields) {
                if (error) {
                    console.log(error);
                }
                console.log(result[0].id);
                console.log(v1);
                v5 = result[0].id;
                var sql2 = "insert into Tourcomment(user_id, tour_id, comment, score) values ('" + v1 + "'," + v5 + ",'" + v4 + "'," + v3 + ")";
                connection.query(sql2, function (error, result, fields) {
                    if (error) {
                        console.log(error);
                    }
                });
                res.redirect('/home');
            });
        });
       

}