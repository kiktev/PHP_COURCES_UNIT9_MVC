<?php

$customers =  $this->get('customers');

foreach($customers as $customer)  :
?>

    <div class="product">
        <h4>Прізвище: <?php echo $customer['last_name']?></h4>
        <h4>Ім'я: <?php echo $customer['first_name']?><h4>
        <h4>Телефон: <?php echo $customer['telephone']?></h4>
		<h4>Email: <?php echo $customer['email']?></h4>
		<h4>Місце проживання: <?php echo $customer['city']?></h4>
		<h4>Посада: <?php echo $customer['admin_role']?></h4>
    </div>
<?php endforeach; ?> 