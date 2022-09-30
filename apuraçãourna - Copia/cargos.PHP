
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
  array("thiago mello","Rio Grande do Sul","50%","Senador"),
  array("Priscila","Santa Catarina","6%","Senador"),
  array("Nicolas","Rio Grande do Sul","9%","Senador"),
  array("Carlos","Bahia","1%","Senador"),
  array("Ivanei","Bahia","15%","Senador"),
  array("a","Rio Grande do Sul","50%","Governador"),
  array("b","Santa Catarina","6%","Governador"),
  array("c","Rio Grande do Sul","9%","Governador"),
  array("d","Bahia","1%","Governador"),
  array("e","Bahia","15%","Governador"),
);
if($_GET['estado'] == ""){
  $_GET['estado'] = "Rio Granded do Sul";
}
?>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
    <title>SenacRS - Apuração das urnas</title>
     <!-- Aqui chamamos o nosso arquivo css externo -->
    <link rel="stylesheet" type="text/css"  href="style.css" />
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
        echo ("<li><a href='cargos.php?estado=".$estado."&cargo=Dep Federal'>" . $estado . "</a></li>");
    }?>
      
      </ul>
  </li>
    <li><a href="#">Deputado Estadual</a>
        <ul>
          
          
        <?php
      foreach ($estados as &$estado) {
        echo ("<li><a href='cargos.php?estado=".$estado."&cargo=Dep Estadual'>" . $estado . "</a></li>");
    }?>
        </ul>
    </li>
    <li><a href="#">Senador</a>
      <ul>
      <?php
      foreach ($estados as &$estado) {
        echo ("<li><a href='senador.php?estado=".$estado."&cargo=Senador'>" . $estado . "</a></li>");
    }?>
      </ul>
  </li>
		<li><a href="#">Governador</a>
      <ul>
      <?php
      foreach ($estados as &$estado) {
        echo ("<li><a href='senador.php?estado=".$estado."&cargo=Governador'>" . $estado . "</a></li>");
    }?>
      </ul></li>
</ul>
</nav>
<div class="logo-div">
  <img id="logo" src="https://seletivos.rr.senac.br/assets/images/custom/logo.png" alt="logo-senac">
  <?php echo("<h1>" . $_GET['cargo']) . "</h1>"?>
  
</div>
</header>
    
    <div class='container'>
      <?php foreach ($candidatos as &$candidato) {
        if (($candidato[1] == $_GET['estado']) and ($candidato[3] == $_GET['cargo'])){
        echo("<div class='candidatos'>");
        echo("<img width=40 height=40  src='_img/avatar.png'>");
        echo("<p>" . $candidato[0] . "</p>");
        echo("<p>" .$candidato[2]. "</p>");
        echo("</div>");
      } 
      }
      ?> 
    </div>
     
</body>
</html>