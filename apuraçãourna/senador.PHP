
<!DOCTYPE HTML>
<?php

$estados = array(
    "1" => "Rio Grande do Sul",
    "2" => "São Paulo",
    "3" => "Rio de Janeiro",
    "4" => "Bahia",
    "5" => "Paraná",
    "6" => "Santa Catarina",
    "7" => "Roraima",
);

$candidatos = array(
  array("thiago mello","Rio Grande do Sul","50%"),
  array("Priscila","Santa Catarina","6%"),
  array("Nicolas","Rio Grande do Sul","9%"),
  array("Carlos","Bahia","1%"),
  array("Ivanei","Bahia","15%"),
);
?>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
    <title>SenacRS - Apuração das urnas</title>
     <!-- Aqui chamamos o nosso arquivo css externo -->
    <link rel="stylesheet" type="text/css"  href="apuracao.css" />
    <!--[if lte IE 8]>
 <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->
</head>
<body>
<header>
<nav>
  <ul class="menu">
    <li><a href="#">Presidente</a></li>
		<li><a href="#">Deputado Federal</a>
      <ul>
        <?php
          foreach ($estados as &$estado) {
            echo ("<li><a href='#'>" . $estado . "</a></li>");
        }
        
        ?>
      
      </ul>
  </li>
    <li><a href="#">Deputado Estadual</a>
        <ul>
          
          
        <?php
          foreach ($estados as &$estado) {
            echo ("<li><a href='#'>" . $estado . "</a></li>");
        }
        ?>
        </ul>
    </li>
    <li><a href="#">Senador</a>
      <ul>
      <?php
      foreach ($estados as &$estado) {
        echo ("<li><a href='senador.php?estado=".$estado."'>" . $estado . "</a></li>");
    }?>
      </ul>
  </li>
		<li><a href="#">Governador</a>
      <ul>
      <?php
      foreach ($estados as &$estado) {
        echo ("<li><a href='#'>" . $estado . "</a></li>");
    }?>
      </ul></li>
</ul>
</nav>
<div class="logo-div">
  <img id="logo" src="https://seletivos.rr.senac.br/assets/images/custom/logo.png" alt="logo-senac">
</div>
</header>
    <table border=1>
      <tr>
        <td>Cadidato</td>
        <td>Qnt Votows</td>
      </tr>
      <?php
      foreach ($candidatos as &$candidato) {

        if ($_GET["estado"] == $candidato[1]){    
        echo("<tr>");
          echo("<td>". $candidato[0] ."</td>");
          echo("<td>" . $candidato[2] . "</td>");
        echo("</tr>");
        }
      }
      ?>
    </table>      
</body>
</html>