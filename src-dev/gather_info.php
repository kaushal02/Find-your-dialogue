<html>

	<head>
		<title>Updated</title>
	</head>

	<body>
		<?php
			if(isset($_POST['submit'])) {
				$data_missing = array();
         
         		if(empty($_POST['name'])){
               		$data_missing[]='name';
         		} else{
           			$name=trim($_POST['name']);
         		}	

				if(empty($_POST['season'])){
               		$data_missing[]='season';
         		} else{
           			$season=trim($_POST['season']);
                    if(!is_numeric($season)) {
                        $data_missing[]='season';
                    }
         		}
        
        		if(empty($_POST['episode'])){
               		$data_missing[]='episode';
         		} else{
           			$episode=trim($_POST['episode']);
                    if(!is_numeric($episode)) {
                        $data_missing[]='episode';
                    }
         		}

         		if(empty($_POST['transcript'])){
               		$data_missing[]='transcript';
         		} else{
           			$transcript=trim($_POST['transcript']);
         		}
        	}

        	if(empty($data_missing)) {
                $name = exec('bash ../src/namefilter.sh '.$name);
        		$fname = $name."_".$season."_".$episode;
        		if(file_exists("../data/raw/".$fname)) {
        			echo "The file you are trying to upload already exists in our database<br>";
        			echo "Please recheck the specifications or upload another file";
        		}
        		else {
					$myfile = fopen("../data/raw/".$fname, "w");
					fwrite($myfile, $transcript);
					fclose($myfile);
					require_once('mysqli_connect.php');
					shell_exec('bash ../src/update.sh '.$fname);
                    echo "Successfully added!";
				}
				mysqli_close($dbc);
			} else {
				echo "You need to enter the following data<br />";
				foreach($data_missing as $missing){
					echo "$missing<br />";
				}
			}
		?>
	</body>
</html>
