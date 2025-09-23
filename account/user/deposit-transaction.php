<?php
$pageName = "Deposit Transaction";
// include_once("layouts/tranheader.php");
include_once("layouts/header.php");
$acct_id = userDetails('id');
// $crypto_name = cryptoName('crypto_name');




if (!$_SESSION['acct_no']) {
    header("location:../login.php");
    die;
}

?>
<div id="content" class="main-content">
    <div class="layout-px-spacing">
        <div class="row layout-top-spacing" id="cancel-row">

            <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                <div class="widget-content widget-content-area br-6">
                    <table id="default-ordering" class="table table-hover" style="width:100%">

                        <thead>
                            <tr>
                                <th>S/N</th>
                                <th>Amount</th>
                                <th>Trans ID</th>
                                <th>Wallet Address</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>


                            <?php

                            function status($data)
                            {
                                if ($data['crypto_status'] == '0') {
                                    return '<span class="badge outline-badge-secondary shadow-none col-md-12">In Progress</span>';
                                }
                                if (
                                    $data['crypto_status'] == '2'
                                ) {
                                    return  '<span class="badge outline-badge-danger shadow-none col-md-12">Hold</span>';
                                }

                                if (
                                    $data['crypto_status'] == '3'
                                ) {
                                    return '<span class="badge outline-badge-danger shadow-none col-md-12">Cancelled</span>';
                                }

                                if (
                                    $data['crypto_status'] == '1'
                                ) {
                                    return '<span class="badge outline-badge-primary shadow-none col-md-12">Completed</span>';
                                }
                            }

                            $sql = "SELECT * FROM deposit WHERE user_id =:acct_id ORDER BY d_id DESC";
                            $stmt = $conn->prepare($sql);
                            $stmt->execute([
                                'acct_id' => $acct_id
                            ]);

                            $sn = 1;

                            while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                            ?>
                                <tr>
                                    <td><?= $sn++ ?></td>
                                    <td><?= $currency . $result['amount'] ?></td>
                                    <td><?= $result['refrence_id'] ?></td>
                                    <td><?= $result['wallet_address'] ?></td>
                                    <td>
                                        <?php 
                                        echo status($result);
                                        ?>
                                    </td>
                                    <td><?= date('Y-m-d H:i a', strtotime($result['created_at'])) ?></td>


                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>S/N</th>
                                <th>Amount</th>
                                <th>Trans ID</th>
                                <th>Wallet Address</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>



            </div>


            <?php
            include_once("layouts/footer.php");
            ?>