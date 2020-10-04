// Import af libraries
import controlP5.*;
import de.bezier.data.sql.*;

// initialisering af variabler
int UserID;
String Name, Username, Password;
String text;
SQLite db;
ControlP5 cp5;

void setup() {
  size( 500, 500 );


  // User input

  cp5 = new ControlP5(this);

  // Username Input
  cp5.addBang("Submit").setPosition(250, 150).setSize(100, 50);
  cp5.addTextfield("a").setPosition(150, 150).setSize(100, 50).setAutoClear(false);

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
    db.query( "SELECT * FROM table_one" );

    while (db.next())
    {
      println( db.getString("field_one") );
      println( db.getInt("field_two") );
    }
  }
}

void draw() {
  background(150);
}
