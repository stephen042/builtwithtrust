<?php
$pageName = "Success";
include_once("layouts/header.php");
include("./userPinfunction.php");

//TEMP TRANSACTION FETCH
$sql = "SELECT * FROM wire_transfer WHERE acct_id =:acct_id ORDER BY wire_id DESC LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->execute([
    'acct_id'=>$user_id
]);
$wire_trans = $stmt->fetch(PDO::FETCH_ASSOC);

$status = wireStatus($wire_trans);




?>

<div id="content" class="main-content">
    <div class="layout-px-spacing">
        <div class="row layout-top-spacing">
            <div class="col-md-8 offset-md-2 mt-5">
                <div class="card component-card">
                    <div class="card-body">
                        <div class="user-profile">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php

                                    if($_SESSION['wire_transfer']){

                                    ?>
                                    <h4 class="text-center text-success">Transfer is been processed</h4>

                                </div>
                            </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="text-center text-info text-uppercase">DEAR, <?= ucwords($fullName)?> YOUR TRANSFER TO  <span class="text-uppercase"><?= $wire_trans['acct_name']?></span> IS BEEN PROCESSED
                                        
                                         <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:100%">
      100%
    </div><br>
                                        </p>
                                    </div>

                                </div>
                            <div class="row">
                                <div class="col-md-8 offset-md-2">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td>AMOUNT</td>
                                            <td><?=$currency. $wire_trans['amount'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>REFERENCE ID</td>
                                            <td><?= $wire_trans['refrence_id'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>BANK NAME</td>
                                            <td><?= $wire_trans['bank_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>ACCOUNT NAME</td>
                                            <td><?= $wire_trans['acct_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>ACCOUNT NO</td>
                                            <td><?= $wire_trans['acct_number'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>STATUS</td>
                                            <td><?=$status ?></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <?php
                                    }elseif($_SESSION['dom_transfer']){
                                    //DOMESTIC TRANSACTION FETCH
                                    $sql = "SELECT * FROM domestic_transfer WHERE acct_id =:acct_id ORDER BY dom_id DESC LIMIT 1";
                                    $stmt = $conn->prepare($sql);
                                    $stmt->execute([
                                        'acct_id'=>$user_id
                                    ]);
                                    $dom_transfer = $stmt->fetch(PDO::FETCH_ASSOC);
                                    $status = domestic($dom_transfer);
                                    ?>
                                    <h3 class="text-center text-success">Transfer Successfully</h3>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="text-center text-info text-uppercase">DEAR, <?= ucwords($fullName)?> YOUR TRANSFER TO  <span class="text-uppercase"><?=$dom_transfer['acct_name'] ?></span> IS BEEN PROCESSED
                                    </p>
                                     <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:100%">
      100%
    </div><br>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-8 offset-md-2">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td>AMOUNT</td>
                                            <td><?=$currency. $dom_transfer['amount'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>REFERENCE ID</td>
                                            <td><?= $dom_transfer['refrence_id'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>BANK NAME</td>
                                            <td><?= $dom_transfer['bank_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>ACCOUNT NAME</td>
                                            <td><?= $dom_transfer['acct_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>ACCOUNT NO</td>
                                            <td><?= $dom_transfer['acct_number'] ?></td>
                                        </tr>
                                        <tr>
                                            <td>STATUS</td>
                                            <td><?=$status ?></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <?php
                                    }else{
                                    ?>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h3 class="text-danger text-center">SORRY WE CAN'T FIND WHAT YOU ARE LOOKING FOR!</h3>
                                        </div>
                                    </div>
                                    <?php
                                    }
                                    ?>
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <a href="./dashboard.php" class="btn btn-primary">GO HOME</a>
                                            
                                            <a href="javascript:window.print()"
                                            class="btn btn-success waves-effect waves-light me-1"><i
                                                class="fa fa-print"></i> Print Statement</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

<?php
include_once("layouts/footer.php");
?>
