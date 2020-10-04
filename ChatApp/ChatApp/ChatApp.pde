// Import af libraries
import controlP5.*;
import de.bezier.data.sql.*;

// initialisering af variabler
int UserID;
String Name, uname, Password;
String text;
SQLite db;
ControlP5 cp5;
int mode = 0;

void setup() {
  size( 500, 500 );

  // User input

  cp5 = new ControlP5(this);

  // Username Input
  cp5.addBang("Submit").setPosition(250, 150).setSize(100, 50);
  cp5.addTextfield("Username").setPosition(150, 150).setSize(100, 50).setAutoClear(false);


  // Password input
  // cp5.addBang("Submit2").setPosition(250, 250).setSize(100, 50);
  // cp5.addTextfield("Password").setPosition(150, 250).setSize(100, 50).setAutoClear(false);




  // Database
  db = new SQLite( this, "database.db" );  // open database file

  if ( db.connect() )
  {
    // list table names
    db.query( "SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"" );

    while (db.next())
    {
      println( db.getString("Name") );
    }

    // read all in table "table_one"
    db.query( "SELECT * FROM Users" );

    while (db.next())
    {
      println( db.getString("field_one") );
      println( db.getInt("field_two") );
    }
  }
}

void draw() {
  background(150);

  // Mode Framework

  if (mode == 0) {
    login();
  } else if (mode == 1) {
    signUp();
  } else if (mode == 2) {
    messages();
  }
}


void Submit() {
  print("User input typed   : ");
  uname=cp5.get(Textfield.class, "Username").getText();


  print(uname);
  
  db.query( "INSERT INTO Users");
  
}
