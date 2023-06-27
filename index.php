<!-- PHP code to establish connection with the localserver -->

<?php
$type= $_POST['type'];

$user = 'root';
$password = '';
$database = 'online travel portal system';
$servername='localhost:3306';

$mysqli = new mysqli($servername, $user,
                $password, $database);
 
// Checking for connections
if ($mysqli->connect_error) {
    die('Connect Error (' .
    $mysqli->connect_errno . ') '.
    $mysqli->connect_error);
}

//SQL query to select data from database
$sql = " Select name,id_passport from customer where id_passport IN
(Select passport_id from reservation where tripid IN
(SELECT trip_id from trip where type='$type')) ";
$result = $mysqli->query($sql);
$mysqli->close();
?>

<!-- HTML code to display data in tabular format -->
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <title>Travel portal</title>
    
    <style>
        table {
            margin: 0 auto;
            font-size: large;
            border: 1px solid black;
        }
 
        h1 {
            text-align: center;
            color: #006600;
            font-size: xx-large;
            font-family: 'Gill Sans', 'Gill Sans MT',
            ' Calibri', 'Trebuchet MS', 'sans-serif';
        }
 
        td {
            background-color: #E4F5D4;
            border: 1px solid black;
        }
 
        th,
        td {
            font-weight: bold;
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
 
        td {
            font-weight: lighter;
        }
    </style>
</head>
 
<body>
    <section>
        <h1>Online travel portal system</h1>
		<h3 align="center"><?php echo "Name and passport id of the cutomers who is going on '$type' trip"?></h3><br><br>
        
        <table>
            <tr>
                <th>Customer name</th>
                <th>Passport id</th>
            </tr>
            
            <?php
                while($rows=$result->fetch_assoc())
                {
            ?>
            <tr>
                <td><?php echo $rows['name'];?></td>
				<td><?php echo $rows['id_passport'];?></td>
            </tr>
            <?php
                }
            ?>
        </table>
    </section>
</body>
 
</html>


