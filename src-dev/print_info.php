<html>
	
	<head>
		<link rel="stylesheet" type="text/css" href="table.css">
		<title>Episodes Found</title>
	</head>

	<body>
		<?php
			if(isset($_POST['submit'])){
				$data_missing = array();
				
				if(empty($_POST['str'])){
              		$data_missing[]='str';
				} else{
					$str=trim($_POST['str']);
				}
			}
			if(empty($data_missing)){
				shell_exec('rm ../data/temp*');
				$myfile = fopen("../data/temp", "w");
				fwrite($myfile, $str);
				fclose($myfile);
				require_once('mysqli_connect.php');
				
				echo "Top results in decreasing order:<br><br>";
				
				shell_exec('bash ../src/query.sh');
				$myfile2 = fopen("../data/temp", "r");
				$pagetext = fread($myfile2, 25000);
				echo nl2br($pagetext);
				shell_exec('rm ../data/temp*');
			}
			else {
				echo "Please enter a set of phrases separated by newline";
			}
		?>
	</body>
</html>
